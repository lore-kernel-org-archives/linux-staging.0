Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC81F70
	for <linux-staging@lists.linux.dev>; Thu, 20 May 2021 20:10:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5B3B66128A;
	Thu, 20 May 2021 20:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1621541410;
	bh=WaCgMvfXBR2gKyUZwzBouYnqALdTwOxZMFC0C16Yfqo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=r0GmfvCV5y8lZ1sXAGwxJgaOTV/M4QhbiaiKN+TtKmof1O7GuR4saIdXK9oMsDOUT
	 h4bnvm5ioDd9Ba9CzavQtpGqFApB79cCbYez0aijCSlJw12MtPWPF9xc3dwCn51o+M
	 GlLOc6KxBkz3LQ9vfzP0tzI/T/9oFOYePrhKkSSz9/ahMZUI+mQHY1CSOf/dpX6Sq6
	 KhLRnNVmb1lQXOzb8fJegJIXpRnHJhTPe5yO+OxhMxcsbEdNlKFp77AiBP2OH2bt6o
	 PmRjGvtWhQ0bA+u+KXT58eE20yjF2tcCKHK5yisYhyrtltoug4ktSzG2LfalvngXZ5
	 vX67EJIavZ63A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4B90D60283;
	Thu, 20 May 2021 20:10:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/4] MT7530 interrupt support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <162154141030.20508.8664926088973694353.git-patchwork-notify@kernel.org>
Date: Thu, 20 May 2021 20:10:10 +0000
References: <20210519033202.3245667-1-dqfext@gmail.com>
In-Reply-To: <20210519033202.3245667-1-dqfext@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: davem@davemloft.net, andrew@lunn.ch, f.fainelli@gmail.com,
 hkallweit1@gmail.com, kuba@kernel.org, Landen.Chao@mediatek.com,
 matthias.bgg@gmail.com, linux@armlinux.org.uk, sean.wang@mediatek.com,
 vivien.didelot@gmail.com, olteanv@gmail.com, robh+dt@kernel.org,
 linus.walleij@linaro.org, gregkh@linuxfoundation.org,
 sergio.paracuellos@gmail.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-staging@lists.linux.dev,
 devicetree@vger.kernel.org, netdev@vger.kernel.org, weijie.gao@mediatek.com,
 gch981213@gmail.com, opensource@vdorst.com, frank-w@public-files.de,
 tglx@linutronix.de, maz@kernel.org

Hello:

This series was applied to netdev/net-next.git (refs/heads/master):

On Wed, 19 May 2021 11:31:58 +0800 you wrote:
> Add support for MT7530 interrupt controller.
> 
> DENG Qingfang (4):
>   net: phy: add MediaTek Gigabit Ethernet PHY driver
>   net: dsa: mt7530: add interrupt support
>   dt-bindings: net: dsa: add MT7530 interrupt controller binding
>   staging: mt7621-dts: enable MT7530 interrupt controller
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/4] net: phy: add MediaTek Gigabit Ethernet PHY driver
    https://git.kernel.org/netdev/net-next/c/e40d2cca0189
  - [net-next,v2,2/4] net: dsa: mt7530: add interrupt support
    https://git.kernel.org/netdev/net-next/c/ba751e28d442
  - [net-next,v2,3/4] dt-bindings: net: dsa: add MT7530 interrupt controller binding
    https://git.kernel.org/netdev/net-next/c/4006f986c091
  - [net-next,v2,4/4] staging: mt7621-dts: enable MT7530 interrupt controller
    https://git.kernel.org/netdev/net-next/c/f494f0935ffb

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


