Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7A823A0
	for <linux-staging@lists.linux.dev>; Thu, 21 Apr 2022 20:05:12 +0000 (UTC)
Received: from dslb-178-004-168-011.178.004.pools.vodafone-ip.de ([178.4.168.11] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nhd30-0001uQ-5S; Thu, 21 Apr 2022 22:05:02 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH] staging: r8188eu: remove OnAtim
Date: Thu, 21 Apr 2022 22:04:49 +0200
Message-Id: <20220421200449.191983-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the empty OnAtim function. We can set the function pointer in
mlme_sta_tbl to NULL if no action is required for this management frame
subtype.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index db61acc914d1..190de0b59c42 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -25,7 +25,7 @@ static mlme_handler mlme_sta_tbl[] = {
 	NULL,
 	NULL,
 	OnBeacon,
-	OnAtim,
+	NULL,
 	OnDisassoc,
 	OnAuthClient,
 	OnDeAuth,
@@ -1479,11 +1479,6 @@ unsigned int OnDisassoc(struct adapter *padapter, struct recv_frame *precv_frame
 	return _SUCCESS;
 }
 
-unsigned int OnAtim(struct adapter *padapter, struct recv_frame *precv_frame)
-{
-	return _SUCCESS;
-}
-
 unsigned int on_action_spct(struct adapter *padapter, struct recv_frame *precv_frame)
 {
 	unsigned int ret = _FAIL;
-- 
2.30.2

