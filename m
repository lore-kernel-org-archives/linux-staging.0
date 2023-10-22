Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D341115A1
	for <linux-staging@lists.linux.dev>; Sun, 22 Oct 2023 06:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lq86QnIq"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-53e2308198dso595143a12.1
        for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 23:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697956732; x=1698561532; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eN+K7djNf+LUAL45GOvKxbnMR4ijDhW80HufDhemqvg=;
        b=Lq86QnIqL4+BH7LBz6d/JSZUOesXvyDVPmf/Ttpcuq5E4hjuME8PJ+qiQ6XgTkcQQL
         subtBHis7Mm5C9T8+nl5P8tPi0O8DZujtRL6EfZcbo9v9yIBphO+4nA1qzRoPnA32e0L
         BEjGaCPZoEAnGpK2ksDsDv0KBdIBfpPRDnpJhqcbFpkWuhGqJcNmRMg+BmsraN9EleZW
         +KvVWLa8uybAIZQDl15aeeRg+WeL2QX3PL5m69KrLoAzaf/gZA67p9xKV2MXFugbO7lA
         w1T9kEn66H0Hold+jaw3xLZoi+fdQwSs4ryB81Mag85aZl1dwt/b4nKc4LA1TnjxA129
         2+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697956732; x=1698561532;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eN+K7djNf+LUAL45GOvKxbnMR4ijDhW80HufDhemqvg=;
        b=YsiwKl2igt7FMHbbkVFABFl2mUjijvDCYKEGjXnJnw3JglhANoDoetnwbqQM4SY7J2
         MAC/hzTQUW4JwwdCZD8Epttxydyn1tvOG//zYKb6dLwVBDBNBJ/4fL+wPLpKQnSwkEj3
         CKzpoU9vI7kmMu45v7WPFaxmsL0sALKKmc7oR9SSREgFxpsBr6gNQHx7KlK9Cim7ubyl
         QaLATFk09zli4lwEFD6ZOwAoMEsVh20cvQkCzYHdHDSr7vy4q+TN5lk8U87IkLKpHuE1
         yxOuBmVDnEhKUmfo18QQnHHH775wBMPdzPDKg1uE9YNj9GnS34RROxbuXho7qJ29Y9qf
         EsuQ==
X-Gm-Message-State: AOJu0YzIHX51G84njozSJblHP8tiPLq/KkN4baCeQcb5QK163yQ9o7YF
	whNOwh38K936wtd+Npv0X7c=
X-Google-Smtp-Source: AGHT+IGkwx4ierVeDcl7EC1HxuWGhK+SwxMe0UEdJcCFgvcY2KDP80wEjG8/MR0XYiDUPvOE/u51+w==
X-Received: by 2002:a17:906:10c9:b0:9c4:4b20:44b0 with SMTP id v9-20020a17090610c900b009c44b2044b0mr3677698ejv.1.1697956732447;
        Sat, 21 Oct 2023 23:38:52 -0700 (PDT)
Received: from [192.168.0.104] (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id cb13-20020a170906a44d00b0099bccb03eadsm4507054ejb.205.2023.10.21.23.38.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Oct 2023 23:38:52 -0700 (PDT)
Message-ID: <e475d553-5cbc-4cca-89d1-09a587a99098@gmail.com>
Date: Sun, 22 Oct 2023 08:38:51 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] staging: rtl8192e: renamed variable TxCountToDataRate
Content-Language: en-US
To: Gary Rookard <garyrookard@fastmail.org>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20231021215440.6584-1-garyrookard@fastmail.org>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20231021215440.6584-1-garyrookard@fastmail.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/21/23 23:54, Gary Rookard wrote:
> Renamed from Pascal/CamelCase to Snake case the variable
> TxCountDataRate, TxCountDataRate -> tx_count_data_rate.
> 
> Linux kernel coding style (cleanup), checkpatch Avoid CamelCase.
> Driver rtl8192e compiles.
> 
> Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
> ---
> Removed parenthesis alignment, and removed corrected spacing from
> this patch. Only contains renaming variable.
> 
>   drivers/staging/rtl8192e/rtl819x_HTProc.c    | 2 +-
>   drivers/staging/rtl8192e/rtllib.h            | 2 +-
>   drivers/staging/rtl8192e/rtllib_softmac_wx.c | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> index 00b21542ddc3..8070a152712e 100644
> --- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
> +++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> @@ -114,7 +114,7 @@ static u16 HTMcsToDataRate(struct rtllib_device *ieee, u8 nMcsRate)
>   	return MCS_DATA_RATE[is40MHz][isShortGI][(nMcsRate & 0x7f)];
>   }
>   
> -u16  TxCountToDataRate(struct rtllib_device *ieee, u8 nDataRate)
> +u16  tx_count_to_data_rate(struct rtllib_device *ieee, u8 nDataRate)

tx_count_to_data_rate

>   {
>   	u16	CCKOFDMRate[12] = {0x02, 0x04, 0x0b, 0x16, 0x0c, 0x12, 0x18,
>   				   0x24, 0x30, 0x48, 0x60, 0x6c};
> diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
> index 9d141aad8cd5..6a9550eaf148 100644
> --- a/drivers/staging/rtl8192e/rtllib.h
> +++ b/drivers/staging/rtl8192e/rtllib.h
> @@ -1784,7 +1784,7 @@ extern u16 MCS_DATA_RATE[2][2][77];
>   u8 HTCCheck(struct rtllib_device *ieee, u8 *pFrame);
>   void HTResetIOTSetting(struct rt_hi_throughput *ht_info);
>   bool IsHTHalfNmodeAPs(struct rtllib_device *ieee);
> -u16  TxCountToDataRate(struct rtllib_device *ieee, u8 nDataRate);
> +u16  tx_count_data_rate(struct rtllib_device *ieee, u8 nDataRate);

tx_count_data_rate

>   int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb);
>   int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb);
>   int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb);
> diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
> index f32584291704..28aba1d610f7 100644
> --- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
> +++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
> @@ -208,7 +208,7 @@ int rtllib_wx_get_rate(struct rtllib_device *ieee,
>   {
>   	u32 tmp_rate;
>   
> -	tmp_rate = TxCountToDataRate(ieee,
> +	tmp_rate = tx_count_to_data_rate(ieee,

tx_count_to_data_rate

>   				     ieee->softmac_stats.CurrentShowTxate);
>   	wrqu->bitrate.value = tmp_rate * 500000;
>   


Hi,

name of the function are different.

You need to do a compile testing before sending in.

drivers/staging/rtl8192e/rtllib_softmac_wx.c: In function 
‘rtllib_wx_get_rate’:
drivers/staging/rtl8192e/rtllib_softmac_wx.c:211:13: error: implicit 
declaration of function ‘tx_count_to_data_rate’; did you mean 
‘tx_count_data_rate’? [-Werror=implicit-function-declaration]
   211 |  tmp_rate = tx_count_to_data_rate(ieee,
       |             ^~~~~~~~~~~~~~~~~~~~~
       |             tx_count_data_rate
cc1: some warnings being treated as errors

Bye Philipp

