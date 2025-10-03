Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B1822A7E5
	for <linux-staging@lists.linux.dev>; Fri,  3 Oct 2025 07:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759475264; cv=none; b=nV16/nNbf703a48xPVEkdlvOO1dGr247pQsjjDEgvB08AiPqEP2D6C3SobIRyNzE4d3eBcrw2EX0a8gzC88bXqmgb4/d/hMqkIrAZTrs5559EV1EV6O+/F8yATHJ5XlISMLD5mv3GXLfqN/QuAft+wyfLpQ/XGsi7rdSFW8fwIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759475264; c=relaxed/simple;
	bh=VfnrwV00n1OTVgQ7ak+8WGMC6Lhvu/i4uIuO4QQf7B0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jun7Lw5WOxLDuAS1+e/EUyZrsW+C9ZP9qm24kYRTpDh4HkMJV+48tZdJL633tnMlHwHcvaQSDONuzqcieuma44i0wJGjMePTKlWlNjXMN0GwXbZWU0TZX86vpONZ9Cshdz5bWhHkJbiJonep0sA18ZR5B6zq2QD/3+RDKD565/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DU6REXNF; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DU6REXNF"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3ee12a63af1so1150767f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 03 Oct 2025 00:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759475260; x=1760080060; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+dLYg+KUenxi+tGWfH6hX1Q42Ol8JhSulu76BtWPmL4=;
        b=DU6REXNFZEstTdD1D0IfQywAJ+Po3RbnPuBzChW79vV0+Y1ZdFvUB/paTGf/tPVZLA
         i+QVxt/mgcSFDTUAd1YqYkklLIS3hWRE8nmmdJcLSdceKaXb3E/TOjxO4mvImj7rBtzZ
         VKfGIqxhPbRG1Zs0RrMcAFd9IqyfTIzllnzSwtXvhnzuE8H+nobxNO/Klmjs8/gZsFi8
         E3IahDvpug70hoPPjIreR3CVtEAsGNaQ5Yz2PBwkloHPwuzHVHya6J76CmjEHZIUICLP
         doldUMQtUlUd4tuxvdWzwie/4476KneX6rjE1/6LlvPpn+73sQuRaaIdQMqOWkq6ySOA
         fk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759475260; x=1760080060;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+dLYg+KUenxi+tGWfH6hX1Q42Ol8JhSulu76BtWPmL4=;
        b=UDpFZddfnIcCjFVSMiIOZTUcR7XaOv1XO+Ek64ddIlVs3bXK5X0cTl5kQfX5cWvE+e
         AaZw8mNEa7LKyvmpNsybxGNv5A322QbtmfjJnKDuYg8oDlI5xNdQ4NSu3x17a9AWgmtB
         985UsoBMcpHDVNB5dkU7Ms7ccVfWlzrjUcunelH/zEf3/SrmiTUtOmXKNIHy8Q68gnhc
         2IBnjIEiBOKEs5WUkn9Potrntp3zbgVTiVQqr3c5gpzqBb5sVKLbzyl9S+0catIt5P1m
         a8HH1xofbfHzqy1kFKvDZrJaYEu01ZCkGI60Pgz2vhNLYFWsfd95+4bLqO6KjFzHtWtI
         JS7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUL3xciPvk60PI2Ny+xogNxmlM7ldE7D717IdsFGiJ4RFO5TE80LFGBx3jQhR9SFP7VYDsOn3EzulpCmZaR@lists.linux.dev
X-Gm-Message-State: AOJu0YyHY0QixdJ5kLNOx7TTfvnZOV0YSBPgD79b+dHh34ctwdF4T4Rp
	iTCIyKWHy6b5JGLe+W9Vf5l1vvP3AiKUwQ7/GBimI61dmhzQ6PJ5XGrEnEJP7ecmxMs=
X-Gm-Gg: ASbGncsCfp3ZIhriTL6hEc/b54W6px2nu3/7QDnMGBFgnM+gF+4ehyygclKHiO9Osq1
	qIy+k13b/YhL/zdvKFYrJ5+ECCFsPhc/TdcMmQ/YYaK3cvwq1HjjmXjPi7wJ7Gt46hJ/2yw22Et
	IdbElq5uyoPtl7WWJwJfrdMagAUhUpUfWGQfbByq46l8gS3V/mP5K1mEDLMsNfY3+H/2HFHdOHl
	9x5R9Io1Cmi+dIQwCpVpyZWrPyl/jTBHCV1X4Ccw3QtOyECIMsEnlnJlOBR03byxY/gYVr8Ht3Y
	yKWUv927AKtFzhFbJ1uxCsnLRyAJLdEa8JXSBCAt1X1wZKZ9m02dBhSdTNoO3lp1YsJD9kgxUKq
	rEfYJfZ6+m60sMoMF0/Ph7boN6DueFUHmDcUxqqxB3QoTmT3eaWUrginV
X-Google-Smtp-Source: AGHT+IH6eMzb4VOW5KfpbZYuUFHDgM4wKDGHErJCIyTzM3ybhw/asDsLkBOmij7ls7Gu/mDzsM8qHg==
X-Received: by 2002:a05:6000:4285:b0:3ea:c360:ff88 with SMTP id ffacd0b85a97d-4256719ebdcmr1056224f8f.31.1759475259872;
        Fri, 03 Oct 2025 00:07:39 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4255d8f01absm6582677f8f.44.2025.10.03.00.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 00:07:39 -0700 (PDT)
Date: Fri, 3 Oct 2025 10:07:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 09/16] staging: rtl8723bs: fix excessive indentation
 in nested if statement
Message-ID: <aN92OChccPlzs0KR@stanley.mountain>
References: <20251002172304.1083601-1-vivek.balachandhar@gmail.com>
 <20251002172304.1083601-10-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251002172304.1083601-10-vivek.balachandhar@gmail.com>

On Thu, Oct 02, 2025 at 05:22:57PM +0000, Vivek BalachandharTN wrote:
> Adjust indentation in a nested if-statement to match kernel coding
> style and improve readability.
> 
> No functional changes.
> 
> Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> index 5d31684c7cf3..34fdef878b51 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -1254,8 +1254,8 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
>  
>  					ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue, pnetwork->network.mac_address);
>  					if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == true) {
> -						if (ptarget_wlan)
> -							ptarget_wlan->fixed = true;
> +					    if (ptarget_wlan)
> +						ptarget_wlan->fixed = true;

Wut?

regards,
dan carpenter

