Received: from mail.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9F62F80
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 00:14:31 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
	by mail.monkeyblade.net (Postfix) with ESMTPSA id C84A44F4130CC;
	Thu, 29 Apr 2021 17:08:19 -0700 (PDT)
Date: Thu, 29 Apr 2021 17:08:15 -0700 (PDT)
Message-Id: <20210429.170815.956010543291313915.davem@davemloft.net>
To: dqfext@gmail.com
Cc: andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com,
 kuba@kernel.org, Landen.Chao@mediatek.com, matthias.bgg@gmail.com,
 linux@armlinux.org.uk, sean.wang@mediatek.com, vivien.didelot@gmail.com,
 olteanv@gmail.com, robh+dt@kernel.org, linus.walleij@linaro.org,
 gregkh@linuxfoundation.org, sergio.paracuellos@gmail.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, weijie.gao@mediatek.com, gch981213@gmail.com,
 opensource@vdorst.com, frank-w@public-files.de, tglx@linutronix.de,
 maz@kernel.org
Subject: Re: [PATCH net-next 0/4] MT7530 interrupt support
From: David Miller <davem@davemloft.net>
In-Reply-To: <20210429062130.29403-1-dqfext@gmail.com>
References: <20210429062130.29403-1-dqfext@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 27.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2 (mail.monkeyblade.net [0.0.0.0]); Thu, 29 Apr 2021 17:08:20 -0700 (PDT)


Please fix this:

error: the following would cause module name conflict:
  drivers/net/phy/mediatek.ko
  drivers/usb/musb/mediatek.ko


Thanks.
