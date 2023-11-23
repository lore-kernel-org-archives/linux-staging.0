Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5909D11C81
	for <linux-staging@lists.linux.dev>; Thu, 23 Nov 2023 20:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GKo8+q4P"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-507a3af69d8so310558e87.0
        for <linux-staging@lists.linux.dev>; Thu, 23 Nov 2023 12:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700772966; x=1701377766; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jH0gybkUMh1ws0/iTKIPo/qAYIylPc5Y9Jda3lmDcHY=;
        b=GKo8+q4PvXAEu/uUyQANyc8IkpGV0HGu5eEgYWjGL0oaa75pWYbDqzZ+OqRli5cx0L
         CDGSGOmmBThUJmf3ecywkvZuxk145xkVATpt6wGvBCwiYoXB6eb6BQy2X/GL+sQyfCBD
         ShB0lzvTphyvQswBpvTa3TlszrV59Cs3BUw7ThJEMmQ3bHLq7PbMIxH8ztijrAtraKbE
         hkEgGroeMFu7fz8S4t3YVkaNvRiNNUvdFgFf6ZEr4Ju2J4hc7MUZtsxUYt/2YrtH351W
         Vd7gg4G3swdya4cy6XwM7Nqizfl1/4NYxbYuh2pEnf5sDEw8pjamI2LgOGQG+ndRqnoi
         1T9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700772966; x=1701377766;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jH0gybkUMh1ws0/iTKIPo/qAYIylPc5Y9Jda3lmDcHY=;
        b=aVtmdOiOd9v6cknDY+BiDDl07xjZazeEyWbhHqpx6fKBFnW8hcZtCLsPt3w813S1bX
         +tVBYFrj6JsG9hy8iivUmCexjTxJSb1evHUS17QCcmUbgFuWl6lJZ/fc4dnotfLafV/2
         lfC7BVq7n5ienqfSjDlbJePChES+h4AfipVZqhL/xzTewG7NYqW1qDWoMqowvEK1CJT7
         NyJbzcIzjqo/R7PiFsawtvhUMlpTTp5UU6JlIMN1kdfvR9nP6EUc6prKT+5FvF0Ay0cb
         WpVV+mBLGikcAYZKQPDyMU7LztScyCVklG+R1eG/wijBrh6d2vdWudUydUfRpvcpB+WX
         JUkA==
X-Gm-Message-State: AOJu0Yx6UtBrTUjTwspk45pmCUnssd9zgUf75JKjzZppi/OJumzxhA4B
	8lJZVmtnjICRLg75qFilgA8=
X-Google-Smtp-Source: AGHT+IGiDJDLfNf/e/HQ3cEiHa48KWl1Fl5KWMyvPvB4N3tL0Tr51v3z1jAjw2RtMMd7LBa8Lqnlxw==
X-Received: by 2002:ac2:5498:0:b0:505:7123:21ae with SMTP id t24-20020ac25498000000b00505712321aemr177948lfk.6.1700772965949;
        Thu, 23 Nov 2023 12:56:05 -0800 (PST)
Received: from [192.168.0.104] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id me22-20020a170906aed600b009dd8473559dsm1189780ejb.110.2023.11.23.12.56.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Nov 2023 12:56:05 -0800 (PST)
Message-ID: <5ff4d268-2fcb-4d55-819a-e2650731b91f@gmail.com>
Date: Thu, 23 Nov 2023 21:56:04 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] staging: rtl8192e: renamed variable
 TXCountToDataRate
To: Gary Rookard <garyrookard@fastmail.org>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20231123144337.13112-1-garyrookard@fastmail.org>
 <20231123144337.13112-3-garyrookard@fastmail.org>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20231123144337.13112-3-garyrookard@fastmail.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/23 15:43, Gary Rookard wrote:
> Renamed from Pascal/CamelCase to Snake case the variable
> TXCountToDataRate.
> TXCountToDataRate -> tx_count_to_data_rate
> 
> Linux kernel coding style (cleanup), checkpatch Avoid CamelCase.
> Driver/module rtl8192e compiles.
> 
> Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
> ---
> v3: Corrected versioning from v1 -> v3, includes change history.
> v2: v2 was skipped over..v3 corrects this.
> v1 Style and compile issues, asked to redo.
> 
>   drivers/staging/rtl8192e/rtl819x_HTProc.c    | 2 +-
>   drivers/staging/rtl8192e/rtllib.h            | 2 +-
>   drivers/staging/rtl8192e/rtllib_softmac_wx.c | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> index 280e335cbb6d..fb8294f31a60 100644
> --- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
> +++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> @@ -114,7 +114,7 @@ static u16 ht_mcs_to_data_rate(struct rtllib_device *ieee, u8 nMcsRate)
>   	return MCS_DATA_RATE[is40MHz][isShortGI][(nMcsRate & 0x7f)];
>   }
>   
> -u16  TxCountToDataRate(struct rtllib_device *ieee, u8 nDataRate)
> +u16  tx_count_to_data_rate(struct rtllib_device *ieee, u8 nDataRate)
>   {
>   	u16	CCKOFDMRate[12] = {0x02, 0x04, 0x0b, 0x16, 0x0c, 0x12, 0x18,
>   				   0x24, 0x30, 0x48, 0x60, 0x6c};
> diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
> index d2cf3cfaaaba..0226a69f40c3 100644
> --- a/drivers/staging/rtl8192e/rtllib.h
> +++ b/drivers/staging/rtl8192e/rtllib.h
> @@ -1783,7 +1783,7 @@ extern u16 MCS_DATA_RATE[2][2][77];
>   u8 HTCCheck(struct rtllib_device *ieee, u8 *pFrame);
>   void HTResetIOTSetting(struct rt_hi_throughput *ht_info);
>   bool IsHTHalfNmodeAPs(struct rtllib_device *ieee);
> -u16  TxCountToDataRate(struct rtllib_device *ieee, u8 nDataRate);
> +u16  tx_count_to_data_rate(struct rtllib_device *ieee, u8 nDataRate);
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
>   				     ieee->softmac_stats.CurrentShowTxate);
>   	wrqu->bitrate.value = tmp_rate * 500000;
>   

CHECK: Alignment should match open parenthesis
#61: FILE: drivers/staging/rtl8192e/rtllib_softmac_wx.c:212:
+	tmp_rate = tx_count_to_data_rate(ieee,
  				     ieee->softmac_stats.CurrentShowTxate);
