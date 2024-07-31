Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B117949624
	for <linux-staging@lists.linux.dev>; Wed, 31 Jul 2024 05:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722402675; cv=none; b=im5lBVh4OIw4zAtIgf5I0ZTc6xsJ1fBK1v2uSe1azuc2jlX018lcWgBEAFLpqFqQOFgGhabaQqjM2lFTBydW3tAZFjNveJfW3iPo1eykdGKrkcM9lz/uoxifYOjQODymCzuHrWjtrjivtZjCKCxhUFXxKuMP/nGBQcDszl5fl/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722402675; c=relaxed/simple;
	bh=8arqm9uivniBVrkX3K1+hWxUe6R6dbHXmuySzxkS+Rg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gJYp8atgfSTV2zp65NYuQpyBPH6bqYExZdRZFV4iCf3SIn126G4hUAsbZn37JokWRnCYf4olDT1f41de1yOdpro7c9jjVV+gOi5YtyGFQzufoJ4YxPcS6XPgn06Xp4lkjf0mVTet/OMKFz3Uc4sNYOjhl6cGvqENrnAq5LudC7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XLLkvHWp; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XLLkvHWp"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5a2333c92ceso863196a12.0
        for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 22:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722402672; x=1723007472; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JyyJ0zpn0TPgwRfHAQUoo9coDlF7OiJbaymCzyth/ys=;
        b=XLLkvHWpehHLYCo6RgVEuXyTiFCZSqxm2yCbMCBbPCWakqyOh2Kzy3M4legS+Q+oZP
         l/iSDDhogyEEcnA3CKoybg+BFIndi7U7+st8ySOb4ulppLdpCK2lWS8qCCq6E2lrcaJn
         1lpbAMfrxPVZee02AaCPFxEVu23ZlTLkBuGeRabtfpnuXYUOthO7WkYdTNRqShLr/XCp
         4skz1Ga+lSKp/IR+49PcVd8ICNzbmEHvA2X5+uUxFLu7jBBbflHFzsY82yVGUKNeMOZA
         zDwcgMQyKJWMgWiPzN9SOtKioOQQukbuaixktNIqPp7mi4cn6o9sf3q0Eidj8hsv1BD5
         WM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722402672; x=1723007472;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JyyJ0zpn0TPgwRfHAQUoo9coDlF7OiJbaymCzyth/ys=;
        b=LCcWXztSNFWBOweMQJ3e0czNzI6Az4b5j3J+eP0kPlGDmMH49A4Wn1WVOMqrYRdKjs
         KJqzZcJy9lQwqVOdsdbv4OD5/aopawad0WTxmy78eAFA5ydShJmHi0o2sHI7kZuZ7Svs
         9YQzlg4Ex8IoJ4yfvl+P9V3DzsnXpkUWAWs6XV49YRV+gcUgVycSeIk44Mp7oQvqYmhG
         Jicu/Gjh4u/GAXdagaoxm5byhzLmwxnZuK7v4L14BahQWNEPEPoMhLID4hDYQrKtiEyo
         WoYN8W9XiSBuUm6CNz1GVou4jbz6l3OR21OWr0ztSWUel6K+R9SsQcNRYKp2vVjLOGRs
         XM3Q==
X-Gm-Message-State: AOJu0Yx3DrT/6dv/EmnhSQnuJTyaqplVEsdiCgSAgsBkVsdp+AfR70kH
	P1PATiLz3OoKac1TZL/NFy2AF8qmwfb1oTvYctOYDpbTqYD9ohhX
X-Google-Smtp-Source: AGHT+IEdU3f68hnYxvpVWBsO5cx8sYbe2/mhX6gs+rL6BbXVHhuO1biabC7Qb8I3ZOJ1IlwYyM0OAQ==
X-Received: by 2002:a05:6402:34d5:b0:58b:e3b:c5de with SMTP id 4fb4d7f45d1cf-5ac2ce66a84mr8283061a12.4.1722402671821;
        Tue, 30 Jul 2024 22:11:11 -0700 (PDT)
Received: from [192.168.0.104] (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ac64eb7c0fsm8169852a12.62.2024.07.30.22.11.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jul 2024 22:11:11 -0700 (PDT)
Message-ID: <b53178f1-1b52-4fea-9edf-092e6961c96d@gmail.com>
Date: Wed, 31 Jul 2024 07:11:10 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8192e: remove duplicate macros from rtllib.h
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240730082928.62284-1-straube.linux@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240730082928.62284-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/30/24 10:29, Michael Straube wrote:
> These macros just duplicate macros from include/linux/ieee80211.h.
> We can safely remove them from rtllib.h.
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
> compile-tested only
> 
>   drivers/staging/rtl8192e/rtllib.h | 11 -----------
>   1 file changed, 11 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
> index 022851b7f1a9..e87313a30741 100644
> --- a/drivers/staging/rtl8192e/rtllib.h
> +++ b/drivers/staging/rtl8192e/rtllib.h
> @@ -414,17 +414,6 @@ enum _REG_PREAMBLE_MODE {
>   #define WLAN_GET_SEQ_FRAG(seq) ((seq) & RTLLIB_SCTL_FRAG)
>   #define WLAN_GET_SEQ_SEQ(seq)  (((seq) & RTLLIB_SCTL_SEQ) >> 4)
>   
> -/* Authentication algorithms */
> -#define WLAN_AUTH_OPEN 0
> -#define WLAN_AUTH_SHARED_KEY 1
> -#define WLAN_AUTH_LEAP 128
> -
> -#define WLAN_CAPABILITY_ESS (1<<0)
> -#define WLAN_CAPABILITY_IBSS (1<<1)
> -#define WLAN_CAPABILITY_PRIVACY (1<<4)
> -#define WLAN_CAPABILITY_SHORT_PREAMBLE (1<<5)
> -#define WLAN_CAPABILITY_SHORT_SLOT_TIME (1<<10)
> -
>   #define RTLLIB_STATMASK_SIGNAL (1<<0)
>   #define RTLLIB_STATMASK_RSSI (1<<1)
>   #define RTLLIB_STATMASK_NOISE (1<<2)


Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
