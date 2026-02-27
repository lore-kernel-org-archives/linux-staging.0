Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09FC3E8C59
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 05:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772171896; cv=none; b=D0iZmRi8/IeRu4MX3J6MvYunazXmwZG+4NbqetSxslbyIdFXDCElXfOYPEUQFbMb8CFcG8QwyKStmMSFeBmUpwNjC9sZOW743ZwOSBoiF31UQlNVZXN5AELDA5B+uPFE1HD17R8s9tmH37eR+IOc1ZMVCIC/10BUP7ar5C6A7PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772171896; c=relaxed/simple;
	bh=ejxuouldZqEKhLKrNnA+MjRRLTICuLtNW9MFLK2pWLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p/Dyk3VG6rlSjtWYqDPWoeccVabaIRt6D2gjVTRzj5eplOnFXgJAQ7jAAy5BhcPXUZhxkEySgHfvAb4GhhJmehLYlducrnIlA1p223gBQuQB6OxTKwupPHyof3kOf73duH6oM6d7mQawMQs/Ro2Ukplx/jq2kUROukj5MnQmJqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Nwy/hC0s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Nwy/hC0s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E0EFC2BC87;
	Fri, 27 Feb 2026 05:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772171896;
	bh=ejxuouldZqEKhLKrNnA+MjRRLTICuLtNW9MFLK2pWLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nwy/hC0se2K2HO07JkuzEzT6xt4cIl9BrnWaDQcAoBAaXu0nwURR2RhZDDDbi16b3
	 IzvauLtErkbXih3Z2zH9ezfA2oYHKH/XkJNp81u5ijXy6W5dBaQoJGZputGBNrIDkU
	 o/hZsrWSUBk5gdLCKyztM7DNYApiStO9392x2dDQ=
Date: Thu, 26 Feb 2026 21:58:07 -0800
From: Greg KH <gregkh@linuxfoundation.org>
To: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH 00/12] staging: rtl8723bs: remove unnecessary pointer
 casts
Message-ID: <2026022627-specked-dweeb-79e8@gregkh>
References: <20260226100255.167059-2-giorgitchankvetadze1997@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226100255.167059-2-giorgitchankvetadze1997@gmail.com>

On Thu, Feb 26, 2026 at 02:02:44PM +0400, Giorgi Tchankvetadze wrote:
> This series removes unnecessary pointer casts in memset(), memcpy(),
> and memcmp() calls throughout the rtl8723bs driver. These functions
> accept void * arguments, making explicit casts redundant.
> 
> All changes were verified by comparing objdump -d output before and
> after, confirming identical object code (except for one embedded
> debug line number shift in rtw_mlme_ext.c).
> 
> Found using Coccinelle semantic patching.
> 
> Giorgi Tchankvetadze (12):
>   staging: rtl8723bs: remove unnecessary casts in rtw_ap.c
>   staging: rtl8723bs: remove unnecessary casts in rtw_ieee80211.c
>   staging: rtl8723bs: remove unnecessary casts in rtw_mlme.c
>   staging: rtl8723bs: remove unnecessary casts in rtw_mlme_ext.c
>   staging: rtl8723bs: remove unnecessary casts in rtw_recv.c
>   staging: rtl8723bs: remove unnecessary casts in rtw_security.c
>   staging: rtl8723bs: remove unnecessary casts in rtw_sta_mgt.c
>   staging: rtl8723bs: remove unnecessary casts in rtw_wlan_util.c
>   staging: rtl8723bs: remove unnecessary casts in rtw_xmit.c
>   staging: rtl8723bs: remove unnecessary casts in rtl8723b_cmd.c
>   staging: rtl8723bs: remove unnecessary casts in rtl8723b_hal_init.c
>   staging: rtl8723bs: remove unnecessary casts in ioctl_cfg80211.c
> 
>  drivers/staging/rtl8723bs/core/rtw_ap.c       |  8 ++--
>  .../staging/rtl8723bs/core/rtw_ieee80211.c    |  8 ++--
>  drivers/staging/rtl8723bs/core/rtw_mlme.c     | 26 ++++++-----
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 40 ++++++++--------
>  drivers/staging/rtl8723bs/core/rtw_recv.c     |  2 +-
>  drivers/staging/rtl8723bs/core/rtw_security.c |  2 +-
>  drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  |  2 +-
>  .../staging/rtl8723bs/core/rtw_wlan_util.c    |  4 +-
>  drivers/staging/rtl8723bs/core/rtw_xmit.c     |  2 +-
>  drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  |  6 +--
>  .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  6 ++-
>  .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 46 ++++++++++---------
>  12 files changed, 82 insertions(+), 70 deletions(-)
> 
> -- 
> 2.52.0
> 
> 

None of these are showing up as a series of emails, but rather as
individual ones.  Please use something like 'git send-email' to properly
thread them together so that we can apply them all at the same time, and
not have to do 12 different interactions :)

thanks,

greg k-h
