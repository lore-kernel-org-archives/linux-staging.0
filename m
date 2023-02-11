Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734E84408
	for <linux-staging@lists.linux.dev>; Sat, 11 Feb 2023 17:02:35 +0000 (UTC)
Received: from dslb-094-219-036-079.094.219.pools.vodafone-ip.de ([94.219.36.79] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pQtGf-0006zn-Mt; Sat, 11 Feb 2023 18:02:29 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH] staging: r8188eu: replace hand coded loop with list_for_each_entry
Date: Sat, 11 Feb 2023 18:02:23 +0100
Message-Id: <20230211170223.419205-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In function rtw_get_stainfo, we can use list_for_each_entry to iterate
over the list of stations and make the code a bit simpler.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_sta_mgt.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_sta_mgt.c b/drivers/staging/r8188eu/core/rtw_sta_mgt.c
index a9c29b2bf230..e1ae1859686e 100644
--- a/drivers/staging/r8188eu/core/rtw_sta_mgt.c
+++ b/drivers/staging/r8188eu/core/rtw_sta_mgt.c
@@ -391,8 +391,7 @@ void rtw_free_all_stainfo(struct adapter *padapter)
 /* any station allocated can be searched by hash list */
 struct sta_info *rtw_get_stainfo(struct sta_priv *pstapriv, u8 *hwaddr)
 {
-	struct list_head *plist, *phead;
-	struct sta_info *psta = NULL;
+	struct sta_info *ploop, *psta = NULL;
 	u32	index;
 	u8 *addr;
 	u8 bc_addr[ETH_ALEN] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
@@ -409,18 +408,11 @@ struct sta_info *rtw_get_stainfo(struct sta_priv *pstapriv, u8 *hwaddr)
 
 	spin_lock_bh(&pstapriv->sta_hash_lock);
 
-	phead = &pstapriv->sta_hash[index];
-	plist = phead->next;
-
-	while (phead != plist) {
-		psta = container_of(plist, struct sta_info, hash_list);
-
-		if ((!memcmp(psta->hwaddr, addr, ETH_ALEN))) {
-			/*  if found the matched address */
+	list_for_each_entry(ploop, &pstapriv->sta_hash[index], hash_list) {
+		if (!memcmp(ploop->hwaddr, addr, ETH_ALEN)) {
+			psta = ploop;
 			break;
 		}
-		psta = NULL;
-		plist = plist->next;
 	}
 
 	spin_unlock_bh(&pstapriv->sta_hash_lock);
-- 
2.30.2

