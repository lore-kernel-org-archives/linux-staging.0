Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7621772
	for <linux-staging@lists.linux.dev>; Sun, 16 May 2021 16:49:46 +0000 (UTC)
Received: from dslb-094-219-038-078.094.219.pools.vodafone-ip.de ([94.219.38.78] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1liJId-0003Vl-Nf; Sun, 16 May 2021 18:07:27 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 2/6] staging: rtl8188eu: use safe iterator in rtw_free_all_stainfo
Date: Sun, 16 May 2021 18:06:09 +0200
Message-Id: <20210516160613.30489-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210516160613.30489-1-martin@kaiser.cx>
References: <20210516160613.30489-1-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is another case where we may remove list entries while we iterate over
the list. Use list_for_each_safe to avoid an endless loop.

Fixes: 23017c8842d2 ("staging: rtl8188eu: Use list iterators and helpers")
Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
Without this patch, unloading the module goes into an endless loop
sometimes.

 drivers/staging/rtl8188eu/core/rtw_sta_mgt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_sta_mgt.c b/drivers/staging/rtl8188eu/core/rtw_sta_mgt.c
index 7941ca0397ed..eda7a441acde 100644
--- a/drivers/staging/rtl8188eu/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8188eu/core/rtw_sta_mgt.c
@@ -379,7 +379,7 @@ u32 rtw_free_stainfo(struct adapter *padapter, struct sta_info *psta)
 /*  free all stainfo which in sta_hash[all] */
 void rtw_free_all_stainfo(struct adapter *padapter)
 {
-	struct list_head *plist, *phead;
+	struct list_head *plist, *phead, *temp;
 	s32 index;
 	struct sta_info *psta = NULL;
 	struct sta_priv *pstapriv = &padapter->stapriv;
@@ -392,7 +392,7 @@ void rtw_free_all_stainfo(struct adapter *padapter)
 
 	for (index = 0; index < NUM_STA; index++) {
 		phead = &pstapriv->sta_hash[index];
-		list_for_each(plist, phead) {
+		list_for_each_safe(plist, temp, phead) {
 			psta = list_entry(plist, struct sta_info, hash_list);
 
 			if (pbcmc_stainfo != psta)
-- 
2.20.1

