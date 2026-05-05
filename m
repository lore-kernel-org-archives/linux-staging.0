Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4FC33D6ED;
	Tue,  5 May 2026 10:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976011; cv=none; b=ra3qvWBxUIna58uAU27dSSeNsHuIXhm/S25JLacfpUDzpUmwgCReNMBcsLBhXkUGo9JzZPcbvZ8KruLOOM4OQrae83WfohdvyRjbUcwBqcitByD8KYe4MGaJVNfe1IO2kStFwpO8wLF25044SJVetY9YY+KI7uzxuMTknsP9kp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976011; c=relaxed/simple;
	bh=mzZJWteICujYg/uzhIC9kXcTd+vF03HC2sK/+q51+mY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oMA8VfC+is9Fp9RF+jyPsjQgyG1qq3xxQ7tvM5zuoTidkt4nJSZXsDoCX9kZyvJfQAC8/W3/y/9powWyGRPoBNfmMv7ce73H7MOcDSYYHRlB+suI0Gi1aO0tWjXIP03E0g1T3uIV1PtXZXU486D0Q/bImCLHzXl04t+5qvz6YbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uIa6tdTu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uIa6tdTu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C45AC2BCB4;
	Tue,  5 May 2026 10:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777976010;
	bh=mzZJWteICujYg/uzhIC9kXcTd+vF03HC2sK/+q51+mY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uIa6tdTuu7nqUDWVBbZO56u2/XBA8kL1su1utjkL7nSVQKzrt5AP32sTWVWIT//7M
	 qahoG8yHdnXFJpGt3zo+yTd8O4M6+NLKzCrq4qYscvXGTDBuGffS/wGQO3ICT2b3O6
	 /KtDhiS2Cno8oMJJ/uaSXs/H4dtGMJ3+zjpv+OlM=
Date: Tue, 5 May 2026 12:13:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ashwin Gundarapu <linuxuser509@zohomail.in>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary comparison to true
Message-ID: <2026050516-encrust-undated-9895@gregkh>
References: <c4d5b70f-dcc7-47cd-a026-2864e0d76e46@zohomail.in>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c4d5b70f-dcc7-47cd-a026-2864e0d76e46@zohomail.in>

On Tue, May 05, 2026 at 03:38:39PM +0530, Ashwin Gundarapu wrote:
> From 833733dda327c72d63bcfb18701fadabae03e4d2 Mon Sep 17 00:00:00 2001
> From: Ashwin Gundarapu <linuxuser509@zohomail.in>
> Date: Sat, 2 May 2026 17:19:48 +0530
> Subject: [PATCH] staging: rtl8723bs: remove unnecessary comparison to true
> 
> Remove explicit comparison to true in check_fwstate() call and
> add spacing around the bitwise OR operator to improve code style.
> 
> Signed-off-by: Ashwin Gundarapu <linuxuser509@zohomail.in>
> ---
>  drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
> b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
> index c70541f95a73..c100a0d70fe2 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
> @@ -151,7 +151,8 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, struct
> ndis_802_11_ssid *ssid)
>      else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING) == true)
>          goto release_mlme_lock;
> 
> -    if (check_fwstate(pmlmepriv, _FW_LINKED|WIFI_ADHOC_MASTER_STATE) ==
> true) {
> +    if (check_fwstate(pmlmepriv,
> +        _FW_LINKED | WIFI_ADHOC_MASTER_STATE)) {
>          if ((pmlmepriv->assoc_ssid.ssid_length == ssid->ssid_length) &&
>              (!memcmp(&pmlmepriv->assoc_ssid.ssid, ssid->ssid,
> ssid->ssid_length))) {
>              if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == false) {
> 
> base-commit: 26fd6bff2c050196005312d1d306889220952a99
> -- 
> 2.43.0
> 
> 

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

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
