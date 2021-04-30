Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4B52F80
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 12:45:01 +0000 (UTC)
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
	(envelope-from <andrew@lunn.ch>)
	id 1lcSVn-001oQa-KO; Fri, 30 Apr 2021 14:44:51 +0200
Date: Fri, 30 Apr 2021 14:44:51 +0200
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
Subject: Re: Re: [PATCH net-next 0/4] MT7530 interrupt support
Message-ID: <YIv7w8Wy81fmU5A+@lunn.ch>
References: <20210429062130.29403-1-dqfext@gmail.com>
 <20210429.170815.956010543291313915.davem@davemloft.net>
 <20210430023839.246447-1-dqfext@gmail.com>
 <YIv28APpOP9tnuO+@lunn.ch>
 <trinity-843c99ce-952a-434e-95e4-4ece3ba6b9bd-1619786236765@3c-app-gmx-bap03>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <trinity-843c99ce-952a-434e-95e4-4ece3ba6b9bd-1619786236765@3c-app-gmx-bap03>

On Fri, Apr 30, 2021 at 02:37:16PM +0200, Frank Wunderlich wrote:
> Hi,
> 
> i prepare rename of musb-driver to musb_mtk.ko as this is also not the best name.
> 
> if this module does only handle mt753x i would suggest
> 
> phy_mt753x.{c,ko}

Hi Frank

That name will cause confusion with generic PHY drivers. They all seem
to use phy- as a file name prefix. At the moment, no Ethernet PHY
driver has phy as filename prefix or suffix.

       Andrew
