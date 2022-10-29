Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFA32F2A
	for <linux-staging@lists.linux.dev>; Sat, 29 Oct 2022 17:24:05 +0000 (UTC)
Received: from dslb-188-097-213-253.188.097.pools.vodafone-ip.de ([188.97.213.253] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oopYw-00074v-SJ; Sat, 29 Oct 2022 19:24:02 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 12/13] staging: r8188eu: rtw_action_public_decache's token is a u8
Date: Sat, 29 Oct 2022 19:23:36 +0200
Message-Id: <20221029172337.1574593-13-martin@kaiser.cx>
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

Both callers of rtw_action_public_decache pass a u8 value for the token
parameter. We can change token from s32 to u8 and remove the code for
token < 0.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index f5923792f067..93f3d387e92d 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -3490,7 +3490,7 @@ inline void issue_probereq_p2p(struct adapter *adapter, u8 *da)
 	_issue_probereq_p2p(adapter, da);
 }
 
-static s32 rtw_action_public_decache(struct recv_frame *recv_frame, s32 token)
+static s32 rtw_action_public_decache(struct recv_frame *recv_frame, u8 token)
 {
 	struct adapter *adapter = recv_frame->adapter;
 	struct mlme_ext_priv *mlmeext = &adapter->mlmeextpriv;
@@ -3499,21 +3499,13 @@ static s32 rtw_action_public_decache(struct recv_frame *recv_frame, s32 token)
 		(recv_frame->attrib.frag_num & 0xf);
 
 	if (GetRetry(frame)) {
-		if (token >= 0) {
-			if ((seq_ctrl == mlmeext->action_public_rxseq) &&
-			    (token == mlmeext->action_public_dialog_token))
-				return _FAIL;
-		} else {
-			if (seq_ctrl == mlmeext->action_public_rxseq)
-				return _FAIL;
-		}
+		if ((seq_ctrl == mlmeext->action_public_rxseq) &&
+		    (token == mlmeext->action_public_dialog_token))
+			return _FAIL;
 	}
 
 	mlmeext->action_public_rxseq = seq_ctrl;
-
-	if (token >= 0)
-		mlmeext->action_public_dialog_token = token;
-
+	mlmeext->action_public_dialog_token = token;
 	return _SUCCESS;
 }
 
-- 
2.30.2

