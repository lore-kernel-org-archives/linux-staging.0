Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1AC33C1
	for <linux-staging@lists.linux.dev>; Wed, 23 Nov 2022 21:26:56 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id b8so34462edf.11
        for <linux-staging@lists.linux.dev>; Wed, 23 Nov 2022 13:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BHT4V7PExgG7rhCblyyBnYo54ms5K9ov1exp2cIvGoo=;
        b=DfJ6F8a669zkbwBrJbAJScl7tNU0rifb3m1ktzu+qeGN0Ovf5Pijq/akXD8KIL1mky
         /8kRJPDkerK5WhItzNQ3D9lDpx4oWkRpN9yk1LIQkaHLilADYNZLFp633Fs/Q6Q9wFmF
         MiIa6MMZSrbG0dl//TkQd5QJ+Enfu0FGpa1QfM1WS9IgH0EBpQ+K/YK7pg3qKSKnI2AL
         XFTcG+p7R4y9pyMM2OQoxElRCYwIEqADWtmzHcHpcoMNCgvKC5p0PvLey6bX2Ns4JJJ8
         CjZVzgQAOCmfjr0JbQ18np6T8zqRUj9MCEUe52tCCDmUzjA4zGXWgxA20FMZA0lDmFf5
         m4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BHT4V7PExgG7rhCblyyBnYo54ms5K9ov1exp2cIvGoo=;
        b=4tuNleHlLMyxJy3dblKUpv0wKg+HRylZIoODgejV5VpW4gyPzq4V47d3MVqmbgbdYn
         dlaDoLWTz2TC7lWtKK8X1Gq2Uwu0Ve3Nf1/SipJO7jmb0AULw7Ew4JvfjX+NqBi9tXa5
         eCvfcX992eTF0vlMQe29mrtvoiPAEs2lhgx8Oz17zxjGy31/aPiPs5MY6g4aaKDinqfu
         tWL2Nzbfd9U5chpy2bJa9FAf24vEOPWz9+w47WebcMrT54zCmnWgfrI5frxBvoenRzcP
         FM5oCofIvahYnTAKGhDkga9pOzRmY3fsbwR6brt4egMkzXu8x3O3yCj9GlEVopMxWFq/
         Fsvg==
X-Gm-Message-State: ANoB5plO6Q8hZpfaiZPE9/EcLtxATZW9/zBkYdHR83n5tvcDBFy3QMPY
	YjAKOOsr7b67IhSTsbT7IeQ=
X-Google-Smtp-Source: AA0mqf5yJLyUvebw6rZR+TFtbPwAzrF0gKSkNvq8dykIDspWZaUnbaoz8cJatWdLiqRwKDJy/TfEJg==
X-Received: by 2002:a50:ff08:0:b0:461:dbcc:5176 with SMTP id a8-20020a50ff08000000b00461dbcc5176mr15071053edu.53.1669238814355;
        Wed, 23 Nov 2022 13:26:54 -0800 (PST)
Received: from ?IPV6:2003:c7:8f35:4b86:f759:7b33:8c22:1ed2? (p200300c78f354b86f7597b338c221ed2.dip0.t-ipconnect.de. [2003:c7:8f35:4b86:f759:7b33:8c22:1ed2])
        by smtp.gmail.com with ESMTPSA id o7-20020aa7c7c7000000b00463c475684csm8022501eds.73.2022.11.23.13.26.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 13:26:53 -0800 (PST)
Message-ID: <37f3b74d-2354-66c4-1ebb-3e1cefd2ba19@gmail.com>
Date: Wed, 23 Nov 2022 22:26:52 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] staging: rtl8192e: Fix potential use-after-free in
 rtllib_rx_Monitor()
Content-Language: en-US
To: YueHaibing <yuehaibing@huawei.com>, gregkh@linuxfoundation.org,
 wlanfae@realtek.com, Larry.Finger@lwfinger.net, mikem@ring3k.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20221123081253.22296-1-yuehaibing@huawei.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221123081253.22296-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/22 09:12, YueHaibing wrote:
> The skb is delivered to netif_rx() in rtllib_monitor_rx(), which may free it,
> after calling this, dereferencing skb may trigger use-after-free.
> Found by Smatch.
> 
> Fixes: 94a799425eee ("From: wlanfae <wlanfae@realtek.com> [PATCH 1/8] rtl8192e: Import new version of driver from realtek")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>   drivers/staging/rtl8192e/rtllib_rx.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
> index 6a0f5bbb99ef..f8965afab767 100644
> --- a/drivers/staging/rtl8192e/rtllib_rx.c
> +++ b/drivers/staging/rtl8192e/rtllib_rx.c
> @@ -1489,9 +1489,9 @@ static int rtllib_rx_Monitor(struct rtllib_device *ieee, struct sk_buff *skb,
>   		hdrlen += 4;
>   	}
>   
> -	rtllib_monitor_rx(ieee, skb, rx_stats, hdrlen);
>   	ieee->stats.rx_packets++;
>   	ieee->stats.rx_bytes += skb->len;
> +	rtllib_monitor_rx(ieee, skb, rx_stats, hdrlen);
>   
>   	return 1;
>   }

I was able to set the driver to Monitor mode but I did not get any 
information from it. I think this happens due to the missing support for 
nl80211. Please give me a hint how to do this.

Thanks for your support.

Bye Philipp
