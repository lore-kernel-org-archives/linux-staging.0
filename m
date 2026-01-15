Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDC139C624;
	Thu, 15 Jan 2026 15:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768491099; cv=none; b=iO1W6oLLTnMdpZlUS1Lqt37uQcx71SfvYzaYn6GmTthOmilVo0u2+olUAwXNlwVH0Tzd0xsU0R+bTfgesSv6fpME37lgdVOychzsNyedgVZDYjTgvsPpmt2sRR0hNN7F3PyIoqF1F1Yi2LWHHVazH4Z5NBxBYnSTfUB6O+A0VQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768491099; c=relaxed/simple;
	bh=Kn3PdQbGjD+8DJxr6vnBV8l8CN6LowynPUQzP/mLCVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YHvne0htdYyK+MUYkTgszmidr99hiTd7av/JxIY7s0VRmPqfw8lnL6UwDvr8Ft+6bBVPWVCgE5QETQ+RAC01i2X08OZHrJny6fBfspE6X9iPQwXHbr3CL0qhlsQpKskEChlHM8FF/hKED8uodUmZ0k5Th7rOdx4z5VG9zREVeSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1SmzzfkO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1SmzzfkO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42FE5C116D0;
	Thu, 15 Jan 2026 15:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768491098;
	bh=Kn3PdQbGjD+8DJxr6vnBV8l8CN6LowynPUQzP/mLCVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1SmzzfkO42PiLg8yn11Ml9MjPuwnI2Cb3yc3t65h/49MXRCgwBbWgHV0eaaINMdjJ
	 TC7Ch9jFt9aDOdiP7QrTYw703IeptGgvy1UWqZIxN76rdn+RdkdMyMAejqefCRtVxB
	 IY9pr5+jaI74eyHKiZONUusPhGEFXd2FBucuKp/A=
Date: Thu, 15 Jan 2026 16:31:36 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Karthikey Kadati <karthikey3608@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] staging: octeon: Remove port status typedefs
Message-ID: <2026011505-jokingly-clinic-c700@gregkh>
References: <20260115152327.92654-1-karthikey3608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115152327.92654-1-karthikey3608@gmail.com>

On Thu, Jan 15, 2026 at 08:53:27PM +0530, Karthikey Kadati wrote:
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

This "V2" stuff doesn't need to be in the changelog text itself please.
It goes below the --- line so it doesn't show up in the changelog when
committed.

> 
> Signed-off-by: Karthikey Kadati <karthikey3608@gmail.com>
> ---
> Changes in v4:
> - Completely removed typedefs (Greg KH). In v3, the struct was named
>   but the typedef keyword was retained. Now uses struct directly.
> - Clarified commit message regarding the robot report (it was a build failure
>   due to anonymous structs, fixed by naming overlap with typedef removal).
> Changes in v3:
> - Address robot feedback.
> Changes in v2:
> - Initial attempt.

Wasn't v1 an initial attempt?  :)



> ---
>  arch/mips/include/asm/octeon/cvmx-pip.h |  4 ++--
>  arch/mips/include/asm/octeon/cvmx-pko.h |  6 +++---
>  drivers/staging/octeon/ethernet.c       |  4 ++--
>  drivers/staging/octeon/octeon-stubs.h   | 12 ++++++------
>  4 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/mips/include/asm/octeon/cvmx-pip.h b/arch/mips/include/asm/octeon/cvmx-pip.h
> index 01ca7267a2ba..1e107a9aa650 100644
> --- a/arch/mips/include/asm/octeon/cvmx-pip.h
> +++ b/arch/mips/include/asm/octeon/cvmx-pip.h
> @@ -236,7 +236,7 @@ typedef struct {
>  	uint64_t inb_octets;
>  	/* Number of packets with GMX/SPX/PCI errors received by PIP */
>  	uint16_t inb_errors;
> -} cvmx_pip_port_status_t;
> +};

You aren't really removing the typedef here, are you ?

Take some time, relax, and think this all through as to what you are
trying to do and how to do it.  Also be sure you are able to properly
build this code, as traditionally, this is a _VERY_ hard driver to
test-build.  It requires a cross-build to get right.

good luck!

greg k-h
