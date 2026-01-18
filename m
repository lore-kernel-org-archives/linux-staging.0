Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AF92EC0AA
	for <linux-staging@lists.linux.dev>; Sun, 18 Jan 2026 12:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768737604; cv=none; b=ON5KOzA8pQSHRZjEFLbQOMAhn16FziuLWX48afmvb4WHDOf0oMqm13gYJIRnae01msm2ZQ2hv3/96opN/NBZw1nMnWdBEq6LuCfETo3o0ZwMmXSqEZ1JY1yQ/t6KU5I7iDo5HsO1qT8kpX7w3sjScaqGiz0inU73ZOOqHDay6Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768737604; c=relaxed/simple;
	bh=QUKIFy1KWubu+ezyqm0bzmv5XxIFJWUxkjA3Ia/WDx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ry0kxema/h0MjAxoqLH2AaHrnxcgQvbOPbXZmuShL+axOyNmXsmBBVWSoXLW2zW+d7UVVcIf7bGCO/Mfgkz8n3vM2ZoPl0zwKWzQuSrs1TkgHS3MMbd7eZAjcMqGvBsBt8TkdFokQ66PVdESD2wDt+gp+rEe0KYONOFl5YvQwz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ROwCTwEN; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ROwCTwEN"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4801d21c411so10148795e9.3
        for <linux-staging@lists.linux.dev>; Sun, 18 Jan 2026 04:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768737601; x=1769342401; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zNKmOWM7uuU0kWQqBwwC50MktRgwdlry/VNrCjqKFfk=;
        b=ROwCTwENZ8ZukSf3KU4SRCWRY6BvvlHYlwyHowGUmmiNYihaEgA8NGWfluoEyYern3
         p0caGRKORJ2ypxUBZ+Q2hyKYnY1aXlxr5f663+ARy7uZuV0Xv2v1tY72tLCAHzG9xr+1
         QDnTojKMlSzo6KiBse8Q8OvzFlG8BI3WEDnzi7dFYGdVD2xEpIL+fngja0DkEuYsqsqS
         WmkOkstVoC+j6mC4JXYFTqirYk+J+KBQiW+Y4OkUVOSopT+hIqlck65A3mAqSVX1RHL+
         zsTW4ZP/Mk8ouK7BCHmKVMmsJYYC7kvtDMenEbWf5ojx+xYstePZYpkGF33txZ+U1eMY
         Gbug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768737601; x=1769342401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zNKmOWM7uuU0kWQqBwwC50MktRgwdlry/VNrCjqKFfk=;
        b=KxQk4ZP2/aCcjK7AeT9oGbN23Ay4+zfguCbvTAUmJbN5fFaTduWBkPZQXHv/HbW6wO
         pHY7QFvq/IC2HommENnN34hskvvB6qSPnR975w+oXavIiTOO9Wr+dK4NvGVkk8PuO/u2
         bxenAwOcEZuUmfYxW1HAKnD7b8XGHzELO+LKFRGkFJDFAnSckXws5zehcawcIkTznSdb
         dSgAk4IaRiPAjX+Cn85OmUsJ8x/G6KIb1bmJ9o/R43UnPmFewpDgWYmzkaG2oXEbn2BJ
         L/o0q6SRcbHvcsR+QAXwi4DXaoHvkcXjQ9bMjwfY43QQ59KtT5+d9qg/84UyZ0s82I++
         W9rg==
X-Forwarded-Encrypted: i=1; AJvYcCXmn+GdgNfeMwGi4EPfyOijTrsVBarj4utDqgJviEUH1PtzBCUGKnkeRDLG2pPpjMn5GMXlUWTeJOESnYf2@lists.linux.dev
X-Gm-Message-State: AOJu0YxZb/fp9xQU9SnxEgaeOoKXHo6ycByrMPpQJgISNfpkPeRel5X1
	4KqOlCYZxVWfB2giH7D/mFe/ZSOlSP4M8cEIOKLYbGyzYdnhQ3uGJSSKz/cbwSWa6RqPbqGkOcz
	mAC9Z
X-Gm-Gg: AY/fxX6mpieKmX86F5x1DDKQ74+NOzKhT22On+4N6owM7fhGS2MRdj7dVgz2rDet027
	zsx2kY88j/2Y+bz41YYAvMSVDZWdHnNeIDnkjK2WT+SK8MhklVolqXOetbBiJjlKL7RKd/k2u3i
	s0a4RbD8km27V3AsZtaXCddkB/Dha6lIWnyeFkcjWdiwv1T9I+b5+riTg2i/Ikvf132/nCX0ZR1
	cakEzf0DrAZrb4GuGEN5PHa+Kk/+wu62Q0s87uhQlfcRouC+BZdUKWbcbO/n3IeSlpemtlm7l1L
	3ZpMG9b5p3QlK8kiMVfcBtlu/t7tAgS+d17ASdyjDL12D0VtEN5BaxEmhUHg0gOiX61zUOp4CVH
	f0nXb67YqsNjxQxUqdHXgb6C6O0cpB/r870M+0ppAfdbp/K27TKryWNmsCBtL/WpHCk60frdlJl
	0nWd8XTGufWFmiS39ydfRXFew1a+E=
X-Received: by 2002:a05:600c:3555:b0:47e:e20e:bb9c with SMTP id 5b1f17b1804b1-4801e2f8e63mr105795515e9.8.1768737600669;
        Sun, 18 Jan 2026 04:00:00 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e879542sm142833875e9.4.2026.01.18.03.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 04:00:00 -0800 (PST)
Date: Sun, 18 Jan 2026 14:59:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Khushal Chitturi <khushalchitturi@gmail.com>
Cc: gregkh@linuxfoundation.org, hansg@kernel.org, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] staging: rtl8723bs: simplify boolean expressions
Message-ID: <aWzLPQ_T5InVjT_V@stanley.mountain>
References: <20260115102910.10018-1-khushalchitturi@gmail.com>
 <20260115102910.10018-3-khushalchitturi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115102910.10018-3-khushalchitturi@gmail.com>

On Thu, Jan 15, 2026 at 03:59:08PM +0530, Khushal Chitturi wrote:
> Simplify boolean expressions in rtw_xmit.c to
> comply with the kernel coding style
> 
> Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_xmit.c | 38 ++++++++++++-----------
>  1 file changed, 20 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> index bbc42db1c828..97e38ef62ac4 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> @@ -384,7 +384,8 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
>  	} else {
>  		while (true) {
>  			/* IOT action */
> -			if ((pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_ATHEROS) && (pattrib->ampdu_en == true) &&
> +			if ((pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_ATHEROS) &&
> +			    (pattrib->ampdu_en) &&

What are these parens for?

>  			    (padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)) {
>  				pattrib->vcs_mode = CTS_TO_SELF;
>  				break;
> @@ -420,7 +421,7 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
>  			/* to do list: check MIMO power save condition. */
>  
>  			/* check AMPDU aggregation for TXOP */
> -			if (pattrib->ampdu_en == true) {
> +			if (pattrib->ampdu_en) {
>  				pattrib->vcs_mode = RTS_CTS;
>  				break;
>  			}
> @@ -482,10 +483,10 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
>  	memset(pattrib->dot11tkiptxmickey.skey,  0, 16);
>  	pattrib->mac_id = psta->mac_id;
>  
> -	if (psta->ieee8021x_blocked == true) {
> +	if (psta->ieee8021x_blocked) {
>  		pattrib->encrypt = 0;
>  
> -		if ((pattrib->ether_type != 0x888e) && (check_fwstate(pmlmepriv, WIFI_MP_STATE) == false)) {
> +		if ((pattrib->ether_type != 0x888e) && (!check_fwstate(pmlmepriv, WIFI_MP_STATE))) {

These parens?

>  			res = _FAIL;
>  			goto exit;
>  		}
> @@ -639,8 +640,8 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
>  	memcpy(pattrib->dst, &etherhdr.h_dest, ETH_ALEN);
>  	memcpy(pattrib->src, &etherhdr.h_source, ETH_ALEN);
>  
> -	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true) ||
> -		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true)) {
> +	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) ||
> +	    (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE))) {

These etc?

regards,
dan carpenter

