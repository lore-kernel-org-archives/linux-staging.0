Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135BA2F80
	for <linux-staging@lists.linux.dev>; Thu, 29 Apr 2021 23:32:08 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id e2so31310424plh.8
        for <linux-staging@lists.linux.dev>; Thu, 29 Apr 2021 16:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eTT0JjyHTNK+HUwEt1vOt0ko87TGIxLuDLOETsVrMNQ=;
        b=NL22mth4obNH9bwhyoRdPTGW5NDTt137bEw6yVVrYx9o5GEqU/tX6+bP1iv0mAo0/0
         +lO/8Ok3gD48/bcyyBQFenVT7d85a/IDaoGQxjK6UbO2CvX7KujRjv9x/qbzjR+rsl5U
         8xVENRKUEPwMkE5OaITnGU8/mesD1sS1xbntJo5XKVGQSaodiwIxnbY9NEAafYv0rmG3
         B6r5KsZmqBSX82/9kIAch/rFVugWbjKVYX/0BhHWAmzeaMWnZvcIxPJmmaY8FrgkiJzC
         aRtTSv2Vk7M468JbEXeRLRXEcPKKnVfrAEHaO4xuXmuem56bGqAtE38xqgEr5hugqPUM
         dTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eTT0JjyHTNK+HUwEt1vOt0ko87TGIxLuDLOETsVrMNQ=;
        b=i7TMCOK91OGrTayzaOgu3B1HnvO+numAPLxa9y8bRUF15Wr9c70L67lmxZaQaXhASe
         asuMH9jqvcjyvEO8Uu0Rwpnkvr+56V1oAy9u8Az40pCNowGI7zUlQXeRkMgJeJtfYlrE
         P7k5jw4Kwolm2+LAFWbz37Imoob+cEX9tdVbKLolqFa35Sl8Ma0iEuA7yex1dAMEICT3
         UiOFyRyP7umggXbtCUeEhEclP/YnvkDuuiPQiuBsqJQFFWQTBl+YJDP39L3QZhMAM8xI
         B9dyBGkhKak5cJEX9AuMfKHBSyxzpYkv0dkezTdjsH93EGNou5bpLSzXf1QaUMhoWo6P
         2Vig==
X-Gm-Message-State: AOAM531ZngbuYJSZn823wSOE9hBz4X6sorEfNuGKL32H53B0yfzW5nHI
	M2oQldcvG1z1ZapIMg/3WgU=
X-Google-Smtp-Source: ABdhPJw6edmhEYsj/llH0BJ5N2LSx83oGegeqtY4EIlysM8uGKAKrfXAv1fBajAw5w1BLje8hcyPuQ==
X-Received: by 2002:a17:90a:a4c7:: with SMTP id l7mr2284100pjw.147.1619739127543;
        Thu, 29 Apr 2021 16:32:07 -0700 (PDT)
Received: from [192.168.1.67] (99-44-17-11.lightspeed.irvnca.sbcglobal.net. [99.44.17.11])
        by smtp.gmail.com with ESMTPSA id lb2sm8041195pjb.53.2021.04.29.16.32.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Apr 2021 16:32:07 -0700 (PDT)
Subject: Re: [PATCH net-next 3/4] dt-bindings: net: dsa: add MT7530 interrupt
 controller binding
To: DENG Qingfang <dqfext@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Landen Chao <Landen.Chao@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 netdev@vger.kernel.org
Cc: Weijie Gao <weijie.gao@mediatek.com>, Chuanhong Guo
 <gch981213@gmail.com>, =?UTF-8?Q?Ren=c3=a9_van_Dorst?=
 <opensource@vdorst.com>, Frank Wunderlich <frank-w@public-files.de>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
References: <20210429062130.29403-1-dqfext@gmail.com>
 <20210429062130.29403-4-dqfext@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <46c30868-fc01-2022-f6ed-c61432d5760f@gmail.com>
Date: Thu, 29 Apr 2021 16:31:59 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210429062130.29403-4-dqfext@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 4/28/2021 11:21 PM, DENG Qingfang wrote:
> Add device tree binding to support MT7530 interrupt controller.
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> ---
> RFC v4 -> PATCH v1:
> - No changes.
> 
>  Documentation/devicetree/bindings/net/dsa/mt7530.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/mt7530.txt b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
> index de04626a8e9d..892b1570c496 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mt7530.txt
> +++ b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
> @@ -81,6 +81,12 @@ Optional properties:
>  - gpio-controller: Boolean; if defined, MT7530's LED controller will run on
>  	GPIO mode.
>  - #gpio-cells: Must be 2 if gpio-controller is defined.
> +- interrupt-controller: Boolean; Enables the internal interrupt controller.
> +
> +If interrupt-controller is defined, the following property is required.

s/is/are/

It would be good to follow up with a converstion of this binding file to
YAML eventually.

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
