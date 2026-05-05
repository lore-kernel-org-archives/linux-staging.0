Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5649E2EC54C;
	Tue,  5 May 2026 09:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777974945; cv=none; b=qWNH3ih7Y7nPncZBu8VaDE5p7PGFesGdhhbI4pQosCxMNJitHnVh5XXZBPRXu1CRx+uCR8jSFQ9PLntPhKdMs3tsFflervQwDEwlENyxZPHAw5G0/se58R+3yTDP3qNdneaChVnb0A1ZlYSaIMrq5YVYUsPGjDcmUjX+cY6yVNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777974945; c=relaxed/simple;
	bh=fsrkDXt9kZYiIuzv6dzmgaMzR2RK+yqCoTjDrNI4sbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ojuT4Uwt7gdar4MRIMo4mLg91JzGmcB6ZdtVb+hwXXLvFIDUIyJrT/f0iSCPQWdpGue9bO7lB+B6t/WqgWwHMMpuwLhBufxs13rG2cGcckBuRnGSxf8OOu/0ZyjYIPuSDh99RMFZ7RvmtJPrv13fGs6pQgF34iOTWqOv3TXyMgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mqLfKjbn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mqLfKjbn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1017C2BCB4;
	Tue,  5 May 2026 09:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777974945;
	bh=fsrkDXt9kZYiIuzv6dzmgaMzR2RK+yqCoTjDrNI4sbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mqLfKjbnWqNPw6febRsqJsk0R84PQkiilKsiFH8i4u5eazyI4pQgctFTw7RPazwPr
	 eo5scMt4Uxj4osvynyXh/U7wXJ8cjld8OMxlN6+7l/QVRxiwTn5wBBT7D3zV4K6dIC
	 +4qqa/RCXtH/bC81rN+3iBhqUITke76JO225MjfQ=
Date: Tue, 5 May 2026 11:55:42 +0200
From: gregkh <gregkh@linuxfoundation.org>
To: Ashwin Gundarapu <linuxuser509@zohomail.in>
Cc: linux-staging <linux-staging@lists.linux.dev>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary comparison to true
Message-ID: <2026050525-broiler-crave-96a5@gregkh>
References: <19df778aebb.7f64067a17835.894066473533179316@zohomail.in>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <19df778aebb.7f64067a17835.894066473533179316@zohomail.in>

On Tue, May 05, 2026 at 02:59:34PM +0530, Ashwin Gundarapu wrote:
> >From 833733dda327c72d63bcfb18701fadabae03e4d2 Mon Sep 17 00:00:00 2001
> 
> From: Ashwin Gundarapu < mailto:linuxuser509@zohomail.in >
> 
> Date: Sat, 2 May 2026 17:19:48 +0530
> 
> Subject: [PATCH] staging: rtl8723bs: remove unnecessary comparison to true
> 
> 
> 
> Remove explicit comparison to true in check_fwstate() call and
> 
> add spacing around the bitwise OR operator to improve code style.
> 
> 
> 
> Signed-off-by: Ashwin Gundarapu < mailto:linuxuser509@zohomail.in >
> 
> ---
> 
> drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 3 ++-
> 
> 1 file changed, 2 insertions(+), 1 deletion(-)
> 
> 
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
> 
> index c70541f95a73..c100a0d70fe2 100644
> 
> --- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
> 
> +++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
> 
> @@ -151,7 +151,8 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, struct ndis_802_11_ssid *ssid)
> 
> else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING) == true)
> 
> goto release_mlme_lock;
> 
> 
> 
> -	if (check_fwstate(pmlmepriv, _FW_LINKED|WIFI_ADHOC_MASTER_STATE) == true) {
> 
> +	if (check_fwstate(pmlmepriv,
> 
> +		_FW_LINKED | WIFI_ADHOC_MASTER_STATE)) {
> 
> if ((pmlmepriv->assoc_ssid.ssid_length == ssid->ssid_length) &&
> 
>     (!memcmp(&pmlmepriv->assoc_ssid.ssid, ssid->ssid, ssid->ssid_length))) {
> 
> if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == false) {
> 
> 
> 
> base-commit: 26fd6bff2c050196005312d1d306889220952a99
> 
> --
> 
> 2.43.0

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

- Your patch is malformed (tabs converted to spaces, linewrapped, etc.)
  and can not be applied.  Please read the file,
  Documentation/process/email-clients.rst in order to fix this.


If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
