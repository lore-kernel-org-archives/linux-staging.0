Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21462F2D
	for <linux-staging@lists.linux.dev>; Sat, 29 Oct 2022 17:24:00 +0000 (UTC)
Received: from dslb-188-097-213-253.188.097.pools.vodafone-ip.de ([188.97.213.253] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oopYs-00074v-2S; Sat, 29 Oct 2022 19:23:58 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 06/13] staging: r8188eu: remove category check in OnAction_p2p
Date: Sat, 29 Oct 2022 19:23:30 +0200
Message-Id: <20221029172337.1574593-7-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221029172337.1574593-1-martin@kaiser.cx>
References: <20221029172337.1574593-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The caller of OnAction_p2p has already checked the action category. We can
remove the check in OnAction_p2p.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 0c2db015656f..97bcef078ea2 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -3836,7 +3836,7 @@ static void on_action_public(struct adapter *padapter, struct recv_frame *precv_
 static void OnAction_p2p(struct adapter *padapter, struct recv_frame *precv_frame)
 {
 	u8 *frame_body;
-	u8 category, OUI_Subtype;
+	u8 OUI_Subtype;
 	u8 *pframe = precv_frame->rx_data;
 	uint len = precv_frame->len;
 	struct	wifidirect_info	*pwdinfo = &padapter->wdinfo;
@@ -3847,10 +3847,6 @@ static void OnAction_p2p(struct adapter *padapter, struct recv_frame *precv_fram
 
 	frame_body = (unsigned char *)(pframe + sizeof(struct ieee80211_hdr_3addr));
 
-	category = frame_body[0];
-	if (category != RTW_WLAN_CATEGORY_P2P)
-		return;
-
 	if (be32_to_cpu(*((__be32 *)(frame_body + 1))) != P2POUI)
 		return;
 
-- 
2.30.2

