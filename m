Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4E21B78F3;
	Thu,  7 May 2026 05:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778130133; cv=none; b=VhEAHrmdpzU89S2+qp3dK8sILLYansuiLT2XUCKXeO7mjXMaIQZt2FnxcGM5wtBOeRABEEQr7WbgbK1rMSdC9Xv9pdoFlixjMRSOiYgUwlzAPbj3NrgiS3hbVRqcA8KYIwdPwfxsNSJ30OzL9ZCfmKZt8mO7lx72fjBd9EcbGHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778130133; c=relaxed/simple;
	bh=KADQTHjwkdDoifA/lXya69qcNgbaXKFJ55+jasLnLxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hVmTyYSiVzchWUM+Ho9pvqmLCA5KG4YBDzc1sK/kS62KJa5JzirWtibFWodn19E1es0LDONSRxiWiqybFWsMlo76vEWRSf77qwjdMcUIwhZ3ZyX3nXF8iIWTQCZ0lnWuRZb88jVc2OixfXh+fuBdR84+M/F+ABHzVCo194fWf38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0w2sk+aO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0w2sk+aO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A437CC2BCB8;
	Thu,  7 May 2026 05:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778130133;
	bh=KADQTHjwkdDoifA/lXya69qcNgbaXKFJ55+jasLnLxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0w2sk+aOo3Ktd13hRrUizCR4mnNyt0KnpUifApkbHJpvvsiCk+6QWn5CjmcG5XU2Y
	 C4eq8BKqiHo4OPe2PtMooLemqP00pdd4VWlG6mWjQFKfZ6teTUW55+SdJX6jpxrqKZ
	 dzhbAG5NXhBE0hUUNneUFSx9GtuJ0lqYCcBI58UQ=
Date: Thu, 7 May 2026 07:02:10 +0200
From: gregkh <gregkh@linuxfoundation.org>
To: Ashwin Gundarapu <linuxuser509@zohomail.in>
Cc: linux-staging <linux-staging@lists.linux.dev>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] staging: rtl8723bs: remove unnecessary comparison to
 true
Message-ID: <2026050716-parachute-murmuring-3ffe@gregkh>
References: <19dfd836c6b.17df539d18654.525093089149603654@zohomail.in>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19dfd836c6b.17df539d18654.525093089149603654@zohomail.in>

On Wed, May 06, 2026 at 07:09:01PM +0530, Ashwin Gundarapu wrote:
> >From 86e105cece56ebf48c8e9ac86d417d201ebf081d Mon Sep 17 00:00:00 2001
> From: Ashwin Gundarapu <linuxuser509@zohomail.in>
> Date: Sat, 2 May 2026 17:19:48 +0530
> Subject: [PATCH v4] staging: rtl8723bs: remove unnecessary comparison to true

This all should not be in the body of the email, how are you sending
this?  Please just use `git send-email`

> 
> Remove explicit comparison to true in check_fwstate() call and
> add spacing around the bitwise OR operator to improve code style.
> 
> Signed-off-by: Ashwin Gundarapu <linuxuser509@zohomail.in>
> ---
> v4: Moved changelog below the --- separator. Ran checkpatch.pl - no errors
> or warnings. Fixed whitespace per Greg KH's review.

What about what changed from 1->2, 2->3?

> 
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

This is not the correct indentation, as stated a number of times already
:(

