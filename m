Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F72F2916
	for <linux-staging@lists.linux.dev>; Sun,  8 Jan 2023 18:58:03 +0000 (UTC)
Received: from dslb-188-096-147-053.188.096.pools.vodafone-ip.de ([188.96.147.53] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pEarm-0003b8-GV; Sun, 08 Jan 2023 19:57:58 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 10/13] staging: r8188eu: remove unused QSLT defines
Date: Sun,  8 Jan 2023 19:57:35 +0100
Message-Id: <20230108185738.597105-11-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230108185738.597105-1-martin@kaiser.cx>
References: <20230108185738.597105-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused defines for Queue Select Value in TxDesc.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/rtl8188e_xmit.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtl8188e_xmit.h b/drivers/staging/r8188eu/include/rtl8188e_xmit.h
index 230ea191d256..e6d343ffc148 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_xmit.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_xmit.h
@@ -5,17 +5,7 @@
 #define __RTL8188E_XMIT_H__
 
 #define		MAX_TX_AGG_PACKET_NUMBER	0xFF
-/*  */
-/*  Queue Select Value in TxDesc */
-/*  */
-#define QSLT_BK							0x2/* 0x01 */
-#define QSLT_BE							0x0
-#define QSLT_VI							0x5/* 0x4 */
-#define QSLT_VO							0x7/* 0x6 */
-#define QSLT_BEACON						0x10
-#define QSLT_HIGH						0x11
 #define QSLT_MGNT						0x12
-#define QSLT_CMD						0x13
 
 /* For 88e early mode */
 #define SET_EARLYMODE_PKTNUM(__paddr, __value)			\
-- 
2.30.2

