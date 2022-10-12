Received: from h7.fbrelay.privateemail.com (h7.fbrelay.privateemail.com [162.0.218.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50431321E
	for <linux-staging@lists.linux.dev>; Wed, 12 Oct 2022 21:24:46 +0000 (UTC)
Received: from MTA-07-4.privateemail.com (mta-07.privateemail.com [198.54.127.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by h7.fbrelay.privateemail.com (Postfix) with ESMTPS id 9B26760569
	for <linux-staging@lists.linux.dev>; Wed, 12 Oct 2022 21:16:30 +0000 (UTC)
Received: from mta-07.privateemail.com (localhost [127.0.0.1])
	by mta-07.privateemail.com (Postfix) with ESMTP id A312B18000A3;
	Wed, 12 Oct 2022 17:16:22 -0400 (EDT)
Received: from fedora.. (93-55-228-234.ip265.fastwebnet.it [93.55.228.234])
	by mta-07.privateemail.com (Postfix) with ESMTPA id 15C1418000A1;
	Wed, 12 Oct 2022 17:16:16 -0400 (EDT)
From: Rigel Di Scala <zedr@zedr.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	rigeld@gmail.com,
	Rigel Di Scala <zedr@zedr.com>
Subject: [PATCH] Staging: rtl8192e: fix a brace style issue
Date: Wed, 12 Oct 2022 21:16:12 +0000
Message-Id: <20221012211612.75871-1-zedr@zedr.com>
X-Mailer: git-send-email 2.37.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

Fixed a coding style issue affecting a conditional if statement.

Signed-off-by: Rigel Di Scala <zedr@zedr.com>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 19d13b3fc..e932ad1a9 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -180,11 +180,10 @@ static void rtllib_send_ADDBAReq(struct rtllib_device *ieee, u8 *dst,
 
 	skb = rtllib_ADDBA(ieee, dst, pBA, 0, ACT_ADDBAREQ);
 
-	if (skb) {
+	if (skb)
 		softmac_mgmt_xmit(skb, ieee);
-	} else {
+	else
 		netdev_dbg(ieee->dev, "Failed to generate ADDBAReq packet.\n");
-	}
 }
 
 static void rtllib_send_ADDBARsp(struct rtllib_device *ieee, u8 *dst,
-- 
2.37.3

