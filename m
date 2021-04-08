Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2607570
	for <linux-staging@lists.linux.dev>; Thu,  8 Apr 2021 15:00:21 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id j18so4570103lfg.5
        for <linux-staging@lists.linux.dev>; Thu, 08 Apr 2021 08:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FjPNKJFXnPLlIkn9ofe/hgNOiX4jHuRRHt6hgl/CzlA=;
        b=XbZQ46kuRoE8CvvYGZdRG7dg/QOplHjo7etUJYk4YVHrjZT3NA85gaoysHXoEEMscI
         5eIzjIauhjJHRn+s2BeO6XCW/EP6IrCLfCsVbyDyrXM3rg0uFrSBSAYOLHTlOhNwux0B
         5eVE73WtGFAuKNOUnbvg+u0JYoB+0Ah4UenNLHTLYmBzLjXeaOAQoLGOeGQQ422RsPfi
         Hcvu7QB8tkyboyurVK1mjBv9DEqucCDuu3igcXiJ5GZTW3T3cGJBdDcU5FUP7f+mphm0
         ZmsLpKKnyHiHsSH38Cud7G2mu5HWtCsI3f0l5qzwjUrfneucL4Bg2uatzY8F+tp45Sp0
         aX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FjPNKJFXnPLlIkn9ofe/hgNOiX4jHuRRHt6hgl/CzlA=;
        b=EKOU2+rbDIB0baJa/Hza1n1uY+X/QQFAZWClSY2B3OflCHgtT9v6Nh0tK+yM2PxbeH
         K4IAT2EkHO+GNfkoBNTKEk8pQWFL9V78nDKWinLalWK/W5cVbvuIdwhiF+y06hP6Y0sb
         ZYUDe51HycHb/GO8PY003+O9XlEmuonRzOxdBr9oPmj9aw9LgKQLr+uyrpVKvu6bO/9m
         +pN1J85rXWXCgaY/V3mrnIp1rfZHjpP4I1Gknf7MzJ5L2b72b04g8FhaMOgRj3VgWTsO
         fqRM7BNA8nN3VoPXxEEq2N2GEdbpuRml3Zt0EzP/er4BSeBGwJffIgCdWpF7WpKQ1w6L
         eDPg==
X-Gm-Message-State: AOAM5312uat13B6RrW4mzwZ6CCKpVohFs+7hzz0dnDpdiu3wVQI49Ztf
	SpycJmxd7eL1+5tOhCadnQw7CwVime+3dNY1ofA=
X-Google-Smtp-Source: ABdhPJzjEAtp7tSnx5kIvHtgEJeseYxS+FKQnHvpnDHWEm/cOFqXyqTMKAR3dgjC0R3Fe6+Hrb+V8yEVk7P8pi+tQOc=
X-Received: by 2002:a05:6512:2295:: with SMTP id f21mr2490389lfu.166.1617894019468;
 Thu, 08 Apr 2021 08:00:19 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210408123919.2528516-1-dqfext@gmail.com> <20210408140255.Horde.Pl-DXtrqmiH9imsWjDqblfM@www.vdorst.com>
In-Reply-To: <20210408140255.Horde.Pl-DXtrqmiH9imsWjDqblfM@www.vdorst.com>
From: DENG Qingfang <dqfext@gmail.com>
Date: Thu, 8 Apr 2021 23:00:08 +0800
Message-ID: <CALW65jZujSCk16RX_xgcg+NGrc9yyFQOQ9Y-z3qz-Qv1TvUQLg@mail.gmail.com>
Subject: Re: [RFC v3 net-next 0/4] MT7530 interrupt support
To: =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>
Cc: "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>, 
	Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, Landen Chao <Landen.Chao@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Sean Wang <sean.wang@mediatek.com>, Vivien Didelot <vivien.didelot@gmail.com>, 
	Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, linux-staging@lists.linux.dev, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, netdev <netdev@vger.kernel.org>, 
	Weijie Gao <weijie.gao@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>, 
	Frank Wunderlich <frank-w@public-files.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ren=C3=A9,

On Thu, Apr 8, 2021 at 10:02 PM Ren=C3=A9 van Dorst <opensource@vdorst.com>=
 wrote:
>
> Tested on Ubiquiti ER-X-SFP (MT7621) with 1 external phy which uses irq=
=3DPOLL.
>

I wonder if the external PHY's IRQ can be registered in the devicetree.
Change MT7530_NUM_PHYS to 6, and add the following to ER-X-SFP dts PHY node=
:

interrupt-parent =3D <&switch0>;
interrupts =3D <5>;
