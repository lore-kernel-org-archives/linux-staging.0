Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7D43FE1
	for <linux-staging@lists.linux.dev>; Thu,  9 Sep 2021 11:42:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B4B561248;
	Thu,  9 Sep 2021 11:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631187772;
	bh=vZMjlN8+KlE6QllsSovulefHp3o4DnHg4Vgqw+JfgcI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KNHi8zJ6w80gJYAazskI23lvsSR18KeqjWtGRvOh7JAaHX81jM8wjHHJ9kOf3RnGF
	 1PiyJtaKxLRN2zOh25kEM4tp0Ro6RWTtLMYpd3TUFWFS2AKMFG6/VmX+JkR6gdly1Z
	 +8o3SYepuhIfOsa10eweMKPPmXC9pTjvGbiL+N4kUu0qFRvx5l7VNc4DCbPaRoeFsM
	 xe/utRWdsGz6JIZoKFQdAdKbNXNGskd40MPMHvhObatjV9vkCZqzOJyDHhuRCTcxS3
	 pc24WnL+T1rzBgv2VohZJlruyvbCUIU5gsdd9GiyGc/VTSQ4/f/9DpwHeEmtAueJUM
	 SMZU5+bXvJguw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH AUTOSEL 5.14 083/252] staging: ks7010: Fix the initialization of the 'sleep_status' structure
Date: Thu,  9 Sep 2021 07:38:17 -0400
Message-Id: <20210909114106.141462-83-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909114106.141462-1-sashal@kernel.org>
References: <20210909114106.141462-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

[ Upstream commit 56315e55119c0ea57e142b6efb7c31208628ad86 ]

'sleep_status' has 3 atomic_t members. Initialize the 3 of them instead of
initializing only 2 of them and setting 0 twice to the same variable.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Link: https://lore.kernel.org/r/d2e52a33a9beab41879551d0ae2fdfc99970adab.1626856991.git.christophe.jaillet@wanadoo.fr
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/ks7010/ks7010_sdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/ks7010/ks7010_sdio.c b/drivers/staging/ks7010/ks7010_sdio.c
index cbc0032c1604..98d759e7cc95 100644
--- a/drivers/staging/ks7010/ks7010_sdio.c
+++ b/drivers/staging/ks7010/ks7010_sdio.c
@@ -939,9 +939,9 @@ static void ks7010_private_init(struct ks_wlan_private *priv,
 	memset(&priv->wstats, 0, sizeof(priv->wstats));
 
 	/* sleep mode */
+	atomic_set(&priv->sleepstatus.status, 0);
 	atomic_set(&priv->sleepstatus.doze_request, 0);
 	atomic_set(&priv->sleepstatus.wakeup_request, 0);
-	atomic_set(&priv->sleepstatus.wakeup_request, 0);
 
 	trx_device_init(priv);
 	hostif_init(priv);
-- 
2.30.2

