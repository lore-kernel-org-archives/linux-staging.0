Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52612CA7
	for <linux-staging@lists.linux.dev>; Sun,  6 Feb 2022 16:18:28 +0000 (UTC)
Received: from ipservice-092-217-075-184.092.217.pools.vodafone-ip.de ([92.217.75.184] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nGkF7-0001bS-UP; Sun, 06 Feb 2022 17:18:26 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 11/14] staging: r8188eu: in_cta_test is always 0
Date: Sun,  6 Feb 2022 17:18:06 +0100
Message-Id: <20220206161809.423031-12-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220206161809.423031-1-martin@kaiser.cx>
References: <20220206161809.423031-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

in_cta_test in struct adapter is never set, so it's always 0.

Remove in_cta_test and related dead code.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/usb_halinit.c   | 16 ++--------------
 drivers/staging/r8188eu/include/drv_types.h |  2 --
 2 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 0c0b7e819518..03966a1e247e 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1111,13 +1111,7 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 			if ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE) {
 				rtw_write32(Adapter, REG_RCR, rtw_read32(Adapter, REG_RCR) | RCR_CBSSID_BCN);
 			} else {
-				if (Adapter->in_cta_test) {
-					u32 v = rtw_read32(Adapter, REG_RCR);
-					v &= ~(RCR_CBSSID_DATA | RCR_CBSSID_BCN);/*  RCR_ADF */
-					rtw_write32(Adapter, REG_RCR, v);
-				} else {
-					rtw_write32(Adapter, REG_RCR, rtw_read32(Adapter, REG_RCR) | RCR_CBSSID_BCN);
-				}
+				rtw_write32(Adapter, REG_RCR, rtw_read32(Adapter, REG_RCR) | RCR_CBSSID_BCN);
 			}
 		}
 		break;
@@ -1131,13 +1125,7 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 				/* enable to rx data frame.Accept all data frame */
 				rtw_write16(Adapter, REG_RXFLTMAP2, 0xFFFF);
 
-				if (Adapter->in_cta_test) {
-					u32 v = rtw_read32(Adapter, REG_RCR);
-					v &= ~(RCR_CBSSID_DATA | RCR_CBSSID_BCN);/*  RCR_ADF */
-					rtw_write32(Adapter, REG_RCR, v);
-				} else {
-					rtw_write32(Adapter, REG_RCR, rtw_read32(Adapter, REG_RCR) | RCR_CBSSID_DATA | RCR_CBSSID_BCN);
-				}
+				rtw_write32(Adapter, REG_RCR, rtw_read32(Adapter, REG_RCR) | RCR_CBSSID_DATA | RCR_CBSSID_BCN);
 
 				if (check_fwstate(pmlmepriv, WIFI_STATION_STATE))
 					RetryLimit = 48;
diff --git a/drivers/staging/r8188eu/include/drv_types.h b/drivers/staging/r8188eu/include/drv_types.h
index 4553cfda0aa4..3d5eb37a4c51 100644
--- a/drivers/staging/r8188eu/include/drv_types.h
+++ b/drivers/staging/r8188eu/include/drv_types.h
@@ -232,8 +232,6 @@ struct adapter {
 	unsigned char			br_mac[ETH_ALEN];
 	unsigned char			br_ip[4];
 	struct br_ext_info		ethBrExtInfo;
-
-	unsigned char     in_cta_test;
 };
 
 #define adapter_to_dvobj(adapter) (adapter->dvobj)
-- 
2.30.2

