Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133F42C80
	for <linux-staging@lists.linux.dev>; Sat,  1 Jan 2022 08:18:10 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id n14-20020a7bcbce000000b00332f4abf43fso8992991wmi.0
        for <linux-staging@lists.linux.dev>; Sat, 01 Jan 2022 00:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DXMWSZptIeRPrV7Ny9e/lWoHz+fzwKFZLfpVM59vyP0=;
        b=VO34iHaCEpkAEFs44Q7eYbTI8ph5n1PkIqK1h8CXuIAV5t45xXfaLuPAyFJXZjUgdG
         Vei2424ILY+gQlG0xyBOuSOb9EntmNhVN8gwaQ1n19zOT6ozZdQ4xtNNm1dkakeJk6Xm
         6hEqxqqohHzr2WN9yJUIAJDptKJ1azvn7553/bMZkI/1u5J5PPYZkCyN2rSLT4urTudy
         2OhYGWrbDHRpEBDKL0pfacml2nbQjHLUphvHwMwrkm0MdQPVQy6boRtcIDFKNidwLZ+D
         QdcJqrfQVSnNaXhLYCMZxYRvF+M9ThP8NUddfGhU5DEYMwH8MYvTR5fgHnBKQnrx1xTm
         CksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DXMWSZptIeRPrV7Ny9e/lWoHz+fzwKFZLfpVM59vyP0=;
        b=dlXqzNQoDT1La7OcYAq7wfafd5y/qKGMNC323d+G9TwA0rJSlKdvOlWqxRlWoBwPpu
         64PqpNkC2da3iMAb4Sjl5w/PqcrBBz/Ln33ZsrcWyWlIWM3v0I/28R9TdPPE/7GqPTzP
         utL+dTx+dDIZw5PgdARlp4qceKkIy6EmAyH2xQVTxN97zKGlV/b8VXUkKcJ4Pa3VhAdL
         pJlTd7jFAiQzq3Zwrgla7bVPSjgu2ExVmuj74oaEyK/T7993SlKZSz75dc4UNVAvfig8
         P0v73a7zdV9kftE3qDCPfMx/l0wCNGvgNXQg5C4ASeCRdG987HnWGv2r0zvg7+zN2yI+
         BH2w==
X-Gm-Message-State: AOAM531n9vZM6QhQVftiWyY177h6Hyf9gR3pbcTXNHuzt5BA/+10g8Fu
	rrf4WYIRaVA8jZCCz0J47/E=
X-Google-Smtp-Source: ABdhPJyFiu1ixPgRE8CH34H8v8h+o9BmECh2Uy5ksNd1t+hrQ/8aGFGyVvA4bjvcVN26k+CHPiwN+w==
X-Received: by 2002:a05:600c:3797:: with SMTP id o23mr31927594wmr.178.1641025088584;
        Sat, 01 Jan 2022 00:18:08 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id u9sm30693651wmm.7.2022.01.01.00.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jan 2022 00:18:08 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 6/7] staging: r8188eu: IntArray and C2hArray are set but never used
Date: Sat,  1 Jan 2022 09:17:57 +0100
Message-Id: <20220101081758.9716-7-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220101081758.9716-1-straube.linux@gmail.com>
References: <20220101081758.9716-1-straube.linux@gmail.com>
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
v2: Remove interrupt_handler_8188eu() since it does nothing now.

 drivers/staging/r8188eu/hal/usb_ops_linux.c   | 20 -------------------
 .../staging/r8188eu/include/rtl8188e_hal.h    |  3 ---
 .../staging/r8188eu/include/rtl8188e_spec.h   |  7 -------
 3 files changed, 30 deletions(-)

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

