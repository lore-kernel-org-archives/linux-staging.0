Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBD617FC
	for <linux-staging@lists.linux.dev>; Sat, 26 Nov 2022 16:01:41 +0000 (UTC)
Received: from dslb-188-096-151-149.188.096.pools.vodafone-ip.de ([188.96.151.149] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oyxcX-0000Ub-4T; Sat, 26 Nov 2022 17:01:37 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 04/10] staging: r8188eu: pass only ies to process_p2p_ps_ie
Date: Sat, 26 Nov 2022 17:01:23 +0100
Message-Id: <20221126160129.178697-5-martin@kaiser.cx>
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

The process_p2p_ps_ie function parses the information elements of a beacon
message and extracts p2p-related info.

process_p2p_ps_ie does not receive a pointer to the information elements
as one would expect. Instead it receives a pointer to the timestamp field
in the beacon message. process_p2p_ps_ie increments this pointer by
_BEACON_IE_OFFSET_ to jump to the start of the information elements (and
decreases the buffer length accordingly).

This is clumsy and hard to understand. Rewrite this such that
process_p2p_ps_ie takes a pointer to the information elements and the
total length of all elements. Check up-front that the total length is
not negative.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c |  9 ++++++++-
 drivers/staging/r8188eu/core/rtw_p2p.c      | 11 ++---------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 5a31b20dc46d..07c57a2b61b9 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -556,6 +556,13 @@ static void OnBeacon(struct adapter *padapter, struct recv_frame *precv_frame)
 	uint len = precv_frame->len;
 	struct wlan_bssid_ex *pbss;
 	int ret = _SUCCESS;
+	u8 *ie_ptr;
+	u32 ie_len;
+
+	ie_ptr = (u8 *)&mgmt->u.beacon.variable;
+	if (precv_frame->len < offsetof(struct ieee80211_mgmt, u.beacon.variable))
+		return;
+	ie_len = precv_frame->len - offsetof(struct ieee80211_mgmt, u.beacon.variable);
 
 	if (pmlmeext->sitesurvey_res.state == SCAN_PROCESS) {
 		report_survey_event(padapter, precv_frame);
@@ -598,7 +605,7 @@ static void OnBeacon(struct adapter *padapter, struct recv_frame *precv_frame)
 				/* todo: the timer is used instead of the number of the beacon received */
 				if ((sta_rx_pkts(psta) & 0xf) == 0)
 					update_beacon_info(padapter, pframe, len, psta);
-				process_p2p_ps_ie(padapter, (pframe + WLAN_HDR_A3_LEN), (len - WLAN_HDR_A3_LEN));
+				process_p2p_ps_ie(padapter, ie_ptr, ie_len);
 			}
 		} else if ((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE) {
 			psta = rtw_get_stainfo(pstapriv, mgmt->sa);
diff --git a/drivers/staging/r8188eu/core/rtw_p2p.c b/drivers/staging/r8188eu/core/rtw_p2p.c
index dc159e58f428..ce05458bd1ad 100644
--- a/drivers/staging/r8188eu/core/rtw_p2p.c
+++ b/drivers/staging/r8188eu/core/rtw_p2p.c
@@ -1505,8 +1505,6 @@ void p2p_protocol_wk_hdl(struct adapter *padapter, int intCmdType)
 
 void process_p2p_ps_ie(struct adapter *padapter, u8 *IEs, u32 IELength)
 {
-	u8 *ies;
-	u32 ies_len;
 	u8 *p2p_ie;
 	u32	p2p_ielen = 0;
 	u8	noa_attr[MAX_P2P_IE_LEN] = { 0x00 };/*  NoA length should be n*(13) + 2 */
@@ -1518,13 +1516,8 @@ void process_p2p_ps_ie(struct adapter *padapter, u8 *IEs, u32 IELength)
 
 	if (rtw_p2p_chk_state(pwdinfo, P2P_STATE_NONE))
 		return;
-	if (IELength <= _BEACON_IE_OFFSET_)
-		return;
 
-	ies = IEs + _BEACON_IE_OFFSET_;
-	ies_len = IELength - _BEACON_IE_OFFSET_;
-
-	p2p_ie = rtw_get_p2p_ie(ies, ies_len, NULL, &p2p_ielen);
+	p2p_ie = rtw_get_p2p_ie(IEs, IELength, NULL, &p2p_ielen);
 
 	while (p2p_ie) {
 		find_p2p = true;
@@ -1579,7 +1572,7 @@ void process_p2p_ps_ie(struct adapter *padapter, u8 *IEs, u32 IELength)
 		}
 
 		/* Get the next P2P IE */
-		p2p_ie = rtw_get_p2p_ie(p2p_ie + p2p_ielen, ies_len - (p2p_ie - ies + p2p_ielen), NULL, &p2p_ielen);
+		p2p_ie = rtw_get_p2p_ie(p2p_ie + p2p_ielen, IELength - (p2p_ie - IEs + p2p_ielen), NULL, &p2p_ielen);
 	}
 
 	if (find_p2p) {
-- 
2.30.2

