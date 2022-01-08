Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEF22CA5
	for <linux-staging@lists.linux.dev>; Sat,  8 Jan 2022 12:50:23 +0000 (UTC)
Received: from dslb-188-097-214-229.188.097.pools.vodafone-ip.de ([188.97.214.229] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1n6BAq-0005EJ-7c; Sat, 08 Jan 2022 13:50:20 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 10/12] staging: r8188eu: HW_VAR_MEDIA_STATUS1 is never set
Date: Sat,  8 Jan 2022 13:49:57 +0100
Message-Id: <20220108124959.313215-11-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220108124959.313215-1-martin@kaiser.cx>
References: <20220108124959.313215-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HW_VAR_MEDIA_STATUS1 hal variable is never set. Remove its define
and the code to set it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/usb_halinit.c  | 9 ---------
 drivers/staging/r8188eu/include/hal_intf.h | 1 -
 2 files changed, 10 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 38b88e6b7bdb..21cb505036b7 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1087,15 +1087,6 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 			rtw_write8(Adapter, MSR, val8);
 		}
 		break;
-	case HW_VAR_MEDIA_STATUS1:
-		{
-			u8 val8;
-
-			val8 = rtw_read8(Adapter, MSR) & 0x03;
-			val8 |= *((u8 *)val) << 2;
-			rtw_write8(Adapter, MSR, val8);
-		}
-		break;
 	case HW_VAR_SET_OPMODE:
 		hw_var_set_opmode(Adapter, variable, val);
 		break;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 120b32994e1f..6728cb506303 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -10,7 +10,6 @@
 
 enum hw_variables {
 	HW_VAR_MEDIA_STATUS,
-	HW_VAR_MEDIA_STATUS1,
 	HW_VAR_SET_OPMODE,
 	HW_VAR_MAC_ADDR,
 	HW_VAR_BSSID,
-- 
2.30.2

