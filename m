Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7722A2F80
	for <linux-staging@lists.linux.dev>; Thu, 29 Apr 2021 23:31:28 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id k3-20020a17090ad083b0290155b934a295so724530pju.2
        for <linux-staging@lists.linux.dev>; Thu, 29 Apr 2021 16:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fzrD8zY4T8i1Ckg0kK2XoOEO/bZAqdILp4zvyRz37iw=;
        b=b43WsVVuC1Pa50Rdjt8xEgtfv2ddcX3sBZP9uXpmXZei6HzUJv6Kb2Zx3106FHcadr
         tuH3onKSd8k5gRaJ3cWKe3cqJJkF2m+lgoeLAo5PJft50r0MAKLTTHFS57FWn6QPh8h5
         TbsEva+ro8/iG0OiPU2uu4GLupnkow4ERibmjggcbM4DqWPcLDiAFryJ2slFzdxtgqUu
         ltgIbphu5kWu2oV7c4it4iISb7LgvHIiS6vTYWoRQzhYvrtfHRMkbcc+6vCeK6SdvpaK
         DQIX+pVPkP8Rsh2/J3AGRbn4/+KkCYendHKmUrwt5TQZOJ7ZwipRT8v/HgWJzTv28vME
         8pEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fzrD8zY4T8i1Ckg0kK2XoOEO/bZAqdILp4zvyRz37iw=;
        b=d0SQsmrksLENkjfu21Ql3ZY4BDQfMO+GN4w7xOmrxxm7K4LttnlNOqLNpnmcnt8cn/
         ZW55be5gasPycwb4pnyl5JGvYnSspoSSz8QBfhFg7mZleAA0YPxJJijaUvodA2qaaHOR
         QoEZF3ezoKBYsGS+11cmDGdh7JJNhJG09Eo0NSFGCxVCzuIV+1X5SYnOt2BFg9vqjikx
         5WjsmmaWrFGKrkw2n/y+E4kuAmi2tAtgxWJRxBco8XyhfCW2p1A4Pq1TXYa397hWBpKg
         5cJAi9Apwt1xzpux8vKj8Mk6WWT/J1WvbkNxcT6VqgXLtBfRZkBDRFbXEaKpDQ+7WAli
         NLuA==
X-Gm-Message-State: AOAM530vftruIizNHD6W5vR9Tb5i56XGSscy4VB34tP89/FQkQDiIhKv
	yuC+2MILb7jLtjm8WPtjiZU=
X-Google-Smtp-Source: ABdhPJxQFWHd9h1MRuUh+9kk8UbYLL3eHDb36/Y5upxqrmZxsITxtsK/7ISTVNxcSJgTeLL+/GEDmg==
X-Received: by 2002:a17:90b:3686:: with SMTP id mj6mr12127837pjb.116.1619739087898;
        Thu, 29 Apr 2021 16:31:27 -0700 (PDT)
Received: from [192.168.1.67] (99-44-17-11.lightspeed.irvnca.sbcglobal.net. [99.44.17.11])
        by smtp.gmail.com with ESMTPSA id q19sm101794pfl.171.2021.04.29.16.31.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Apr 2021 16:31:27 -0700 (PDT)
Subject: Re: [PATCH net-next 4/4] staging: mt7621-dts: enable MT7530 interrupt
 controller
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
 <20210429062130.29403-5-dqfext@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <f397c8e2-7ee0-f67c-6ea0-412fc671d418@gmail.com>
Date: Thu, 29 Apr 2021 16:31:22 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210429062130.29403-5-dqfext@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 4/28/2021 11:21 PM, DENG Qingfang wrote:
> Enable MT7530 interrupt controller in the MT7621 SoC.
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
