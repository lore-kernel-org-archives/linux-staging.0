Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4F62CA1
	for <linux-staging@lists.linux.dev>; Thu, 30 Dec 2021 20:01:11 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id c66so16234685wma.5
        for <linux-staging@lists.linux.dev>; Thu, 30 Dec 2021 12:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5CtCwwPsCao8kkeRXV1Zww5XYrsoEXQXIXV3u2Cd1x4=;
        b=fKJE5tHF/wWzzTMnhcAO2od0kiS1rsPcb+5qwSGYe2uaF2LJAfClResc8KPEKhJPeQ
         mMoCcHuwYc0wqRAD1Ggp5NuFoU9d4mMnw3UWDZStchayTuaAC/2MDS6irJwLSfHcvUiw
         KbDu1xNHMrcpp/HptDW75IjelYVgK+Dy79AJbjKyav8W8k47wvoRFJm0ObuWc42rDy8c
         m76V1sHE70apbb0joGOFL3rq47vv2KqI3htgTf4ZjedVT9Ifkogj8+ib2lTZVS0VQGvI
         uaxrApeZJ+/0JyoqptWK46+Z/S4oVsApNVwGLlxqmwiu0KIxrv2HqN+eGhzljN6wKSUj
         n7yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5CtCwwPsCao8kkeRXV1Zww5XYrsoEXQXIXV3u2Cd1x4=;
        b=Oo0EFYoowQAx+MNGWKnT6CsjbiKCr1h/GP2Khu5A3VOLjUMo8x6t1fFNIF4OSrJtK4
         7P2O0YUeTFNa6I7reppY5w0C97CPvqGxc6NL9ISdfu7hovKXQrw7llKz1J+CBr0lPL/m
         jOIYW2KJ6IBsT89P454zGmMmx3JExIDcMyBJhNc/J0okH3izmwXA00LgZkgBZxYBHZhD
         3DaK2OuaAlTLkGm8EFdN/jjngbovHYBJl6e5yoj8y+gfnZ3uWY9xh5lpTkr8uF8SrxH3
         WNcDgO06GZv4Lp7Ck7C1+1vA1guR2viNlQOJDASNukTPkAX3Z/3nOdviW2FDDKfkiQLI
         9Suw==
X-Gm-Message-State: AOAM532K1DeFdHI1x/coJ+KcogjsAhY6KU2vhukkbxLPDXevRtZPsRMA
	Qt1mcMK5KKs5eumsvSxWKQo=
X-Google-Smtp-Source: ABdhPJyKE7LoeS4OkyEwk4Pv3xU+Wioc8bGJ0Y7C+SGbwCUwusJZHlxkojJD+zJU96u2ISRsNR5LoQ==
X-Received: by 2002:a1c:494:: with SMTP id 142mr27836964wme.191.1640894469710;
        Thu, 30 Dec 2021 12:01:09 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id o8sm29042286wry.20.2021.12.30.12.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Dec 2021 12:01:09 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 6/7] staging: r8188eu: IntArray and C2hArray are set but never used
Date: Thu, 30 Dec 2021 21:00:58 +0100
Message-Id: <20211230200059.13406-7-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211230200059.13406-1-straube.linux@gmail.com>
References: <20211230200059.13406-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fields IntArray and C2hArray of struct hal_data_8188e are set but
never used. Remove them.

While at it, remove the unsed defines USB_INTR_CONTENT_CPWM1_OFFSET
and USB_INTR_CONTENT_CPWM2_OFFSET as well.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c     | 10 ----------
 drivers/staging/r8188eu/include/rtl8188e_hal.h  |  3 ---
 drivers/staging/r8188eu/include/rtl8188e_spec.h |  7 -------
 3 files changed, 20 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 9ec55a77dccd..85bcde5ee79a 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -185,20 +185,10 @@ int rtw_writeN(struct adapter *adapter, u32 addr, u32 length, u8 *data)
 
 static void interrupt_handler_8188eu(struct adapter *adapt, u16 pkt_len, u8 *pbuf)
 {
-	struct hal_data_8188e *haldata = &adapt->haldata;
-
 	if (pkt_len != INTERRUPT_MSG_FORMAT_LEN) {
 		DBG_88E("%s Invalid interrupt content length (%d)!\n", __func__, pkt_len);
 		return;
 	}
-
-	/*  HISR */
-	memcpy(&haldata->IntArray[0], &pbuf[USB_INTR_CONTENT_HISR_OFFSET], 4);
-	memcpy(&haldata->IntArray[1], &pbuf[USB_INTR_CONTENT_HISRE_OFFSET], 4);
-
-	/*  C2H Event */
-	if (pbuf[0] != 0)
-		memcpy(&haldata->C2hArray[0], &pbuf[USB_INTR_CONTENT_C2H_OFFSET], 16);
 }
 
 static int recvbuf2recvframe(struct adapter *adapt, struct sk_buff *pskb)
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

