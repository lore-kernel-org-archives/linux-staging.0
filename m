Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260161386
	for <linux-staging@lists.linux.dev>; Sat,  6 Aug 2022 11:14:21 +0000 (UTC)
Received: from dslb-188-097-043-167.188.097.pools.vodafone-ip.de ([188.97.43.167] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oKHkw-0001FX-PE; Sat, 06 Aug 2022 13:14:10 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 5/5] staging: r8188eu: simplify the calculation of ie start offset
Date: Sat,  6 Aug 2022 13:13:52 +0200
Message-Id: <20220806111352.690650-6-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220806111352.690650-1-martin@kaiser.cx>
References: <20220724153917.138848-1-martin@kaiser.cx>
 <20220806111352.690650-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use offsetof to calculate the start offset of the information elements in
an association response message. This should make it easier to understand
how the offset is calculated.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
v2:
 - rewrite the commit message

 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 10074355b82d..6d3d5ff9a00e 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -1359,7 +1359,7 @@ unsigned int OnAssocRsp(struct adapter *padapter, struct recv_frame *precv_frame
 	/* following are moved to join event callback function */
 	/* to handle HT, WMM, rate adaptive, update MAC reg */
 	/* for not to handle the synchronous IO in the tasklet */
-	for (i = (6 + WLAN_HDR_A3_LEN); i < pkt_len;) {
+	for (i = offsetof(struct ieee80211_mgmt, u.assoc_resp.variable); i < pkt_len;) {
 		pIE = (struct ndis_802_11_var_ie *)(pframe + i);
 
 		switch (pIE->ElementID) {
-- 
2.30.2

