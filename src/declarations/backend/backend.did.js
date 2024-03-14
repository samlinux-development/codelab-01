export const idlFactory = ({ IDL }) => {
  const Result_1 = IDL.Variant({ 'ok' : IDL.Text, 'err' : IDL.Text });
  const Entry = IDL.Record({ 'word' : IDL.Text, 'description' : IDL.Text });
  const Result = IDL.Variant({ 'ok' : Entry, 'err' : IDL.Text });
  return IDL.Service({
    'addWord' : IDL.Func([IDL.Text, IDL.Text], [Result_1], []),
    'getWord' : IDL.Func([IDL.Text], [Result], ['query']),
  });
};
export const init = ({ IDL }) => { return []; };
