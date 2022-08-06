Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49875321B
	for <linux-staging@lists.linux.dev>; Sat,  6 Aug 2022 19:55:58 +0000 (UTC)
Received: from dslb-188-097-043-167.188.097.pools.vodafone-ip.de ([188.97.43.167] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oKPto-0004Tu-1F; Sat, 06 Aug 2022 21:55:52 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 03/13] staging: r8188eu: merge two small functions
Date: Sat,  6 Aug 2022 21:55:30 +0200
Message-Id: <20220806195540.777390-4-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220806195540.777390-1-martin@kaiser.cx>
References: <20220806195540.777390-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All that rtl8188eu_interface_configure does is call
HalUsbSetQueuePipeMapping8188EUsb. We can merge the two functions.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/usb_halinit.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 839841f90d29..ed0faf4fd51d 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -35,18 +35,12 @@ static void _ConfigNormalChipOutEP_8188E(struct adapter *adapt, u8 NumOutPipe)
 	}
 }
 
-static int HalUsbSetQueuePipeMapping8188EUsb(struct adapter *adapt, u8 NumOutPipe)
-{
-
-	_ConfigNormalChipOutEP_8188E(adapt, NumOutPipe);
-	return Hal_MappingOutPipe(adapt, NumOutPipe);
-}
-
 int rtl8188eu_interface_configure(struct adapter *adapt)
 {
 	struct dvobj_priv *pdvobjpriv = adapter_to_dvobj(adapt);
 
-	return HalUsbSetQueuePipeMapping8188EUsb(adapt, pdvobjpriv->RtNumOutPipes);
+	_ConfigNormalChipOutEP_8188E(adapt, pdvobjpriv->RtNumOutPipes);
+	return Hal_MappingOutPipe(adapt, pdvobjpriv->RtNumOutPipes);
 }
 
 u32 rtl8188eu_InitPowerOn(struct adapter *adapt)
-- 
2.30.2

