Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DC0435F
	for <linux-staging@lists.linux.dev>; Mon, 28 Mar 2022 11:39:54 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id y10so16530477edv.7
        for <linux-staging@lists.linux.dev>; Mon, 28 Mar 2022 04:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/BBT6nEYzLBNKJa5StA4l20Ep/xLb2s98P4A955hkWk=;
        b=ApcDM2P3ZXeAufbLvqkC/ab+Np12Rcl9lbLtcxNMC5ZN9KcP9ehRjKitH7G8DZRgdp
         qEtQuIRNuwmYu3PDKxRUC5uwV6Y5LxJ4PVjDJSKdJPF87PbvhCt107h5uFfZBhPW7MNp
         izHT+qeUM1anm8q1K7eh6TcoLy6bTgt0Lun6MVe12zLtDlv/apzS3GAjRTEaxvp4Iv6V
         6kG1rXCGj5+Ze4UqXjx6ke48NOXYDMg0Hl6CvrgefeQHsPKR8dbzQS7aX4NHKEvZVeXS
         K/tilVHSvVAYjHdPwmlCdwwAMsNwLoF0FwxCDdUfgot33q0n0MqfmyUwUAYE1mUz2VzJ
         RDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/BBT6nEYzLBNKJa5StA4l20Ep/xLb2s98P4A955hkWk=;
        b=yAOBkZvt1pa99aY+iDi/3G8hTI94SZ55VZ2h8QjN5vY8Wf2ehDpzESwVLrHAQnY8FZ
         AtQJh8h+8hQ8MInsAi63mha+1dbXJrS5jAjeeDCD/q0ZL1/4nCdCZbKlUSVxrNEJgUnw
         Gj1xu43OtKTJ1kpaHWjdaVm48sfGt66EHm8qtsgUqW7pTYsYWMFkban2BDxKpU6nGu7W
         /baIJ6xFPYlKwMwkeoj/Aht3cLwA8kXtVG8j8P2/o4Ti12JmrbV0b6Qk6Y7VfsS9sNd7
         1TClncsYBWIagvHB1+Yy/QuNLSQX/o/Sn/4C+vQEVytSE9nlbXbdDI0QKlcSVHOiFJCf
         MmEQ==
X-Gm-Message-State: AOAM531ecNZLeX6VWPF9QMIpSRKPOeKlnM9jNfBp9wPIodvr5R/wD57M
	MgW0GCtfPrN+GPTWGsp5B60=
X-Google-Smtp-Source: ABdhPJwio4iQdmg5hTn4ICgwa/6A6/OAfMwLhxhVHZl+K2bgUwFU+NuoMMKJPODt8fHEfwNqaY32pg==
X-Received: by 2002:a05:6402:5cd:b0:419:7753:acfb with SMTP id n13-20020a05640205cd00b004197753acfbmr15442329edx.131.1648467593052;
        Mon, 28 Mar 2022 04:39:53 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id hq39-20020a1709073f2700b006dfc58efab9sm5938556ejc.73.2022.03.28.04.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 04:39:52 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/9] staging: r8188eu: rename some macros to upper case
Date: Mon, 28 Mar 2022 13:39:34 +0200
Message-Id: <20220328113940.6396-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220328113940.6396-1-straube.linux@gmail.com>
References: <20220328113940.6396-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename some macros to upper case to avoid camel case and improve
readability. While at it, remove some unused macros.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_halinit.c       | 12 ++++++------
 drivers/staging/r8188eu/include/rtl8188e_spec.h | 10 +++-------
 2 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index cf1e4bbfd6a9..26a86b891aa1 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1152,19 +1152,19 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 				AcmCtrl = AcmCtrl | 0x1;
 
 			if (acm_ctrl & BIT(3))
-				AcmCtrl |= AcmHw_VoqEn;
+				AcmCtrl |= ACMHW_VOQEN;
 			else
-				AcmCtrl &= (~AcmHw_VoqEn);
+				AcmCtrl &= (~ACMHW_VOQEN);
 
 			if (acm_ctrl & BIT(2))
-				AcmCtrl |= AcmHw_ViqEn;
+				AcmCtrl |= ACMHW_VIQEN;
 			else
-				AcmCtrl &= (~AcmHw_ViqEn);
+				AcmCtrl &= (~ACMHW_VIQEN);
 
 			if (acm_ctrl & BIT(1))
-				AcmCtrl |= AcmHw_BeqEn;
+				AcmCtrl |= ACMHW_BEQEN;
 			else
-				AcmCtrl &= (~AcmHw_BeqEn);
+				AcmCtrl &= (~ACMHW_BEQEN);
 
 			rtw_write8(Adapter, REG_ACMHWCTRL, AcmCtrl);
 		}
diff --git a/drivers/staging/r8188eu/include/rtl8188e_spec.h b/drivers/staging/r8188eu/include/rtl8188e_spec.h
index edae053e350e..ef42c4b2f20c 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_spec.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_spec.h
@@ -998,13 +998,9 @@ Current IOREG MAP
 #define STOP_BCNQ		BIT(6)
 
 /* 2 ACMHWCTRL */
-#define	AcmHw_HwEn		BIT(0)
-#define	AcmHw_BeqEn		BIT(1)
-#define	AcmHw_ViqEn		BIT(2)
-#define	AcmHw_VoqEn		BIT(3)
-#define	AcmHw_BeqStatus		BIT(4)
-#define	AcmHw_ViqStatus		BIT(5)
-#define	AcmHw_VoqStatus		BIT(6)
+#define ACMHW_BEQEN		BIT(1)
+#define ACMHW_VIQEN		BIT(2)
+#define ACMHW_VOQEN		BIT(3)
 
 /* 	0x0600h ~ 0x07FFh	WMAC Configuration */
 /* 2APSD_CTRL */
-- 
2.35.1

