Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DA72CA3
	for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 20:51:47 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id w20so37583205wra.9
        for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 12:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PBcF53XoTwOshk3YrZwbKbN/UyVDJ23qlHTXxkU+SnU=;
        b=e/aonn1BxuMfd3aCITdHkFbqGTt2Qy74p9EyGH/oCB9D15PGcF2PczDq3ZJn7/N2Ah
         XYy4iEuF9+AIDb6tKayJUQ+Fv7PdVUHjHnPh7B/UKzY9QvdlB49oiZ675A/yNf1x+kw0
         52O1pqUyx/DKFc17tl2v1DKJjpLMpAIi2bDaxuU056DteU5daBVuGK3rd4ax45M0szkR
         iXVZ8nVwdEtjotSSc615VBidZs9EPq9kO6Yp7QXA5sPR3mqrvFt7Yff2djicwumPacqD
         nDqek+DEWnqjTF75nk8QS1b74D/7QchCTht1PJqC9Lct/NulKf90ql72VR4rn627YTn0
         HDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PBcF53XoTwOshk3YrZwbKbN/UyVDJ23qlHTXxkU+SnU=;
        b=Vea8O49+DbLx5ADYvoatpoU6+rsT7XCYmZui34y7+VnjGnnvKXz1fl0HysAtxlgnso
         mju1PVL1rSL14ms81YZL0BX8H061YsvJcZgeQUJxCa7Tc0hWM03J/xktOcH6MZl0k0di
         VyK9A1XMsdBx0Zl1IH2On3xfm7qyiWC0e6BkRw2Y0tE3/gx6W8DCNTKKCV9evOO40ZXy
         XLSD34NsME66+rFAo1isJlEMiuMqi/NNEH4yia1OIDAcPagc7K0riViUjySn63x+L5R8
         wvYrLfmXo+4+mXW60yr3lJmgt3ZF4hCJsv4xPqQM9YRGoINpWe/hSKy6e3+jiGvlSJVB
         LU8g==
X-Gm-Message-State: AOAM532wAvDfFr2kZu9DZlA4kVhxAXV5K9URqaC6g3HJYYwagKhyrI2J
	PRBQJXtZXwDoIJM1mM11k5y/wyeGpEU=
X-Google-Smtp-Source: ABdhPJxf0uiAx9Dgqb9+3Jn2xkcZDan6uqG/GZbfJ2RYKg7h+OfFVAjyk0y8cSkjTlkrZSZwqwvBug==
X-Received: by 2002:adf:aa9a:: with SMTP id h26mr21712625wrc.437.1640811106429;
        Wed, 29 Dec 2021 12:51:46 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id l12sm27421989wmq.2.2021.12.29.12.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 12:51:46 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 28/32] staging: r8188eu: make odm_HwAntDiv() static
Date: Wed, 29 Dec 2021 21:51:04 +0100
Message-Id: <20211229205108.26373-29-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211229205108.26373-1-straube.linux@gmail.com>
References: <20211229205108.26373-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function odm_HwAntDiv() is only used in odm.c. Make it static.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c             | 16 ++++++++--------
 drivers/staging/r8188eu/include/odm_precomp.h |  1 -
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index e067e46ccf64..14020a3e67d4 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -544,6 +544,14 @@ static void odm_InitHybridAntDiv(struct odm_dm_struct *pDM_Odm)
 	ODM_AntennaDiversityInit_88E(pDM_Odm);
 }
 
+static void odm_HwAntDiv(struct odm_dm_struct *pDM_Odm)
+{
+	if (!(pDM_Odm->SupportAbility & ODM_BB_ANT_DIV))
+		return;
+
+	ODM_AntennaDiversity_88E(pDM_Odm);
+}
+
 /* 3 Export Interface */
 
 /*  2011/09/21 MH Add to describe different team necessary resource allocate?? */
@@ -859,14 +867,6 @@ void ODM_TXPowerTrackingCheck(struct odm_dm_struct *pDM_Odm)
 	}
 }
 
-void odm_HwAntDiv(struct odm_dm_struct *pDM_Odm)
-{
-	if (!(pDM_Odm->SupportAbility & ODM_BB_ANT_DIV))
-		return;
-
-	ODM_AntennaDiversity_88E(pDM_Odm);
-}
-
 /* EDCA Turbo */
 void ODM_EdcaTurboInit(struct odm_dm_struct *pDM_Odm)
 {
diff --git a/drivers/staging/r8188eu/include/odm_precomp.h b/drivers/staging/r8188eu/include/odm_precomp.h
index c3fce8b91a5a..fdd0e2355c69 100644
--- a/drivers/staging/r8188eu/include/odm_precomp.h
+++ b/drivers/staging/r8188eu/include/odm_precomp.h
@@ -33,6 +33,5 @@
 
 void ODM_EdcaTurboInit(struct odm_dm_struct *pDM_Odm);
 void odm_EdcaTurboCheck(struct odm_dm_struct *pDM_Odm);
-void odm_HwAntDiv(struct odm_dm_struct *pDM_Odm);
 
 #endif	/*  __ODM_PRECOMP_H__ */
-- 
2.34.1

