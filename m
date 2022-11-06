Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571382593
	for <linux-staging@lists.linux.dev>; Sun,  6 Nov 2022 12:49:20 +0000 (UTC)
Received: from ipservice-092-217-068-220.092.217.pools.vodafone-ip.de ([92.217.68.220] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1orf5L-0008Dj-A1; Sun, 06 Nov 2022 13:49:11 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 4/9] staging: r8188eu: reformat a function header
Date: Sun,  6 Nov 2022 13:48:56 +0100
Message-Id: <20221106124901.720785-5-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221106124901.720785-1-martin@kaiser.cx>
References: <20221106124901.720785-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The definition of Hal_EfuseParseIDCode88E can be a single line.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index cc29963f4b49..73855bca76fe 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -676,11 +676,7 @@ s32 InitLLTTable(struct adapter *padapter, u8 txpktbuf_bndy)
 	return status;
 }
 
-void
-Hal_EfuseParseIDCode88E(
-		struct adapter *padapter,
-		u8 *hwinfo
-	)
+void Hal_EfuseParseIDCode88E(struct adapter *padapter, u8 *hwinfo)
 {
 	struct eeprom_priv *pEEPROM = &padapter->eeprompriv;
 	struct net_device *netdev = padapter->pnetdev;
-- 
2.30.2

