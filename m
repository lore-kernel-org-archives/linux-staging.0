Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627E78F50
	for <linux-staging@lists.linux.dev>; Sun, 30 Oct 2022 17:33:52 +0000 (UTC)
Received: from ipservice-092-217-067-184.092.217.pools.vodafone-ip.de ([92.217.67.184] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1opCBx-000469-Ey; Sun, 30 Oct 2022 18:33:49 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 11/13] staging: r8188eu: remove return value from on_action_public_default
Date: Sun, 30 Oct 2022 18:33:24 +0100
Message-Id: <20221030173326.1588647-12-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221030173326.1588647-1-martin@kaiser.cx>
References: <20221030173326.1588647-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The only caller of on_action_public_default does not check the return
value. We can make it a void function.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index b395457a6a60..f5923792f067 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -3788,22 +3788,15 @@ static void on_action_public_vendor(struct recv_frame *precv_frame)
 		on_action_public_p2p(precv_frame);
 }
 
-static unsigned int on_action_public_default(struct recv_frame *precv_frame)
+static void on_action_public_default(struct recv_frame *precv_frame)
 {
-	unsigned int ret = _FAIL;
 	u8 *pframe = precv_frame->rx_data;
 	u8 *frame_body = pframe + sizeof(struct ieee80211_hdr_3addr);
 	u8 token;
 
 	token = frame_body[2];
 
-	if (rtw_action_public_decache(precv_frame, token) == _FAIL)
-		goto exit;
-
-	ret = _SUCCESS;
-
-exit:
-	return ret;
+	rtw_action_public_decache(precv_frame, token);
 }
 
 static void on_action_public(struct adapter *padapter, struct recv_frame *precv_frame)
-- 
2.30.2

