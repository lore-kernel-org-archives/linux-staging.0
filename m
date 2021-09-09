Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1895F3FE1
	for <linux-staging@lists.linux.dev>; Thu,  9 Sep 2021 11:49:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2F3EB61A62;
	Thu,  9 Sep 2021 11:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631188153;
	bh=CtX/yPRZcRIVIBZ1kDR812ScIe02+qvh++rMn6IRlyc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FegP1XOOJdekaDIhATlPRxl+l8fNU+zOeYlvRNsup3RqFN8YCrjmXhAoOISkdJRnI
	 F09GGJt1g/jU9Gw8jqzDt1YJwDbM+mlDTXQpKBR32LDcZ+K7cvn4dvGGyonjxf1yt2
	 pzigpnhQIvIhX5RgO6hoZgKd+DzNiBevgeaFR8Bzst4+c/R36e79EE2Lxnom/0Eo02
	 rK+dcoJkV0A6n3Dl9VbwlR/p1cqln0+OtgVyCtrbHtxC8BBua8kI2UslFCohqVxct2
	 TX/eDNIava6BWN/IHEqkp2MgfkkwUQdnOyPrsl+j1HBNS+afbWS/fSzsV0JuST06cj
	 YufzQNAHJnQ6A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Fabio Aiuto <fabioaiuto83@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH AUTOSEL 5.13 122/219] staging: rtl8723bs: fix right side of condition
Date: Thu,  9 Sep 2021 07:44:58 -0400
Message-Id: <20210909114635.143983-122-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909114635.143983-1-sashal@kernel.org>
References: <20210909114635.143983-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Fabio Aiuto <fabioaiuto83@gmail.com>

[ Upstream commit e3678dc1ea40425b7218c20e2fe7b00a72f23a41 ]

TxNum value is compared against ODM_RF_PATH_D,
which is inconsistent. Compare it against
RF_MAX_TX_NUM, as in other places in the same file.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
Link: https://lore.kernel.org/r/147631fe6f4f5de84cc54a62ba71d739b92697be.1628329348.git.fabioaiuto83@gmail.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index 94d11689b4ac..33ff80da3277 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -707,7 +707,7 @@ static void PHY_StoreTxPowerByRateNew(
 	if (RfPath > ODM_RF_PATH_D)
 		return;
 
-	if (TxNum > ODM_RF_PATH_D)
+	if (TxNum > RF_MAX_TX_NUM)
 		return;
 
 	for (i = 0; i < rateNum; ++i) {
-- 
2.30.2

