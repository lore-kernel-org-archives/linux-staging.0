Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B16611C94;
	Sat, 23 Mar 2024 22:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711233061; cv=none; b=S6rOWBzybSHxP/zIhPlB1wxiZg6/QOJU4xKoVB0iVGxCfG347XgYAuyOVh77O4KwhVqc2UDmdBvuTZGIFStbccEpQ6X+2KPNPzlXY5AM15CpofcrNyvVT8b7s45dvl5VJfle1zDVEjFzc/zggFhfMsXkb1cPsIw4Vu6S4QPia/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711233061; c=relaxed/simple;
	bh=PojwwhLQ0f7eE47P++0q9jpP2oeL01I849PctSEwux4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GeySB0QvKDqAjxHK6pk4T3UmVuK8nP+M/1jSEtKc+MMMsrXOmO9yu12d5kTpFen+5nDmSyUSMeV0Atz7NkcarwOLMaPyW+obBzGlDkuuk3nqWJuhilTct65DfLvsAlZtVH5dLpjhMaFGAIvcko8riXPUCZQOyKnchESrJ5O2SQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g5x+EiX1; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g5x+EiX1"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a46daa53584so99602866b.0;
        Sat, 23 Mar 2024 15:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711233058; x=1711837858; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6pIl9ecoJqRC4Nq8p1VbyTskDTfwqQJ3s481KX+SUP8=;
        b=g5x+EiX18sF2n7sLEOP/4Ib9XZgsNbSsbXvvTUCYda7IK47M6EG3BIuS30lrzc0q3q
         qs94oB7Lyd+buAMRgoW54rXAR/ixumD6MAWYPxesEPW8xil7nXNC9CG89YjiAqIe8e0W
         HmFTIstCGU5hF9JewlJAOkE/DVgkeQQMJWJ2Qa5ZCaYicpm17DEpmKIt7YkgZjM9bPKg
         /4aRiFgLR8KBzLOUCM/DsTvHfTrUU8IS3KExxzhw5BHY1+Lx6g2pi+9LQ3PyesedK0EH
         Yk/f7vg+Zh0VjWQ8cBoBupdsfTqTFzKEBw+xkXw1MFYPE2RZTVzLRORqZ3PpuR216TtX
         0JZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711233058; x=1711837858;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6pIl9ecoJqRC4Nq8p1VbyTskDTfwqQJ3s481KX+SUP8=;
        b=ZtdEnk1/L1teJBdEcHBBWaQKqfl5Wy5qIlN4/GU88DPPQmW0blSgFb4bvIwVWYFP2r
         V3dgPx9rikxU743TcD+lxMIDRj9Eqgu38nAOYtIGa0n8Dq0I9UBApkYlnsjZ2hgorn43
         70eTdW34/PziyANwGjBEV3pN6jTGWuXC3bccPJNaAFck7zqxq8aNcAkJEsxp2lbJshwm
         9eTJ5cMNns+oD6bGRYPiLaLESkNvsaFTJ73iYX08raeGP7ezn3eU37kulpZbIHYXFXN8
         WwYB9TxK6WStlbk5ZadC+XuEbJdW2gTHxxF12MULMuWkxWmogdi4yDxEVFbqX1NbY75/
         IDEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWhj5tJrKv1heCODtwpZHBCexQa1GLHTqi0O8mRr/ySBQDAPdbNOio7Vp1D4UMA0BpCdpy73U0vzSjtyPDOXE9dLgzWL+CokF7
X-Gm-Message-State: AOJu0YwOIe98+00Y/O1RrfiTe5ggoHPsPPo19nFqPJCseAZdQPCfTLtb
	SKcTiMA5JwHnBDsg63Ff3BCMN5zObVZg0JosyOQ0c3h0vNoMO1l0
X-Google-Smtp-Source: AGHT+IHP7VQ0+i5S/9MzwJNbjpPesGT6wzx5M370QsxZ7f+lCQaRj3tAMz8UvBv8W2bdYNZhyT9jbA==
X-Received: by 2002:a17:906:646:b0:a47:366b:21da with SMTP id t6-20020a170906064600b00a47366b21damr1842602ejb.4.1711233058191;
        Sat, 23 Mar 2024 15:30:58 -0700 (PDT)
Received: from [192.168.0.104] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id k18-20020a1709065fd200b00a46cf8aea7bsm1348645ejv.30.2024.03.23.15.30.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Mar 2024 15:30:57 -0700 (PDT)
Message-ID: <9d8f35f6-2d23-43bf-9ac5-c88e4f65609e@gmail.com>
Date: Sat, 23 Mar 2024 23:30:57 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8712: Rename variable bw_40MHz_en
Content-Language: en-US
To: Lautaro Javier Fernandez Pricco <ljfp@ljfp.xyz>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 outreachy <outreachy@lists.linux.dev>
Cc: linux-staging <linux-staging@lists.linux.dev>,
 linux-kernel <linux-kernel@vger.kernel.org>
References: <Zf4fhSomoYzCE4gW@ljfp.xyz>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <Zf4fhSomoYzCE4gW@ljfp.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/23/24 01:17, Lautaro Javier Fernandez Pricco wrote:
> The bw_40MHz_en variable triggered an 'Avoid
> CamelCase' warning from checkpatch.pl. This patch addresses said warning by
> renaming the variable to bw_40mhz_en.
Hi Lautaro Javier,
Checkpatch is wrong with this proposal. The offical abreviations for 
MHz, kHz, GHz, dB and so on can remain as they are.
This is easier to read.

> Reported by checkpatch:
> CHECK: Avoid CamelCase: <bw_40MHz_en>
It is not required to add the name of the tool who found this. Much more 
important is a good description why this change makes sense...
For example:
... to shorten code.
... to improve readability.

Thanks for your support.

Bye Philipp


> Signed-off-by: Lautaro Javier Fernandez Pricco <ljfp@ljfp.xyz>
> ---
>   drivers/staging/rtl8712/hal_init.c        | 2 +-
>   drivers/staging/rtl8712/rtl8712_hal.h     | 2 +-
>   drivers/staging/rtl8723bs/core/rtw_mlme.c | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8712/hal_init.c b/drivers/staging/rtl8712/hal_init.c
> index 1148075f0cd6..efea4f97488c 100644
> --- a/drivers/staging/rtl8712/hal_init.c
> +++ b/drivers/staging/rtl8712/hal_init.c
> @@ -98,7 +98,7 @@ static void fill_fwpriv(struct _adapter *adapter, struct fw_priv *fwpriv)
>   	/* todo: check if needs endian conversion */
>   	fwpriv->hci_sel =  RTL8712_HCI_TYPE_72USB;
>   	fwpriv->usb_ep_num = (u8)dvobj->nr_endpoint;
> -	fwpriv->bw_40MHz_en = regpriv->cbw40_enable;
> +	fwpriv->bw_40mhz_en = regpriv->cbw40_enable;
>   	switch (regpriv->rf_config) {
>   	case RTL8712_RF_1T1R:
>   		fwpriv->rf_config = RTL8712_RFC_1T1R;
> diff --git a/drivers/staging/rtl8712/rtl8712_hal.h b/drivers/staging/rtl8712/rtl8712_hal.h
> index 66cc4645e2d1..3df687fce79d 100644
> --- a/drivers/staging/rtl8712/rtl8712_hal.h
> +++ b/drivers/staging/rtl8712/rtl8712_hal.h
> @@ -85,7 +85,7 @@ struct fw_priv {   /*8-bytes alignment required*/
>   	unsigned char rsvd025;
>   	/*--- long word 3 ----*/
>   	unsigned char qos_en;    /*1: QoS enable*/
> -	unsigned char bw_40MHz_en;   /*1: 40MHz BW enable*/
> +	unsigned char bw_40mhz_en;   /*1: 40MHz BW enable*/
>   	unsigned char AMSDU2AMPDU_en;   /*1: 4181 convert AMSDU to AMPDU,
>   					 * 0: disable
>   					 */
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> index bfb27f902753..0e5b07ad5a8f 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -2331,7 +2331,7 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
>   		}
>   	}
>   
> -	/* to disable 40M Hz support while gd_bw_40MHz_en = 0 */
> +	/* to disable 40 MHz support while gd_bw_40mhz_en = 0 */
>   	if (channel > 14) {
>   		if ((pregistrypriv->bw_mode & 0xf0) > 0)
>   			cbw40_enable = 1;

