Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2519A2106
	for <linux-staging@lists.linux.dev>; Sat, 15 Oct 2022 15:24:58 +0000 (UTC)
Received: from ipservice-092-217-066-135.092.217.pools.vodafone-ip.de ([92.217.66.135] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1ojj1z-000722-Cb; Sat, 15 Oct 2022 17:24:55 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 8/9] staging: r8188eu: summarize two flags checks
Date: Sat, 15 Oct 2022 17:24:39 +0200
Message-Id: <20221015152440.232281-9-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221015152440.232281-1-martin@kaiser.cx>
References: <20221015152440.232281-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Summarize the two statements to check if either WIFI_FW_AUTH_STATE or
WIFI_FW_ASSOC_STATE is set.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 465f51bce0e3..09ffecc5b2b3 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -1500,8 +1500,7 @@ unsigned int OnDeAuth(struct adapter *padapter, struct recv_frame *precv_frame)
 		 *	However, the Win8.1 with BRCM Wi-Fi will send the deauth with reason code 6 to us after receieving our deauth.
 		 *	Added the following code to avoid this case.
 		 */
-		if ((pmlmeinfo->state & WIFI_FW_AUTH_STATE) ||
-		    (pmlmeinfo->state & WIFI_FW_ASSOC_STATE)) {
+		if (pmlmeinfo->state & (WIFI_FW_AUTH_STATE | WIFI_FW_ASSOC_STATE)) {
 			if (reason == WLAN_REASON_CLASS2_FRAME_FROM_NONAUTH_STA) {
 				ignore_received_deauth = 1;
 			} else if (reason == WLAN_REASON_PREV_AUTH_NOT_VALID) {
-- 
2.30.2

