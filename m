Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D38051C37
	for <linux-staging@lists.linux.dev>; Mon, 11 Dec 2023 19:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gP5TaFwk"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-54ce02c1ba2so1043794a12.0
        for <linux-staging@lists.linux.dev>; Mon, 11 Dec 2023 11:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702322535; x=1702927335; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=15LJJIC+ZvEXcFWs9wkEalc+mlbTT7lJo9MkOjhcNVM=;
        b=gP5TaFwkrGkcWYmP3zKPpfaNZCpaaU9vOYUi/+iZlJK78BBa/LjKE4zpMNYFJzoymr
         I2MjyyE/k8nT3Z0EyIuHnjFBodI55YJTSt+/bFS37487UY/0P5lz2/guPOBvV2H4AB36
         uSQAn9i4iMjHGY5Z4hZjX0ePcL4CGCRZQCc/3sRWIZ7eNLKAhG0gLELvYQwLzaOVJEb3
         hLaWiOCNIDdoHIEX+YL6GEwKFcjHnjGd5vGi5u3AMUU3zzYwwzBr3dtW54J//vZV/cxx
         dS5i190167x8ZBmwmmgKdm9ZWUL+rM8RFR+GpW7uDjR10S19te8x9LXHw151VRF7rhf1
         g6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702322535; x=1702927335;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=15LJJIC+ZvEXcFWs9wkEalc+mlbTT7lJo9MkOjhcNVM=;
        b=Q6W4ym9VpD1hJcQXl806V2r5ecmVaN5WwRkKUV191xyB0YdrlGfH18on3Yir7nB+sV
         77OdMQPum936U58IWFnmYcrgOsC0LLguw2HtkAdWpG1xruQFJ44QzxFkt/jRCtwy0jIQ
         s1C+zgb8ev0ASKVvKTD1fAVfG/JHFd2nRCaJO7yR594d4s4D2fys+ehy7SlBd9Ve6hdE
         e6iDM1Qwr0wW2ZBgyqhc5dXenwdYvfukdg/G0yjwpJZo0beCQWkHpD/+YqEtUdhHhNuO
         6YK1jN8HR310o6VSIjBUaUHoorUbkldpCAHaibNBCnA2b2WW6/4Rz0dXG9Wi90Ad8bQj
         PZBQ==
X-Gm-Message-State: AOJu0YwxLOqm03CRv03yQDmQ9mS0gDZA2V6qvB2rFLVDIBVtWQwZ0FvP
	cOCyAaV+UGDWAgwv3FejSxo=
X-Google-Smtp-Source: AGHT+IHAI7rQoezDclA4XVHFQFZgJbm6UcBdAk2QaAzvwkh+2+JWiShIuR0bCPSZGvGl1GTnvsGEOQ==
X-Received: by 2002:a17:907:8b8a:b0:a1d:5c34:2ce7 with SMTP id tb10-20020a1709078b8a00b00a1d5c342ce7mr5372808ejc.6.1702322535130;
        Mon, 11 Dec 2023 11:22:15 -0800 (PST)
Received: from [192.168.0.104] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id vv8-20020a170907a68800b00a1d2b0d4500sm5210981ejc.168.2023.12.11.11.22.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 11:22:14 -0800 (PST)
Message-ID: <20793387-da59-4192-bb86-b20aeb127a65@gmail.com>
Date: Mon, 11 Dec 2023 20:22:12 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] Staging: rtl8192e: Remove variable bFirstSeg
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Tree Davies <tdavies@darkphysics.net>
Cc: gregkh@linuxfoundation.org, anjan@momi.ca, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20231210193705.2131807-1-tdavies@darkphysics.net>
 <20231210193705.2131807-2-tdavies@darkphysics.net>
 <2cdb678d-b784-411e-8913-eb7666e08ccc@suswa.mountain>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <2cdb678d-b784-411e-8913-eb7666e08ccc@suswa.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/23 09:37, Dan Carpenter wrote:
> On Sun, Dec 10, 2023 at 11:37:02AM -0800, Tree Davies wrote:
>> Remove variable bFirstSeg as it is defined but never used.
>>
>> Signed-off-by: Tree Davies <tdavies@darkphysics.net>
>> ---
>>   drivers/staging/rtl8192e/rtllib.h | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
>> index 0a8c44e497f5..c0a24826cd3b 100644
>> --- a/drivers/staging/rtl8192e/rtllib.h
>> +++ b/drivers/staging/rtl8192e/rtllib.h
>> @@ -103,7 +103,6 @@ struct cb_desc {
>>   	/* Tx Desc Related flags (8-9) */
>>   	u8 bLastIniPkt:1;
>>   	u8 bCmdOrInit:1;
>> -	u8 bFirstSeg:1;
>>   	u8 bLastSeg:1;
>>   	u8 bEncrypt:1;
>>   	u8 tx_dis_rate_fallback:1;
> 
> I don't think you can remove these.  They're part of the protocol for
> talking to the firmware.
> 
> regards,
> dan carpenter
> 

Hi Dan,

thanks for your response.

struct cb_desc is used in conjunction with this line:
struct cb_desc *tcb_desc = (struct cb_desc *)(skb->cb + 8);
from skbuff.h:
	/*
	 * This is the control buffer. It is free to use for every
	 * layer. Please put your private variables there. If you
	 * want to keep them across layers you have to do a skb_clone()
	 * first. This is owned by whoever has the skb queued ATM.
	 */
	char			cb[48] __aligned(8);

I think it has to do with the sku buffer and can be changed.

Here a test:
kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$ git diff
diff --git a/drivers/staging/rtl8192e/rtllib.h 
b/drivers/staging/rtl8192e/rtllib.h
index cc9070f39004..f29efc605ba9 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -100,6 +100,7 @@ static inline void *netdev_priv_rsl(struct 
net_device *dev)
  /* defined for skb cb field */
  /* At most 28 byte */
  struct cb_desc {
+       u8 ph_temp[7];
         /* Tx Desc Related flags (8-9) */
         u8 bLastIniPkt:1;
         u8 bCmdOrInit:1;
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c 
b/drivers/staging/rtl8192e/rtllib_softmac.c
index ee527ba5d1a8..93292fc3faaf 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -189,6 +189,9 @@ inline void softmac_mgmt_xmit(struct sk_buff *skb, 
struct rtllib_device *ieee)
         struct cb_desc *tcb_desc = (struct cb_desc *)(skb->cb + 8);

         spin_lock_irqsave(&ieee->lock, flags);
+       printk("Setting tcb_desc !!!\n");
+       tcb_desc->ph_temp[0] = 0xAA;
+       tcb_desc->ph_temp[6] = 0xAA;

         /* called with 2nd param 0, no mgmt lock required */
         rtllib_sta_wakeup(ieee, 0);

Here the log:
[ 9024.740612] rtl819xE 0000:03:00.0: Adapter(8192 PCI-E) is found - 
DeviceID=8192
[ 9025.773658] Setting tcb_desc !!!
[ 9025.773783] Setting tcb_desc !!!
[ 9025.797635] Setting tcb_desc !!!
[ 9025.797701] Setting tcb_desc !!!
[ 9025.849687] Setting tcb_desc !!!
[ 9025.849743] Setting tcb_desc !!!
[ 9025.977703] Setting tcb_desc !!!
[ 9025.977740] Setting tcb_desc !!!
[ 9026.105693] Setting tcb_desc !!!

Performance as expected OK.

Please reconsider your decision?

Thanks

Bye Philipp



