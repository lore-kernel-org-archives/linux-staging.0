Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64DB6D0E
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 16:07:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 28EA1613DF
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 16:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617725223;
	bh=q0TkxKOZJRUCAT/XfYl1YgZ73jKyqtq9Ikqkmc/zUi0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GyMC15T1zs1/FkyzEWXhAoZRPjYf8iTv0ebdRrGUWbDRkWlLvORRumrMafdLcFCPg
	 QYAZApT/4mG9b41oyajNyffAC8dI7OmznHPc+ULgGQh2OqecWYYejnHKLedqaksmnJ
	 PP1659XHUsMr+O1Y/6e52Q9+lpjus3evEJ6fVn/B9eozisxj459ekoIp7vEDHVFHZV
	 lm2ubBW0wfV/VPYrf6t+4zRTnX3c4wmEQBb/nHHG+X9MDGsMD6e6/GGGLb34tFBGLk
	 xhOSYoPuGNxibwmqk6EXHR7Mm53VggW8AkrwLSI9FN6q6NkBEO7h9nxcxSwFaUVAwE
	 hixdnahlEquUQ==
Received: by mail-ej1-f46.google.com with SMTP id hq27so22773354ejc.9
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 09:07:03 -0700 (PDT)
X-Gm-Message-State: AOAM530wQEG7EOQrqkjYAGZdoPjwDs6iZWl4EEDT5xeD5PSuJPuR/oHO
	T1yCaY5XsLPPcEKtVg6e6CtWkKV0ceCTnjiUcw==
X-Google-Smtp-Source: ABdhPJzMoSMQygWRDajEWdidSk67pVGpnygV7Dy6GVwOgacbGBH3WitosU5sKMxxu8argY+oQjgYUzFyQ6EbAAfWYTg=
X-Received: by 2002:a17:906:490e:: with SMTP id b14mr6455459ejq.303.1617725221514;
 Tue, 06 Apr 2021 09:07:01 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210406141819.1025864-1-dqfext@gmail.com> <20210406141819.1025864-2-dqfext@gmail.com>
 <CAAOTY_8snSTcguhyB9PJBWydqNaWZL3V4zXiYULVp5n48fN24w@mail.gmail.com> <CALW65jbbQSFbgjsMkKCyFWnbkLOenM_+2q6K7BQG5bc4-R0CpA@mail.gmail.com>
In-Reply-To: <CALW65jbbQSFbgjsMkKCyFWnbkLOenM_+2q6K7BQG5bc4-R0CpA@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 7 Apr 2021 00:06:50 +0800
X-Gmail-Original-Message-ID: <CAAOTY__4CdGjD-66jJcQVCuzSWOUe7gLxrZ4GAfBAuaOcvX8wA@mail.gmail.com>
Message-ID: <CAAOTY__4CdGjD-66jJcQVCuzSWOUe7gLxrZ4GAfBAuaOcvX8wA@mail.gmail.com>
Subject: Re: [RFC net-next 1/4] net: phy: add MediaTek PHY driver
To: DENG Qingfang <dqfext@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, 
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

DENG Qingfang <dqfext@gmail.com> =E6=96=BC 2021=E5=B9=B44=E6=9C=886=E6=97=
=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8811:57=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, Apr 6, 2021 at 11:47 PM Chun-Kuang Hu <chunkuang.hu@kernel.org> w=
rote:
> >
> > Hi, Qingfang:
> >
> > DENG Qingfang <dqfext@gmail.com> =E6=96=BC 2021=E5=B9=B44=E6=9C=886=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8810:19=E5=AF=AB=E9=81=93=EF=BC=
=9A
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
> So "MEDIATEK_MT7530_PHY" should be okay?

This is ok, but this name looks only for one SoC.
MEDIATEK_ETHERNET_PHY could support more SoC, how do you think?

Regards,
Chun-Kuang.

>
> >
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/drivers/phy/mediatek?h=3Dv5.12-rc6
> >
> > Regards,
> > Chun-Kuang.
