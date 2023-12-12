Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F063F1D6A9
	for <linux-staging@lists.linux.dev>; Tue, 12 Dec 2023 18:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OsIE8Y/G"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40c495ab68cso4266345e9.0
        for <linux-staging@lists.linux.dev>; Tue, 12 Dec 2023 10:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702407419; x=1703012219; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3jZqFXSKKPd9Ks/RHdE7adax2t7T1aOez3KnX+eA7uc=;
        b=OsIE8Y/GZpl6EZAbIFJZVIyErxInxjiye57fEX++roxPCaWUKhQk1erUBMj18icCQW
         aTGiFAWaB0GHIf0MVZ56udigC7yyAPN7I2Qzg8WBfxpmoYmO47gn0lwLhtP4I2G/bMVi
         pN368eZIxEB3eHSs1hJFohrh+4VkLlvNL1BvW/hLjlvDtLN4SLWZjpUExA8a94e9H36s
         aeusSi2xl0Qs1FobDD7Ws484m2iyCg3JBfeufM0VC8p7PtGCik/O8j/ehZSF3XmaBffS
         NSjujTGWJ96z/RU5qjZ/puYomchclEiPbu79vuD17wbJX6EJtm7pFObd7sRd7hU8vrQP
         KAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702407419; x=1703012219;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3jZqFXSKKPd9Ks/RHdE7adax2t7T1aOez3KnX+eA7uc=;
        b=iMPuOSCcpZDMLhY71jnorZIGs+sl4/qHOzPnPdf7WQlGc5JIOqHtQySwvoMR8HJ1zr
         295+gRTdjDM0u3t1/51b6NwzgZmGBhWJSsU6VDJdfNRfdpJU3zI06mA8fVCpFgWitX9f
         vkjc01ZNr1Dk2eLpSkInZZqGijzsbh4Ohi2qodlx5VXaheDNUb9386Awt4HC2ygUi0rf
         tIfDInd+b4+EO1jNwawG+tEVb3rfakeEWTixCnQKu3+TuCQgrTfNbyzwigCFlZXK9U+4
         EId64abvnkkR49dsA8Jvqr0wgqvLHWpjIhsMxtYOmPy+sRuk31cRtaQcrPihSFWCHoqY
         23Yg==
X-Gm-Message-State: AOJu0YyrrizGh63Y/QfVTqNsAlsRqekwWmwbs6tsDehCpnhn87gcfetJ
	8uTbJdGloCHW5a2F4t2AG0M=
X-Google-Smtp-Source: AGHT+IHwaHKV1sGHAHOEQAnyDRP51wcL4tlpVXOeUO/hCDwA2xZwlsFWuh2yYF5C4lMyoBC1fkBG4g==
X-Received: by 2002:a05:600c:1c86:b0:3fe:d637:7b25 with SMTP id k6-20020a05600c1c8600b003fed6377b25mr8363131wms.0.1702407418795;
        Tue, 12 Dec 2023 10:56:58 -0800 (PST)
Received: from [192.168.0.104] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id r20-20020a05600c35d400b0040b538047b4sm19863451wmq.3.2023.12.12.10.56.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 10:56:58 -0800 (PST)
Message-ID: <6a065daf-3639-4a87-8ab6-7018e0362900@gmail.com>
Date: Tue, 12 Dec 2023 19:56:57 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] staging: rtl8192e: rename variable pHT
Content-Language: en-US
To: Gary Rookard <garyrookard@fastmail.org>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20231212165637.17618-1-garyrookard@fastmail.org>
 <20231212165637.17618-5-garyrookard@fastmail.org>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20231212165637.17618-5-garyrookard@fastmail.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/12/23 17:56, Gary Rookard wrote:
> oding style issue, Avoid CamelCase
> rename it. pHT -> ht
> 
> Signed-off-by: Gary Rookard<garyrookard@fastmail.org>
> ---
>   drivers/staging/rtl8192e/rtl819x_HTProc.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> index ac85151a6069..add8f58b5b1e 100644
> --- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
> +++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> @@ -250,17 +250,17 @@ void ht_reset_iot_setting(struct rt_hi_throughput *ht_info)
>   void ht_construct_capability_element(struct rtllib_device *ieee, u8 *pos_ht_cap,
>   				  u8 *len, u8 is_encrypt, bool assoc)
>   {
> -	struct rt_hi_throughput *pHT = ieee->ht_info;
> +	struct rt_hi_throughput *ht = ieee->ht_info;
>   	struct ht_capab_ele *pCapELE = NULL;
>   
> -	if (!pos_ht_cap || !pHT) {
> +	if (!pos_ht_cap || !ht) {
>   		netdev_warn(ieee->dev,
>   			    "%s(): posHTCap and ht_info are null\n", __func__);
>   		return;
>   	}
>   	memset(pos_ht_cap, 0, *len);
>   
> -	if ((assoc) && (pHT->ePeerHTSpecVer == HT_SPEC_VER_EWC)) {
> +	if ((assoc) && (ht->ePeerHTSpecVer == HT_SPEC_VER_EWC)) {
>   		static const u8	EWC11NHTCap[] = { 0x00, 0x90, 0x4c, 0x33 };
>   
>   		memcpy(pos_ht_cap, EWC11NHTCap, sizeof(EWC11NHTCap));
> @@ -275,9 +275,9 @@ void ht_construct_capability_element(struct rtllib_device *ieee, u8 *pos_ht_cap,
>   	if (ieee->GetHalfNmodeSupportByAPsHandler(ieee->dev))
>   		pCapELE->ChlWidth = 0;
>   	else
> -		pCapELE->ChlWidth = (pHT->reg_bw_40mhz ? 1 : 0);
> +		pCapELE->ChlWidth = (ht->reg_bw_40mhz ? 1 : 0);

The last line changed with my patch:
[PATCH 02/10] staging: rtl8192e: Remove variable ht_info->reg_bw_40mhz

It is always difficult to know which patches are accepted by the 
maintainer but you may want to look into the following mailing list to 
see if there have been any patches send in for this driver.
https://lore.kernel.org/linux-staging/

You could apply the send in patches and build your ones on top. Then you 
do not have this issue. But when the patches you are using are not 
accepted you will run into the same issues.

Thanks for your support.

Bye Philipp



