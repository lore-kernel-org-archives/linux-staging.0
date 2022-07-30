Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37C83C26
	for <linux-staging@lists.linux.dev>; Sat, 30 Jul 2022 14:40:03 +0000 (UTC)
Received: from dslb-188-104-059-172.188.104.pools.vodafone-ip.de ([188.104.59.172] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oHndA-0004pM-LY; Sat, 30 Jul 2022 16:39:52 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 2/3] staging: r8188eu: make rtw_handle_dualmac a void function
Date: Sat, 30 Jul 2022 16:39:38 +0200
Message-Id: <20220730143939.671951-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220730143939.671951-1-martin@kaiser.cx>
References: <20220730143939.671951-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rtw_handle_dualmac function always returns _SUCCESS. Remove the return
value and update the one caller that checks it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_wlan_util.c | 5 +----
 drivers/staging/r8188eu/include/drv_types.h  | 2 +-
 drivers/staging/r8188eu/os_dep/usb_intf.c    | 4 +---
 3 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
index 3a002cb6834f..235dbf353802 100644
--- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
@@ -1578,10 +1578,8 @@ void beacon_timing_control(struct adapter *padapter)
 
 static struct adapter *pbuddy_padapter;
 
-int rtw_handle_dualmac(struct adapter *adapter, bool init)
+void rtw_handle_dualmac(struct adapter *adapter, bool init)
 {
-	int status = _SUCCESS;
-
 	if (init) {
 		if (!pbuddy_padapter) {
 			pbuddy_padapter = adapter;
@@ -1594,5 +1592,4 @@ int rtw_handle_dualmac(struct adapter *adapter, bool init)
 	} else {
 		pbuddy_padapter = NULL;
 	}
-	return status;
 }
diff --git a/drivers/staging/r8188eu/include/drv_types.h b/drivers/staging/r8188eu/include/drv_types.h
index bba88a0ede61..9f8a8d3e8f77 100644
--- a/drivers/staging/r8188eu/include/drv_types.h
+++ b/drivers/staging/r8188eu/include/drv_types.h
@@ -222,7 +222,7 @@ struct adapter {
 
 #define adapter_to_dvobj(adapter) (adapter->dvobj)
 
-int rtw_handle_dualmac(struct adapter *adapter, bool init);
+void rtw_handle_dualmac(struct adapter *adapter, bool init);
 
 static inline u8 *myid(struct eeprom_priv *peepriv)
 {
diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index e1a0447fd1e7..4dbdffa4e293 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -306,8 +306,7 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
 
 	padapter->hw_init_mutex = &usb_drv->hw_init_mutex;
 
-	if (rtw_handle_dualmac(padapter, 1) != _SUCCESS)
-		goto free_adapter;
+	rtw_handle_dualmac(padapter, 1);
 
 	pnetdev = rtw_init_netdev(padapter);
 	if (!pnetdev)
@@ -370,7 +369,6 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
 	rtw_free_drv_sw(padapter);
 handle_dualmac:
 	rtw_handle_dualmac(padapter, 0);
-free_adapter:
 	if (pnetdev)
 		rtw_free_netdev(pnetdev);
 	else
-- 
2.30.2

