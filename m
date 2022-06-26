Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAD8320B
	for <linux-staging@lists.linux.dev>; Sun, 26 Jun 2022 18:26:16 +0000 (UTC)
Received: from dslb-188-104-057-109.188.104.pools.vodafone-ip.de ([188.104.57.109] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1o5WeG-00072p-E6; Sun, 26 Jun 2022 20:06:16 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2] staging: r8188eu: remove rtw_usleep_os
Date: Sun, 26 Jun 2022 20:06:03 +0200
Message-Id: <20220626180603.287054-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220602194807.281115-1-martin@kaiser.cx>
References: <20220602194807.281115-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the rtw_usleep_os helper function. There are only two callers, both
of which call rtw_usleep_os(100). This is equivalent to msleep(1).

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
changes in v2:
- use msleep(1) instead of usleep_range

 drivers/staging/r8188eu/core/rtw_pwrctrl.c      | 2 +-
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 2 +-
 drivers/staging/r8188eu/include/osdep_service.h | 2 --
 drivers/staging/r8188eu/os_dep/osdep_service.c  | 8 --------
 4 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_pwrctrl.c b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
index 45e85b593665..cf9020a73933 100644
--- a/drivers/staging/r8188eu/core/rtw_pwrctrl.c
+++ b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
@@ -273,7 +273,7 @@ static s32 LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
 			err = -1;
 			break;
 		}
-		rtw_usleep_os(100);
+		msleep(1);
 	}
 
 	return err;
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 5549e7be334a..5b65313e0b9d 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -243,7 +243,7 @@ static int efuse_read_phymap_from_txpktbuf(
 			if (reg)
 				break;
 
-			rtw_usleep_os(100);
+			msleep(1);
 		} while (time_before(jiffies, timeout));
 
 		/* data from EEPROM needs to be in LE */
diff --git a/drivers/staging/r8188eu/include/osdep_service.h b/drivers/staging/r8188eu/include/osdep_service.h
index 1d97d5be46d5..72990a1cdc66 100644
--- a/drivers/staging/r8188eu/include/osdep_service.h
+++ b/drivers/staging/r8188eu/include/osdep_service.h
@@ -76,8 +76,6 @@ void *rtw_malloc2d(int h, int w, int size);
 		spin_lock_init(&((q)->lock));			\
 	} while (0)
 
-void rtw_usleep_os(int us);
-
 static inline unsigned char _cancel_timer_ex(struct timer_list *ptimer)
 {
 	return del_timer_sync(ptimer);
diff --git a/drivers/staging/r8188eu/os_dep/osdep_service.c b/drivers/staging/r8188eu/os_dep/osdep_service.c
index 812acd59be79..3504a0a9ba87 100644
--- a/drivers/staging/r8188eu/os_dep/osdep_service.c
+++ b/drivers/staging/r8188eu/os_dep/osdep_service.c
@@ -42,14 +42,6 @@ Otherwise, there will be racing condition.
 Caller must check if the list is empty before calling rtw_list_delete
 */
 
-void rtw_usleep_os(int us)
-{
-	if (1 < (us / 1000))
-		msleep(1);
-	else
-		msleep((us / 1000) + 1);
-}
-
 static const struct device_type wlan_type = {
 	.name = "wlan",
 };
-- 
2.30.2

