Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63859808
	for <linux-staging@lists.linux.dev>; Tue, 31 Jan 2023 09:01:08 +0000 (UTC)
Received: from dslb-188-096-143-205.188.096.pools.vodafone-ip.de ([188.96.143.205] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pMmVh-00052y-H3; Tue, 31 Jan 2023 10:01:01 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH] staging: r8188eu: fix NULL check for rcu pointer
Date: Tue, 31 Jan 2023 10:00:57 +0100
Message-Id: <20230131090057.241779-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the NULL check for padapter->pnetdev->rx_handler_data.

The current code calls rcu_dereference while it holds the rcu read lock
and checks the pointer after releasing the lock. An rcu pointer may only be
used between calls to rcu_read_lock and rcu_read_unlock.

Replace the check with rcu_access_pointer. My understanding is that this
function returns the value of the pointer and needs no locking. We can
then check the pointer but we must not dereference it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_xmit.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 91f92ec5ef69..18941320e70e 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -1631,18 +1631,14 @@ s32 rtw_xmit(struct adapter *padapter, struct sk_buff **ppkt)
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 	struct xmit_frame *pxmitframe = NULL;
 	struct mlme_priv	*pmlmepriv = &padapter->mlmepriv;
-	void *br_port = NULL;
 	s32 res;
 
 	pxmitframe = rtw_alloc_xmitframe(pxmitpriv);
 	if (!pxmitframe)
 		return -1;
 
-	rcu_read_lock();
-	br_port = rcu_dereference(padapter->pnetdev->rx_handler_data);
-	rcu_read_unlock();
-
-	if (br_port && check_fwstate(pmlmepriv, WIFI_STATION_STATE | WIFI_ADHOC_STATE)) {
+	if (rcu_access_pointer(padapter->pnetdev->rx_handler_data) &&
+	    check_fwstate(pmlmepriv, WIFI_STATION_STATE | WIFI_ADHOC_STATE)) {
 		res = rtw_br_client_tx(padapter, ppkt);
 		if (res == -1) {
 			rtw_free_xmitframe(pxmitpriv, pxmitframe);
-- 
2.30.2

