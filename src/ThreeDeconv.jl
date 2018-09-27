# __BEGIN_LICENSE__
#
# ThreeDeconv.jl
# Author: Hayato Ikoma (h9koma@stanford.edu)
#
# Copyright (c) 2018, Stanford University
#
# All rights reserved.
#
# Redistribution and use in source and binary forms for academic and other
# non-commercial purposes with or without modification, are permitted provided
# that the following conditions are met:
#
# * Redistributions of source code, including modified source code, must retain
#   the above copyright notice, this list of conditions and the following
#   disclaimer.
#
# * Redistributions in binary form or a modified form of the source code must
#   reproduce the above copyright notice, this list of conditions and the
#   following disclaimer in the documentation and/or other materials provided with
#   the distribution.
#
# * Neither the name of The Leland Stanford Junior University, any of its
#   trademarks, the names of its employees, nor contributors to the source code
#   may be used to endorse or promote products derived from this software without
#   specific prior written permission.
#
# * Where a modified version of the source code is redistributed publicly in
#   source or binary forms, the modified source code must be published in a freely
#   accessible manner, or otherwise redistributed at no charge to anyone
#   requesting a copy of the modified source code, subject to the same terms as
#   this agreement.
#
# THIS SOFTWARE IS PROVIDED BY THE TRUSTEES OF THE LELAND STANFORD JUNIOR
# UNIVERSITY "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
# PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE LELAND STANFORD JUNIOR
# UNIVERSITY OR ITS TRUSTEES BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
# BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
# IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY
# OF SUCH DAMAGE.
#
# __END_LICENSE__


module ThreeDeconv

import Base.GC.gc
using LinearAlgebra, FFTW, GPUArrays, Requires
FFTW.set_num_threads(4)

iscuda() = false

function __init__()
    @require CuArrays="3a865a2d-5b23-5a0f-bc46-62713ec82fae" begin @eval using CuArrays; iscuda() = true end
end

include("psf/psf.jl")
include("util/linearoperator.jl")
include("util/fft.jl")
include("util/util.jl")
include("noiseestimation/noiseestimation.jl")
include("deconvolution/deconvolve.jl")

end # module
