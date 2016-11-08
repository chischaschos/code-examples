RubyVM::InstructionSequence.compile_option = {
  tailcall_optimization: true,
  trace_instruction: false
}

b = -> (n, binary = []) do
  quotient = n / 2
  if quotient.zero?
    [0, binary.unshift(n % 2)]
  else
    b.call(quotient, binary.unshift(n % 2))
  end
end

# same as "1101".to_i(2)
puts b[ARGV[0].to_i].last.join
