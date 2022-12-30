Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDCB4C95
	for <linux-staging@lists.linux.dev>; Fri, 30 Dec 2022 18:07:16 +0000 (UTC)
Received: from dslb-188-097-208-179.188.097.pools.vodafone-ip.de ([188.97.208.179] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pBJmi-0004rR-BI; Fri, 30 Dec 2022 19:07:12 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 08/20] staging: r8188eu: remove duplicate psta check
Date: Fri, 30 Dec 2022 19:06:34 +0100
Message-Id: <20221230180646.91008-9-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221230180646.91008-1-martin@kaiser.cx>
References: <20221230180646.91008-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We do not need the psta check in the while loop of rtw_xmitframe_coalesce.
psta is already checked near the start of the function and is not modified
afterwards.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_xmit.c | 36 ++++++++++++-------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 62b66a205a06..2bccb9ca42e9 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -1009,25 +1009,23 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 
 		/* adding icv, if necessary... */
 		if (pattrib->iv_len) {
-			if (psta) {
-				switch (pattrib->encrypt) {
-				case _WEP40_:
-				case _WEP104_:
-					WEP_IV(pattrib->iv, psta->dot11txpn, pattrib->key_idx);
-					break;
-				case _TKIP_:
-					if (bmcst)
-						TKIP_IV(pattrib->iv, psta->dot11txpn, pattrib->key_idx);
-					else
-						TKIP_IV(pattrib->iv, psta->dot11txpn, 0);
-					break;
-				case _AES_:
-					if (bmcst)
-						AES_IV(pattrib->iv, psta->dot11txpn, pattrib->key_idx);
-					else
-						AES_IV(pattrib->iv, psta->dot11txpn, 0);
-					break;
-				}
+			switch (pattrib->encrypt) {
+			case _WEP40_:
+			case _WEP104_:
+				WEP_IV(pattrib->iv, psta->dot11txpn, pattrib->key_idx);
+				break;
+			case _TKIP_:
+				if (bmcst)
+					TKIP_IV(pattrib->iv, psta->dot11txpn, pattrib->key_idx);
+				else
+					TKIP_IV(pattrib->iv, psta->dot11txpn, 0);
+				break;
+			case _AES_:
+				if (bmcst)
+					AES_IV(pattrib->iv, psta->dot11txpn, pattrib->key_idx);
+				else
+					AES_IV(pattrib->iv, psta->dot11txpn, 0);
+				break;
 			}
 
 			memcpy(pframe, pattrib->iv, pattrib->iv_len);
-- 
2.30.2

