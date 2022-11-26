Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDF817F7
	for <linux-staging@lists.linux.dev>; Sat, 26 Nov 2022 16:01:41 +0000 (UTC)
Received: from dslb-188-096-151-149.188.096.pools.vodafone-ip.de ([188.96.151.149] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oyxcW-0000Ub-D3; Sat, 26 Nov 2022 17:01:36 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 03/10] staging: r8188eu: replace GetAddr2Ptr calls
Date: Sat, 26 Nov 2022 17:01:22 +0100
Message-Id: <20221126160129.178697-4-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221126160129.178697-1-martin@kaiser.cx>
References: <20221126160129.178697-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Get the source address of a beacon frame from our struct ieee80211_mgmt
instead of using the driver's internal GetAddr2Ptr helper.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 66e3a90da3a3..5a31b20dc46d 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -586,7 +586,7 @@ static void OnBeacon(struct adapter *padapter, struct recv_frame *precv_frame)
 		}
 
 		if (((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE) && (pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS)) {
-			psta = rtw_get_stainfo(pstapriv, GetAddr2Ptr(pframe));
+			psta = rtw_get_stainfo(pstapriv, mgmt->sa);
 			if (psta) {
 				ret = rtw_check_bcn_info(padapter, pframe, len);
 				if (!ret) {
@@ -601,7 +601,7 @@ static void OnBeacon(struct adapter *padapter, struct recv_frame *precv_frame)
 				process_p2p_ps_ie(padapter, (pframe + WLAN_HDR_A3_LEN), (len - WLAN_HDR_A3_LEN));
 			}
 		} else if ((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE) {
-			psta = rtw_get_stainfo(pstapriv, GetAddr2Ptr(pframe));
+			psta = rtw_get_stainfo(pstapriv, mgmt->sa);
 			if (psta) {
 				/* update WMM, ERP in the beacon */
 				/* todo: the timer is used instead of the number of the beacon received */
@@ -621,8 +621,7 @@ static void OnBeacon(struct adapter *padapter, struct recv_frame *precv_frame)
 
 				pmlmeext->TSFValue = le64_to_cpu(mgmt->u.beacon.timestamp);
 
-				/* report sta add event */
-				report_add_sta_event(padapter, GetAddr2Ptr(pframe), cam_idx);
+				report_add_sta_event(padapter, mgmt->sa, cam_idx);
 			}
 		}
 	}
-- 
2.30.2

