Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F366D0E
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 15:34:31 +0000 (UTC)
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
	(envelope-from <andrew@lunn.ch>)
	id 1lTnW7-00F8gN-Pt; Tue, 06 Apr 2021 17:21:23 +0200
Date: Tue, 6 Apr 2021 17:21:23 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: DENG Qingfang <dqfext@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Sean Wang <sean.wang@mediatek.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
	netdev@vger.kernel.org, Weijie Gao <weijie.gao@mediatek.com>,
	Chuanhong Guo <gch981213@gmail.com>,
	=?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>
Subject: Re: [RFC net-next 1/4] net: phy: add MediaTek PHY driver
Message-ID: <YGx8c5Jt2D7fB0cO@lunn.ch>
References: <20210406141819.1025864-1-dqfext@gmail.com>
 <20210406141819.1025864-2-dqfext@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210406141819.1025864-2-dqfext@gmail.com>

On Tue, Apr 06, 2021 at 10:18:16PM +0800, DENG Qingfang wrote:
> Add support for MediaTek PHYs found in MT7530 and MT7531 switches.

Do you know if this PHY is available standalone?

> +static int mt7531_phy_config_init(struct phy_device *phydev)
> +{
> +	mtk_phy_config_init(phydev);
> +
> +	/* PHY link down power saving enable */
> +	phy_set_bits(phydev, 0x17, BIT(4));
> +	phy_clear_bits_mmd(phydev, MDIO_MMD_VEND1, 0xc6, 0x300);
> +
> +	/* Set TX Pair delay selection */
> +	phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x13, 0x404);
> +	phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x14, 0x404);

This gets me worried about RGMII delays. We have had bad backwards
compatibility problems with PHY drivers which get RGMII delays wrong.

Since this is an internal PHY, i suggest you add a test to the
beginning of mt7531_phy_config_init():

	if (phydev->interface != PHY_INTERFACE_MODE_INTERNAL)
		return -EINVAL;

We can then solve RGMII problems when somebody actually needs RGMII.

   Andrew
