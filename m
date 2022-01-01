Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC65F2CA6
	for <linux-staging@lists.linux.dev>; Sat,  1 Jan 2022 08:49:54 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id o3so1530864wrh.10
        for <linux-staging@lists.linux.dev>; Sat, 01 Jan 2022 00:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fZkQCyjgnnx4rx3Sb/nBNm6G3aX374d2a0MfjOD+6ec=;
        b=Sybhx02EkBFbvZOR3XR5V2eT+cdFzcRaUqYw4aW0s6oikiiYIDJBpNTyJc/X0mHMNc
         qk8dlNvt7sjpYmSi/MlwhVdSZlsTRRGRi+2ZEyv4lRBZau4I2hYnjR9rAaFm4GMG0amC
         xsqIcp8jglMNFKxCM9noHJyIX2mF+YSt/2P8YZG7ALUc1B+F+JLx7rXDQFJFpRiGG9bB
         nkHwJ4g6hAfqoZgqkV/OZ68pIht3lQT6BmtaR+VNRtfeg61i3HZenrO7gjOV3G2QXc9S
         KVIceQhf+8EG7bVwbAwClD9yVFchjY3G+oXsJsxD7QKxLDNKnMndtyOr8dmJdsSwEIYO
         lFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fZkQCyjgnnx4rx3Sb/nBNm6G3aX374d2a0MfjOD+6ec=;
        b=nTLoaAigvFajUbksqYIonRUZijlXPKcX4exKwX9CBvmh0y9hu683i13fuj/XeCCTUQ
         DOikmWaOGYzg7EUvEgaHmfd5qJ8WBJ+N6mnl+p4k7ldbSnh78VK2COAGeDs9+J7wN0qh
         NYlp7+nE6qRQDkZHH5+VN/7hZABpp/8tduQxFIpPP9A9eqD6nYOSJlx6HjIToPcwA/8N
         jKkJCtHQ22B/icKHZPRJh/QJ7YBZzjiPmVy3WElSmMsLGAiVftbBzMLesvOqAvGS1lIA
         qBHiC3thqQdUndbO/azJVYTRTv6+j8DX5zdLcfqJ2yifkeuuhZVLU36m0Kd2r89BEZtK
         dbAg==
X-Gm-Message-State: AOAM5324z4egpBaln0dlgWy9nsWvMVHXJbbAj2aABpnWjgwxrJDF0da/
	aak5ebXsd0aC3PhCBq/tKNI=
X-Google-Smtp-Source: ABdhPJx6zSe6Kh9Z4dazVFhy3Kj6LxmnoOjYto7ujNy1nScVms71ewUF0u2PqvlfVUBhutz2wg3aMg==
X-Received: by 2002:adf:fbcf:: with SMTP id d15mr20265320wrs.132.1641026993306;
        Sat, 01 Jan 2022 00:49:53 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::d7e8])
        by smtp.gmail.com with ESMTPSA id o9sm14806578wri.97.2022.01.01.00.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jan 2022 00:49:53 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 6/7] staging: r8188eu: IntArray and C2hArray are set but never used
Date: Sat,  1 Jan 2022 09:49:36 +0100
Message-Id: <20220101084937.3411-7-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220101084937.3411-1-straube.linux@gmail.com>
References: <20220101084937.3411-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fields IntArray and C2hArray of struct hal_data_8188e are set but
never used. Remove them and remove interrupt_handler_8188eu() since it
does nothing now.

While at it, remove the unsed defines USB_INTR_CONTENT_CPWM1_OFFSET
and USB_INTR_CONTENT_CPWM2_OFFSET as well.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v3: Remove INTERRUPT_MSG_FORMAT_LEN from rtl8188e_recv.h.
v2: Remove interrupt_handler_8188eu() since it does nothing now.

 drivers/staging/r8188eu/hal/usb_ops_linux.c   | 20 -------------------
 .../staging/r8188eu/include/rtl8188e_hal.h    |  3 ---
 .../staging/r8188eu/include/rtl8188e_recv.h   |  1 -
 .../staging/r8188eu/include/rtl8188e_spec.h   |  7 -------
 4 files changed, 31 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 9ec55a77dccd..4a0ab4053e90 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -183,24 +183,6 @@ int rtw_writeN(struct adapter *adapter, u32 addr, u32 length, u8 *data)
 	return RTW_STATUS_CODE(ret);
 }
 
-static void interrupt_handler_8188eu(struct adapter *adapt, u16 pkt_len, u8 *pbuf)
-{
-	struct hal_data_8188e *haldata = &adapt->haldata;
-
-	if (pkt_len != INTERRUPT_MSG_FORMAT_LEN) {
-		DBG_88E("%s Invalid interrupt content length (%d)!\n", __func__, pkt_len);
-		return;
-	}
-
-	/*  HISR */
-	memcpy(&haldata->IntArray[0], &pbuf[USB_INTR_CONTENT_HISR_OFFSET], 4);
-	memcpy(&haldata->IntArray[1], &pbuf[USB_INTR_CONTENT_HISRE_OFFSET], 4);
-
-	/*  C2H Event */
-	if (pbuf[0] != 0)
-		memcpy(&haldata->C2hArray[0], &pbuf[USB_INTR_CONTENT_C2H_OFFSET], 16);
-}
-
 static int recvbuf2recvframe(struct adapter *adapt, struct sk_buff *pskb)
 {
 	u8	*pbuf;
@@ -342,8 +324,6 @@ static int recvbuf2recvframe(struct adapter *adapt, struct sk_buff *pskb)
 							pattrib->MacIDValidEntry[0],
 							pattrib->MacIDValidEntry[1]
 							);
-			} else if (pattrib->pkt_rpt_type == HIS_REPORT) {
-				interrupt_handler_8188eu(adapt, pattrib->pkt_len, precvframe->rx_data);
 			}
 			rtw_free_recvframe(precvframe, pfree_recv_queue);
 		}
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index 2ce42d647a34..239d0db55639 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -246,9 +246,6 @@ struct hal_data_8188e {
 
 	u32	UsbBulkOutSize;
 
-	/*  Interrupt relatd register information. */
-	u32	IntArray[3];/* HISR0,HISR1,HSISR */
-	u8	C2hArray[16];
 	u8	UsbTxAggMode;
 	u8	UsbTxAggDescNum;
 
diff --git a/drivers/staging/r8188eu/include/rtl8188e_recv.h b/drivers/staging/r8188eu/include/rtl8188e_recv.h
index bc30eb4634bb..0be9896eaf0f 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_recv.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_recv.h
@@ -37,7 +37,6 @@ enum rx_packet_type {
 	HIS_REPORT,/*  USB HISR RPT */
 };
 
-#define INTERRUPT_MSG_FORMAT_LEN 60
 void rtl8188eu_init_recvbuf(struct recv_buf *buf);
 s32 rtl8188eu_init_recv_priv(struct adapter *padapter);
 void rtl8188eu_free_recv_priv(struct adapter * padapter);
diff --git a/drivers/staging/r8188eu/include/rtl8188e_spec.h b/drivers/staging/r8188eu/include/rtl8188e_spec.h
index e59fd2fe82c5..009222b4a95d 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_spec.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_spec.h
@@ -475,13 +475,6 @@ Default: 00b.
 #define	MSR_INFRA			0x02
 #define	MSR_AP				0x03
 
-/*   88EU (MSR) Media Status Register	(Offset 0x4C, 8 bits) */
-#define	USB_INTR_CONTENT_C2H_OFFSET	0
-#define	USB_INTR_CONTENT_CPWM1_OFFSET	16
-#define	USB_INTR_CONTENT_CPWM2_OFFSET	20
-#define	USB_INTR_CONTENT_HISR_OFFSET	48
-#define	USB_INTR_CONTENT_HISRE_OFFSET	52
-
 /*  88E Driver Initialization Offload REG_FDHM0(Offset 0x88, 8 bits) */
 /* IOL config for REG_FDHM0(Reg0x88) */
 #define CMD_INIT_LLT			BIT(0)
-- 
2.34.1

