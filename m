Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D2572
	for <linux-staging@lists.linux.dev>; Sun, 16 May 2021 16:49:54 +0000 (UTC)
Received: from dslb-094-219-038-078.094.219.pools.vodafone-ip.de ([94.219.38.78] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1liJIf-0003Vl-DJ; Sun, 16 May 2021 18:07:29 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 3/6] staging: rtl8188eu: use safe iterator in expire_timeout_chk
Date: Sun, 16 May 2021 18:06:10 +0200
Message-Id: <20210516160613.30489-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210516160613.30489-1-martin@kaiser.cx>
References: <20210516160613.30489-1-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the first loop in expire_timeout_chk, we may call rtw_free_stainfo and
remove an entry from auth_list.

In the second loop, we may call list_del_init on our list.

Use list_for_each_safe for both loops.

Fixes: 23017c8842d2 ("staging: rtl8188eu: Use list iterators and helpers")
Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
compile-tested only

 drivers/staging/rtl8188eu/core/rtw_ap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_ap.c b/drivers/staging/rtl8188eu/core/rtw_ap.c
index ca9a321c4921..a410b42ecb6e 100644
--- a/drivers/staging/rtl8188eu/core/rtw_ap.c
+++ b/drivers/staging/rtl8188eu/core/rtw_ap.c
@@ -164,7 +164,7 @@ static u8 chk_sta_is_alive(struct sta_info *psta)
 
 void expire_timeout_chk(struct adapter *padapter)
 {
-	struct list_head *phead, *plist;
+	struct list_head *phead, *plist, *temp;
 	u8 updated = 0;
 	struct sta_info *psta = NULL;
 	struct sta_priv *pstapriv = &padapter->stapriv;
@@ -176,7 +176,7 @@ void expire_timeout_chk(struct adapter *padapter)
 
 	phead = &pstapriv->auth_list;
 	/* check auth_queue */
-	list_for_each(plist, phead) {
+	list_for_each_safe(plist, temp, phead) {
 		psta = list_entry(plist, struct sta_info, auth_list);
 
 		if (psta->expire_to > 0) {
-- 
2.20.1

