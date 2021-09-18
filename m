Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E803FC8
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 18:19:33 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id t6so43014101edi.9
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 11:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I0jcC2Su8d4wIhHItiadcLqrply5RR3Vd1Gurt9GSRs=;
        b=VuQ9ik0YfttN4MhlPp9KVm09+HRaNOGBkFW2QVOtUZ7IwHHiPEVn0gGDM4siedp0QL
         Sv/oKfdNUDD2WEEjYkG3Ei1QI+S/Kl76l2FzkwmIS6VIbFwSHK0pNtFJedBWa+Gk+TIu
         kcDaZtMwtJjgNUhE1vhCTHQMV9ne5ew5YSTxM2Atq/rglDbRl21kwzgtDETNpyD1yPiO
         eapy4PaR5oAPi/R2+xLO1StvCu0qZjludQ+PlrLCPtPxq3mG3TwSomYRQmyUX8UoqAIn
         iERHYxPe3ai1EkcNTan8Cdu6hq80N1LieXk145lckLzlrGhpJctopgLA+exk24iPmPzp
         boUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I0jcC2Su8d4wIhHItiadcLqrply5RR3Vd1Gurt9GSRs=;
        b=dK9rqm9GS9rdSp4pPSwustS1rhbOmguIUqsecPTdy94Ck3MDFrnjwNhnKQe9wM7IFI
         CS1KCiXu2qv8fVUYyoWPr6ltS8oKOrwbsah7Kd9EdStnOIJxUmsZlPJ9Ca5KF42mUPkS
         Xujg8natqWmk4DUlxxP1GXvET/bVX1nCtYn5RSsISSECX1Djdv+BnlYr3PZfZZeYLRGr
         lat8ts9+5xqqfhErSy25UEw9ZtcJtp99NRK6xa8Fd4Kdav60dmoKlKyM7hJSEVzn5rvl
         OTgrgxiDu9DCqQ/qpE4SxATnh5qVcX8pBt+wKXTn/FWv5GORim/CJ7OcTzI4mLBpeNc7
         yOtg==
X-Gm-Message-State: AOAM530kD0vIz5NlFZ4OGRmmz4o9Syhts/xi26Pd1zaCKv3pNL3bnc5o
	wXU4kNmzA+Gm8BqLsoRe2ag=
X-Google-Smtp-Source: ABdhPJy3zZm5udA6BjvdwroEGD/Mh2ihHH73KBqZpKJJWs0ODX9QXlXMlEAeUx2vfpuOgFdvV01UPw==
X-Received: by 2002:a17:906:584:: with SMTP id 4mr19281311ejn.56.1631989171583;
        Sat, 18 Sep 2021 11:19:31 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id t19sm3903673ejb.115.2021.09.18.11.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 11:19:31 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 14/14] staging: r8188eu: clean up indentation in odm_RegDefine11N.h
Date: Sat, 18 Sep 2021 20:19:04 +0200
Message-Id: <20210918181904.12000-15-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210918181904.12000-1-straube.linux@gmail.com>
References: <20210918181904.12000-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up indentation in odm_RegDefine11N.h.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 .../staging/r8188eu/include/odm_RegDefine11N.h   | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/include/odm_RegDefine11N.h b/drivers/staging/r8188eu/include/odm_RegDefine11N.h
index 3e2fd6b1c793..82a602b39cc7 100644
--- a/drivers/staging/r8188eu/include/odm_RegDefine11N.h
+++ b/drivers/staging/r8188eu/include/odm_RegDefine11N.h
@@ -10,14 +10,14 @@
 #define	ODM_REG_RX_DEFUALT_A_11N		0x858
 #define	ODM_REG_ANTSEL_CTRL_11N			0x860
 #define	ODM_REG_RX_ANT_CTRL_11N			0x864
-#define	ODM_REG_PIN_CTRL_11N				0x870
-#define	ODM_REG_SC_CNT_11N				0x8C4
+#define	ODM_REG_PIN_CTRL_11N			0x870
+#define	ODM_REG_SC_CNT_11N			0x8C4
 /* PAGE 9 */
 #define	ODM_REG_ANT_MAPPING1_11N		0x914
 /* PAGE A */
-#define	ODM_REG_CCK_ANTDIV_PARA1_11N	0xA00
-#define	ODM_REG_CCK_CCA_11N				0xA0A
-#define	ODM_REG_CCK_ANTDIV_PARA2_11N	0xA0C
+#define	ODM_REG_CCK_ANTDIV_PARA1_11N		0xA00
+#define	ODM_REG_CCK_CCA_11N			0xA0A
+#define	ODM_REG_CCK_ANTDIV_PARA2_11N		0xA0C
 #define	ODM_REG_CCK_FA_RST_11N			0xA2C
 #define	ODM_REG_CCK_FA_MSB_11N			0xA58
 #define	ODM_REG_CCK_FA_LSB_11N			0xA5C
@@ -28,7 +28,7 @@
 /* PAGE C */
 #define	ODM_REG_OFDM_FA_HOLDC_11N		0xC00
 #define	ODM_REG_OFDM_FA_RSTC_11N		0xC0C
-#define	ODM_REG_IGI_A_11N				0xC50
+#define	ODM_REG_IGI_A_11N			0xC50
 #define	ODM_REG_ANTDIV_PARA1_11N		0xCA4
 #define	ODM_REG_OFDM_FA_TYPE1_11N		0xCF0
 /* PAGE D */
@@ -39,9 +39,9 @@
 
 /* 2 MAC REG LIST */
 #define	ODM_REG_ANTSEL_PIN_11N			0x4C
-#define	ODM_REG_RESP_TX_11N				0x6D8
+#define	ODM_REG_RESP_TX_11N			0x6D8
 
 /* DIG Related */
-#define	ODM_BIT_IGI_11N					0x0000007F
+#define	ODM_BIT_IGI_11N				0x0000007F
 
 #endif
-- 
2.33.0

