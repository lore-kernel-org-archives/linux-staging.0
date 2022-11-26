Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FEC23C8
	for <linux-staging@lists.linux.dev>; Sat, 26 Nov 2022 16:01:45 +0000 (UTC)
Received: from dslb-188-096-151-149.188.096.pools.vodafone-ip.de ([188.96.151.149] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oyxca-0000Ub-Q7; Sat, 26 Nov 2022 17:01:40 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 09/10] staging: r8188eu: simplify error handling for missing station
Date: Sat, 26 Nov 2022 17:01:28 +0100
Message-Id: <20221126160129.178697-10-martin@kaiser.cx>
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

Simplify the code to handle the case where we're associated to a station
that is not in our list of known stations.

We can simply exit in this case. This patch reverts the if-condition and
saves one level of indentation.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 24 ++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 76424bcba416..362313c49c52 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -597,19 +597,19 @@ static void OnBeacon(struct adapter *padapter, struct recv_frame *precv_frame)
 
 	if (((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE) && (pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS)) {
 		psta = rtw_get_stainfo(pstapriv, mgmt->sa);
-		if (psta) {
-			ret = rtw_check_bcn_info(padapter, pframe, len);
-			if (!ret) {
-				receive_disconnect(padapter,
-						   pmlmeinfo->network.MacAddress, 0);
-				return;
-			}
-			/* update WMM, ERP in the beacon */
-			/* todo: the timer is used instead of the number of the beacon received */
-			if ((sta_rx_pkts(psta) & 0xf) == 0)
-				update_beacon_info(padapter, ie_ptr, ie_len, psta);
-			process_p2p_ps_ie(padapter, ie_ptr, ie_len);
+		if (!psta)
+			return;
+
+		ret = rtw_check_bcn_info(padapter, pframe, len);
+		if (!ret) {
+			receive_disconnect(padapter, pmlmeinfo->network.MacAddress, 0);
+			return;
 		}
+		/* update WMM, ERP in the beacon */
+		/* todo: the timer is used instead of the number of the beacon received */
+		if ((sta_rx_pkts(psta) & 0xf) == 0)
+			update_beacon_info(padapter, ie_ptr, ie_len, psta);
+		process_p2p_ps_ie(padapter, ie_ptr, ie_len);
 	} else if ((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE) {
 		psta = rtw_get_stainfo(pstapriv, mgmt->sa);
 		if (psta) {
-- 
2.30.2

