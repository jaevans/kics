package Cx

CxPolicy[result] {
	resource := input.document[i].resource.aws_kms_key[name]

	resource.is_enabled == true
	object.get(resource, "enable_key_rotation", "undefined") == "undefined"

	result := {
		"documentId": input.document[i].id,
		"searchKey": sprintf("aws_kms_key[%s]", [name]),
		"issueType": "MissingAttribute",
		"keyExpectedValue": sprintf("aws_kms_key[%s].enable_key_rotation is set", [name]),
		"keyActualValue": sprintf("aws_kms_key[%s].enable_key_rotation is undefined", [name]),
	}
}

CxPolicy[result] {
	resource := input.document[i].resource.aws_kms_key[name]

	resource.is_enabled == true
	resource.enable_key_rotation == false

	result := {
		"documentId": input.document[i].id,
		"searchKey": sprintf("aws_kms_key[%s].enable_key_rotation", [name]),
		"issueType": "IncorrectValue",
		"keyExpectedValue": sprintf("aws_kms_key[%s].enable_key_rotation is set to true", [name]),
		"keyActualValue": sprintf("aws_kms_key[%s].enable_key_rotation is set to false", [name]),
	}
}
