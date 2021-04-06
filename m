Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E016F6D0E
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 15:39:15 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id k25so9104312iob.6
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 08:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dWxFzfKKOt+ryNUGtIA7HKn1wCE+QFswqU/+uqCUAzo=;
        b=G9jof8Q6D3iqyUddjnM66ZIpqBpTUSY4OWVPX8B4ht0B5FcM9cGnncIhteSSSAr0gg
         W5rBCFvuOHQrzdf+5g6y5T32ts5lLZbBdZgH9c0rnnMQvC0id5owFpSPczcltIl8ey7i
         ajQkhLrsn5aEschOSp66HTvuDLnCd68+crEVnaqLn3ZT/BXRoXbVJHk2EuxwnGTgks8z
         sg/rqazXZPXiGDrOEgW1PO+Aa256W77paqMIfiabrszEDIxpC5eMTVaT4z85klx1Wg7t
         5zZdVf4ZcsCsBrXVwZwd4JNTGdVaTTFM0ixQK000QhzlxbUv1Kv/bvwsezy0Yg9nwk4k
         tERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dWxFzfKKOt+ryNUGtIA7HKn1wCE+QFswqU/+uqCUAzo=;
        b=uJdg70TjEPMtp6/BozNVHWDfJ3behoD1xS8MVomVRJ/GqAb0r72iQWO3dKJUSD9lSN
         pCAafsdNFcLFaOzoiy6BLJm5AdDV00wyt8r+BHJ9wt8Oom20V0eKVZ8fDzAoMiD6K4Wt
         ckwULMz6P/GPVwFJdpE/VXpRwbqQMN27E7tcHI7L+Pln3rYW3WsrmLGx8ym2Lj6yW4+H
         dWadsXePd7roiQlKWGsa32VxFi0p3rdBGLQOqJWYDgPvgHyRrvghJwN+6K/PMeHBA1vX
         6lGbdP7FA2LefNqDZ9fYFbJXTShSweIEIO0xDypsypoD1JP+7Qh08bmiQZfbNJOlH5ll
         mSwQ==
X-Gm-Message-State: AOAM533vmTqxEwNEnBgXL/GNHPVOQImvKfGir36QThLOMH7IULkDUf3j
	txcrwZc5Wj9g31qs2o+Ruwb0+yU5z1OghPITGvw=
X-Google-Smtp-Source: ABdhPJy3YG+5BM+JKU8AQNUYeKtb+jJMAndWgE0jQ+keqRMn1E2k/TmrjG0/9fN38Ubih2KJL/q8MeujGEdUnK9jZgo=
X-Received: by 2002:a02:ccda:: with SMTP id k26mr2514289jaq.136.1617723555190;
 Tue, 06 Apr 2021 08:39:15 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210406141819.1025864-1-dqfext@gmail.com> <20210406141819.1025864-3-dqfext@gmail.com>
 <YGx+nyYkSY3Xu0Za@lunn.ch>
In-Reply-To: <YGx+nyYkSY3Xu0Za@lunn.ch>
From: DENG Qingfang <dqfext@gmail.com>
Date: Tue, 6 Apr 2021 23:39:12 +0800
Message-ID: <CALW65jYhBGmz8dy+9C_YCpJU5wa-KAwgrGjCSpa3nqUNT+xU+g@mail.gmail.com>
Subject: Re: [RFC net-next 2/4] net: dsa: mt7530: add interrupt support
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	Landen Chao <Landen.Chao@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>, 
	Vivien Didelot <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-kernel@vger.kernel.org, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, linux-staging@lists.linux.dev, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, netdev <netdev@vger.kernel.org>, 
	Weijie Gao <weijie.gao@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>, 
	=?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 6, 2021 at 11:30 PM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Tue, Apr 06, 2021 at 10:18:17PM +0800, DENG Qingfang wrote:
> > Add support for MT7530 interrupt controller to handle internal PHYs.
>
> Are the interrupts purely PHY interrupts? Or are there some switch
> operation interrupts, which are currently not used?

There are other switch operations interrupts as well, such as VLAN
member violation, switch ACL hit.

>
> I'm just wondering if it is correct to so closely tie interrupts and
> MDIO together.
>
>      Andrew
