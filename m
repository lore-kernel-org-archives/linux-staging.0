Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512F0350A2D;
	Mon, 12 Jan 2026 10:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768215510; cv=none; b=bmV4llZBjHa6Kh3mn6RC8prWCkeIQpAbQmGOISbWB37KHwj9uitdlZ8qLSvjE8SK6elcViILuTzrzhZRve68nm2/LkZcWHJvqS4kdRXHP8ZJB/bF3CxWd1vnrT/DYFm6v87F0Porkj3/Xy3ed38i7rMgQMksQnXl1vYwvIZ0e4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768215510; c=relaxed/simple;
	bh=3yRfx0KiipVWJx4R1Zy1R3xIOER+fXqvhvxumNe78Mw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n5l0cajAMLdaZbkHi0jxaYir4ml0DZcPFO+8DTFvCRpQ5tZom9nsugfUQTaDhU/V+3/gVRBwdBbUnkxZ8gTZ//gC0MmTepbn//f/DC4Y2c8Wzg6kgl8NEx6vhkGBrJeBJtJS2m1mCdtDoqTOp+r/Rhg86gQz4/cazjV2EjXYIDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Fnidd+52; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Fnidd+52"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 921ACC16AAE;
	Mon, 12 Jan 2026 10:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768215509;
	bh=3yRfx0KiipVWJx4R1Zy1R3xIOER+fXqvhvxumNe78Mw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fnidd+52GNx5JuMkiOQYB2DaUOc/jmBREmq0sK9us2EyBZ7z8fdplwmavWiFM3H6/
	 OrUczKNZnMbE00ncCltQlXASSMliCwoJ0OdCC4t2oQbXP1qxmSixrm5lGOh8T4NgjZ
	 BLsl3hoqMSs3m71NyPqU3J5LUi6VUz9xzxW7hMXc=
Date: Mon, 12 Jan 2026 11:58:27 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Nayana Mariyappa <nayana.mariyappa@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] staging: rtl8723bs: avoid non-kernel-doc comment warning
Message-ID: <2026011221-calamari-surround-4e29@gregkh>
References: <20260112045511.42960-1-nayana.mariyappa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112045511.42960-1-nayana.mariyappa@gmail.com>

On Mon, Jan 12, 2026 at 04:55:11AM +0000, Nayana Mariyappa wrote:
> Replace a /** comment with a regular block comment to avoid
> kernel-doc parsing warnings reported by the kernel test robot.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202601101642.PaiOTqlr-lkp@intel.com/
> Signed-off-by: Nayana Mariyappa <nayana.mariyappa@gmail.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/osdep_service.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
> index c082a0359064..95b1d4e8e0f3 100644
> --- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
> +++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
> @@ -6,7 +6,7 @@
>   ******************************************************************************/
>  #include <drv_types.h>
>  
> -/**
> +/*
>   * Translate the OS dependent @param error_code to OS independent RTW_STATUS_CODE
>   * @return: one of RTW_STATUS_CODE
>   */
> -- 
> 2.43.0
> 
> 

Does not apply to my tree at all :(
