Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3383FE1
	for <linux-staging@lists.linux.dev>; Thu,  9 Sep 2021 11:44:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 530AF6127C;
	Thu,  9 Sep 2021 11:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631187847;
	bh=4F/FtUHaVA8ntObtQdHZamsH2x118d5OxzvWksJvNb0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rsKhzW22YxAzO8zupYh3C5b/FrImsLCW+HDMrm4lDsnKP7j/Z4MfRg84Rkr3lfiSZ
	 Nhjj8aQhswRp1VLu4Lfn+0ar0jwkTBTQNjcBDIbvZl0+JrP/28BxeAdVJVuV9j+AUh
	 +rfYka/IzufZU3OK0wdYbCxzey+7wZHZnbAscaisP2foQI7yJ8QG2EjNAwgV3isWuD
	 PEJRqEMWMDfDlrLssAULxSOBsReC7GaxVg/qlIWnldhdPp9JbBzs8793ONettuWV/P
	 p2+t5C/jLhNWPm4rP78ZrMb4ltn9eQ9qksIEc4r/cKhehexz09SBRMC69/3OmxLZ/j
	 ccnvgygpwobRw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Fabio Aiuto <fabioaiuto83@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH AUTOSEL 5.14 139/252] staging: rtl8723bs: fix right side of condition
Date: Thu,  9 Sep 2021 07:39:13 -0400
Message-Id: <20210909114106.141462-139-sashal@kernel.org>
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
index bb7941aee0c4..fcf31f6d4b36 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -463,7 +463,7 @@ static void PHY_StoreTxPowerByRateNew(
 	if (RfPath > ODM_RF_PATH_D)
 		return;
 
-	if (TxNum > ODM_RF_PATH_D)
+	if (TxNum > RF_MAX_TX_NUM)
 		return;
 
 	for (i = 0; i < rateNum; ++i) {
-- 
2.30.2

