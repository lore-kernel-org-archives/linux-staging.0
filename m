Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247B733CF
	for <linux-staging@lists.linux.dev>; Fri, 30 Dec 2022 18:07:14 +0000 (UTC)
Received: from dslb-188-097-208-179.188.097.pools.vodafone-ip.de ([188.97.208.179] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pBJmf-0004rR-6C; Fri, 30 Dec 2022 19:07:09 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 04/20] staging: r8188eu: return immediately if we're not meant to encrypt
Date: Fri, 30 Dec 2022 19:06:30 +0100
Message-Id: <20221230180646.91008-5-martin@kaiser.cx>
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

In function xmitframe_swencrypt, we can return immediately if our packet
needs no encryption. This is simpler than wrapping all the code into a
large if statement.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_xmit.c | 31 +++++++++++++------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 4cd457cfb791..35d291d78c60 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -765,21 +765,22 @@ static void xmitframe_swencrypt(struct adapter *padapter, struct xmit_frame *pxm
 {
 	struct	pkt_attrib	 *pattrib = &pxmitframe->attrib;
 
-	if (pattrib->bswenc) {
-		switch (pattrib->encrypt) {
-		case _WEP40_:
-		case _WEP104_:
-			rtw_wep_encrypt(padapter, pxmitframe);
-			break;
-		case _TKIP_:
-			rtw_tkip_encrypt(padapter, pxmitframe);
-			break;
-		case _AES_:
-			rtw_aes_encrypt(padapter, pxmitframe);
-			break;
-		default:
-			break;
-		}
+	if (!pattrib->bswenc)
+		return;
+
+	switch (pattrib->encrypt) {
+	case _WEP40_:
+	case _WEP104_:
+		rtw_wep_encrypt(padapter, pxmitframe);
+		break;
+	case _TKIP_:
+		rtw_tkip_encrypt(padapter, pxmitframe);
+		break;
+	case _AES_:
+		rtw_aes_encrypt(padapter, pxmitframe);
+		break;
+	default:
+		break;
 	}
 }
 
-- 
2.30.2

