Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F7B1C2B
	for <linux-staging@lists.linux.dev>; Fri,  2 Dec 2022 09:32:20 +0000 (UTC)
Received: from ipservice-092-217-087-074.092.217.pools.vodafone-ip.de ([92.217.87.74] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1p12P0-0001zC-3F; Fri, 02 Dec 2022 10:32:14 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 2/2] staging: r8188eu: use subtype helper in rtw_check_bcn_info
Date: Fri,  2 Dec 2022 10:31:59 +0100
Message-Id: <20221202093159.404111-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221202093159.404111-1-martin@kaiser.cx>
References: <20221202093159.404111-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use ieee80211_is_beacon to check the frame subtype in rtw_check_bcn_info.
Replace the call to the driver-specific GetFrameSubType function.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_wlan_util.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
index da3465d6bb0f..f1ebb5358cb9 100644
--- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
@@ -874,9 +874,10 @@ void VCS_update(struct adapter *padapter, struct sta_info *psta)
 
 int rtw_check_bcn_info(struct adapter  *Adapter, u8 *pframe, u32 packet_len)
 {
+	struct ieee80211_mgmt *mgmt = (struct ieee80211_mgmt *)pframe;
 	unsigned int		len;
 	unsigned char		*p;
-	unsigned short	val16, subtype;
+	unsigned short	val16;
 	struct wlan_network *cur_network = &Adapter->mlmepriv.cur_network;
 	/* u8 wpa_ie[255], rsn_ie[255]; */
 	u16 wpa_len = 0, rsn_len = 0;
@@ -908,9 +909,7 @@ int rtw_check_bcn_info(struct adapter  *Adapter, u8 *pframe, u32 packet_len)
 	if (!bssid)
 		return _FAIL;
 
-	subtype = GetFrameSubType(pframe) >> 4;
-
-	if (subtype == WIFI_BEACON)
+	if (ieee80211_is_beacon(mgmt->frame_control))
 		bssid->Reserved[0] = 1;
 
 	bssid->Length = sizeof(struct wlan_bssid_ex) - MAX_IE_SZ + len;
-- 
2.30.2

