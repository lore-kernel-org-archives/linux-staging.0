Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D9D3FCB
	for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 23:31:10 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id b21-20020a1c8015000000b003049690d882so11107161wmd.5
        for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 16:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZgAFzPYLLEIZyR5p3BVXRSzgw7xSTQ9/sY8TbwA9U/g=;
        b=DF8gFNrfgriop0h3gtxixIfgZhJcSv7D4kN2CdJ3gvQWSMUAdnpOl5UCQk3hlgW9nZ
         FKtOPglggtBT5tJPKR4bAdVbJniOlkpcFcWM40TcEkae7nN5lt+ZbVQe2UOlCoUFBo28
         yzLPeeYFVXRNszGtnDZiqxaxKCTS+cG2yZAaplE7so0E89D3jhZPw7R280n62NtfClWZ
         jXyNnA4Uapiwv3mmnEQY3fOV+iKYVdqVLVxWCMeIE26XS8hWeCfY3FoDCCqi9aUAu6Ef
         QY1ZTdgZspMq8CPPE9YvRImGFFg7x2HVvJpipkOynWoidThNlEPHmqs2nPvfcyoihYq7
         ozkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZgAFzPYLLEIZyR5p3BVXRSzgw7xSTQ9/sY8TbwA9U/g=;
        b=wcHV1mmpr5UHMMt/QTZRxwYg+CnS+PnYhzb9SPREQuW7fMo4kWBKGuiL0TeNLoaGw/
         Z9E8yFTrfGRvmBCD1+lG08kT4LA4m61DOYciX6+oF5kPdz3SQiU3MeacLj25yNX4aDdK
         OZJZLsHMnVKqOcFMivoTFCau98JMjnMKd+WsalER4r1dtf4eX7MAjfLcTXXFDaSSiSV1
         9CSI5Z5QHSG3N4zlw2m5jMMOdDbJXdHkxSTtqkLSTdI2ejM07hEjNaOQUCF+NDJI5g1T
         Vb13g2JKdgbwx2uw8YUy51Zq2c7pgCk7L8R4PPNaUpY2qcyjZzf+E8FXDsxerxdS/eY7
         o44A==
X-Gm-Message-State: AOAM5303kdXnAHKN/pyqBIm6nmgx2zhSkIfIs1AmFMvSS9/FZm64r6Qn
	O66Bl4fjL8KptSqVQ7hrNp8=
X-Google-Smtp-Source: ABdhPJy4l5AODdgDNkG7r7y+pBQmTYrSGKE4R5dHd9zdx/FHpZNIwa5QEMa93wFI++idBq9wrKo7Yg==
X-Received: by 2002:a1c:f206:: with SMTP id s6mr13178113wmc.102.1631921468836;
        Fri, 17 Sep 2021 16:31:08 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id w9sm7523148wmc.19.2021.09.17.16.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 16:31:08 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 06/12] staging: r8188eu: remove more dead code from ODM_Write_DIG()
Date: Sat, 18 Sep 2021 01:30:42 +0200
Message-Id: <20210917233048.31677-7-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210917233048.31677-1-straube.linux@gmail.com>
References: <20210917233048.31677-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SupportICType is ODM_RTL8188E in this driver. Remove code that is
never executed.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index cac4f8ff7b63..48c10b78f4a5 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -466,12 +466,8 @@ void ODM_Write_DIG(struct odm_dm_struct *pDM_Odm, u8 CurrentIGI)
 
 	if (pDM_DigTable->CurIGValue != CurrentIGI) {
 		ODM_SetBBReg(pDM_Odm, ODM_REG(IGI_A, pDM_Odm), ODM_BIT(IGI, pDM_Odm), CurrentIGI);
-		if (pDM_Odm->SupportICType != ODM_RTL8188E)
-			ODM_SetBBReg(pDM_Odm, ODM_REG(IGI_B, pDM_Odm), ODM_BIT(IGI, pDM_Odm), CurrentIGI);
-
 		pDM_DigTable->CurIGValue = CurrentIGI;
 	}
-/*  Add by Neil Chen to enable edcca to MP Platform */
 }
 
 /* Need LPS mode for CE platform --2012--08--24--- */
-- 
2.33.0

