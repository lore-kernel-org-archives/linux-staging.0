Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8498E6111
	for <linux-staging@lists.linux.dev>; Mon,  6 Feb 2023 20:18:19 +0000 (UTC)
Received: from ipservice-092-217-084-033.092.217.pools.vodafone-ip.de ([92.217.84.33] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pP7wH-0007ps-N2; Mon, 06 Feb 2023 21:18:09 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 3/6] staging: r8188eu: use standard error codes in rtl8188eu_inirp_init
Date: Mon,  6 Feb 2023 21:17:57 +0100
Message-Id: <20230206201800.139195-4-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230206201800.139195-1-martin@kaiser.cx>
References: <20230206201800.139195-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the driver-specific _SUCCESS and _FAIL error codes in
rtl8188eu_inirp_init. Return 0 for success or a negative error
code as we do elsewhere in the kernel.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/usb_halinit.c  | 16 ++++++----------
 drivers/staging/r8188eu/include/hal_intf.h |  2 +-
 2 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 25fd6f8d814c..a1051ac1cac4 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -848,29 +848,25 @@ u32 rtl8188eu_hal_deinit(struct adapter *Adapter)
 	return _SUCCESS;
  }
 
-unsigned int rtl8188eu_inirp_init(struct adapter *Adapter)
+int rtl8188eu_inirp_init(struct adapter *Adapter)
 {
 	u8 i;
 	struct recv_buf *precvbuf;
-	uint	status;
 	struct recv_priv *precvpriv = &Adapter->recvpriv;
-
-	status = _SUCCESS;
+	int ret;
 
 	/* issue Rx irp to receive data */
 	precvbuf = (struct recv_buf *)precvpriv->precv_buf;
 	for (i = 0; i < NR_RECVBUFF; i++) {
-		if (!rtw_read_port(Adapter, precvbuf)) {
-			status = _FAIL;
-			goto exit;
-		}
+		ret = rtw_read_port(Adapter, precvbuf);
+		if (ret)
+			return ret;
 
 		precvbuf++;
 		precvpriv->free_recv_buf_queue_cnt--;
 	}
 
-exit:
-	return status;
+	return 0;
 }
 
 /*  */
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index ac6e3f95c5b7..296aa5b8268d 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -26,7 +26,7 @@ void UpdateHalRAMask8188EUsb(struct adapter *adapt, u32 mac_id, u8 rssi_level);
 int rtl8188e_IOL_exec_cmds_sync(struct adapter *adapter,
 				struct xmit_frame *xmit_frame, u32 max_wating_ms, u32 bndy_cnt);
 
-unsigned int rtl8188eu_inirp_init(struct adapter *Adapter);
+int rtl8188eu_inirp_init(struct adapter *Adapter);
 
 uint rtw_hal_init(struct adapter *padapter);
 uint rtw_hal_deinit(struct adapter *padapter);
-- 
2.30.2

