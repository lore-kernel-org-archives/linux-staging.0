Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6525C3148C5;
	Tue,  5 May 2026 09:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777975091; cv=none; b=mGgEq89gq5mLw4amuoCzaDUZS5TXBFkLh5ruAKloIXEHGz1As0zhHuDAQqbfbMOMIi0zFTvHbqnSZbylUdHfXfIH8qLI4VegUn0/dd6Hd2GeU32ai7u8ZTB4Hh59U3J+MRRwdF5Zh8AfF2xFyadSqEjMyVkmv24WMiTzyWeLvSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777975091; c=relaxed/simple;
	bh=wHsGY403j+eHi/ZLsk+PV9x1DNws0frM1L+aVY6f9EE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XJvWioCSGx5vjkC3YrlvIC1GXMtgYigNPHo7LSohUqeycIKctUm8/WYqFZB4kvHyqDlknKkTCXyJCPPxZR04KreA9RN5Z/zHFOo9+imZ3ttXOSR+sY7n8ZLvdszwTDJhrRmvkI4jHOcgOZt1MNVYxotRGcYE5bQcLWWxmMJfBA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dyFB8gCk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dyFB8gCk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96A34C2BCB4;
	Tue,  5 May 2026 09:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777975090;
	bh=wHsGY403j+eHi/ZLsk+PV9x1DNws0frM1L+aVY6f9EE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dyFB8gCkmWufZywb4DJrzuCBpiq2ozlO35Dlpj84ds8dUAQJG0nwaCqtYV0IOS3ED
	 1XS+8t4+efCX57u6P5rdMuNBPd3qErcZZbK5bQvrIilCR7+Ps72mZ7CyArSYDQyuVv
	 t9L2rA+yK7N8t2Sy4yHL1Qcl04Jp57DCJxlO0ou0=
Date: Tue, 5 May 2026 11:58:08 +0200
From: gregkh <gregkh@linuxfoundation.org>
To: Ashwin Gundarapu <linuxuser509@zohomail.in>
Cc: linux-staging <linux-staging@lists.linux.dev>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary comparison to true
Message-ID: <2026050541-banjo-pranker-490d@gregkh>
References: <19df78192f1.8499078d18124.8136902784979453848@zohomail.in>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19df78192f1.8499078d18124.8136902784979453848@zohomail.in>

On Tue, May 05, 2026 at 03:09:17PM +0530, Ashwin Gundarapu wrote:
> 
> >From 833733dda327c72d63bcfb18701fadabae03e4d2 Mon Sep 17 00:00:00 2001
> From: Ashwin Gundarapu <linuxuser509@zohomail.in>
> Date: Sat, 2 May 2026 17:19:48 +0530
> Subject: [PATCH] staging: rtl8723bs: remove unnecessary comparison to true

This should not be here.

> 
> Remove explicit comparison to true in check_fwstate() call and
> add spacing around the bitwise OR operator to improve code style.
> 
> Signed-off-by: Ashwin Gundarapu <linuxuser509@zohomail.in>
> ---
>  drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
> index c70541f95a73..c100a0d70fe2 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
> @@ -151,7 +151,8 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, struct ndis_802_11_ssid *ssid)
>  	else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING) == true)
>  		goto release_mlme_lock;
>  
> -	if (check_fwstate(pmlmepriv, _FW_LINKED|WIFI_ADHOC_MASTER_STATE) == true) {
> +	if (check_fwstate(pmlmepriv,
> +		_FW_LINKED | WIFI_ADHOC_MASTER_STATE)) {

You also wrapped the line, why?  checkpatch should have complained about
this too.

thanks,

greg k-h
