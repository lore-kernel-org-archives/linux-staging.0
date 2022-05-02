Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16F43217
	for <linux-staging@lists.linux.dev>; Mon,  2 May 2022 20:07:17 +0000 (UTC)
Received: from ipservice-092-217-077-109.092.217.pools.vodafone-ip.de ([92.217.77.109] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nlcKB-0007ch-92; Mon, 02 May 2022 22:07:15 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 6/9] staging: r8188eu: replace OnAction_tbl with switch-case
Date: Mon,  2 May 2022 22:06:49 +0200
Message-Id: <20220502200652.143665-7-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220502200652.143665-1-martin@kaiser.cx>
References: <20220502200652.143665-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

OnAction_tbl has only three entries. It's simpler to use a switch
statement instead of iterating over the table.

We can then remove the table itself and struct action_handler, which was
used only for the table entries.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 22 +++++++++----------
 .../staging/r8188eu/include/rtw_mlme_ext.h    |  5 -----
 2 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 9c83a74f0795..0df89bbdb63a 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -32,12 +32,6 @@ static mlme_handler mlme_sta_tbl[] = {
 	OnAction,
 };
 
-static struct action_handler OnAction_tbl[] = {
-	{RTW_WLAN_CATEGORY_BACK, &OnAction_back},
-	{RTW_WLAN_CATEGORY_PUBLIC, on_action_public},
-	{RTW_WLAN_CATEGORY_P2P, &OnAction_p2p},
-};
-
 static u8 null_addr[ETH_ALEN] = {0, 0, 0, 0, 0, 0};
 
 /**************************************************
@@ -3877,9 +3871,7 @@ unsigned int OnAction_p2p(struct adapter *padapter, struct recv_frame *precv_fra
 
 unsigned int OnAction(struct adapter *padapter, struct recv_frame *precv_frame)
 {
-	int i;
 	unsigned char	category;
-	struct action_handler *ptable;
 	unsigned char	*frame_body;
 	u8 *pframe = precv_frame->rx_data;
 
@@ -3887,10 +3879,16 @@ unsigned int OnAction(struct adapter *padapter, struct recv_frame *precv_frame)
 
 	category = frame_body[0];
 
-	for (i = 0; i < ARRAY_SIZE(OnAction_tbl); i++) {
-		ptable = &OnAction_tbl[i];
-		if (category == ptable->num)
-			ptable->func(padapter, precv_frame);
+	switch (category) {
+	case RTW_WLAN_CATEGORY_BACK:
+		OnAction_back(padapter, precv_frame);
+		break;
+	case RTW_WLAN_CATEGORY_PUBLIC:
+		on_action_public(padapter, precv_frame);
+		break;
+	case RTW_WLAN_CATEGORY_P2P:
+		OnAction_p2p(padapter, precv_frame);
+		break;
 	}
 	return _SUCCESS;
 }
diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
index 63e4ee8e3dfb..888b12a9f755 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
@@ -186,11 +186,6 @@ enum SCAN_STATE {
 
 typedef unsigned int (*mlme_handler)(struct adapter *adapt, struct recv_frame *frame);
 
-struct action_handler {
-	unsigned int   num;
-	unsigned int (*func)(struct adapter *adapt, struct recv_frame *frame);
-};
-
 struct	ss_res {
 	int	state;
 	int	bss_cnt;
-- 
2.30.2

