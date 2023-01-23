Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C225B880A
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 20:54:09 +0000 (UTC)
Received: from ipservice-092-217-089-134.092.217.pools.vodafone-ip.de ([92.217.89.134] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pK3pM-0000Lk-P5; Mon, 23 Jan 2023 21:54:04 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 12/23] staging: r8188eu: remove redundant parameter
Date: Mon, 23 Jan 2023 21:53:31 +0100
Message-Id: <20230123205342.229589-13-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230123205342.229589-1-martin@kaiser.cx>
References: <20230123205342.229589-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rtl8188eu_xmitframe_complete function takes two parameters: adapter
and xmit_priv. xmit_priv is part of struct adapter, this parameter can be
removed.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/rtl8188eu_xmit.c    | 3 ++-
 drivers/staging/r8188eu/hal/usb_ops_linux.c     | 3 +--
 drivers/staging/r8188eu/include/rtl8188e_xmit.h | 3 +--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c b/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
index e097fa14dc6e..e067cc271686 100644
--- a/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
+++ b/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
@@ -365,8 +365,9 @@ static u32 xmitframe_need_length(struct xmit_frame *pxmitframe)
 	return len;
 }
 
-bool rtl8188eu_xmitframe_complete(struct adapter *adapt, struct xmit_priv *pxmitpriv)
+bool rtl8188eu_xmitframe_complete(struct adapter *adapt)
 {
+	struct xmit_priv *pxmitpriv = &adapt->xmitpriv;
 	struct dvobj_priv *pdvobjpriv = adapter_to_dvobj(adapt);
 	struct xmit_frame *pxmitframe = NULL;
 	struct xmit_frame *pfirstframe = NULL;
diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 9f008e61a6f2..e122c8ca929c 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -463,7 +463,6 @@ u32 rtw_read_port(struct adapter *adapter, u8 *rmem)
 void rtl8188eu_xmit_tasklet(unsigned long priv)
 {
 	struct adapter *adapt = (struct adapter *)priv;
-	struct xmit_priv *pxmitpriv = &adapt->xmitpriv;
 
 	if (check_fwstate(&adapt->mlmepriv, _FW_UNDER_SURVEY))
 		return;
@@ -471,5 +470,5 @@ void rtl8188eu_xmit_tasklet(unsigned long priv)
 	do {
 		if (adapt->bDriverStopped || adapt->bSurpriseRemoved || adapt->bWritePortCancel)
 			break;
-	} while (rtl8188eu_xmitframe_complete(adapt, pxmitpriv));
+	} while (rtl8188eu_xmitframe_complete(adapt));
 }
diff --git a/drivers/staging/r8188eu/include/rtl8188e_xmit.h b/drivers/staging/r8188eu/include/rtl8188e_xmit.h
index e6d343ffc148..a023dd792da7 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_xmit.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_xmit.h
@@ -125,7 +125,6 @@ s32 rtl8188eu_hal_xmit(struct adapter *padapter, struct xmit_frame *frame);
 s32 rtl8188eu_mgnt_xmit(struct adapter *padapter, struct xmit_frame *frame);
 s32 rtl8188eu_xmit_buf_handler(struct adapter *padapter);
 void rtl8188eu_xmit_tasklet(unsigned long priv);
-bool rtl8188eu_xmitframe_complete(struct adapter *padapter,
-				 struct xmit_priv *pxmitpriv);
+bool rtl8188eu_xmitframe_complete(struct adapter *padapter);
 
 #endif /* __RTL8188E_XMIT_H__ */
-- 
2.30.2

