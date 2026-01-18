Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF83218827
	for <linux-staging@lists.linux.dev>; Sun, 18 Jan 2026 12:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768737734; cv=none; b=bMl1fQ7i75gSi3L1Ilcm9tQFD5+AOi/1OzkIGIkP1nH0ww+qTWjyPoIYQPoum8nPVzqw8hIA0yZWFXtoj2S4s0p+QGPxymmtOkfYibbsGQr2F5LREWKOxUEAbcVGSpsET3fyf8jtqHqUkkhsPw6EtAwmoCl67RSBOhK1DHKRTBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768737734; c=relaxed/simple;
	bh=GaRLsDYVHAIpsLkPUuBEekQPKkEikAudPJ8AsCSh3us=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ApB3ptyZNVZXfUnPS2nVSv4tuoIb6fhyNwlapZvAT1DNhimKpaHmKDd5KcYIQg2BOJKWa4hvJtA6WAXLQtuKon/UTBwP5PMz/UqE/sMLb9LOVaKMiJJt/2oyvBCdkRlnoGQ8CKcuY85eQgOBYqDbcHhoC7BZFHG9q7LX/wOqiaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yehnjGf2; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yehnjGf2"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-432d28870ddso1814291f8f.3
        for <linux-staging@lists.linux.dev>; Sun, 18 Jan 2026 04:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768737731; x=1769342531; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fsOjmXq861+B8+piq64axGGmhncgWMIggfsLJIoRT+8=;
        b=yehnjGf2H+wM5PMudjOOsq2l7DhfWKdskUqPDm3adSMimOiAnAaSGn33rSCWvvkh4d
         RpGqTcedpDet33q8FjXRzYCPR9qYJBkH7vG7E46hG3XdCbufU1bsNk7LI8yGu/rmPCsd
         Lrx0HcLqX+Y7aVpw0BNJDhgoxknL4hkMp+ecrfKbfRzMPS8TXhnFK5nE7ldga2sSGFwM
         xCJpb/ChnKZCbuuUyokl/Yv4FEmUayKVScbP3boEqbx4Oi7L/YkfZctQLE0UvPUtWogm
         vuAeVfSJu7UPffqTIX1xzLuDAfVpD2WNNLoHUDnrOTgaYV5OrJ3rMTvIGWuTP1ovVNev
         QMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768737731; x=1769342531;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fsOjmXq861+B8+piq64axGGmhncgWMIggfsLJIoRT+8=;
        b=p7HcpXIktXsZIOUYndCtiEPeZ0C/kj/iLeApGN59K5vtx9UDhApghJ+BvuxU0adrBH
         r4cGIbpifkF+WHzNLgvgpitLHova1KvmslP3U9gK1GjZkQi252LXknSvhj8rw+jhAZdQ
         OHzDZBD0u72qzmgUEy+G4meU6hJKXLOUUzXoRgAj28iKcEDii3cRJBleLIBTRiFSmu6t
         0WFZuBo4LcqhElJ6IKyyE+i1c0PgLEflMJb10845UgKSrsWkBb81FWu8FPtd5dsQKHbx
         MbRB/IsOsQB+qCwvUkL7UU1XvwmI2efQZSLuw1LGn/T7GNfSRmiuPmuE1AYP8nEsJlRA
         QRYg==
X-Forwarded-Encrypted: i=1; AJvYcCWOBo7HdR14V1zFPa4oh+Tv1YwmG48U7FuYKJRxyzSrMnR6Qyk61yi6NvdJNHCVhiet5Awy7ZvZ7PNPxVMO@lists.linux.dev
X-Gm-Message-State: AOJu0YxtX+Yc3VJrzmUuWeyE1xNf6MJ981l4tTtsE1YNVlhvjigiK7eX
	nQWrdCg8cw6HmKCEtUXIuE2JhkB5x1zzlO2Rubj8ACNl1+Lr6oePgOT3Fb1J9eQiJBI=
X-Gm-Gg: AY/fxX7hnOxH5LrR7ZLtL71hSGS/pCa51JlDpc1B6juJheabwpfah1lx0Gq/hqXoQ6u
	W+PIJKX/gP5/CmbJvNBIbl7mtAPzbgtD/m+lYl1kelx1L/URUJSC2U3ZyIegfBEhBMiqg1Nj9qR
	ZHpUe1+GIqs3UEoHx1KXrRkuR+R0QPt/HtX/RaBfZHsd8EJy5oEdCZ4TQyDmOKCVDNTqer68VA2
	Lcs5WcpoP2B7LtjzMAbuGPw+NoZEZ1J5GjiKlCDCVlqOgJI1S+sW8xw/gejWhEoF5vXsUSX5gcs
	WyWv8P0+e9SRV3hRhfF+x4Idsmz/4CDKM5oQtLjsZ3RWrWzLaAPBrNCFr1bzM/uf/M8A+soUbfU
	elerr4TaFJ7PNvfOe7Pxcv1gCGnWZNdDQWm0xOK+ztf1vpVRg34onfA8rDmxKb1/Zi9evXp2CCh
	7W6R7JWf0dG7CwlCMO
X-Received: by 2002:a05:6000:2911:b0:431:327:5dc2 with SMTP id ffacd0b85a97d-43569bcc0acmr10070937f8f.51.1768737731039;
        Sun, 18 Jan 2026 04:02:11 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569926648sm17117733f8f.10.2026.01.18.04.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 04:02:10 -0800 (PST)
Date: Sun, 18 Jan 2026 15:02:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Khushal Chitturi <khushalchitturi@gmail.com>
Cc: gregkh@linuxfoundation.org, hansg@kernel.org, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] staging: rtl8723bs: rename CamelCase identifiers to
 snake_case
Message-ID: <aWzLv5ezJOf5r8Rl@stanley.mountain>
References: <20260115102910.10018-1-khushalchitturi@gmail.com>
 <20260115102910.10018-4-khushalchitturi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115102910.10018-4-khushalchitturi@gmail.com>

On Thu, Jan 15, 2026 at 03:59:09PM +0530, Khushal Chitturi wrote:
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index ef2d92b5588a..005e6737e1af 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -1148,10 +1148,11 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
>  			BusyThreshold = BusyThresholdLow;
>  
>  		if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > BusyThreshold ||
> -			pmlmepriv->LinkDetectInfo.NumTxOkInPeriod > BusyThreshold) {
> +			pmlmepriv->LinkDetectInfo.tx_ok_in_period > BusyThreshold) {
>  			bBusyTraffic = true;
>  
> -			if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > pmlmepriv->LinkDetectInfo.NumTxOkInPeriod)
> +			if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod >
> +			    pmlmepriv->LinkDetectInfo.tx_ok_in_period)

This is just weird now.  NumRxOkInPeriod vs tx_ok_in_period?  The names
don't match and the tx_ok_in_period name doesn't make sense.

regards,
dan carpenter

