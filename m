Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342712C86
	for <linux-staging@lists.linux.dev>; Mon, 11 Oct 2021 20:12:28 +0000 (UTC)
Received: from dslb-188-097-046-226.188.097.pools.vodafone-ip.de ([188.97.46.226] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1ma1eq-0004mk-MZ; Mon, 11 Oct 2021 22:12:24 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 3/8] staging: r8188eu: remove rtl8188e_deinit_dm_priv
Date: Mon, 11 Oct 2021 22:11:54 +0200
Message-Id: <20211011201159.10252-4-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011201159.10252-1-martin@kaiser.cx>
References: <20211011201159.10252-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This function is empty and can be removed.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/rtl8188e_dm.c     | 4 ----
 drivers/staging/r8188eu/include/rtl8188e_dm.h | 1 -
 drivers/staging/r8188eu/os_dep/os_intfs.c     | 2 --
 3 files changed, 7 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_dm.c b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
index 90b30606fe13..6a96194bbc26 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_dm.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
@@ -143,10 +143,6 @@ void rtl8188e_init_dm_priv(struct adapter *Adapter)
 	Init_ODM_ComInfo_88E(Adapter);
 }
 
-void rtl8188e_deinit_dm_priv(struct adapter *Adapter)
-{
-}
-
 /*  Add new function to reset the state of antenna diversity before link. */
 /*  Compare RSSI for deciding antenna */
 void AntDivCompare8188E(struct adapter *Adapter, struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src)
diff --git a/drivers/staging/r8188eu/include/rtl8188e_dm.h b/drivers/staging/r8188eu/include/rtl8188e_dm.h
index a4399b119a74..0dec2828a3a6 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_dm.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_dm.h
@@ -30,7 +30,6 @@ struct	dm_priv {
 };
 
 void rtl8188e_init_dm_priv(struct adapter *adapt);
-void rtl8188e_deinit_dm_priv(struct adapter *adapt);
 void rtl8188e_InitHalDm(struct adapter *adapt);
 void rtl8188e_HalDmWatchDog(struct adapter *adapt);
 
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index 1418c9c4916c..e7964a048c99 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -557,8 +557,6 @@ void rtw_cancel_all_timer(struct adapter *padapter)
 	_cancel_timer_ex(&padapter->pwrctrlpriv.pwr_state_check_timer);
 
 	_cancel_timer_ex(&padapter->recvpriv.signal_stat_timer);
-	/* cancel dm timer */
-	rtl8188e_deinit_dm_priv(padapter);
 }
 
 u8 rtw_free_drv_sw(struct adapter *padapter)
-- 
2.20.1

