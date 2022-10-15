Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA33210C
	for <linux-staging@lists.linux.dev>; Sat, 15 Oct 2022 15:24:59 +0000 (UTC)
Received: from ipservice-092-217-066-135.092.217.pools.vodafone-ip.de ([92.217.66.135] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1ojj20-000722-7k; Sat, 15 Oct 2022 17:24:56 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 9/9] staging: r8188eu: ignore_received_deauth is a boolean
Date: Sat, 15 Oct 2022 17:24:40 +0200
Message-Id: <20221015152440.232281-10-martin@kaiser.cx>
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

The ignore_received_deauth is in fact a boolean variable. Change its type
to bool and use true, false for its values.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 09ffecc5b2b3..fda446b6779c 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -1493,7 +1493,7 @@ unsigned int OnDeAuth(struct adapter *padapter, struct recv_frame *precv_frame)
 
 		associated_clients_update(padapter, updated);
 	} else {
-		int	ignore_received_deauth = 0;
+		bool ignore_received_deauth = false;
 
 		/* Before sending the auth frame to start the STA/GC mode connection with AP/GO,
 		 *	we will send the deauth first.
@@ -1502,10 +1502,10 @@ unsigned int OnDeAuth(struct adapter *padapter, struct recv_frame *precv_frame)
 		 */
 		if (pmlmeinfo->state & (WIFI_FW_AUTH_STATE | WIFI_FW_ASSOC_STATE)) {
 			if (reason == WLAN_REASON_CLASS2_FRAME_FROM_NONAUTH_STA) {
-				ignore_received_deauth = 1;
+				ignore_received_deauth = true;
 			} else if (reason == WLAN_REASON_PREV_AUTH_NOT_VALID) {
 				// TODO: 802.11r
-				ignore_received_deauth = 1;
+				ignore_received_deauth = true;
 			}
 		}
 
-- 
2.30.2

