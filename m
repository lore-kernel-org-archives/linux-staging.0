Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5AF1FDA
	for <linux-staging@lists.linux.dev>; Sun,  3 Apr 2022 16:55:03 +0000 (UTC)
Received: from dslb-094-219-033-178.094.219.pools.vodafone-ip.de ([94.219.33.178] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nb3V9-0008D7-AI; Sun, 03 Apr 2022 18:54:55 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 11/11] staging: r8188eu: remove the bretry variable
Date: Sun,  3 Apr 2022 18:54:38 +0200
Message-Id: <20220403165438.357728-12-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220403165438.357728-1-martin@kaiser.cx>
References: <20220403165438.357728-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the bretry variable. It's set and used only once. Call the
ieee80211 helper directly.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index e9209785b1c9..91a6e0f035f4 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -936,7 +936,6 @@ static void validate_recv_mgnt_frame(struct adapter *padapter,
 static int validate_recv_data_frame(struct adapter *adapter,
 				    struct recv_frame *precv_frame)
 {
-	u8 bretry;
 	struct sta_info *psta = NULL;
 	u8 *ptr = precv_frame->rx_data;
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)precv_frame->rx_data;
@@ -944,8 +943,6 @@ static int validate_recv_data_frame(struct adapter *adapter,
 	struct security_priv	*psecuritypriv = &adapter->securitypriv;
 	int ret;
 
-	bretry = ieee80211_has_retry(hdr->frame_control);
-
 	memcpy(pattrib->dst, ieee80211_get_DA(hdr), ETH_ALEN);
 	memcpy(pattrib->src, ieee80211_get_SA(hdr), ETH_ALEN);
 
@@ -999,7 +996,8 @@ static int validate_recv_data_frame(struct adapter *adapter,
 	precv_frame->preorder_ctrl = &psta->recvreorder_ctrl[pattrib->priority];
 
 	/*  decache, drop duplicate recv packets */
-	if (recv_decache(precv_frame, bretry, &psta->sta_recvpriv.rxcache) == _FAIL)
+	if (recv_decache(precv_frame, ieee80211_has_retry(hdr->frame_control),
+			 &psta->sta_recvpriv.rxcache) == _FAIL)
 		return _FAIL;
 
 	if (pattrib->privacy) {
-- 
2.30.2

