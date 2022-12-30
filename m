Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B5133F6
	for <linux-staging@lists.linux.dev>; Fri, 30 Dec 2022 18:07:16 +0000 (UTC)
Received: from dslb-188-097-208-179.188.097.pools.vodafone-ip.de ([188.97.208.179] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pBJmg-0004rR-Oj; Fri, 30 Dec 2022 19:07:10 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 06/20] staging: r8188eu: simplify rtl8188eu_xmit_tasklet
Date: Fri, 30 Dec 2022 19:06:32 +0100
Message-Id: <20221230180646.91008-7-martin@kaiser.cx>
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

Simplify the rtl8188eu_xmit_tasklet function. Remove an unnecessary
temporary variable and reformat the code.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index c51f860d3527..a238d29a3a46 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -481,22 +481,14 @@ u32 rtw_read_port(struct adapter *adapter, u8 *rmem)
 
 void rtl8188eu_xmit_tasklet(unsigned long priv)
 {
-	int ret = false;
 	struct adapter *adapt = (struct adapter *)priv;
 	struct xmit_priv *pxmitpriv = &adapt->xmitpriv;
 
 	if (check_fwstate(&adapt->mlmepriv, _FW_UNDER_SURVEY))
 		return;
 
-	while (1) {
-		if ((adapt->bDriverStopped) ||
-		    (adapt->bSurpriseRemoved) ||
-		    (adapt->bWritePortCancel))
-			break;
-
-		ret = rtl8188eu_xmitframe_complete(adapt, pxmitpriv);
-
-		if (!ret)
+	do {
+		if (adapt->bDriverStopped || adapt->bSurpriseRemoved || adapt->bWritePortCancel)
 			break;
-	}
+	} while (rtl8188eu_xmitframe_complete(adapt, pxmitpriv));
 }
-- 
2.30.2

