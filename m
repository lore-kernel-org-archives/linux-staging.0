Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FA1A34
	for <linux-staging@lists.linux.dev>; Sat,  9 Apr 2022 16:32:28 +0000 (UTC)
Received: from ipservice-092-217-091-111.092.217.pools.vodafone-ip.de ([92.217.91.111] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1ndE0f-0006Rg-Oy; Sat, 09 Apr 2022 18:32:25 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 09/10] staging: r8188eu: improve timeout handling in efuse_read_phymap_from_txpktbuf
Date: Sat,  9 Apr 2022 18:32:11 +0200
Message-Id: <20220409163212.241122-10-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220409163212.241122-1-martin@kaiser.cx>
References: <20220409163212.241122-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the standard kernel functions to define and check the timeout in
efuse_read_phymap_from_txpktbuf.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index efdadfb61905..e17375a74f17 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -186,8 +186,8 @@ static void efuse_read_phymap_from_txpktbuf(
 	u16 *size	/* for efuse content: the max byte to read. will update to byte read */
 	)
 {
+	unsigned long timeout;
 	u16 dbg_addr = 0;
-	u32 start  = 0, passing_time = 0;
 	__le32 lo32 = 0, hi32 = 0;
 	u16 len = 0, count = 0;
 	int i = 0;
@@ -206,9 +206,8 @@ static void efuse_read_phymap_from_txpktbuf(
 		rtw_write16(adapter, REG_PKTBUF_DBG_ADDR, dbg_addr + i);
 
 		rtw_write8(adapter, REG_TXPKTBUF_DBG, 0);
-		start = jiffies;
-		while (!rtw_read8(adapter, REG_TXPKTBUF_DBG) &&
-		       (passing_time = rtw_get_passing_time_ms(start)) < 1000)
+		timeout = jiffies + msecs_to_jiffies(1000);
+		while (!rtw_read8(adapter, REG_TXPKTBUF_DBG) && time_before(jiffies, timeout))
 			rtw_usleep_os(100);
 
 		/* data from EEPROM needs to be in LE */
-- 
2.30.2

