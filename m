Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868DD614A
	for <linux-staging@lists.linux.dev>; Mon, 21 Mar 2022 20:34:01 +0000 (UTC)
Received: from dslb-094-219-034-255.094.219.pools.vodafone-ip.de ([94.219.34.255] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nWOj0-0003ce-6c; Mon, 21 Mar 2022 21:33:58 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Laight <David.Laight@ACULAB.COM>,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 5/6] staging: r8188eu: DYNAMIC_RF_CALIBRATION is not used
Date: Mon, 21 Mar 2022 21:30:30 +0100
Message-Id: <20220321203031.143486-6-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220321203031.143486-1-martin@kaiser.cx>
References: <20220321203031.143486-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the DYNAMIC_RF_CALIBRATION capability. It's cleared in one place
but never checked.

DYNAMIC_RF_CALIBRATION is part of podmpriv->SupportAbility, there are no
users that check SupportAbility as a whole and use DYNAMIC_RF_CALIBRATION
implicitly.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/usb_halinit.c      | 2 --
 drivers/staging/r8188eu/include/rtw_mlme_ext.h | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 599d930a5927..11dc8834acac 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1431,8 +1431,6 @@ void SetHalDefVar8188EUsb(struct adapter *Adapter, enum hal_def_variable eVariab
 				podmpriv->SupportAbility = DYNAMIC_FUNC_DISABLE;
 			} else if (dm_func == 1) {/* disable DIG */
 				podmpriv->SupportAbility  &= (~DYNAMIC_BB_DIG);
-			} else if (dm_func == 3) {/* disable tx power tracking */
-				podmpriv->SupportAbility  &= (~DYNAMIC_RF_CALIBRATION);
 			} else if (dm_func == 6) {/* turn on all dynamic func */
 				if (!(podmpriv->SupportAbility  & DYNAMIC_BB_DIG)) {
 					struct rtw_dig *pDigTable = &podmpriv->DM_DigTable;
diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
index 9b9c81fe8543..9092e775fc5d 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
@@ -31,8 +31,6 @@
 /*  BB ODM section BIT 0-15 */
 #define	DYNAMIC_BB_DIG				BIT(0)
 
-#define		DYNAMIC_RF_CALIBRATION		BIT(26)
-
 #define		DYNAMIC_ALL_FUNC_ENABLE		0xFFFFFFF
 
 #define _HW_STATE_NOLINK_		0x00
-- 
2.30.2

