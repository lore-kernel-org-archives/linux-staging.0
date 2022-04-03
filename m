Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337F31FDB
	for <linux-staging@lists.linux.dev>; Sun,  3 Apr 2022 16:55:02 +0000 (UTC)
Received: from dslb-094-219-033-178.094.219.pools.vodafone-ip.de ([94.219.33.178] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nb3V7-0008D7-Gj; Sun, 03 Apr 2022 18:54:53 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 09/11] staging: r8188eu: remove psa, pda
Date: Sun,  3 Apr 2022 18:54:36 +0200
Message-Id: <20220403165438.357728-10-martin@kaiser.cx>
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

Remove the psa, pda variables. They are set and read only once.
We can use the ieee80211 helpers directly.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 75c0e0b17185..63ce66489146 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -937,7 +937,7 @@ static int validate_recv_data_frame(struct adapter *adapter,
 				    struct recv_frame *precv_frame)
 {
 	u8 bretry;
-	u8 *psa, *pda, *pbssid;
+	u8 *pbssid;
 	struct sta_info *psta = NULL;
 	u8 *ptr = precv_frame->rx_data;
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)precv_frame->rx_data;
@@ -946,15 +946,13 @@ static int validate_recv_data_frame(struct adapter *adapter,
 	int ret;
 
 	bretry = ieee80211_has_retry(hdr->frame_control);
-	pda = ieee80211_get_DA(hdr);
-	psa = ieee80211_get_SA(hdr);
 
 	pbssid = get_hdr_bssid(ptr);
 	if (!pbssid)
 		return _FAIL;
 
-	memcpy(pattrib->dst, pda, ETH_ALEN);
-	memcpy(pattrib->src, psa, ETH_ALEN);
+	memcpy(pattrib->dst, ieee80211_get_DA(hdr), ETH_ALEN);
+	memcpy(pattrib->src, ieee80211_get_SA(hdr), ETH_ALEN);
 
 	memcpy(pattrib->bssid, pbssid, ETH_ALEN);
 
-- 
2.30.2

