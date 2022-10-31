Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B50443D
	for <linux-staging@lists.linux.dev>; Mon, 31 Oct 2022 20:52:15 +0000 (UTC)
Received: from dslb-084-059-234-234.084.059.pools.vodafone-ip.de ([84.59.234.234] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1opblL-0006y5-FT; Mon, 31 Oct 2022 21:52:03 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>,
	Joe Perches <joe@perches.com>
Subject: [PATCH] staging: r8188eu: use ether_addr_equal in OnAction
Date: Mon, 31 Oct 2022 21:51:41 +0100
Message-Id: <20221031205140.124682-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use ether_addr_equal to compare two mac addresses in OnAction.

Both struct ieee80211_mgmt and struct eeprom_priv's mac_addr component
are 2-byte aligned.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index e985fc5fc575..6679d4037d6b 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -3823,7 +3823,7 @@ static void OnAction(struct adapter *padapter, struct recv_frame *precv_frame)
 {
 	struct ieee80211_mgmt *mgmt = (struct ieee80211_mgmt *)precv_frame->rx_data;
 
-	if (memcmp(myid(&padapter->eeprompriv), mgmt->da, ETH_ALEN))
+	if (!ether_addr_equal(myid(&padapter->eeprompriv), mgmt->da))
 		return;
 
 	switch (mgmt->u.action.category) {
-- 
2.30.2

