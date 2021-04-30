Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847F771
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 16:34:54 +0000 (UTC)
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
	(envelope-from <andrew@lunn.ch>)
	id 1lcW6H-001pzm-9A; Fri, 30 Apr 2021 18:34:45 +0200
Date: Fri, 30 Apr 2021 18:34:45 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: DENG Qingfang <dqfext@gmail.com>, David Miller <davem@davemloft.net>,
	f.fainelli@gmail.com, hkallweit1@gmail.com, kuba@kernel.org,
	Landen.Chao@mediatek.com, matthias.bgg@gmail.com,
	linux@armlinux.org.uk, sean.wang@mediatek.com,
	vivien.didelot@gmail.com, olteanv@gmail.com, robh+dt@kernel.org,
	linus.walleij@linaro.org, gregkh@linuxfoundation.org,
	sergio.paracuellos@gmail.com, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org, netdev@vger.kernel.org,
	weijie.gao@mediatek.com, gch981213@gmail.com, opensource@vdorst.com,
	tglx@linutronix.de, maz@kernel.org
Subject: Re: Re: Re: Re: [PATCH net-next 0/4] MT7530 interrupt support
Message-ID: <YIwxpYD1jnFMPQz+@lunn.ch>
References: <20210429062130.29403-1-dqfext@gmail.com>
 <20210429.170815.956010543291313915.davem@davemloft.net>
 <20210430023839.246447-1-dqfext@gmail.com>
 <YIv28APpOP9tnuO+@lunn.ch>
 <trinity-843c99ce-952a-434e-95e4-4ece3ba6b9bd-1619786236765@3c-app-gmx-bap03>
 <YIv7w8Wy81fmU5A+@lunn.ch>
 <trinity-611ff023-c337-4148-a215-98fd5604eac2-1619787382934@3c-app-gmx-bap03>
 <YIwCliT5NZT713WD@lunn.ch>
 <trinity-c45bbeec-5b7c-43a2-8e86-7cb22ad61558-1619794787680@3c-app-gmx-bap03>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <trinity-c45bbeec-5b7c-43a2-8e86-7cb22ad61558-1619794787680@3c-app-gmx-bap03>

> mhm, maybe the naming should differ if generic phy and net-phy are
> that different. i guess there is no way to merge the net phys to the
> generic phys (due to linking to the net device drivers) to have only
> 1 phy section, right?

phys and generic PHYs are very different things, completely different
API etc. They cannot be merged.

> but if phy- prefix is used by generic phys, maybe eth- or net- can be used here (maybe with "phy" added)
> 
> something like
> 
> eth-phy-mt753x.ko
> 
> else i have no idea now...my patch renaming the musb-module seems not
> to be accepted due to possible breakage

The usb module has been around for a long time, so it cannot be
changed. The phy driver is new, not in a released kernel. So we can
still rename it without causing problems.

I still want to understand the naming here. If you look at most
Ethernet switches with integrated PHYs, the PHYs have their own naming
scheme, separate from the switch, because they are independent IP. So
i would prefer this driver by named after the PHY name, not the switch
name. That might solve the naming conflict, mt123x for the PHY, mt7530
for the switch driver.

	Andrew
