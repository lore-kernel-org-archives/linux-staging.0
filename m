Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40D171
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 13:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	 bh=foqwV3LZUmXDdTNvR/fFhNELYb8TFDLpg4frq5Uu1wk=; b=Xz7TLVrDwoJr2Cf66bWhzW9QF
	WHeOD48tHgtmtJk98kZpCQKsC+wsS/ghnnNOG2pqGpJDSVT+X7IE2lW9nkVYitr5RvEn/YC9lAcSF
	3fkkNFcK+/1/ejCVlMPSv6NwXApaRWKB7/tcQAYK5nr08To45hIbHKQ6eTRDPAlgnh+wsGnRonNJc
	DpkEELgHFLqgQLZZIzDLi0C+ouDYh7wie83lmDRV+BSbkWNWYQWXEjRKUSSK2zGkWCxAUDVLFQ8QA
	3TQBXvDShIj0lAs2MrLgQOb92QuASnVXgR4SiZ1/4wK0Y/SmlAV9yrw45LVpcgL37easz1L2K5d6P
	trRRwq7dw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52380)
	by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <linux@armlinux.org.uk>)
	id 1lWIqn-0005fZ-L0; Tue, 13 Apr 2021 14:13:05 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1lWIqh-0008DM-Rt; Tue, 13 Apr 2021 14:12:59 +0100
Date: Tue, 13 Apr 2021 14:12:59 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: DENG Qingfang <dqfext@gmail.com>
Cc: =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
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
	Frank Wunderlich <frank-w@public-files.de>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Subject: Re: [RFC v4 net-next 1/4] net: phy: add MediaTek PHY driver
Message-ID: <20210413131259.GP1463@shell.armlinux.org.uk>
References: <20210412034237.2473017-1-dqfext@gmail.com>
 <20210412034237.2473017-2-dqfext@gmail.com>
 <20210412070449.Horde.wg9CWXW8V9o0P-heKYtQpVh@www.vdorst.com>
 <20210412150836.929610-1-dqfext@gmail.com>
 <20210413035920.1422364-1-dqfext@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210413035920.1422364-1-dqfext@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: Russell King - ARM Linux admin <linux@armlinux.org.uk>

On Tue, Apr 13, 2021 at 11:59:20AM +0800, DENG Qingfang wrote:
> Within 12 hours, I got some spontaneous link down/ups when EEE is enabled:
> 
> [16334.236233] mt7530 mdio-bus:1f wan: Link is Down
> [16334.241340] br-lan: port 3(wan) entered disabled state
> [16337.355988] mt7530 mdio-bus:1f wan: Link is Up - 1Gbps/Full - flow control rx/tx
> [16337.363468] br-lan: port 3(wan) entered blocking state
> [16337.368638] br-lan: port 3(wan) entered forwarding state
> 
> The cable is a 30m Cat.6 and never has such issue when EEE is disabled.
> Perhaps WAKEUP_TIME_1000/100 or some PHY registers need to be fine-tuned,
> but for now I think it should be disabled by default.

Experience with Atheros AR8035 which has a very similar issue would
suggest that before resorting to the blunt hammer of disabling
SmartEEE, one should definitely experiment with the 1G Tw settings.

Using 24us for 1G speeds on AR8035 helps a great deal, whereas the PHY
defaults to 17us for 1G and 23us for 100M.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
