Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FF66D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 15:03:11 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
	by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.86_2)
	(envelope-from <colin.king@canonical.com>)
	id 1lU9i0-0005iz-Vf; Wed, 07 Apr 2021 15:03:09 +0000
From: Colin King <colin.king@canonical.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8192u: Fix potential infinite loop
Date: Wed,  7 Apr 2021 16:03:08 +0100
Message-Id: <20210407150308.496623-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Colin Ian King <colin.king@canonical.com>

The for-loop iterates with a u8 loop counter i and compares this
with the loop upper limit of riv->ieee80211->LinkDetectInfo.SlotNum
that is a u16 type. There is a potential infinite loop if SlotNum
is larger than the u8 loop counter. Fix this by making the loop
counter the same type as SlotNum.

Addresses-Coverity: ("Infinite loop")
Fixes: 8fc8598e61f6 ("Staging: Added Realtek rtl8192u driver to staging")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8192u/r8192U_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
index 9fc4adc83d77..b5a313649f44 100644
--- a/drivers/staging/rtl8192u/r8192U_core.c
+++ b/drivers/staging/rtl8192u/r8192U_core.c
@@ -3210,7 +3210,7 @@ static void rtl819x_update_rxcounts(struct r8192_priv *priv, u32 *TotalRxBcnNum,
 			     u32 *TotalRxDataNum)
 {
 	u16			SlotIndex;
-	u8			i;
+	u16			i;
 
 	*TotalRxBcnNum = 0;
 	*TotalRxDataNum = 0;
-- 
2.30.2

