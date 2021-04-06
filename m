Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195796D10
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 16:00:44 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id m3so7383875edv.5
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 09:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k5EpuzuQJTKW4iCexb4wYn9pAT56gYbwWP/iQi0chJE=;
        b=d3pyj6/e3e/fxYUdpu90XqhYram4OhWvReN9Bo7SKbbY5tXgcKg6Vcxejn4Y2FhZyY
         qyiBX4wUVVubcDYf2hojBzSFiQ1OBf0pbQPDW73tmv7WVEWUhEY8jOVD+BKsZ10Jdqwd
         /2oux4dbZA3nijNfEqi8esoiYDSC3ATU7r8uvgYpGWL98OiIxFeCGEfXusZthiweq8o1
         WTDtlCm5EyWqWgsRYxn5q6yoGQ/Cnk+hf55Hixxp9NJ1LEJCfGlw1QYuE7QoREwmbc6u
         SOzXsZSpeKnIVaVe/m1y9R9NAzXQ1ReBCGLT+f1AUWBLTFZOqC/Iu2LzQQNqZreuML16
         Jwqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k5EpuzuQJTKW4iCexb4wYn9pAT56gYbwWP/iQi0chJE=;
        b=PiJvNiVZOSN13La3Fho7K9HK180BrbGkLk7C3ZJDN0F6sUYq2+MDh9PJX3EtG650oE
         Nbl+q2vg8JywPlAe6kNyFvHvAh4xv8SX3X2PutaG1tHVedueke3gqp66n+1r5lZydz5+
         L1ZyF3fXeq301ftnSQ7v+6q7YPgd+QDVy6u2iqLtajTavNakZCDvWJPqj8W8ILG8DR7O
         8E5kQAOXwjn2RTtZjxUZVQCRRMijv7aPibOXKa4576TBEqe+W4tbFUKZyP1cNhy8aK16
         eerwW2RPn+8bb55MNnSuwbIyONl+pnWd743Y5d+aCuTqAdz7GC3T4DMaz1EhVYvm4I4t
         xLrw==
X-Gm-Message-State: AOAM5314y2v2e7fXh+o4T+UP1dJbsKRo9K6chf+9vpwbRzgqiGwByr+Z
	KPPpRDSPupAgjFzILftkRKzCg6MgVUepVDV7
X-Google-Smtp-Source: ABdhPJw8nHUAQuZ6zZk8j9rfvTPC/Ukwe91CIxsRC6iPj5FHzN6E8hu8ZaonkNE2FgYrO6EcuD3u/w==
X-Received: by 2002:a05:6402:344e:: with SMTP id l14mr8680125edc.184.1617724842572;
        Tue, 06 Apr 2021 09:00:42 -0700 (PDT)
Received: from localhost.localdomain (host-79-42-91-147.retail.telecomitalia.it. [79.42.91.147])
        by smtp.gmail.com with ESMTPSA id n16sm14317737edr.42.2021.04.06.09.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 09:00:42 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy-kernel@googlegroups.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [Outreachy kernel] [PATCH v3] staging: rtl8723bs: hal: Remove camelcase in Hal8723BReg.h
Date: Tue,  6 Apr 2021 18:00:37 +0200
Message-Id: <20210406160037.27225-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.30.2
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove camelcase in some symbols defined in Hal8723BReg.h. These symbols
are not used anywhere else, therefore this patch does not break the driver.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

Patch v3 changes nothing with respect to v2 and v1. It exists only to cc some recipients that were missing in the header of the previous email.

 drivers/staging/rtl8723bs/hal/Hal8723BReg.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/Hal8723BReg.h b/drivers/staging/rtl8723bs/hal/Hal8723BReg.h
index cc249e15b4bd..60c1f966c5de 100644
--- a/drivers/staging/rtl8723bs/hal/Hal8723BReg.h
+++ b/drivers/staging/rtl8723bs/hal/Hal8723BReg.h
@@ -110,7 +110,7 @@
 #define REG_RSVD3_8723B				0x0168
 #define REG_C2HEVT_MSG_NORMAL_8723B		0x01A0
 #define REG_C2HEVT_CMD_SEQ_88XX			0x01A1
-#define REG_C2hEVT_CMD_CONTENT_88XX		0x01A2
+#define REG_C2HEVT_CMD_CONTENT_88XX		0x01A2
 #define REG_C2HEVT_CMD_LEN_88XX			0x01AE
 #define REG_C2HEVT_CLEAR_8723B			0x01AF
 #define REG_MCUTST_1_8723B			0x01C0
@@ -424,13 +424,13 @@
 #define	IMR_RXFOVW_8723B		BIT8	/* Receive FIFO Overflow */
 
 /* 2 ACMHWCTRL 0x05C0 */
-#define	AcmHw_HwEn_8723B		BIT(0)
-#define	AcmHw_VoqEn_8723B		BIT(1)
-#define	AcmHw_ViqEn_8723B		BIT(2)
-#define	AcmHw_BeqEn_8723B		BIT(3)
-#define	AcmHw_VoqStatus_8723B		BIT(5)
-#define	AcmHw_ViqStatus_8723B		BIT(6)
-#define	AcmHw_BeqStatus_8723B		BIT(7)
+#define	ACMHW_HWEN_8723B		BIT(0)
+#define	ACMHW_VOQEN_8723B		BIT(1)
+#define	ACMHW_VIQEN_8723B		BIT(2)
+#define	ACMHW_BEQEN_8723B		BIT(3)
+#define	ACMHW_VOQSTATUS_8723B		BIT(5)
+#define	ACMHW_VIQSTATUS_8723B		BIT(6)
+#define	ACMHW_BEQSTATUS_8723B		BIT(7)
 
 /* 8195 (RCR) Receive Configuration Register	(Offset 0x608, 32 bits) */
 #define	RCR_TCPOFLD_EN			BIT25	/* Enable TCP checksum offload */
-- 
2.30.2

