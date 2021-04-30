Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5562F80
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 12:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1619786236;
	bh=aWA0qZW6OIJpsght0sPtlyAsUnhdMUN05yqm1M8XjsQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=g13+7uC+M2sTr28mFWdno+u9YNLBBvuAxHyhLqURCyV631eiTuzCxC50heLLwvlmZ
	 pgUKvHQYRW6d8nmkZ3OfmJNEm5syhOy4tUDmbTuP7Ldbo02DgRB4dbP0GuR4qx06ou
	 XetKgIDOAEjC8VCEsDvnnNyPs3WISEjzrlHJMuvg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [157.180.225.50] ([157.180.225.50]) by web-mail.gmx.net
 (3c-app-gmx-bap03.server.lan [172.19.172.73]) (via HTTP); Fri, 30 Apr 2021
 14:37:16 +0200
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <trinity-843c99ce-952a-434e-95e4-4ece3ba6b9bd-1619786236765@3c-app-gmx-bap03>
From: Frank Wunderlich <frank-w@public-files.de>
To: Andrew Lunn <andrew@lunn.ch>
Cc: DENG Qingfang <dqfext@gmail.com>, David Miller <davem@davemloft.net>,
 f.fainelli@gmail.com, hkallweit1@gmail.com, kuba@kernel.org,
 Landen.Chao@mediatek.com, matthias.bgg@gmail.com, linux@armlinux.org.uk,
 sean.wang@mediatek.com, vivien.didelot@gmail.com, olteanv@gmail.com,
 robh+dt@kernel.org, linus.walleij@linaro.org, gregkh@linuxfoundation.org,
 sergio.paracuellos@gmail.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-staging@lists.linux.dev,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 weijie.gao@mediatek.com, gch981213@gmail.com, opensource@vdorst.com,
 tglx@linutronix.de, maz@kernel.org
Subject: Aw: Re: [PATCH net-next 0/4] MT7530 interrupt support
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Apr 2021 14:37:16 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <YIv28APpOP9tnuO+@lunn.ch>
References: <20210429062130.29403-1-dqfext@gmail.com>
 <20210429.170815.956010543291313915.davem@davemloft.net>
 <20210430023839.246447-1-dqfext@gmail.com> <YIv28APpOP9tnuO+@lunn.ch>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:ylYnjWFNykRWOKSx3UIDDPiFuY/keJ+N0BZCO5sR80bsR6BBg02Q7LKHjtxineS3ctVz8
 sKaSAYh8o0agfbR2GR5smR5BnugCP1hWi/3SsM3xO/F1/R+7J/y6IP1o4QgzsineKPNdp0LU+TX4
 jJQ9bqN1WylsDcDM7n63ojCcDg0IRCUOy62U1wsSaHKK7OrTS+bs77EVP30nb68bPCRdIEzuQ1un
 KQZ4kyxNx2g15X3fGyAhb2XEIUXdpOrJQrQHTR+CCGpZ17u4HJL+b9P12g0coHlVgizLCzZAUZy4
 w4=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zbwz7g5Ns4I=:rTQz1sgb1ya6Byjhnt47jG
 TDzlj/YX2nWyScSkr4eWxd0MAAevy3Zk2kWZhtyInMwNXQOY53v6Trz1pK7GmjEhMfbcS0gf4
 PV28WlwT6EdY1LS/2W4fJ7YVdvMpLKLH8dzPv2hFnfKzKjCydHLzBEQaO9QujQNuTi4KL6NuN
 Bb6zbFxR4mEzehanDp5ErAh+SxaCcsC/I9avKkSTiemAgYoC1ZUmKl+p1NqAa9I2oFoeZkJxV
 gUhg9tecgwq3Lc/Yh69hQt5CtugbbC34BVwyIw0klB2tAaWi4GqeIEy5K9OkrLLa1fcWZ5ru1
 9i51QvmVQ2oBBgGNiXqPz0yb1ybve10MGpTQOgAVSU+KcMjv2jyOJevrMrzHU5zgS+PTcJXuz
 yZC12UqX0mjetuotnLhUboWGfnUW0eoBvssVJUNgKBA56802cLwBjM/24wM8TWwCKg/8Zde+U
 RMj99LAGYCTE12lX7y4nCE/F7tHCKghnQTqIEdvKVloDIJybWwnRiZJbUpJC7BbWRQJLQZVJY
 YtUCtg1asMEptdUwjFtxQL7bZk/88dJSetCX+5TxQuLOkmYzLDMz2Ynvwfd5BoTJUwyQ/uoiT
 U/N1Bv/wjCZJJFysR7/eW+a3FKUiVoB5wZedu5+DsDD3iGJePZ41IQNqfXuQ4gcjbDTJx/pdW
 ych1QqWvel1+yRuWjEPRjRpymj4/Oh2owYa+WnTWh2rAlEiHvcLb2nA7LaRWKcHOUWfYQMIZI
 vQHG7uSHKKTz1OiHCBs09Go7K23U9AxMaviVaky/MANc7PJn9UAa1WH8QUhEAl3N+n2lwUiFP
 pBMCYv78cII6ke6dm5phsO0gNZIqkigcAmP13jOiE+zsr5GOdV4p+UhV0n3karEKIwhmzb+F/
 dzcqdyvdwSYweBTXanMAe0Yo/r06mjZspbOftVuxWZVk/VqBZgd3rZcjpX1nGC7HA7Y05/Y2Z
 sFe6Otyc0hQ==

Hi,

i prepare rename of musb-driver to musb_mtk.ko as this is also not the best name.

if this module does only handle mt753x i would suggest

phy_mt753x.{c,ko}

regards Frank


> Gesendet: Freitag, 30. April 2021 um 14:24 Uhr
> Von: "Andrew Lunn" <andrew@lunn.ch>

> mediatek_phy.c gets you into trouble with the generic PHY drivers.
> Most Ethernet PHY drivers have the model number in the file name. Does
> the PHY have its own name/numbering, or is it always considered part
> of the switch?  If the PHY has an identity of its own, use
> that. Otherwise maybe mediatek75xx.c?

