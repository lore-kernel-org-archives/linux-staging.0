Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7BA28F9
	for <linux-staging@lists.linux.dev>; Sun,  8 Jan 2023 18:58:00 +0000 (UTC)
Received: from dslb-188-096-147-053.188.096.pools.vodafone-ip.de ([188.96.147.53] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pEari-0003b8-UQ; Sun, 08 Jan 2023 19:57:55 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 06/13] staging: r8188eu: make rtl8188eu_inirp_init a void function
Date: Sun,  8 Jan 2023 19:57:31 +0100
Message-Id: <20230108185738.597105-7-martin@kaiser.cx>
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

rtl8188eu_inirp_init's return value is not checked by its caller. Make
rtl8188eu_inirp_init a void function.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/usb_halinit.c  | 14 +++-----------
 drivers/staging/r8188eu/include/hal_intf.h |  2 +-
 2 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index d28b4dc2a767..afa24a59fbb3 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -851,29 +851,21 @@ u32 rtl8188eu_hal_deinit(struct adapter *Adapter)
 	return _SUCCESS;
  }
 
-unsigned int rtl8188eu_inirp_init(struct adapter *Adapter)
+void rtl8188eu_inirp_init(struct adapter *Adapter)
 {
 	u8 i;
 	struct recv_buf *precvbuf;
-	uint	status;
 	struct recv_priv *precvpriv = &Adapter->recvpriv;
 
-	status = _SUCCESS;
-
 	/* issue Rx irp to receive data */
 	precvbuf = (struct recv_buf *)precvpriv->precv_buf;
 	for (i = 0; i < NR_RECVBUFF; i++) {
-		if (!rtw_read_port(Adapter, (unsigned char *)precvbuf)) {
-			status = _FAIL;
-			goto exit;
-		}
+		if (!rtw_read_port(Adapter, (unsigned char *)precvbuf))
+			return;
 
 		precvbuf++;
 		precvpriv->free_recv_buf_queue_cnt--;
 	}
-
-exit:
-	return status;
 }
 
 /*  */
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index ac6e3f95c5b7..767f97c5f85d 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -26,7 +26,7 @@ void UpdateHalRAMask8188EUsb(struct adapter *adapt, u32 mac_id, u8 rssi_level);
 int rtl8188e_IOL_exec_cmds_sync(struct adapter *adapter,
 				struct xmit_frame *xmit_frame, u32 max_wating_ms, u32 bndy_cnt);
 
-unsigned int rtl8188eu_inirp_init(struct adapter *Adapter);
+void rtl8188eu_inirp_init(struct adapter *Adapter);
 
 uint rtw_hal_init(struct adapter *padapter);
 uint rtw_hal_deinit(struct adapter *padapter);
-- 
2.30.2

