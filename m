Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A27F395242
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 20:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774901189; cv=none; b=AJMyvzmi5VU4qR6hznN5iEZfUxhQOS340qbC9e2VtT8KouzqRzB45Cttxphy33nmJ7r2+QYZItDo1i6ZWnB/9qvBCsqMNTZ+RhSTKGKtdNk23JngQJaDy3iiJ8IMhFJ8BqHAV77aWDmPFakgvaASLFpfpfgh132pmiRu/VRxofs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774901189; c=relaxed/simple;
	bh=TdIhpxHLvVnFqrwUlI3yJd5w3NzSrEYec63H4+DvE/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RVJRtiySuq7lAEyBeShREmLy20ehw92lT1W1corFFk44if4h0zaEEfL2lh+4wiBpKAbSG637FHneWouL8WdfMigws6gN19L91+qQlVo66GU8v2cp0z8Mu4P5B+I9QUQELxHXMiMzmg01EgdIenDA09s1IyE9f882snFb4bd9HcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C7SaVeMR; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7SaVeMR"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43cfde3c3f3so1176052f8f.3
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 13:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774901187; x=1775505987; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cLwIMLuhyVAYc+PwPkVk/veDbq1sLle8zjJns1c52Dw=;
        b=C7SaVeMRMzByVEEZQnYBjMukiND6n4R6a5xopDWZ2PNklQrAScD2pUCOHDGF+kW3wR
         Ef6V2imHbFuj3qaPremQ3fkhSAkLjXnALLJMvBeg/cq+WKu6Svf7GY5gWWCNLnTHME2x
         zKR9/hysuJ2Phh+yTtf1HkkXvsTWGeQjnI43U+5Nk78KBPTPzRAHFMWK1cVNpHB9AEjW
         AOYoMZ0XKHX6qTyo4Aq8q1PeWb/O+Iixn7tkVMkD/x6L9YsS0fAINo6dJ0ITKoWqhSWW
         DIHN1lAQ9aheQVP3nbQiItKw8NYgBxAXXPPUzxuB5gEyIYdN+jj89dCYmwHnSqtU+Gi4
         s/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774901187; x=1775505987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cLwIMLuhyVAYc+PwPkVk/veDbq1sLle8zjJns1c52Dw=;
        b=Gck4pirFjrVoHH4CR1xVcFC/i2GS+rnkdd/krNhdaVL67LGYStxLwHJH2MvH26n/AE
         2rhyQ/sFZWGxtnbzB3jYLEZRaxlHACJOwOqCV9O2yAMSW4+cl96Wv1Qx49G+65i30YLA
         LAzzM3V0BFyeWBhaYNGG25dtyRyhHuAAqXTG/xFOpyboEhcP6mNDNfyQX79plTehRAyp
         3znkfH++gMcmRDumorOoHCT2H5UWvuuVbbho4812pZr9wkwhDx9eLgERVzbaiyBjEG1v
         AFV2jEcg/05k3oQHnvAfvhKAhlf9+6LY7/z/T6cojB5sOVYV01Mfceobqj2AolGDd6oq
         wc8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXrQ2knDvBk1owctnasWjIU1t4VrEnpqVz3paKoPm7RhNX3W2yAXSk/DSlkpGmRLugvXkmZ7hiPp550hkno@lists.linux.dev
X-Gm-Message-State: AOJu0YzTPUXlVXy+qCZxcEWslDrQVHOetJ6/pjRsovI5AFhgFNNorjnS
	CbTUKXPaRRfef2X8rCcxRQjY8Z633xHn/meEUBzZVme7Kp3BOMAUNi/E
X-Gm-Gg: ATEYQzw7MOkT+vGxShpd0hf03Lbfe/DL0ip39IhaxHDaz1Ok5K8CF4EpSxdUpGHKs9F
	+ZGNd//6phqA5NmvdRYFXmPDt2YIZFVfpqevOOlunTX0eNuRHAfCy0w4qztpP3mVKR0yxIHZ8Lh
	7ylZ0U/PDm0HJJ8vOGQmlsGV47GmIHuN9TL4w8Z1CFod05C11pY7niPY2yi2BZLYRuc7yP7DpnT
	BIY6yu3gKeJGJdNmrcrXFpssr0jfPCtx0y0hC2XNFMlhc5LmTDmSlliMIPf4iRVlhwCw1yHlIR+
	AC9zyLZSm4TxwRnRhDD5w+skxxICuk1dXwPQjoONjh63EA1YlcN+jK34XIs1ntzCpGFsfQAmrEP
	Zy0ooExO+sXYsLzQKM2obv9LITt2PJdjQ/dNZg92FcaEUkF/8pOGQJ+fIHz4UFDH0y4IJ+ej1Ke
	mqdZk+Z3O2o7hWyZG2W4k=
X-Received: by 2002:a05:6000:2489:b0:439:ba75:7dab with SMTP id ffacd0b85a97d-43b9e9d6022mr22752221f8f.9.1774901186597;
        Mon, 30 Mar 2026 13:06:26 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e29b1sm19881947f8f.8.2026.03.30.13.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 13:06:26 -0700 (PDT)
Date: Mon, 30 Mar 2026 23:06:23 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: rtl8723bs: Remove dead code
Message-ID: <acrXv3nNcI6oXgjK@stanley.mountain>
References: <20260330165510.33134-1-ethantidmore06@gmail.com>
 <20260330165510.33134-2-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330165510.33134-2-ethantidmore06@gmail.com>

On Mon, Mar 30, 2026 at 11:55:09AM -0500, Ethan Tidmore wrote:
> @@ -413,17 +408,14 @@ void update_bmc_sta(struct adapter *padapter)
>  		/* ap mode */
>  		rtw_hal_set_odm_var(padapter, HAL_ODM_STA_INFO, psta, true);
>  
> -		/* if (pHalData->fw_ractrl == true) */
> -		{
> -			u8 arg[4] = {0};
> +		u8 arg[4] = {0};
>  

Now there is a declaration in the middle of the code which isn't
normal style unless it's a __cleanup pointer.  I would probably
just leave this comment as-is so it serves as documentation that
something weird and historicaly is going on here.

regards,
dan carpenter

> -			arg[0] = psta->mac_id;
> -			arg[1] = psta->raid;
> -			arg[2] = 0;
> -			arg[3] = psta->init_rate;
> +		arg[0] = psta->mac_id;
> +		arg[1] = psta->raid;
> +		arg[2] = 0;
> +		arg[3] = psta->init_rate;
>  
> -			rtw_hal_add_ra_tid(padapter, tx_ra_bitmap, arg, 0);
> -		}
> +		rtw_hal_add_ra_tid(padapter, tx_ra_bitmap, arg, 0);
>  
>  		rtw_sta_media_status_rpt(padapter, psta, 1);
>  

