Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE50A6D0D
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 09:17:59 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id r12so26475834ejr.5
        for <linux-staging@lists.linux.dev>; Wed, 07 Apr 2021 02:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NtBGPqIcRzSYJupveHRk1jBF1Lk0E+DkUti3vbu6sww=;
        b=tPzTVz99DZJ88IjcY+fdMaT9gQB1AAa7bwbEjzVEHU6IyS1Q/khV1yBs8XBbIEZdrU
         jiHrntMKe7kjXWl4J1MDiksCpiOwde8uUl5h3gn1JXYx5E6v6Ujc6ALqRvHv1cFYulgw
         FUF+QIxU8NCnlj8po+DhO3mi7/L6rE215q2AR3EcC4YnqnhF1m39AhQXpF5cDj786q7B
         RhSpYcOALl4PDkNHBM81Nva9gR+NlBTWFsqsjaayWPFSU9JWeOvGhSN4x3K0U/ccwtev
         Xpc/6MSzl+YB5vTB8zuRuF4xs3g23cmaYsGYAoRnfkHH8MX/DEu7mfVw38vmkhTBzBdU
         W4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NtBGPqIcRzSYJupveHRk1jBF1Lk0E+DkUti3vbu6sww=;
        b=IbKH4azbi8C8AFQfm9GaQ5027jG87V3tOuU6PmXmmO9sVtRGGIoIqw12nQnOV5ArDx
         TUuTeeTF+j4e69FXJ7aU4qw3eSk6h4uxd8qtQOW5kQMtBR3XaoKdPk61tzgnjq4V1gpw
         CacsCyhTXhNIqpjgE9rA89capeOnWh2zBxNfG9r5sliBHZSx9oiXrciMt6y9/VVAs4Al
         Jb4BhrOW1DNt+d6b4wRSp4cSkOds0nGCGJebbZG/SeHufILDi4ro06A7SmBbWUyVLIGU
         U98WAzw4psXeDHGaVq68FtgtJSnrktIFVDtOeEOK+3yUf67JNTnwhS5SKKoaqs4JmiUY
         pEvA==
X-Gm-Message-State: AOAM530bzqh+0OI+hui8QhyHjGwSxEp1LlCN/A/r8BucQBU6nJx1edr2
	SddOcV6gnXRXr+YwzMWLxfo=
X-Google-Smtp-Source: ABdhPJyjhMuuvrH3yr3Uv/KNqErb5SU8Irsbum9YUiW7LyZycYrCKnvixPQ/G5ipovt4NQCJ7FaFlA==
X-Received: by 2002:a17:906:468b:: with SMTP id a11mr2590895ejr.190.1617787078207;
        Wed, 07 Apr 2021 02:17:58 -0700 (PDT)
Received: from localhost.localdomain (host-79-42-91-147.retail.telecomitalia.it. [79.42.91.147])
        by smtp.gmail.com with ESMTPSA id f9sm15248458eds.41.2021.04.07.02.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 02:17:56 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy-kernel@googlegroups.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [Outreachy kernel] [PATCH v2] staging: rtl8723bs: hal: Remove camelcase
Date: Wed,  7 Apr 2021 11:17:52 +0200
Message-Id: <20210407091752.27350-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.30.2
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove camelcase. Issue detected by checkpatch.pl. The symbols aren't
used in other files, so this change doesn't break the driver's code.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

This is a necessary v2 patch because v1 cannot anymore apply to the current staging/testing tree

 drivers/staging/rtl8723bs/hal/Hal8723BReg.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/Hal8723BReg.h b/drivers/staging/rtl8723bs/hal/Hal8723BReg.h
index b9aca99478db..616d20106392 100644
--- a/drivers/staging/rtl8723bs/hal/Hal8723BReg.h
+++ b/drivers/staging/rtl8723bs/hal/Hal8723BReg.h
@@ -112,7 +112,7 @@
 #define REG_RSVD3_8723B					0x0168
 #define REG_C2HEVT_MSG_NORMAL_8723B	0x01A0
 #define REG_C2HEVT_CMD_SEQ_88XX		0x01A1
-#define REG_C2hEVT_CMD_CONTENT_88XX	0x01A2
+#define REG_C2HEVT_CMD_CONTENT_88XX	0x01A2
 #define REG_C2HEVT_CMD_LEN_88XX		0x01AE
 #define REG_C2HEVT_CLEAR_8723B			0x01AF
 #define REG_MCUTST_1_8723B				0x01C0
@@ -429,13 +429,13 @@
 #define	IMR_RXFOVW_8723B		BIT8	/*  Receive FIFO Overflow */
 
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
 
 /*        8195 (RCR) Receive Configuration Register	(Offset 0x608, 32 bits) */
 #define	RCR_TCPOFLD_EN			BIT25	/*  Enable TCP checksum offload */
-- 
2.30.2

