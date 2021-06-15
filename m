Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD50B70
	for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 15:48:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C79326148E;
	Tue, 15 Jun 2021 15:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623772124;
	bh=ZZw7LqFGgfCHUlgt8fcTCe5QwulDRnNqcaBgTxopqcM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QJPrswyTO3uGrHW073/6TTaxPX+BupF9bRf7B1RGJJStqAufbdnLqdBuCIT2ehvSS
	 xglsfbTACvsRekL2ezI1kO+Rxz7ANF68zJou2YOWpEf0GEob2m32Pb19nYDrVVlCm8
	 Qbal3/kftsMEAL+yxJVdKkPYUI22oXiJ70oP9o10WD1uG9Zt/j3tc//aLHP5hnK3bQ
	 /n73WbS/p3W0zrpDDaXJeNEvOfIRcFlv76Liri/Jk3XIaltQax0A6arWJAKihPi4c4
	 Ph6iVTyg/121aqNLNQLWr/XeAkWALp/gLZaEPX/e/IgiEEBdZ8+eAvNWkd54rrNsal
	 J667TSr+nQY9g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Axel Lin <axel.lin@ingics.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH AUTOSEL 5.12 16/33] regulator: hi6421v600: Fix .vsel_mask setting
Date: Tue, 15 Jun 2021 11:48:07 -0400
Message-Id: <20210615154824.62044-16-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210615154824.62044-1-sashal@kernel.org>
References: <20210615154824.62044-1-sashal@kernel.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Axel Lin <axel.lin@ingics.com>

[ Upstream commit 50bec7fb4cb1bcf9d387046b6dec7186590791ec ]

Take ldo3_voltages as example, the ARRAY_SIZE(ldo3_voltages) is 16.
i.e. the valid selector is 0 ~ 0xF.
But in current code the vsel_mask is "(1 << 15) - 1", i.e. 0x7FFF. Fix it.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Link: https://lore.kernel.org/r/20210529013236.373847-1-axel.lin@ingics.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/hikey9xx/hi6421v600-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/hikey9xx/hi6421v600-regulator.c b/drivers/staging/hikey9xx/hi6421v600-regulator.c
index f6a14e9c3cbf..e10fe3058176 100644
--- a/drivers/staging/hikey9xx/hi6421v600-regulator.c
+++ b/drivers/staging/hikey9xx/hi6421v600-regulator.c
@@ -83,7 +83,7 @@ static const unsigned int ldo34_voltages[] = {
 			.owner		= THIS_MODULE,			       \
 			.volt_table	= vtable,			       \
 			.n_voltages	= ARRAY_SIZE(vtable),		       \
-			.vsel_mask	= (1 << (ARRAY_SIZE(vtable) - 1)) - 1, \
+			.vsel_mask	= ARRAY_SIZE(vtable) - 1,	       \
 			.vsel_reg	= vreg,				       \
 			.enable_reg	= ereg,				       \
 			.enable_mask	= emask,			       \
-- 
2.30.2

