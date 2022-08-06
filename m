Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA883218
	for <linux-staging@lists.linux.dev>; Sat,  6 Aug 2022 19:55:55 +0000 (UTC)
Received: from dslb-188-097-043-167.188.097.pools.vodafone-ip.de ([188.97.43.167] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oKPtm-0004Tu-9y; Sat, 06 Aug 2022 21:55:50 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 01/13] staging: r8188eu: Hal_MappingOutPipe should return an int
Date: Sat,  6 Aug 2022 21:55:28 +0200
Message-Id: <20220806195540.777390-2-martin@kaiser.cx>
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

Update the Hal_MappingOutPipe function to return 0 for success or -EXNIO
if the caller requested more than the number of available endpoints.
This error code is also used by usb_find_common_endpoints if a requested
endpoint was not found.

Unlike a boolean return value, a negative error code can be returned to
external functions that call the r8188eu driver, e.g. to the caller of our
probe function.

HalUsbSetQueuePipeMapping8188EUsb passes the return value of
Hal_MappingOutPipe on to its caller. We have to change its return type
from bool to int as well.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/hal_com.c     | 8 +++-----
 drivers/staging/r8188eu/hal/usb_halinit.c | 2 +-
 drivers/staging/r8188eu/include/hal_com.h | 2 +-
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/hal_com.c b/drivers/staging/r8188eu/hal/hal_com.c
index 6a1cdc67335b..d24e0e5924eb 100644
--- a/drivers/staging/r8188eu/hal/hal_com.c
+++ b/drivers/staging/r8188eu/hal/hal_com.c
@@ -225,11 +225,10 @@ static void three_out_pipe(struct adapter *adapter, bool wifi_cfg)
 	}
 }
 
-bool Hal_MappingOutPipe(struct adapter *adapter, u8 numoutpipe)
+int Hal_MappingOutPipe(struct adapter *adapter, u8 numoutpipe)
 {
 	struct registry_priv *pregistrypriv = &adapter->registrypriv;
 	bool wifi_cfg = pregistrypriv->wifi_spec;
-	bool result = true;
 
 	switch (numoutpipe) {
 	case 2:
@@ -242,10 +241,9 @@ bool Hal_MappingOutPipe(struct adapter *adapter, u8 numoutpipe)
 		one_out_pipe(adapter);
 		break;
 	default:
-		result = false;
-		break;
+		return -ENXIO;
 	}
-	return result;
+	return 0;
 }
 
 /*
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 8b36fb56076e..ba068e6fd9fb 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -35,7 +35,7 @@ static void _ConfigNormalChipOutEP_8188E(struct adapter *adapt, u8 NumOutPipe)
 	}
 }
 
-static bool HalUsbSetQueuePipeMapping8188EUsb(struct adapter *adapt, u8 NumOutPipe)
+static int HalUsbSetQueuePipeMapping8188EUsb(struct adapter *adapt, u8 NumOutPipe)
 {
 
 	_ConfigNormalChipOutEP_8188E(adapt, NumOutPipe);
diff --git a/drivers/staging/r8188eu/include/hal_com.h b/drivers/staging/r8188eu/include/hal_com.h
index d7e333f6ce39..3dfb61e64ee0 100644
--- a/drivers/staging/r8188eu/include/hal_com.h
+++ b/drivers/staging/r8188eu/include/hal_com.h
@@ -143,7 +143,7 @@ u8 MRateToHwRate(u8 rate);
 
 void HalSetBrateCfg(struct adapter *Adapter, u8 *mBratesOS, u16 *pBrateCfg);
 
-bool Hal_MappingOutPipe(struct adapter *pAdapter, u8 NumOutPipe);
+int Hal_MappingOutPipe(struct adapter *pAdapter, u8 NumOutPipe);
 
 s32 c2h_evt_read(struct adapter *adapter, u8 *buf);
 
-- 
2.30.2

