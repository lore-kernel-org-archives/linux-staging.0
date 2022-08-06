Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B00D321B
	for <linux-staging@lists.linux.dev>; Sat,  6 Aug 2022 19:55:56 +0000 (UTC)
Received: from dslb-188-097-043-167.188.097.pools.vodafone-ip.de ([188.97.43.167] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oKPtn-0004Tu-6C; Sat, 06 Aug 2022 21:55:51 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 02/13] staging: r8188eu: process HalUsbSetQueuePipeMapping8188EUsb's return value
Date: Sat,  6 Aug 2022 21:55:29 +0200
Message-Id: <20220806195540.777390-3-martin@kaiser.cx>
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

At the moment, HalUsbSetQueuePipeMapping8188EUsb returns an error status
to rtl8188eu_interface_configure, where this status is discarded.

Pass the error status from rtl8188eu_interface_configure to
rtw_usb_if1_init and handle it there.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/usb_halinit.c  | 4 ++--
 drivers/staging/r8188eu/include/hal_intf.h | 2 +-
 drivers/staging/r8188eu/os_dep/usb_intf.c  | 4 +++-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index ba068e6fd9fb..839841f90d29 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -42,11 +42,11 @@ static int HalUsbSetQueuePipeMapping8188EUsb(struct adapter *adapt, u8 NumOutPip
 	return Hal_MappingOutPipe(adapt, NumOutPipe);
 }
 
-void rtl8188eu_interface_configure(struct adapter *adapt)
+int rtl8188eu_interface_configure(struct adapter *adapt)
 {
 	struct dvobj_priv *pdvobjpriv = adapter_to_dvobj(adapt);
 
-	HalUsbSetQueuePipeMapping8188EUsb(adapt, pdvobjpriv->RtNumOutPipes);
+	return HalUsbSetQueuePipeMapping8188EUsb(adapt, pdvobjpriv->RtNumOutPipes);
 }
 
 u32 rtl8188eu_InitPowerOn(struct adapter *adapt)
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 3ed5b7e031cd..fd8e792958ce 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -10,7 +10,7 @@
 
 typedef s32 (*c2h_id_filter)(u8 id);
 
-void rtl8188eu_interface_configure(struct adapter *adapt);
+int rtl8188eu_interface_configure(struct adapter *adapt);
 int ReadAdapterInfo8188EU(struct adapter *Adapter);
 void rtl8188eu_init_default_value(struct adapter *adapt);
 void rtl8188e_SetHalODMVar(struct adapter *Adapter, void *pValue1, bool bSet);
diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index db91f72dd40f..2b330104a55d 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -330,7 +330,9 @@ static int rtw_usb_if1_init(struct dvobj_priv *dvobj, struct usb_interface *pusb
 	rtl8188e_read_chip_version(padapter);
 
 	/* step usb endpoint mapping */
-	rtl8188eu_interface_configure(padapter);
+	ret = rtl8188eu_interface_configure(padapter);
+	if (ret)
+		goto handle_dualmac;
 
 	/* step read efuse/eeprom data and get mac_addr */
 	ret = ReadAdapterInfo8188EU(padapter);
-- 
2.30.2

