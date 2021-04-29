Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3980C2F80
	for <linux-staging@lists.linux.dev>; Thu, 29 Apr 2021 23:40:54 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id f2-20020a17090a4a82b02900c67bf8dc69so736879pjh.1
        for <linux-staging@lists.linux.dev>; Thu, 29 Apr 2021 16:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XhukHwYbMb8O314H4ZGGa+i+YIDh1nbMFFV8k4MmwUI=;
        b=op9P97+VwniEZEgl6V0uJg4liTBfCSve0gYuIwtJV2VxgUw2uUscBqDXghoZPDnU6f
         kmbxPcA8HMaMk9tqhS0jkzO7vEHxBQU70muIVCdylatZ9w3zGSt44TC3VOxcSJHLkdk8
         HF7pjnC265ouFoBV4707RyhBohR2M7FGgk3tuRDZhZxKL8HrWpiXBOk5po+DkFwTPJiE
         KKQNrgRjFEc2xWJhu3cSdmQhT0b5UW/Kmv4aYB6IFMprXMFAviFbSnYw8yVV596Z52b0
         nLL7Ac0HUC1DYwzPnV4gn9R7Y9oS+3ZcDr/YsqIgEWLniuGvjD9Jo9T8F7uT60zX8IA+
         03Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XhukHwYbMb8O314H4ZGGa+i+YIDh1nbMFFV8k4MmwUI=;
        b=P1/7GC7KfVRk6UiInbH+eejQ66MitZotMOz2tjD/RH8v7JjHDzU0QLGlohyCh4fMQh
         Ezro028SpfY3lCEI+gCNTElsKLxnvcbgZ08CVJ0yekrOb7rSG/io2QYaidMOeJ3PA1ix
         QU0ogdLh5A9u+62U+muY59H0enLnTNdorNyXg0ddwr0ipovzBBW//45OOhSI/cGlUQUB
         5PFY21zupsAeGPuNkV5y2zZ1hdGoyM25j4J7tj6l5xV4vjhs9/giLaVZvi09aoBzHYz2
         t4RepuJRrfUqD78K7Sgha0uAbCSerelIOa2k1kxc5MsOsEVSSZKX4t6t+ElBaWShkWWO
         ZM+A==
X-Gm-Message-State: AOAM532WZ+aLi5XWnSRdZkX9Xb5p7IQ3UfSGMJp46aaVguElVLV/gUcw
	tOTmkt7TfHAd6LK/lohNJ6c=
X-Google-Smtp-Source: ABdhPJwjGyTLCdT6s5cn8i6gJu489rSGDxoyn02TFF4vVytwGrZ2VZpOChwO4adx+To7A4ZukzXXtA==
X-Received: by 2002:a17:90b:3615:: with SMTP id ml21mr4991739pjb.28.1619739653805;
        Thu, 29 Apr 2021 16:40:53 -0700 (PDT)
Received: from [192.168.1.67] (99-44-17-11.lightspeed.irvnca.sbcglobal.net. [99.44.17.11])
        by smtp.gmail.com with ESMTPSA id q21sm23807pfl.152.2021.04.29.16.40.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Apr 2021 16:40:53 -0700 (PDT)
Subject: Re: [PATCH net-next 1/4] net: phy: add MediaTek PHY driver
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
 <20210429062130.29403-2-dqfext@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <7330e4f6-5e7a-1993-1577-fefaa163b6cd@gmail.com>
Date: Thu, 29 Apr 2021 16:40:39 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210429062130.29403-2-dqfext@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 4/28/2021 11:21 PM, DENG Qingfang wrote:
> Add support for MediaTek PHYs found in MT7530 and MT7531 switches.
> The initialization procedure is from the vendor driver, but due to lack
> of documentation, the function of some register values remains unknown.
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
