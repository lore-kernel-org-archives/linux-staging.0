Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFF53214
	for <linux-staging@lists.linux.dev>; Mon,  2 May 2022 20:07:17 +0000 (UTC)
Received: from ipservice-092-217-077-109.092.217.pools.vodafone-ip.de ([92.217.77.109] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nlcK9-0007ch-Na; Mon, 02 May 2022 22:07:13 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 4/9] staging: r8188eu: remove action_handler string
Date: Mon,  2 May 2022 22:06:47 +0200
Message-Id: <20220502200652.143665-5-martin@kaiser.cx>
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

Remove the unused str component from struct action_handler and the
corresponding entries in OnAction_tbl.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c    | 6 +++---
 drivers/staging/r8188eu/include/rtw_mlme_ext.h | 1 -
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index a581930b05df..9c83a74f0795 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -33,9 +33,9 @@ static mlme_handler mlme_sta_tbl[] = {
 };
 
 static struct action_handler OnAction_tbl[] = {
-	{RTW_WLAN_CATEGORY_BACK, "ACTION_BACK", &OnAction_back},
-	{RTW_WLAN_CATEGORY_PUBLIC, "ACTION_PUBLIC", on_action_public},
-	{RTW_WLAN_CATEGORY_P2P, "ACTION_P2P", &OnAction_p2p},
+	{RTW_WLAN_CATEGORY_BACK, &OnAction_back},
+	{RTW_WLAN_CATEGORY_PUBLIC, on_action_public},
+	{RTW_WLAN_CATEGORY_P2P, &OnAction_p2p},
 };
 
 static u8 null_addr[ETH_ALEN] = {0, 0, 0, 0, 0, 0};
diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
index 136879a0a0f9..63e4ee8e3dfb 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
@@ -188,7 +188,6 @@ typedef unsigned int (*mlme_handler)(struct adapter *adapt, struct recv_frame *f
 
 struct action_handler {
 	unsigned int   num;
-	char* str;
 	unsigned int (*func)(struct adapter *adapt, struct recv_frame *frame);
 };
 
-- 
2.30.2

