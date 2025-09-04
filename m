Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8069A29E11C
	for <linux-staging@lists.linux.dev>; Thu,  4 Sep 2025 07:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756971778; cv=none; b=eWgxNKiPbfwlMBxFXtxUwnhHztWZelHHrWkNFLgcgUGAO1IaAroVOUcs3InNRXq4NcfUhwBsKAqvgmmcBjf639rfs1sBJE4YuPRcJgdlxVS28+scl2MGcgOL+zNs13v55juj4DqOwrgS1GjgrknivkTlfpKD8bRIXIyXRyNe5Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756971778; c=relaxed/simple;
	bh=ZaFZpuefFgzZpMrXGV6OywiSg0kF8Ybw36uYEX7yPQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GtCTaonSh+hdy/Ab8i9sLHGeWFRfUSqyAg+jegrlkk9t/kgqHtCktKE5ulcF6KaEx59JKYgLZ3iM5iJGbpHZZCuWvaRx5eLMKRdwez587vkTorTt6piwprffScUrveqXgVej/FYqDAj+yRdpapIW41wdCDvyZ1AhiGiiaq1BlC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z8eDdYEX; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z8eDdYEX"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45b7d87b90fso5666075e9.0
        for <linux-staging@lists.linux.dev>; Thu, 04 Sep 2025 00:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756971775; x=1757576575; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PE1WEm0x+xTSY0iMhqlk9K01ZY7gt87ogAjaJwXEInI=;
        b=Z8eDdYEXkEUuoWFM2Z/CBXa5x0I3GVUlcDQN5lzTPksKykm35EujC3afj415LggAbM
         gV51wxG2I47Rv8EQsbMuZsHIz7K6WRVlNy4WEFTeLtHKS4dX3s4GRtY3ZsE9i+jUTE/2
         Pnq75bVkmTfJiLDZvsR1XQcOmKQZ6/plrpICvtKT8sqi/EodPSkaJrbXSPDI7/sEOt9q
         8ybmYiBPYm5/AGsRJp44uulzdh1GF9oz4gwH+lP32sT9vqkrc0zp655b9u3STeZKGmnJ
         eFAOWNIEl2PjQr7VwuNGK3OHU/4yBRMirUY4rkxFfLDl/zh3b+HYGK7wE+YVkD6Uix56
         otzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756971775; x=1757576575;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PE1WEm0x+xTSY0iMhqlk9K01ZY7gt87ogAjaJwXEInI=;
        b=u10wLEjuDKN9tO5kURsr+FRBKnkzB4WqAPlB4HQmaTglX7fGKpqsaFfB1HLwfbAgSd
         Nw/kzXxxkzSB1Y8CAmurNDcmqXvrby/AFbwFbCntzpNpTbTKdQNNTIM7UFyU6qa5izf6
         JQgGZEajQYY+Cmihek9PVLglwQ+4jXMr/NkaDJ6M4d7pKgPooesRhPIhARaMBfvAoMVe
         4d69wwff/yb//DLHzdJcyd3G1orFjKZ2uPzUbxz2HCgpY7GcgcRyXdzMtq8b8vo1+fq1
         SRA7/hwrmAGISTszDL64Bw2Z6LL6JcBNohrLPEE647tZ5Je1CnuzKnz7nrcAPa3+HPGT
         dp2A==
X-Forwarded-Encrypted: i=1; AJvYcCUlKHqu3bs5xJUyGZGrKpeIHQcl7Gvr5TBp6BjRsr/Xu5BLgq1D+eICCsqWDYy8jLBkwOtAAOcnG/pOS79v@lists.linux.dev
X-Gm-Message-State: AOJu0YzJvusHF9eFo6HB7GUrlVCG0oc48In5YH45iMmzOjCRu40bW30l
	Mq4jLe9g9fAHOplnzLlxhurP/soDV9uOBtwZ7Xgd58omplqNLltSSS5uwoKmbwq/JXE=
X-Gm-Gg: ASbGncu6R1177vJouaFL9A2+9yU0fFtcVrkUEx7PtCCYCsh3fOzYEpPUXxR4sc1ik+o
	EX+4axR2HaDi3AILy14x7bAxAEC9Uc/yLgfCAc/yDS0KUGghJKcsKhQZd6NvyyqrA5tVuDNAx72
	+u4fq5OS8Xe+EvmngqC69o4dB4Bjx0JYiH27yUXoN0PTPuKmJi8xES2J0ZFZtmRCBj+1+bwtu2A
	+hx379EYN84dZeQ1edp2FCxjTKGH2VColAR/S5MoM5XoylUbkft/HFwbm27gCZXNMVhZr8QhOFu
	heK8j2vu7CnxWjQ6zDhI+mQoxdqCvUwp3Lxexz6H2WbBpyBXOePEZZrhNNeFkdczfzxP7/aZXbM
	s288E0dghkODhoBJmd82ZeojvkaQuTuWy35gLutGQbvJKgsea
X-Google-Smtp-Source: AGHT+IFqEKV1dOU6AtGVeQbAA7dRuZZOzzWKEs0hUSqjXwiB8fUJpq/jUJLWO3K7o6PoM/UBdUvBIg==
X-Received: by 2002:a05:600c:a419:b0:45b:9b9f:88cb with SMTP id 5b1f17b1804b1-45b9b9f8af4mr43283525e9.16.1756971774749;
        Thu, 04 Sep 2025 00:42:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45c6faad9cfsm82663845e9.0.2025.09.04.00.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 00:42:54 -0700 (PDT)
Date: Thu, 4 Sep 2025 10:42:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 12/16] staging: rtl8723bs: remove unnecessary braces
 for single statement blocks
Message-ID: <aLlC-raf6UksVFlC@stanley.mountain>
References: <20250904021448.216461-1-vivek.balachandhar@gmail.com>
 <20250904021448.216461-13-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904021448.216461-13-vivek.balachandhar@gmail.com>

On Thu, Sep 04, 2025 at 02:14:44AM +0000, Vivek BalachandharTN wrote:
> Drop braces around conditional blocks that contain only a single
> statement, as required by kernel coding style. This enhances clarity
> and reduces visual clutter.
> 
> No functional changes.
> 
> Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> index ef9057456768..27be46c11b65 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -514,9 +514,8 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
>  			break;
>  		}
>  
> -		if (rtw_roam_flags(adapter)) {
> +		if (rtw_roam_flags(adapter))
>  			/* TODO: don't select network in the same ess as oldest if it's new enough*/
> -		}

Heh.  No.

>  
>  		if (!oldest || time_after(oldest->last_scanned, pnetwork->last_scanned))
>  			oldest = pnetwork;
> @@ -2546,9 +2545,8 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
>  	len = 0;
>  	p = rtw_get_ie(pie + sizeof(struct ndis_802_11_fix_ie), WLAN_EID_HT_OPERATION, &len,
>  		       ie_len - sizeof(struct ndis_802_11_fix_ie));
> -	if (p && len > 0) {
> +	if (p && len > 0)
>  		/* todo: */
> -	}

Also no.  Also heh.  You've introduced a bug.  Smatch does find this
sort of bug btw.

$ ~/smatch/released/smatch_scripts/kchecker --spammy drivers/staging/rtl8723bs/core/rtw_mlme.c
  SYNC    include/config/auto.conf
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/basic/fixdep
  CHECK   scripts/mod/empty.c
  CALL    scripts/checksyscalls.sh
  DESCEND objtool
  INSTALL libsubcmd_headers
  CC [M]  drivers/staging/rtl8723bs/core/rtw_mlme.o
  CHECK   drivers/staging/rtl8723bs/core/rtw_mlme.c
drivers/staging/rtl8723bs/core/rtw_mlme.c:843 find_network() error: we previously assumed 'pwlan' could be null (see line 838)
drivers/staging/rtl8723bs/core/rtw_mlme.c:2413 rtw_restructure_ht_ie() warn: odd binop '0x1c & 0x0'
drivers/staging/rtl8723bs/core/rtw_mlme.c:2467 rtw_update_ht_cap() warn: if statement not indented
$

It's always a good idea to add a kchecker to your QC process.

regards,
dan carpenter

