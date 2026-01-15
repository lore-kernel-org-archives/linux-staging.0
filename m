Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396CF3128D0;
	Thu, 15 Jan 2026 14:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768488556; cv=none; b=mX7bNq9YSFLU0ZC3kJ5EDRabwh2D18QcHduekCGnqZ+i/4npFjE7mQFDbVjBQkyaOLDpq+OJ4ZeOs1eIL+EhvEyLZG/ln497za46gSlPgobWHhB/FOovaIFYCEcXr1Ol76cbI3tY7yJmNHMksU9Lj27ELvkQsM7F6CphaQ8VHY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768488556; c=relaxed/simple;
	bh=NlZwW2Kc94MfUFY+maULxioJr6JRdA0P1hDOOXG6IA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NiqCMFV3E2CwZX6rlqhH+XlIbsgh+fgiN+4E8HLvdw/epMCCV3iJ0OAbmytGjeF9/FM/EFEYOFGVlYGszGLUbbpfuqAaXqKljzlFvAXXMoIJwZabDAIL47UlV9E2KUjyMeT5IwkDnBOmfjgwYUV5LapOwrXByb6q7h9NtJOz43Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jjoT6TTf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jjoT6TTf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 714A5C116D0;
	Thu, 15 Jan 2026 14:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768488555;
	bh=NlZwW2Kc94MfUFY+maULxioJr6JRdA0P1hDOOXG6IA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jjoT6TTfHH55RfZ3evHv/PgduEKFj2x6KWrQfyyOA9PtGPiQLOLkcEls8S2UKAdbg
	 riUk5DbX+hs8J4NDVnJVyrGu7pdTu1MU5rd8+GlvZ4vEmKZnrQpkmTLlAAWTb0Q5X0
	 1bj9NWcZ8Cx9DOt1DgQCVkfSxXsFTMGhPWNZGRoA=
Date: Thu, 15 Jan 2026 15:49:12 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Karthikey Kadati <karthikey3608@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4] staging: octeon: Remove port status typedefs
Message-ID: <2026011550-grope-deeply-f17d@gregkh>
References: <20260115123942.83341-1-karthikey3608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115123942.83341-1-karthikey3608@gmail.com>

On Thu, Jan 15, 2026 at 06:09:42PM +0530, Karthikey Kadati wrote:
> Remove cvmx_pip_port_status_t and cvmx_pko_port_status_t typedefs and
> replace them with struct cvmx_pip_port_status and struct
> cvmx_pko_port_status to match Linux kernel coding style.
> 
> This also updates the MIPS architecture headers to name the structs so
> they can be referenced by the staging driver, resolving the build failure
> found in v2.
> 
> In v2, the anonymous struct definition in the header caused a compilation
> error when referenced in the driver. This patch names the structs in the
> headers and updates all usages to use the struct type directly, removing
> the typedefs as per coding style requirements.
> 
> Reported-by: kernel test robot <lkp@intel.com>

Did the kernel test robot report that the typedefs need to be removed
from this driver?

confused,

greg k-h
