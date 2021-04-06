Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30B86D0E
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 15:49:17 +0000 (UTC)
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
	(envelope-from <andrew@lunn.ch>)
	id 1lTnx0-00F8vw-7I; Tue, 06 Apr 2021 17:49:10 +0200
Date: Tue, 6 Apr 2021 17:49:10 +0200
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
	linux-kernel@vger.kernel.org,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	linux-staging@lists.linux.dev,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	netdev <netdev@vger.kernel.org>,
	Weijie Gao <weijie.gao@mediatek.com>,
	Chuanhong Guo <gch981213@gmail.com>,
	=?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>
Subject: Re: [RFC net-next 2/4] net: dsa: mt7530: add interrupt support
Message-ID: <YGyC9liu9v+DFSHA@lunn.ch>
References: <20210406141819.1025864-1-dqfext@gmail.com>
 <20210406141819.1025864-3-dqfext@gmail.com>
 <YGx+nyYkSY3Xu0Za@lunn.ch>
 <CALW65jYhBGmz8dy+9C_YCpJU5wa-KAwgrGjCSpa3nqUNT+xU+g@mail.gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALW65jYhBGmz8dy+9C_YCpJU5wa-KAwgrGjCSpa3nqUNT+xU+g@mail.gmail.com>

On Tue, Apr 06, 2021 at 11:39:12PM +0800, DENG Qingfang wrote:
> On Tue, Apr 6, 2021 at 11:30 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > On Tue, Apr 06, 2021 at 10:18:17PM +0800, DENG Qingfang wrote:
> > > Add support for MT7530 interrupt controller to handle internal PHYs.
> >
> > Are the interrupts purely PHY interrupts? Or are there some switch
> > operation interrupts, which are currently not used?
> 
> There are other switch operations interrupts as well, such as VLAN
> member violation, switch ACL hit.

O.K. So that makes it similar to the mv88e6xxx. With that driver, i
kept interrupt setup and mdio setup separate. I add the interrupt
controller first, and then do mdio setup, calling a helper to map the
PHY interrupts and assign them to bus->irq[].

That gives you a cleaner structure when you start using the other
interrupts.

	Andrew
