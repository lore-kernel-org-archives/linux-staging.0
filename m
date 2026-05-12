Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3706B135A53
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 07:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778571443; cv=none; b=V7dEMp2D0g+liZE82BXdfXris1hbYfbSguqZ4qQ0vVJNTGS1owSS/Tw7KhD7VKMSya75dfXrnGDM9O1rf3Q9S1qp6vt1nOyn4CP2S960mYndzaQhZyYxH2D43poQXmMZrHwDq1eW7gTSLzWraXbay6uBey1VTPlQq3Y9BrEId5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778571443; c=relaxed/simple;
	bh=dTmrkJn4weiuNg0VBlPnKFt/P9440EYzy09QpnPlOH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NsFijw04OLzjSGnKJgZicVUQVKFOQnX2Zy/JaQd4fElVjaMiLIOWAHg+YWwfS1GW3kFM9gr77ftrL9K/JdNxfbO5mXbnkNpOBNQWNQy5JsWXZ5A0YYulL3cC9ROBCjCw/eUkBlM0xTp+rRTo/NlHWkCTCRsIDxLjXQTbiferDW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lmwo1FZA; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lmwo1FZA"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so54735465e9.0
        for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 00:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778571440; x=1779176240; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PnFqd4eoebq6QO9QB+ogH2edRmONki+/t3a+recyMXU=;
        b=Lmwo1FZAeIchDsguTOYdy/jUl8dUUD7SWGNr1arG3Vb/TiEhT4T7jmLBHkuGu+rUhB
         vGwWQl0Rk2lSYzU6usr0GJDmLV0941TwNXRUgPqxRoR/nvQov1u9V5RfYy64AL3iWUNq
         Lfhxfdx7p2IjSBapbnzCdsGb7qMm7baMaJ0kfYxG67QSrnbbR9FvpRuWW02NhBJ+Fe2Y
         +22cYX2aPH/roH77il1e5jf66XQ/PLgFu6FY9Vh6pU0N9DVEAJsU4FxC/tC6nUCAq8tp
         IjzFBEPUXRFfp1IeHj9GgIbyj6+9IuCHCNY5oIV4eblm2tNzQDbBB783cr3s9EcdT8pB
         5YYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778571440; x=1779176240;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PnFqd4eoebq6QO9QB+ogH2edRmONki+/t3a+recyMXU=;
        b=pNwNfnBFRCb0zKzrb5OHHkpQih5JNyhAFvkahORXV09OwJGixaB/nOuSw9GuIflRPz
         F2mhJ92tj9NI68dgeCtgCcO90Ekej5/Z7RfUgsVxSdFUxvc2MFUQcUO2i5NHoeFrLkea
         MQhbe5qFrQes5kuvFCDz9E3V5MPf21oysw7wCapGhrLFhF8tM1qKlAnVGsLzVnRVvZMo
         yCDrYVbfysX2tPmucy9nk8ngNmy9vHnv5tGY+8VwNmQE9kL2d3c/QW3HFaQrm41Ccy2g
         WsYQF5yp2hN/E5cgZ6rKANdUWVlAqyFkyCw1E+Q+P1jBXyo6daYMKb0D+dlyqxreQItA
         gW1g==
X-Forwarded-Encrypted: i=1; AFNElJ/mRgFFrj3ZjuPyDySpUGXjvKE/NGbqg20abVOxLMqisttY2jDS2lhoLOH5U4kzS0IaRjn5LcHk3smeQ082@lists.linux.dev
X-Gm-Message-State: AOJu0Yya5poNy/G+Hg2LQHOJSVtuZxC49UW2xVZOIskFjOxelQNHFvNE
	Nf2J4vdM1PqRJW0J45Zxb7tu0GaWFpve93AykAcGGM5dpxICLvzbBeg8
X-Gm-Gg: Acq92OHyN0Xhi2xvD7szVi0RilR5PuAuFBeMUcO2NNlY2tPvw8kVrkt1DMamSiRjwSC
	PefzlnvG8dvM+zImuANvU+2wlA+Mm+VSkRv+YwtEE3OIuM/PemFBU249WczWAiH80MAY6LMO86F
	uq26ZwWUp78mM5q6Dd8NClKWDNljvyUETysoFCabqhbcFkNU8tJWWj31NV6cJICj6x3IFRnbuzD
	PUHjXLfsAxn1RSSrjpZyFDFafIsr7ZJMLqlmqvehq/9M+rvQ2LjYrJqpyXutOZwN+VJxGtZqP3k
	NXlyAkpy8edRBKdF1W5jibQR9wmgFuE5d8USgXIH4hpfjHbdsZ/As+lJor5xIJa/vwbW2fLKpUj
	Mwr991lXunVKcVoZKSyIjQqZFzGfay1Uq1ukO5OssgiZn0xkc8CRlFL0N4ea90oSGREj1dnyqbW
	bADi3O0by8S5xBcC7kKSS2EP4cFuZDXw==
X-Received: by 2002:a05:600c:474b:b0:488:9e54:94c0 with SMTP id 5b1f17b1804b1-48e8fe5017fmr25335265e9.8.1778571439934;
        Tue, 12 May 2026 00:37:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f43de84sm11609595e9.26.2026.05.12.00.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 00:37:19 -0700 (PDT)
Date: Tue, 12 May 2026 10:37:15 +0300
From: Dan Carpenter <error27@gmail.com>
To: Shayaun Nejad <snejad123@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: rtl8723bs: bound SUPP_RATES IE length in
 rtw_check_beacon_data
Message-ID: <agLYq3tu0M4QpSmo@stanley.mountain>
References: <cover.1778550157.git.snejad123@gmail.com>
 <a56d8fa71dc6843e5096ce69d4c216c0ca99a7de.1778550157.git.snejad123@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a56d8fa71dc6843e5096ce69d4c216c0ca99a7de.1778550157.git.snejad123@gmail.com>

On Mon, May 11, 2026 at 06:44:56PM -0700, Shayaun Nejad wrote:
> rtw_check_beacon_data() copies SUPP_RATES and EXT_SUPP_RATES IE
> payloads into a 16-byte support_rate[] buffer.
> 
> The IE lengths are used directly, so oversized rate IEs can overflow the
> stack buffer.
> 
> Clamp the supported rates copy and the combined extended supported rates
> copy to NDIS_802_11_LENGTH_RATES_EX.
> 
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shayaun Nejad <snejad123@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_ap.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
> index 4b40124110..363ecb02b5 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ap.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
> @@ -873,6 +873,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
>  		       &ie_len,
>  		       (pbss_network->ie_length - _BEACON_IE_OFFSET_));
>  	if (p) {
> +		ie_len = min_t(uint, ie_len, NDIS_802_11_LENGTH_RATES_EX);

These days we would use umin()

>  		memcpy(support_rate, p + 2, ie_len);
>  		support_rate_num = ie_len;

support_rate_num is set here.  We know from the min_t() that it's less
<= NDIS_802_11_LENGTH_RATES_EX.

>  	}
> @@ -882,8 +883,11 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
>  		       WLAN_EID_EXT_SUPP_RATES,
>  		       &ie_len,
>  		       pbss_network->ie_length - _BEACON_IE_OFFSET_);
> -	if (p)
> +	if (p && support_rate_num < NDIS_802_11_LENGTH_RATES_EX) {

We know that support_rate_num <= NDIS_802_11_LENGTH_RATES_EX.  Allowing
== NDIS_802_11_LENGTH_RATES_EX is okay because memcpy() of zero bytes is
a no-op.

> +		ie_len = min_t(uint, ie_len,
> +			       NDIS_802_11_LENGTH_RATES_EX - support_rate_num);

Use umin() here too.

Otherwise the patch is fine.

regards,
dan carpenter

>  		memcpy(support_rate + support_rate_num, p + 2, ie_len);
> +	}
>  
>  	network_type = rtw_check_network_type(support_rate, channel);
>  
> -- 
> 2.43.0
> 
