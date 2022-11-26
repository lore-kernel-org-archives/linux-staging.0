Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F83A23CD
	for <linux-staging@lists.linux.dev>; Sat, 26 Nov 2022 16:01:46 +0000 (UTC)
Received: from dslb-188-096-151-149.188.096.pools.vodafone-ip.de ([188.96.151.149] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oyxcb-0000Ub-K2; Sat, 26 Nov 2022 17:01:41 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 10/10] staging: r8188eu: remove a variable
Date: Sat, 26 Nov 2022 17:01:29 +0100
Message-Id: <20221126160129.178697-11-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221126160129.178697-1-martin@kaiser.cx>
References: <20221126160129.178697-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check the result of rtw_check_bcn_info directly and remove the ret
variable.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 362313c49c52..d32b2d569e23 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -555,7 +555,6 @@ static void OnBeacon(struct adapter *padapter, struct recv_frame *precv_frame)
 	u8 *pframe = precv_frame->rx_data;
 	uint len = precv_frame->len;
 	struct wlan_bssid_ex *pbss;
-	int ret = _SUCCESS;
 	u8 *ie_ptr;
 	u32 ie_len;
 
@@ -600,8 +599,7 @@ static void OnBeacon(struct adapter *padapter, struct recv_frame *precv_frame)
 		if (!psta)
 			return;
 
-		ret = rtw_check_bcn_info(padapter, pframe, len);
-		if (!ret) {
+		if (rtw_check_bcn_info(padapter, pframe, len) != _SUCCESS) {
 			receive_disconnect(padapter, pmlmeinfo->network.MacAddress, 0);
 			return;
 		}
-- 
2.30.2

