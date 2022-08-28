Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9C32F43
	for <linux-staging@lists.linux.dev>; Sun, 28 Aug 2022 19:40:24 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id bs25so7827775wrb.2
        for <linux-staging@lists.linux.dev>; Sun, 28 Aug 2022 12:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=SBJUt5ya6H+Vp4juVe7YBe27t2DrpMHLEEUeEfHVB4Q=;
        b=CKptIP8hALLJcspcyH3wZ+DDUrdpFwm5eWl/ZSduQcuDU3UKdUuB6s5J7lv1UihJkY
         ikB0fAiqUaLoSQIR3adUJIR4KhcvDLyAZYFuDuVOshoajU47DvhJu14ovz3hre9JDaU9
         PCyiNBfg+rvNDTz5g+M3W64rg2q17PTsHKQ3H4xSycwFizS+YpyFhci+sDTQwKxo5xBD
         j2tq+DsxOPAKR9TnCYEXp937FEkjEk3Tgc8qd1LT9oECthnq0Ow9FP6FIUnY+BDwlg+H
         v8Jjaa2+gny0r+LfHFX3K7+V64tGTqyrMJPA/S4d/be+gyFwhkRqS2K+AQS+omZeaDD6
         /IOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=SBJUt5ya6H+Vp4juVe7YBe27t2DrpMHLEEUeEfHVB4Q=;
        b=M1H+ltotWk1miRMF3POPHV5NWVyP8B8FQFDLHzf21DJhsob2DLSGer7SQaP6inEXQt
         VxTpxNlXkkdewxM7aKKbmwpXwMkHchWt1HjoOEuepENmTAk7s2nuOZbM47boxLFIOoWu
         crKTiJbIhpXPvSr4lVIPlVDzugqTjYKALk8wGlHFGEiZkm6ere2PoF0C3efop7nad79U
         SegV6EeZCGJo46MCSmw5Qyn9PuGUJ2q8LDk5V/8dJQ4JHp5Zaqo5h5RbmxaXopBGqiJy
         7mYsYiFFRKrd6rSqxcEv9Evijo+oK6itGeeOizPuhIGOhTpZmf5spb8FfZsbnWPaOdsP
         CvdA==
X-Gm-Message-State: ACgBeo0X2bTEwF3kt7HWObxUg3S2tmFmwpKylK7XwoJEfMgWBSqy0v82
	9KEkDFHoYz6jwWTMKSIWPW0=
X-Google-Smtp-Source: AA6agR6vKePDsASPC+j/BFgCJsWg/lnAcU/ys5lkjhmU2adiGHa+nEiFzQPPlBSuwtiLBWu6LX9NYw==
X-Received: by 2002:a5d:5985:0:b0:222:c5dd:b7c8 with SMTP id n5-20020a5d5985000000b00222c5ddb7c8mr4778851wri.511.1661715623249;
        Sun, 28 Aug 2022 12:40:23 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2e:6943:86da:343d:c9ca:6ac3? (p200300c78f2e694386da343dc9ca6ac3.dip0.t-ipconnect.de. [2003:c7:8f2e:6943:86da:343d:c9ca:6ac3])
        by smtp.gmail.com with ESMTPSA id u14-20020adfdd4e000000b0021f131de6aesm5190965wrm.34.2022.08.28.12.40.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Aug 2022 12:40:22 -0700 (PDT)
Message-ID: <1559c05f-a345-314a-c9e5-857d46dbfe11@gmail.com>
Date: Sun, 28 Aug 2022 21:40:21 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] staging: rtl8192e: Fix comments typo
Content-Language: en-US
To: Shaomin Deng <dengshaomin@cdjrlc.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: baihaowen@meizu.com, dan.carpenter@oracle.com, paskripkin@gmail.com,
 dave@stgolabs.net, edumazet@google.com
References: <20220825150258.8967-1-dengshaomin@cdjrlc.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220825150258.8967-1-dengshaomin@cdjrlc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/25/22 17:02, Shaomin Deng wrote:
> Fix double word "new" in comments.
> 
> Signed-off-by: Shaomin Deng <dengshaomin@cdjrlc.com>
> ---
>   drivers/staging/rtl8192e/rtllib_softmac.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
> index b5f4d35954a9..9e6d7c5716ff 100644
> --- a/drivers/staging/rtl8192e/rtllib_softmac.c
> +++ b/drivers/staging/rtl8192e/rtllib_softmac.c
> @@ -1611,7 +1611,7 @@ inline void rtllib_softmac_new_net(struct rtllib_device *ieee,
>   
>   	short apset, ssidset, ssidbroad, apmatch, ssidmatch;
>   
> -	/* we are interested in new new only if we are not associated
> +	/* we are interested in new only if we are not associated
>   	 * and we are not associating / authenticating
>   	 */
>   	if (ieee->state != RTLLIB_NOLINK)

Sorry this proposal was made just some hours before by Jilin Yuan 
<yuanjilin@cdjrlc.com> in patch: "[PATCH] staging/rtl8192e: fix repeated 
words in comments"

Bye Philipp
