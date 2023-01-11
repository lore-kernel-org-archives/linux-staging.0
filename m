Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BED8A92A
	for <linux-staging@lists.linux.dev>; Wed, 11 Jan 2023 19:57:05 +0000 (UTC)
Received: from dslb-188-096-145-172.188.096.pools.vodafone-ip.de ([188.96.145.172] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pFhDZ-0005F2-0e; Wed, 11 Jan 2023 20:57:01 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 10/20] staging: r8188eu: remove struct reg_protocol_rd
Date: Wed, 11 Jan 2023 20:56:30 +0100
Message-Id: <20230111195640.306748-11-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230111195640.306748-1-martin@kaiser.cx>
References: <20230111195640.306748-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove struct reg_protocol_rd. It's not used in the r8188eu driver.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/rtw_io.h | 43 ------------------------
 1 file changed, 43 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_io.h b/drivers/staging/r8188eu/include/rtw_io.h
index 4800c8249721..858fd9cbb57a 100644
--- a/drivers/staging/r8188eu/include/rtw_io.h
+++ b/drivers/staging/r8188eu/include/rtw_io.h
@@ -102,49 +102,6 @@ struct	intf_hdl {
 	struct dvobj_priv *pintf_dev;
 };
 
-struct reg_protocol_rd {
-#ifdef __LITTLE_ENDIAN
-	/* DW1 */
-	u32		NumOfTrans:4;
-	u32		Reserved1:4;
-	u32		Reserved2:24;
-	/* DW2 */
-	u32		ByteCount:7;
-	u32		WriteEnable:1;		/* 0:read, 1:write */
-	u32		FixOrContinuous:1;	/* 0:continuous, 1: Fix */
-	u32		BurstMode:1;
-	u32		Byte1Access:1;
-	u32		Byte2Access:1;
-	u32		Byte4Access:1;
-	u32		Reserved3:3;
-	u32		Reserved4:16;
-	/* DW3 */
-	u32		BusAddress;
-	/* DW4 */
-	/* u32		Value; */
-#else
-/* DW1 */
-	u32 Reserved1:4;
-	u32 NumOfTrans:4;
-	u32 Reserved2:24;
-	/* DW2 */
-	u32 WriteEnable:1;
-	u32 ByteCount:7;
-	u32 Reserved3:3;
-	u32 Byte4Access:1;
-
-	u32 Byte2Access:1;
-	u32 Byte1Access:1;
-	u32 BurstMode:1;
-	u32 FixOrContinuous:1;
-	u32 Reserved4:16;
-	/* DW3 */
-	u32	BusAddress;
-
-	/* DW4 */
-#endif
-};
-
 struct reg_protocol_wt {
 #ifdef __LITTLE_ENDIAN
 	/* DW1 */
-- 
2.30.2

