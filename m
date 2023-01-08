Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00DB2912
	for <linux-staging@lists.linux.dev>; Sun,  8 Jan 2023 18:58:01 +0000 (UTC)
Received: from dslb-188-096-147-053.188.096.pools.vodafone-ip.de ([188.96.147.53] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pEark-0003b8-GJ; Sun, 08 Jan 2023 19:57:56 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 08/13] staging: r8188eu: remove unused hal_xmit_handler define
Date: Sun,  8 Jan 2023 19:57:33 +0100
Message-Id: <20230108185738.597105-9-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230108185738.597105-1-martin@kaiser.cx>
References: <20230108185738.597105-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hal_xmit_handler is not used by the r8188eu driver. Remove it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/rtl8188e_xmit.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/rtl8188e_xmit.h b/drivers/staging/r8188eu/include/rtl8188e_xmit.h
index 82439f52b0c8..230ea191d256 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_xmit.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_xmit.h
@@ -134,7 +134,6 @@ void rtl8188e_fill_fake_txdesc(struct adapter *padapter, u8 *pDesc,
 s32 rtl8188eu_hal_xmit(struct adapter *padapter, struct xmit_frame *frame);
 s32 rtl8188eu_mgnt_xmit(struct adapter *padapter, struct xmit_frame *frame);
 s32 rtl8188eu_xmit_buf_handler(struct adapter *padapter);
-#define hal_xmit_handler rtl8188eu_xmit_buf_handler
 void rtl8188eu_xmit_tasklet(unsigned long priv);
 bool rtl8188eu_xmitframe_complete(struct adapter *padapter,
 				 struct xmit_priv *pxmitpriv);
-- 
2.30.2

