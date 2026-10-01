Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3A5366051
	for <linux-staging@lists.linux.dev>; Thu,  1 Oct 2026 05:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790833626; cv=none; b=oGrLB1BMHAM17wmhyLL3CAusTcMtykcJn05rIszLzYo1CT8stJxgXFhjcYqS/wA7FQt5o1N7u672r0lBGCYWA9VNkBoySz7NPndt7y+2XklurnpuPxFJIUdfvPgTxePiQis4iVNuzdQ9mO6r+0w7JFb3ELhhsevP+jDBkruw5B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790833626; c=relaxed/simple;
	bh=lG1PkdD8mQ6KhBQVzFMIBxWO3CbrnDFzyc+X0AIiYGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rp0qfTfik/l7wMD3rb2cPvV6ptjOHniglEH7kck2BYQ2XBDkAkK54+7kZZ2q2AbIjnpYuOikM+8nuIEDIbioMZkEqXXJNuDQOjYFymmcGTA+JcqBo2/jTPRCR1iAYlSGSplDE/cSejn/x/jGGnWciIE++tNhjEINr7n4zhgvDvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fZ+ZWkZa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fZ+ZWkZa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E5F21F000FF;
	Thu,  1 Oct 2026 05:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790833624;
	bh=t/M+9FG6/v9OJ2T7wKHhL3GLHONpeeHnUSbK645kFJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fZ+ZWkZaaLn4645jQZttVmTLV1jGwgVvcO7Jc12fSg3M1nRJ8YAei9VvyYnhS4NTT
	 cEHSlwH8qY3dEP83bT7y3atCDe7YGOvfqtYS/2z9tcPoJI5Lf+/Xz9gnnxc5vaYbF9
	 MAj06WLA6Fa5zM475vF+Y2TIkylHg18tJTrXuYyA=
Date: Thu, 1 Oct 2026 07:46:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jennifer Guo <guojy.bj@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/2] staging: rtl8723bs: delete more empty comment lines
Message-ID: <2026100121-ducky-unabashed-b77a@gregkh>
References: <20260911193335.6908-1-guojy.bj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911193335.6908-1-guojy.bj@gmail.com>

On Fri, Sep 11, 2026 at 12:33:33PM -0700, Jennifer Guo wrote:
> This patchset deletes all empty comment lines /*  */ from hal/ and
> os_dep/ files, and adds a newline back in where appropriate.
> 
> Jennifer Guo (2):
>   staging: rtl8723bs: delete empty comment lines in hal/ header files
>   staging: rtl8723bs: delete empty comment lines in source files
> 
>  drivers/staging/rtl8723bs/hal/Hal8723BReg.h   | 17 +-------
>  .../staging/rtl8723bs/hal/HalBtc8723b1Ant.c   | 16 -------
>  .../staging/rtl8723bs/hal/HalBtc8723b1Ant.h   |  2 -
>  .../staging/rtl8723bs/hal/HalBtc8723b2Ant.c   |  8 ----
>  .../staging/rtl8723bs/hal/HalBtc8723b2Ant.h   |  2 -
>  drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h  |  2 +-
>  drivers/staging/rtl8723bs/hal/HalPhyRf.c      |  6 +--
>  .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    |  2 -
>  .../staging/rtl8723bs/hal/HalPhyRf_8723B.h    |  6 +--
>  drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c  |  6 ---
>  drivers/staging/rtl8723bs/hal/hal_btcoex.c    | 13 ------
>  drivers/staging/rtl8723bs/hal/odm.c           | 26 ------------
>  drivers/staging/rtl8723bs/hal/odm.h           | 42 ++-----------------
>  drivers/staging/rtl8723bs/hal/odm_HWConfig.c  |  7 ----
>  drivers/staging/rtl8723bs/hal/odm_HWConfig.h  |  2 -
>  drivers/staging/rtl8723bs/hal/rtl8723b_dm.c   |  6 ---
>  .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 30 -------------
>  .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   | 21 +---------
>  .../staging/rtl8723bs/hal/rtl8723b_rf6052.c   |  2 -
>  .../staging/rtl8723bs/hal/rtl8723b_rxdesc.c   |  4 --
>  drivers/staging/rtl8723bs/hal/sdio_halinit.c  | 33 ---------------
>  drivers/staging/rtl8723bs/hal/sdio_ops.c      | 17 --------
>  .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  4 +-
>  drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  6 +--
>  24 files changed, 14 insertions(+), 266 deletions(-)
> 
> -- 
> 2.34.1
> 

As these didn't all apply cleanly, I took the bits that did.  You might
want to rebase your patches on the staging-testing branch and send new
versions for the bits that were missed.

thanks,

greg k-h
