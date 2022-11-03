Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F177679C9
	for <linux-staging@lists.linux.dev>; Thu,  3 Nov 2022 22:01:10 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id t1so1985705wmi.4
        for <linux-staging@lists.linux.dev>; Thu, 03 Nov 2022 15:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u+myOUTcxqEfQMThAIiz8SuyliK2/UIGrMCMSymFxCE=;
        b=AmdVWJTMGlB+aeXO5lJVwIXZbrQi9HxoRtizfLu5L2hcXfWEBlSHTSM3KJryGovgTY
         CKNPJI7J6RHgpO4EsaSDF0LooJw/O8HIYszvadGs8HkW9Wr65whqcIkC4MPiJIx6Mfju
         PDQZJASGe93huPUApG4ofiZ8J/A5aXlOufac4y5CzUvlP4njBeoK4Funt8HQndQM62TK
         3bxqG6ZXeGq2YDpJATgc5hGLWe42soNzB8kgffvCRowAi/qjPMyeIf7giSqdocMNoe4u
         JuOskU9FiwQkpjEwy+PanOhiMIv2XCiLxRST+wRuFiw0rgkSvYx/7T7Gf1DTB/JtM6+f
         1zhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u+myOUTcxqEfQMThAIiz8SuyliK2/UIGrMCMSymFxCE=;
        b=FSXOIRUYSCjviIXVo9ICbeF2wG478SLn3FXEZMaajyUMgZDBvuJAa4iET5MNmMWXVR
         mEfuAXJxqujcyFy9KStpPBMG20iRNL1aPfBy3kY+IpgG+Wu57goj8733e7KZ7pv0/Tn4
         2GeHLdsuTAgYcnGB3XAZFgNkaeuWUkFqDdBtQuPKVYil4C9RXPwuKNQTngS5kVTxcbO8
         h4yaueQYskYy5yIcmc5hi/hL6rhmPCy/bCcf+q45HcXag11ao2kZ6G3Xkx0J3kdk4D6o
         ApNrPjgaW+CmYtzyMDVRyooCbxFFHc9m2T2UtfRSPnorTitCSF4VjiLxBlkacXvL+Gph
         3hlA==
X-Gm-Message-State: ACrzQf2NpwQvODd7KeWUdFzuu5q9PnFhbv4zN9XqlRJ+1aX2XeSZd5iY
	j/KkYEEI6BGrRtRPw+yD92c=
X-Google-Smtp-Source: AMsMyM70OsXMXIK4GT9TB+3XvT3T7jZvU99hqANplgZXzTxldVCV+1dR9wX9tarA3BzewNNPJVkbyg==
X-Received: by 2002:a1c:f311:0:b0:3b5:18ca:fc5e with SMTP id q17-20020a1cf311000000b003b518cafc5emr21477669wmq.70.1667512869173;
        Thu, 03 Nov 2022 15:01:09 -0700 (PDT)
Received: from [192.168.1.102] (p54a07888.dip0.t-ipconnect.de. [84.160.120.136])
        by smtp.gmail.com with ESMTPSA id x5-20020a5d4905000000b0023655e51c14sm1821127wrq.32.2022.11.03.15.01.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 15:01:08 -0700 (PDT)
Message-ID: <2c51855b-cd74-5701-d9fc-ad75818e7c28@gmail.com>
Date: Thu, 3 Nov 2022 23:01:07 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] staging: rtl8192e: Fix divide fault when calculating
 beacon age
Content-Language: en-US
To: Larry Finger <Larry.Finger@lwfinger.net>, gregkh@linuxfoundation.org
Cc: phil@philpotter.co.uk, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>
References: <20221103200507.14304-1-Larry.Finger@lwfinger.net>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221103200507.14304-1-Larry.Finger@lwfinger.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/22 21:05, Larry Finger wrote:
> When the configuration parameter CONFIG_HZ is less that 100, the compiler
> generates an error as follows:
> 
> ../drivers/staging/rtl8192e/rtllib_wx.c: In function 'rtl819x_translate_scan':
> ../drivers/staging/rtl8192e/rtllib_wx.c:220:57: warning: division by zero [-Wdiv-by-zero]
>    220 |                       (jiffies - network->last_scanned) / (HZ / 100));
>        |                                                         ^
> In file included from ../include/linux/skbuff.h:45,
>                   from ../include/linux/if_ether.h:19,
>                   from ../include/linux/etherdevice.h:20,
>                   from ../drivers/staging/rtl8192e/rtllib_wx.c:18:
> ../drivers/staging/rtl8192e/rtllib_wx.c: In function 'rtllib_wx_get_scan':
> ../drivers/staging/rtl8192e/rtllib_wx.c:261:70: warning: division by zero [-Wdiv-by-zero]
>    261 |                                    (jiffies - network->last_scanned) /
>        |
> 
> In fact, is HZ is not a multiple of 100, the calculation will be wrong, but it
> will compile correctly.
> 
> The fix is to get rid of the (HZ / 100) portion. To decrease any round-off
> errors, the compiler is forced to perform the 100 * jiffies-difference before
> dividing by HX. This patch is only compile tested.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
> ---
>   drivers/staging/rtl8192e/rtllib_wx.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtllib_wx.c b/drivers/staging/rtl8192e/rtllib_wx.c
> index da2c41c9b92f..7013425102dd 100644
> --- a/drivers/staging/rtl8192e/rtllib_wx.c
> +++ b/drivers/staging/rtl8192e/rtllib_wx.c
> @@ -217,7 +217,7 @@ static inline char *rtl819x_translate_scan(struct rtllib_device *ieee,
>   	p = custom;
>   	p += scnprintf(p, MAX_CUSTOM_LEN - (p - custom),
>   		      " Last beacon: %lums ago",
> -		      (jiffies - network->last_scanned) / (HZ / 100));
> +		      (100 *(jiffies - network->last_scanned)) / HZ);
>   	iwe.u.data.length = p - custom;
>   	if (iwe.u.data.length)
>   		start = iwe_stream_add_point_rsl(info, start, stop,
> @@ -258,8 +258,8 @@ int rtllib_wx_get_scan(struct rtllib_device *ieee,
>   				   escape_essid(network->ssid,
>   						network->ssid_len),
>   				   network->bssid,
> -				   (jiffies - network->last_scanned) /
> -				   (HZ / 100));
> +				   (100 * (jiffies - network->last_scanned)) /
> +				   HZ);
>   	}
>   
>   	spin_unlock_irqrestore(&ieee->lock, flags);

Line length of the description is to long.

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>

