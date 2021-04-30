Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E56972
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 12:24:26 +0000 (UTC)
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
	(envelope-from <andrew@lunn.ch>)
	id 1lcSBs-001oHb-52; Fri, 30 Apr 2021 14:24:16 +0200
Date: Fri, 30 Apr 2021 14:24:16 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: DENG Qingfang <dqfext@gmail.com>
Cc: David Miller <davem@davemloft.net>, f.fainelli@gmail.com,
	hkallweit1@gmail.com, kuba@kernel.org, Landen.Chao@mediatek.com,
	matthias.bgg@gmail.com, linux@armlinux.org.uk,
	sean.wang@mediatek.com, vivien.didelot@gmail.com, olteanv@gmail.com,
	robh+dt@kernel.org, linus.walleij@linaro.org,
	gregkh@linuxfoundation.org, sergio.paracuellos@gmail.com,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
	netdev@vger.kernel.org, weijie.gao@mediatek.com,
	gch981213@gmail.com, opensource@vdorst.com, frank-w@public-files.de,
	tglx@linutronix.de, maz@kernel.org
Subject: Re: [PATCH net-next 0/4] MT7530 interrupt support
Message-ID: <YIv28APpOP9tnuO+@lunn.ch>
References: <20210429062130.29403-1-dqfext@gmail.com>
 <20210429.170815.956010543291313915.davem@davemloft.net>
 <20210430023839.246447-1-dqfext@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210430023839.246447-1-dqfext@gmail.com>

On Fri, Apr 30, 2021 at 10:38:39AM +0800, DENG Qingfang wrote:
> On Thu, Apr 29, 2021 at 05:08:15PM -0700, David Miller wrote:
> > 
> > Please fix this:
> > 
> > error: the following would cause module name conflict:
> >   drivers/net/phy/mediatek.ko
> >   drivers/usb/musb/mediatek.ko
> 
> So I still have to rename the PHY driver..
> Andrew, what is your suggestion? Is mediatek_phy.c okay?

mediatek_phy.c gets you into trouble with the generic PHY drivers.
Most Ethernet PHY drivers have the model number in the file name. Does
the PHY have its own name/numbering, or is it always considered part
of the switch?  If the PHY has an identity of its own, use
that. Otherwise maybe mediatek75xx.c?

      Andrew
