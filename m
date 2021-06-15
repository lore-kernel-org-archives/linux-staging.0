Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CB770
	for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 15:49:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6BD2A616ED;
	Tue, 15 Jun 2021 15:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623772196;
	bh=TLQXXMRgCJYZjDlvNmaC2ZBnYfPNzA9DrlkZNPcYHKo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T6XxSL5/2Z3vJmE8UabnFyDm+oR9+I8sBp6vo8G+0Fw4pKSnEtKbsbKGaCdZbCVzV
	 C8L7t2w+TH4LkcpyvJx2I2X3zPCiMzwfwUTXt+Y1dtWN1fmO6tf3qmOxkiXTcUW8Y1
	 B/OHQzGHX4CsDSh6yRDkrRa2ztwC1YKjFg+ZMlUpVs6aUPM7j1J0vpG2j3t6TAdB1m
	 2HKcrfCXraerUj0oLHejBTRZhAJ4oCTeVz4gyRUjcRwznACeDtC9KJAFo/BroBXuG5
	 TfaUwxD49zJUjgahoq00KpUgNZQCXVk8N3LWtq6wlOOw3A270/DwVPjXGEL2/MDK0D
	 xD44NB1L9B3cA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.4 06/15] pinctrl: ralink: rt2880: avoid to error in calls is pin is already enabled
Date: Tue, 15 Jun 2021 11:49:38 -0400
Message-Id: <20210615154948.62711-6-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210615154948.62711-1-sashal@kernel.org>
References: <20210615154948.62711-1-sashal@kernel.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Sergio Paracuellos <sergio.paracuellos@gmail.com>

[ Upstream commit eb367d875f94a228c17c8538e3f2efcf2eb07ead ]

In 'rt2880_pmx_group_enable' driver is printing an error and returning
-EBUSY if a pin has been already enabled. This begets anoying messages
in the caller when this happens like the following:

rt2880-pinmux pinctrl: pcie is already enabled
mt7621-pci 1e140000.pcie: Error applying setting, reverse things back

To avoid this just print the already enabled message in the pinctrl
driver and return 0 instead to not confuse the user with a real
bad problem.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Link: https://lore.kernel.org/r/20210604055337.20407-1-sergio.paracuellos@gmail.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c b/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c
index d0f06790d38f..0ba4e4e070a9 100644
--- a/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c
+++ b/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c
@@ -127,7 +127,7 @@ static int rt2880_pmx_group_enable(struct pinctrl_dev *pctrldev,
 	if (p->groups[group].enabled) {
 		dev_err(p->dev, "%s is already enabled\n",
 			p->groups[group].name);
-		return -EBUSY;
+		return 0;
 	}
 
 	p->groups[group].enabled = 1;
-- 
2.30.2

