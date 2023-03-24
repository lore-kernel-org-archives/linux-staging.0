Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5634C28EA
	for <linux-staging@lists.linux.dev>; Fri, 24 Mar 2023 08:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679647634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5G+nkVZbFhorfyx9g7JFxAkGXU0+uL9r+IJmU+EGZDc=;
	b=SRN9YIqfo5aGDcrA3NXqPEhAOi6yUJIm2oAk9Ldaprzlh8RPAqwDLsNq+INKJt7JZQ8yBb
	aGSyPzn3KWveIZAqfpO+v71JYrSXxCfYZhI5FDg8Psh6pAjwaxteqWfQj/3/7fUjWLFCrK
	2ehv2Jc1M8nAMaAVVhiArCHqdPOyy6I=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-lDWN3IhtM1mfMxHv3O9B7g-1; Fri, 24 Mar 2023 04:47:10 -0400
X-MC-Unique: lDWN3IhtM1mfMxHv3O9B7g-1
Received: by mail-ed1-f69.google.com with SMTP id t26-20020a50d71a000000b005003c5087caso2211202edi.1
        for <linux-staging@lists.linux.dev>; Fri, 24 Mar 2023 01:47:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679647629;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5G+nkVZbFhorfyx9g7JFxAkGXU0+uL9r+IJmU+EGZDc=;
        b=JHmOoijSppw9b8dh8sUrCL6n+e5hxO3240UVEa1LSLgZ+s7yCEJuHNUIBNM+fMp7Fa
         dXhBj6vVtg7gMszPyoJ7Yq52/5hDXP9oOz1o8L/7ctH7ocu480tDrI3vpIiIcoTSd70R
         ViWJVNTWAzLolDoTWjFyfJU+i8MrxUgZv7JvE0iNiLaEMwZgOJE6Fvt1O0+Tqzcz5QKL
         7XChRv8i36fG2cPciqIdDOnkcpEvvOntt+25JyCN2aBep93rD8HIWm8X3cDa5tR1UI4c
         uRbC9k5gF248afT+yIrRYvbAylMkysRDryd9XaxYkKJjXOFCa+Alr7Yi4eK/MqItQ47Y
         uzsg==
X-Gm-Message-State: AAQBX9cdLrMqDeK9Ccf3q4+3mvGNC6PLdZ74sOpOFOBXmMmAL3VEkZr7
	hnrhkoupbJqZTMwZsia6Cd60/Gu237b2kR32p3yQ2Szwyg/HRWPYSDfGXYTqYWbiZt8CZrCJK6W
	s100NOWPW4mXzJlbrvp4ZU8LQEnbSb4wvsw==
X-Received: by 2002:a17:907:7f25:b0:931:f57a:4bcd with SMTP id qf37-20020a1709077f2500b00931f57a4bcdmr2154506ejc.77.1679647629507;
        Fri, 24 Mar 2023 01:47:09 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y5sorhIXa/1/3XlRrgSYRtI0MI1TLm5EQbwDS3hG646GTEMQT+qf958aIcY2hlb7VtfCu0Kw==
X-Received: by 2002:a17:907:7f25:b0:931:f57a:4bcd with SMTP id qf37-20020a1709077f2500b00931f57a4bcdmr2154493ejc.77.1679647629265;
        Fri, 24 Mar 2023 01:47:09 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id j8-20020a170906278800b0093dc6944b8bsm981148ejc.208.2023.03.24.01.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 01:47:08 -0700 (PDT)
Message-ID: <f2eef1b0-5ab5-0ccf-7721-520c3b708007@redhat.com>
Date: Fri, 24 Mar 2023 09:47:07 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] staging: rtl8723bs: remove hal_btcoex_SetChipType()
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20230324084334.12183-1-straube.linux@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230324084334.12183-1-straube.linux@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/24/23 09:43, Michael Straube wrote:
> Remove the function hal_btcoex_SetChipType() as it does nothing and
> produces the following gcc warning when compiling with W=1.
> 
> drivers/staging/rtl8723bs/hal/hal_btcoex.c:1182:30: warning: variable 'pHalData' set but not used [-Wunused-but-set-variable]
>  1182 |         struct hal_com_data *pHalData;
>       |                              ^~~~~~~~
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/staging/rtl8723bs/hal/hal_btcoex.c        | 8 --------
>  drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 1 -
>  drivers/staging/rtl8723bs/include/hal_btcoex.h    | 1 -
>  3 files changed, 10 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
> index e36f8c369a04..e26b789b9cdd 100644
> --- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
> +++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
> @@ -1177,14 +1177,6 @@ bool hal_btcoex_IsBtDisabled(struct adapter *padapter)
>  		return false;
>  }
>  
> -void hal_btcoex_SetChipType(struct adapter *padapter, u8 chipType)
> -{
> -	struct hal_com_data *pHalData;
> -
> -
> -	pHalData = GET_HAL_DATA(padapter);
> -}
> -
>  void hal_btcoex_SetPgAntNum(struct adapter *padapter, u8 antNum)
>  {
>  	struct hal_com_data *pHalData;
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> index 0fcae6871108..c3c1b49674d3 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> @@ -2304,7 +2304,6 @@ void Hal_EfuseParseBTCoexistInfo_8723B(
>  	}
>  
>  	hal_btcoex_SetBTCoexist(padapter, pHalData->EEPROMBluetoothCoexist);
> -	hal_btcoex_SetChipType(padapter, pHalData->EEPROMBluetoothType);
>  	hal_btcoex_SetPgAntNum(padapter, pHalData->EEPROMBluetoothAntNum == Ant_x2 ? 2 : 1);
>  	if (pHalData->EEPROMBluetoothAntNum == Ant_x1)
>  		hal_btcoex_SetSingleAntPath(padapter, pHalData->ant_path);
> diff --git a/drivers/staging/rtl8723bs/include/hal_btcoex.h b/drivers/staging/rtl8723bs/include/hal_btcoex.h
> index fb167642da01..525cce3574fe 100644
> --- a/drivers/staging/rtl8723bs/include/hal_btcoex.h
> +++ b/drivers/staging/rtl8723bs/include/hal_btcoex.h
> @@ -23,7 +23,6 @@ struct bt_coexist {
>  void hal_btcoex_SetBTCoexist(struct adapter *padapter, u8 bBtExist);
>  bool hal_btcoex_IsBtExist(struct adapter *padapter);
>  bool hal_btcoex_IsBtDisabled(struct adapter *);
> -void hal_btcoex_SetChipType(struct adapter *padapter, u8 chipType);
>  void hal_btcoex_SetPgAntNum(struct adapter *padapter, u8 antNum);
>  void hal_btcoex_SetSingleAntPath(struct adapter *padapter, u8 singleAntPath);
>  

