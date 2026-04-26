Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7853A371042
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 03:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261892; cv=none; b=Z8ZesZ5WyM95mYh8gwHdQascvHghzDEMZU62iFjZE7t79j1s7HJ18YoBG+HbM65DAh6qZR7ZNemgwF/IHQfJ2tQsYZ/xmA4wtD/m3JiTAWSSViQcQB/O8TbZR/IHzmQgIFFF/Ve0vIILDJ5d6pnPS4Hq9PyyVPOHGYCktjCynj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261892; c=relaxed/simple;
	bh=Xmzq2SHaJoOVLHalgIb91/VgUcjOmbJuxGMZkAbExHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u5T8j+MBHwpQMquDDgd9pgZqVuIDZPHnshvxnocKOMmW4BOz3Dy3p7BdWRP01+d0ab7YyNH/xf0FDcciL2DgL9n6Y2TLPI3xA9yYaiMlnPwNDSrEv5SW3Q9lzSqIlXqa8wRSVIF/k7Qp5dU47rOVFioMe7gcBQu90ofMdNh1wfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nzDcBqPt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nzDcBqPt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3977AC19425;
	Mon, 27 Apr 2026 03:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777261892;
	bh=Xmzq2SHaJoOVLHalgIb91/VgUcjOmbJuxGMZkAbExHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nzDcBqPtqBClV+EgPqx4RDlGI6+83eiww1tD//WC3ehFP/wRg3N8cAXWShc2F6+xw
	 hdVyHJxafVqHggqhvqLlCMROrirh9II16FISSZ0pIYd35vcmKddOYEuuBMdHWMa28R
	 J0UvRy5L96pN7RB9jLeJf2Pi7E1uim+KjFMtlgI8=
Date: Sun, 26 Apr 2026 22:15:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andrei Khomenkov <khomenkov@mailbox.org>
Cc: Ethan Tidmore <ethantidmore06@gmail.com>,
	Dan Carpenter <error27@gmail.com>, linux-staging@lists.linux.dev
Subject: Re: [PATCH v5 1/3] staging: rtl8723bs: simplify boolean comparisons
Message-ID: <2026042639-trade-resolute-cac8@gregkh>
References: <20260421220058.29317-1-khomenkov@mailbox.org>
 <20260421220058.29317-2-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421220058.29317-2-khomenkov@mailbox.org>

On Wed, Apr 22, 2026 at 01:00:56AM +0300, Andrei Khomenkov wrote:
> Simplify boolean comparisons to improve readability
> and conform to the Linux kernel coding style.
> 
> Signed-off-by: Andrei Khomenkov <khomenkov@mailbox.org>
> ---
>  drivers/staging/rtl8723bs/core/rtw_ap.c       |  2 +-
>  drivers/staging/rtl8723bs/core/rtw_btcoex.c   |  2 +-
>  drivers/staging/rtl8723bs/core/rtw_cmd.c      |  2 +-
>  .../staging/rtl8723bs/core/rtw_ieee80211.c    |  2 +-
>  .../staging/rtl8723bs/core/rtw_ioctl_set.c    | 54 +++++++-------
>  drivers/staging/rtl8723bs/core/rtw_mlme.c     | 14 ++--
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 16 ++---
>  drivers/staging/rtl8723bs/core/rtw_recv.c     | 71 +++++++++----------
>  drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  |  2 +-
>  .../staging/rtl8723bs/core/rtw_wlan_util.c    | 18 ++---
>  drivers/staging/rtl8723bs/core/rtw_xmit.c     | 34 ++++-----
>  drivers/staging/rtl8723bs/hal/hal_btcoex.c    | 10 +--
>  drivers/staging/rtl8723bs/hal/hal_com.c       |  4 +-
>  .../staging/rtl8723bs/hal/hal_com_phycfg.c    |  4 +-
>  drivers/staging/rtl8723bs/hal/hal_intf.c      |  4 +-
>  drivers/staging/rtl8723bs/hal/odm.c           |  8 +--
>  .../staging/rtl8723bs/hal/odm_CfoTracking.c   |  2 +-
>  drivers/staging/rtl8723bs/hal/odm_DIG.c       | 24 +++----
>  drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  |  2 +-
>  drivers/staging/rtl8723bs/hal/rtl8723b_dm.c   | 12 ++--
>  .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 12 ++--
>  .../staging/rtl8723bs/hal/rtl8723bs_recv.c    |  2 +-
>  .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  8 +--
>  drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  2 +-
>  .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 52 +++++++-------
>  .../staging/rtl8723bs/os_dep/sdio_ops_linux.c |  4 +-
>  drivers/staging/rtl8723bs/os_dep/xmit_linux.c |  2 +-
>  27 files changed, 184 insertions(+), 185 deletions(-)

This is big, and conflicts with patches from others sent before you.

Can you break this up into a smaller patch series, maybe one per file,
or sub-dir?

thanks,

greg k-h
