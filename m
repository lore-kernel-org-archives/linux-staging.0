Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6A12F27
	for <linux-staging@lists.linux.dev>; Sat, 29 Oct 2022 17:24:01 +0000 (UTC)
Received: from dslb-188-097-213-253.188.097.pools.vodafone-ip.de ([188.97.213.253] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oopYs-00074v-RW; Sat, 29 Oct 2022 19:23:58 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 07/13] staging: r8188eu: replace switch-case with if
Date: Sat, 29 Oct 2022 19:23:31 +0200
Message-Id: <20221029172337.1574593-8-martin@kaiser.cx>
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

OnAction_p2p has a switch-case statement where only a single case is
handled. Use if instead, this makes the code shorter and easier to read.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 97bcef078ea2..7b05f847a8e6 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -3853,19 +3853,8 @@ static void OnAction_p2p(struct adapter *padapter, struct recv_frame *precv_fram
 	len -= sizeof(struct ieee80211_hdr_3addr);
 	OUI_Subtype = frame_body[5];
 
-	switch (OUI_Subtype) {
-	case P2P_NOTICE_OF_ABSENCE:
-		break;
-	case P2P_PRESENCE_REQUEST:
+	if (OUI_Subtype == P2P_PRESENCE_REQUEST)
 		process_p2p_presence_req(pwdinfo, pframe, len);
-		break;
-	case P2P_PRESENCE_RESPONSE:
-		break;
-	case P2P_GO_DISC_REQUEST:
-		break;
-	default:
-		break;
-	}
 }
 
 static void OnAction(struct adapter *padapter, struct recv_frame *precv_frame)
-- 
2.30.2

