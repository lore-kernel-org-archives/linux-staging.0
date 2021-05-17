Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1626E2FB6
	for <linux-staging@lists.linux.dev>; Mon, 17 May 2021 20:20:34 +0000 (UTC)
Received: from dslb-084-059-234-229.084.059.pools.vodafone-ip.de ([84.59.234.229] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1lijj1-0001o4-2D; Mon, 17 May 2021 22:20:27 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 5/6] staging: rtl8188eu: use safe iterator in rtw_sta_flush
Date: Mon, 17 May 2021 22:18:25 +0200
Message-Id: <20210517201826.25150-5-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210517201826.25150-1-martin@kaiser.cx>
References: <20210516160613.30489-1-martin@kaiser.cx>
 <20210517201826.25150-1-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use list_for_each_entry_safe, we may delete list items while iterating
over the list.

Fixes: 23017c8842d2 ("staging: rtl8188eu: Use list iterators and helpers")
Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
v2:
 - use list_for_each_entry_safe

 drivers/staging/rtl8188eu/core/rtw_ap.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_ap.c b/drivers/staging/rtl8188eu/core/rtw_ap.c
index d297d5301153..bbecb07274f6 100644
--- a/drivers/staging/rtl8188eu/core/rtw_ap.c
+++ b/drivers/staging/rtl8188eu/core/rtw_ap.c
@@ -1573,8 +1573,8 @@ u8 ap_free_sta(struct adapter *padapter, struct sta_info *psta,
 
 int rtw_sta_flush(struct adapter *padapter)
 {
-	struct list_head *phead, *plist;
-	struct sta_info *psta = NULL;
+	struct list_head *phead;
+	struct sta_info *psta, *temp;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info	*pmlmeinfo = &pmlmeext->mlmext_info;
@@ -1588,9 +1588,7 @@ int rtw_sta_flush(struct adapter *padapter)
 	spin_lock_bh(&pstapriv->asoc_list_lock);
 	phead = &pstapriv->asoc_list;
 	/* free sta asoc_queue */
-	list_for_each(plist, phead) {
-		psta = list_entry(plist, struct sta_info, asoc_list);
-
+	list_for_each_entry_safe(psta, temp, phead, asoc_list) {
 		list_del_init(&psta->asoc_list);
 		pstapriv->asoc_list_cnt--;
 
-- 
2.20.1

