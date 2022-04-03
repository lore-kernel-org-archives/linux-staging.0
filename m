Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFE71FDB
	for <linux-staging@lists.linux.dev>; Sun,  3 Apr 2022 16:32:26 +0000 (UTC)
Received: from dslb-094-219-033-178.094.219.pools.vodafone-ip.de ([94.219.33.178] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nb39E-0007x0-1N; Sun, 03 Apr 2022 18:32:16 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 2/2] staging: r8188eu: remove constant variable
Date: Sun,  3 Apr 2022 18:32:06 +0200
Message-Id: <20220403163206.357004-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220403163206.357004-1-martin@kaiser.cx>
References: <20220403163206.357004-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

wifi_test_chk_rate is always 1. Remove the variable and the code to
check it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index ca415d123cbf..2f85d3a545cd 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -478,7 +478,6 @@ unsigned int OnProbeReq(struct adapter *padapter, struct recv_frame *precv_frame
 	u8 is_valid_p2p_probereq = false;
 
 	struct wifidirect_info	*pwdinfo = &padapter->wdinfo;
-	u8 wifi_test_chk_rate = 1;
 
 	if (!rtw_p2p_chk_state(pwdinfo, P2P_STATE_NONE) &&
 	    !rtw_p2p_chk_state(pwdinfo, P2P_STATE_IDLE) &&
@@ -493,16 +492,14 @@ unsigned int OnProbeReq(struct adapter *padapter, struct recv_frame *precv_frame
 
 		/*	Commented by Kurt 2012/10/16 */
 		/*	IOT issue: Google Nexus7 use 1M rate to send p2p_probe_req after GO nego completed and Nexus7 is client */
-		if (wifi_test_chk_rate == 1) {
-			is_valid_p2p_probereq = process_probe_req_p2p_ie(pwdinfo, pframe, len);
-			if (is_valid_p2p_probereq) {
-				if (rtw_p2p_chk_role(pwdinfo, P2P_ROLE_DEVICE)) {
-					/*  FIXME */
-					report_survey_event(padapter, precv_frame);
-					p2p_listen_state_process(padapter,  get_sa(pframe));
-
-					return _SUCCESS;
-				}
+		is_valid_p2p_probereq = process_probe_req_p2p_ie(pwdinfo, pframe, len);
+		if (is_valid_p2p_probereq) {
+			if (rtw_p2p_chk_role(pwdinfo, P2P_ROLE_DEVICE)) {
+				/*  FIXME */
+				report_survey_event(padapter, precv_frame);
+				p2p_listen_state_process(padapter,  get_sa(pframe));
+
+				return _SUCCESS;
 			}
 		}
 	}
-- 
2.30.2

