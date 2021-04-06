Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E175C6D0E
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 16:14:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2962C613D2
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 16:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617725692;
	bh=e7fZVz6b0FMgjgCkbnNmNXBn1MD/C6gNDZ3usE0y5hc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=USE73gN/6PJf5bTwmAe+aEqN6RlKtxqQvoAKsF4cnQbuDuqs74aFV4L67qwrB1B1f
	 ASAuseMeo2vKHBrzGPD5ZkjbM2PZKOgQpY5IdRvPAlgU6nHf253ygstru7Mn1kiE5u
	 sUtwZxrU2QzHAcL6oaxTFfijDRsnFie0Lz8q1+efl0E+feU+vxKqM3+SHecqAXcS83
	 dhDlDZUi/LxctuCNKHqqD49sBmCYAw4LkrS+WWpRGld39qSWcgzUtk196LKQc5etVQ
	 PXsKhshbW02RyTa8jaoBIiQByJBgvRJcZ+nPQwDpvtC+tvBvJEIwOEhL45ssbdlo/a
	 xD1V7eSe6r45w==
Received: by mail-ej1-f51.google.com with SMTP id u17so16597515ejk.2
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 09:14:52 -0700 (PDT)
X-Gm-Message-State: AOAM5324XXNWHrdYEGcY5GteEAEl8KHsEchBk1mihw9thDi2JV7b9wcH
	sq5mgZd0NMnqAiBWIc9fZ3+GIaS/aURFg06ntA==
X-Google-Smtp-Source: ABdhPJxus3vaJlBolyIDnwHcY8HUfh+bhu44dUc1lwfkvNdASWzEwWAgbEIKh7zaUEUIwYwhnk1eltD52lV6wsnPcD0=
X-Received: by 2002:a17:906:490e:: with SMTP id b14mr6498315ejq.303.1617725690674;
 Tue, 06 Apr 2021 09:14:50 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210406141819.1025864-1-dqfext@gmail.com> <20210406141819.1025864-2-dqfext@gmail.com>
 <CAAOTY_8snSTcguhyB9PJBWydqNaWZL3V4zXiYULVp5n48fN24w@mail.gmail.com> <YGyGFOrXwEsqCW/z@lunn.ch>
In-Reply-To: <YGyGFOrXwEsqCW/z@lunn.ch>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 7 Apr 2021 00:14:39 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9feP7bBFJFVBWzNbnAK7xZQFLZJ=viFFncyS55JghP9A@mail.gmail.com>
Message-ID: <CAAOTY_9feP7bBFJFVBWzNbnAK7xZQFLZJ=viFFncyS55JghP9A@mail.gmail.com>
Subject: Re: [RFC net-next 1/4] net: phy: add MediaTek PHY driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, DENG Qingfang <dqfext@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	Landen Chao <Landen.Chao@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>, 
	Vivien Didelot <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, linux-staging@lists.linux.dev, 
	DTML <devicetree@vger.kernel.org>, netdev <netdev@vger.kernel.org>, 
	Weijie Gao <weijie.gao@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>, 
	=?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Andrew Lunn <andrew@lunn.ch> =E6=96=BC 2021=E5=B9=B44=E6=9C=887=E6=97=A5 =
=E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=8812:02=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, Apr 06, 2021 at 11:47:08PM +0800, Chun-Kuang Hu wrote:
> > Hi, Qingfang:
> >
> > DENG Qingfang <dqfext@gmail.com> =E6=96=BC 2021=E5=B9=B44=E6=9C=886=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8810:19=E5=AF=AB=E9=81=93=EF=BC=
=9A
> > >
> > > Add support for MediaTek PHYs found in MT7530 and MT7531 switches.
> > > The initialization procedure is from the vendor driver, but due to la=
ck
> > > of documentation, the function of some register values remains unknow=
n.
> > >
> > > Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> > > ---
> > >  drivers/net/phy/Kconfig    |   5 ++
> > >  drivers/net/phy/Makefile   |   1 +
> > >  drivers/net/phy/mediatek.c | 109 +++++++++++++++++++++++++++++++++++=
++
> > >  3 files changed, 115 insertions(+)
> > >  create mode 100644 drivers/net/phy/mediatek.c
> > >
> > > diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
> > > index a615b3660b05..edd858cec9ec 100644
> > > --- a/drivers/net/phy/Kconfig
> > > +++ b/drivers/net/phy/Kconfig
> > > @@ -207,6 +207,11 @@ config MARVELL_88X2222_PHY
> > >           Support for the Marvell 88X2222 Dual-port Multi-speed Ether=
net
> > >           Transceiver.
> > >
> > > +config MEDIATEK_PHY
> >
> > There are many Mediatek phy drivers in [1], so use a specific name.
>
> Those are generic PHY drivers, where as this patch is add a PHY
> driver. The naming used in this patch is consistent with other PHY
> drivers. So i'm happy with this patch in this respect.
>
> PHY drivers have been around a lot longer than generic PHY drivers. So
> i would actually say the generic PHY driver naming should make it
> clear they are generic PHYs, not PHYs.
>

OK, so just ignore my comment.

> But lets not bike shed about this too much.
>
>       Andrew
