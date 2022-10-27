Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C517B;
	Thu, 27 Oct 2022 06:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=VRlppOXqTERUsMfJJp57WhabYcrLNxxlFHPbP6x0mek=;
  b=bR49g5cgS+CzcNm9iTkkSHFS/h4c+5RfaXX8zGEXYZQLysFoeZqXw+gV
   XDpoznlf9Kww6gmBVFnBIkQ2s9uYODTV6X0qOrpaVEmnogSFLU/2lc/o/
   soyI9+nHSjwmcfkvB5BgyyyEe4k77Tc2QyPeNeYFKbfvlfzX3ZtAvy8PG
   8=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.95,215,1661810400"; 
   d="scan'208";a="35679348"
Received: from 51.123.68.85.rev.sfr.net (HELO hadrien) ([85.68.123.51])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2022 08:12:14 +0200
Date: Thu, 27 Oct 2022 08:12:14 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Emily Peri <eperi1024@gmail.com>
cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Replace ternary statement with min
 function
In-Reply-To: <Y1neXqVYZ8mq8jH+@marshmallow>
Message-ID: <alpine.DEB.2.22.394.2210270811540.2792@hadrien>
References: <Y1neXqVYZ8mq8jH+@marshmallow>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Wed, 26 Oct 2022, Emily Peri wrote:

> Ternary statements that pick the min of two values can be replaced by
> the built-in min() function. This improves readability, since its quicker
> to understand min(x, y) than x < y ? x : y. Issue found by coccicheck.

It looks like a nice change, but I get a compiler error afer the patch,

julia

>
> Signed-off-by: Emily Peri <eperi1024@gmail.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> index 6aeb169c6ebf..0cf7d9f82b83 100644
> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> @@ -1551,7 +1551,7 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
>
>  		wps_ie = rtw_get_wps_ie(buf, ielen, NULL, &wps_ielen);
>  		if (wps_ie && wps_ielen > 0) {
> -			padapter->securitypriv.wps_ie_len = wps_ielen < MAX_WPS_IE_LEN ? wps_ielen : MAX_WPS_IE_LEN;
> +			padapter->securitypriv.wps_ie_len = min(wps_ielen, MAX_WPS_IE_LEN);
>  			memcpy(padapter->securitypriv.wps_ie, wps_ie, padapter->securitypriv.wps_ie_len);
>  			set_fwstate(&padapter->mlmepriv, WIFI_UNDER_WPS);
>  		} else {
> --
> 2.34.1
>
>
>
