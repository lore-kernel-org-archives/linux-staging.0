Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D7114F65
	for <linux-staging@lists.linux.dev>; Thu, 23 Nov 2023 21:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aIlIyM7n"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-54373788ec4so310617a12.0
        for <linux-staging@lists.linux.dev>; Thu, 23 Nov 2023 13:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700773536; x=1701378336; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rw4Kok7jUVVa6uXmeOLPYM7OZwu0CQxt+Y+R1sPjnuc=;
        b=aIlIyM7nQ6FPvpA4ijJVMhyR/edp5j0kGQKK4Ii0AjdQY4jT1/i3meT5kb6iPzh6LN
         PcGqIqOV6sDqwQEzBDp2I8kJC4zkmVYQM+HTg4OwiVR4bJav6ve5TF8kF6S1CA9jVxrR
         4gfpT91G9jv0TrALpwsjrb4k0f6DlhqBqCjNBikW7CZUEfJN3JXPdQvwH9Zcas+NfBPq
         oA06a/nL0FmL1C5rxyDlKO9JS1iIhOppRYI2bXCbzMtHgI0cDOXWdx5fF+FMfQyCQWya
         B4jxcE2eWnKW/gPZ2vRjUTWulI4qri2W8mLxpH4m05xDnHWQEx7CT1TYm/0SwIj/DSB2
         g1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700773536; x=1701378336;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rw4Kok7jUVVa6uXmeOLPYM7OZwu0CQxt+Y+R1sPjnuc=;
        b=LehsFhSsbmPywCjELDQ3AKOdXS+kt1jP6TPWY72aZwktnKIntAEcNjwvLdCLB6Gwgr
         kFQSJxgs9Co4nPGVfXy8Qrv3FFAgnUloocfmh+d6jTB9zDF4/FaKubOSTOj4p8UyjW2r
         L1HiPjW7QGfF7QlM9VEK9/sbS9dez6fkUjv1NNtnrWPqMzw3HyrYx6fdfk6sEJwebmHI
         JB2Jm2RYZKlwIj8zigjSf3s7tA8Q50tlPcLpZ9pFWmy5dpSwgOa31jmzfbqC6xQT2LiL
         QmMz7p8LOLpirq0tdxYbxnX9xN83O/k2hddDuepH+rEjjyHXMTTybuFqKlZPDWwnhZl4
         hI2w==
X-Gm-Message-State: AOJu0YwComP1XTvRm4biii02DhZAQ3UdPT+occj2gcamcX2eKyI0xO7w
	eS+vw9n/+Om8XSGJszNHY5g=
X-Google-Smtp-Source: AGHT+IFTjWJCNmIm2tUQW+6hyPYaSjLQg37gElGwWHj+v1lMNJ2DsJfdbEpF4w7K9GOagah3vYvN7A==
X-Received: by 2002:a50:ec96:0:b0:543:6222:e37c with SMTP id e22-20020a50ec96000000b005436222e37cmr328621edr.0.1700773535794;
        Thu, 23 Nov 2023 13:05:35 -0800 (PST)
Received: from [192.168.0.104] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id c13-20020aa7df0d000000b0054386466f56sm1011724edy.60.2023.11.23.13.05.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Nov 2023 13:05:35 -0800 (PST)
Message-ID: <4df855f1-77e9-44a2-a024-aa5c7d661642@gmail.com>
Date: Thu, 23 Nov 2023 22:05:34 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] staging: rtl8192e: renamed variable
 HTIOTActIsMgntUseCCK6M
Content-Language: en-US
To: Gary Rookard <garyrookard@fastmail.org>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20231123144337.13112-1-garyrookard@fastmail.org>
 <20231123144337.13112-6-garyrookard@fastmail.org>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20231123144337.13112-6-garyrookard@fastmail.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/23 15:43, Gary Rookard wrote:
> Renamed from Pascal/CamelCase to Snake case the variable
> HTIOTActIsMgntUseCCK6M.
> HTIOTActIsMgntUseCCK6M -> ht_iot_act_is_mgnt_use_cck_6m
> 
> Linux kernel coding style (cleanup), checkpatch Avoid CamelCase.
> Driver/module rtl8192e compiles.
> 
> Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
> ---
> v3: Corrected versioning fron v1 -> v3, includes change history.
> v2: v2 was Skipped over..v3 corrects this.
> v1: Style and compile issues, asked to redo.
> 
>   drivers/staging/rtl8192e/rtl819x_HTProc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> index 0873c19ca051..f43249fd78d7 100644
> --- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
> +++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> @@ -207,7 +207,7 @@ static void ht_iot_peer_determine(struct rtllib_device *ieee)
>   	netdev_dbg(ieee->dev, "IOTPEER: %x\n", ht_info->IOTPeer);
>   }
>   
> -static u8 HTIOTActIsMgntUseCCK6M(struct rtllib_device *ieee,
> +static u8 ht_iot_act_is_mgnt_use_cck_6m(struct rtllib_device *ieee,
>   				 struct rtllib_network *network)

CHECK: Alignment should match open parenthesis
#33: FILE: drivers/staging/rtl8192e/rtl819x_HTProc.c:211:
+static u8 ht_iot_act_is_mgnt_use_cck_6m(struct rtllib_device *ieee,
  				 struct rtllib_network *network)

Please use checkpatch on your patches. Alignment issues can be fixed up 
by you. CamelCase oft not when the variable did not change within your 
patch.

>   {
>   	u8	retValue = 0;
> @@ -675,7 +675,7 @@ void HTResetSelfAndSavePeerSetting(struct rtllib_device *ieee,
>   		ht_iot_peer_determine(ieee);
>   
>   		ht_info->iot_action = 0;
> -		bIOTAction = HTIOTActIsMgntUseCCK6M(ieee, pNetwork);
> +		bIOTAction = ht_iot_act_is_mgnt_use_cck_6m(ieee, pNetwork);
>   		if (bIOTAction)
>   			ht_info->iot_action |= HT_IOT_ACT_MGNT_USE_CCK_6M;
>   		bIOTAction = HTIOTActIsCCDFsync(ieee);

