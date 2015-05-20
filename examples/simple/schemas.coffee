@AccountSchema = new SimpleSchema
  mail:
    type: String
    regEx: SimpleSchema.RegEx.Email,
    label: 'e-Mail Address'
  name:
    type: String
  lastName:
    type: String