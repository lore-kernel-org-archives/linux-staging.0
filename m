Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD732261593;
	Mon,  2 Feb 2026 08:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770021375; cv=none; b=hZDbJm+9BRD3EDsDK0lIe8EFrj+l0BOOLMq5d8WVLB0vyUCZvrvGRc4NtmEuhdf/TJdJYe/pLhwGk4EI3jNveHAuY79wAODLXGuee+mw/5ZAmam1as43SQwPnTbg7jjniGjeI9/t2Lq2P0BovnLEkERkLrO6XivFcvh7glGgyzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770021375; c=relaxed/simple;
	bh=7wrUR6HB4XBG3elPb4yPJRi1j8uXJ7qaAuvK1/60LJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FnAdLltBOw/B0DMr5HqI35WatiuOLlWKR0iVvbyC1+OHQaapr44+5pofz9UPXcyDP2IzbNJ0PE1w55GRmJa6Gz1d6oKEC5p0aTJPcfZj1HDL0LQetmLa3lV4KXpb107LS5X+OU+0d6aUT3xTKowUnOoB0CViVOOG/jqeEnLntdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=A6mu6Mt0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="A6mu6Mt0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6BB5C116C6;
	Mon,  2 Feb 2026 08:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770021375;
	bh=7wrUR6HB4XBG3elPb4yPJRi1j8uXJ7qaAuvK1/60LJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A6mu6Mt015NCdeGHimL23ooSRWlczf1FRtFPPZTATAuia2B6yhhOyq/XkBs1noUbA
	 vnANSG5A7unjO7Qm/rdVnBF8zIxIrHH0rmYvluCefghr6J97aDXiju2w297pMOi1gD
	 7hw/tINQyLa0ZGJxCq8Z75CPesowSlK6RMoqEHeE=
Date: Mon, 2 Feb 2026 09:36:11 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Luka Gejak <lukagejak5@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 5/5] staging: rtl8723bs: fix LONG_LINE warnings across
 C files
Message-ID: <2026020247-stubble-marlin-bfeb@gregkh>
References: <20260202070752.3391-1-lukagejak5@gmail.com>
 <20260202070752.3391-6-lukagejak5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202070752.3391-6-lukagejak5@gmail.com>

On Mon, Feb 02, 2026 at 08:07:52AM +0100, Luka Gejak wrote:
> Refactor lines exceeding 100 characters to comply with kernel coding
> style. All changes preserve original logic and behavior.
> 
> Techniques used:
> - Move trailing comments to separate lines above code
> - Break long function signatures across multiple lines
> - Extract complex expressions into named temp variables
> - Use scoped blocks for local variable declarations
> - Create pointer aliases for deeply nested struct accesses
> - Simplify compound conditionals with intermediate booleans
> 
> Files modified:
> - core/: rtw_cmd.c, rtw_ieee80211.c, rtw_io.c, rtw_ioctl_set.c,
>          rtw_mlme.c, rtw_mlme_ext.c, rtw_pwrctrl.c, rtw_recv.c,
>          rtw_security.c, rtw_wlan_util.c, rtw_xmit.c
> - hal/:  HalBtc8723b1Ant.c, HalBtc8723b2Ant.c, HalPhyRf.c,
>          HalPhyRf_8723B.c, hal_com.c, hal_com_phycfg.c, hal_intf.c,
>          hal_sdio.c, odm.c, odm_DIG.c, odm_HWConfig.c, rtl8723b_cmd.c,
>          rtl8723b_hal_init.c, rtl8723b_phycfg.c, rtl8723b_rf6052.c,
>          rtl8723bs_recv.c, rtl8723bs_xmit.c, sdio_halinit.c
> - os_dep/: ioctl_cfg80211.c, os_intfs.c, sdio_intf.c, xmit_linux.c
> 
> Signed-off-by: Luka Gejak <lukagejak5@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c      | 142 ++---
>  .../staging/rtl8723bs/core/rtw_ieee80211.c    |  36 +-
>  drivers/staging/rtl8723bs/core/rtw_io.c       |   4 +-
>  .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  16 +-
>  drivers/staging/rtl8723bs/core/rtw_mlme.c     | 103 ++--
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 492 ++++++++++++------
>  drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |   3 +-
>  drivers/staging/rtl8723bs/core/rtw_recv.c     | 123 +++--
>  drivers/staging/rtl8723bs/core/rtw_security.c |  11 +-
>  .../staging/rtl8723bs/core/rtw_wlan_util.c    | 215 +++++---
>  drivers/staging/rtl8723bs/core/rtw_xmit.c     |  62 ++-
>  .../staging/rtl8723bs/hal/HalBtc8723b1Ant.c   |  35 +-
>  .../staging/rtl8723bs/hal/HalBtc8723b2Ant.c   |  29 +-
>  drivers/staging/rtl8723bs/hal/HalPhyRf.c      |  36 +-
>  .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    | 166 ++++--
>  drivers/staging/rtl8723bs/hal/hal_com.c       |  10 +-
>  .../staging/rtl8723bs/hal/hal_com_phycfg.c    |  22 +-
>  drivers/staging/rtl8723bs/hal/hal_intf.c      |   4 +-
>  drivers/staging/rtl8723bs/hal/hal_sdio.c      |   4 +-
>  drivers/staging/rtl8723bs/hal/odm.c           |  18 +-
>  drivers/staging/rtl8723bs/hal/odm_DIG.c       |  38 +-
>  drivers/staging/rtl8723bs/hal/odm_HWConfig.c  |  17 +-
>  drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  | 103 +++-
>  .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  64 ++-
>  .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   |  54 +-
>  .../staging/rtl8723bs/hal/rtl8723b_rf6052.c   |   6 +-
>  .../staging/rtl8723bs/hal/rtl8723bs_recv.c    |   6 +-
>  .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |   5 +-
>  drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  17 +-
>  .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 134 +++--
>  drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  17 +-
>  drivers/staging/rtl8723bs/os_dep/sdio_intf.c  |   3 +-
>  drivers/staging/rtl8723bs/os_dep/xmit_linux.c |   8 +-
>  33 files changed, 1364 insertions(+), 639 deletions(-)

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
