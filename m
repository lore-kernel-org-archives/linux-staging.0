Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEA572
	for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 13:37:30 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id qb4so3252553ejc.11
        for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 06:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vpBo6pS+05Q4WF57DinU840cssZYXHgBom0RqSKX0GE=;
        b=Wilmb2bP/BOc3I9eKR0qxPe0iFuQPb6e7gqLR/pce8zTDhslo0b8sJHP3+V5Jvv0tx
         Mxb54BeNw8i3ZtZ4C3FvOLLRy/PZ18piKWCoHFT9gnnFrDEOkaT2BF13YOYkP3Kch4uZ
         uyK7Pr348LffMjJn6vFNzWNZfAJqCG+nV7AQ2E9gMj9kIgqwviYFll139BgNYmA598aH
         eMYKr143soS5gHZbp6+MisZRlWc42dYNT7U8jhnXuDdSYxSj723+RZ4aYK6v/jf+gHCk
         qjy7DLGym4BXkRNBexKOTGKXgkF2lrQCMDfptJJ5DQkx81Ip+Zkd0vWfjXLIhQ6h/JG9
         TpmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vpBo6pS+05Q4WF57DinU840cssZYXHgBom0RqSKX0GE=;
        b=GRn/g2zOWOpTjIlMlhgPoxqcKvoTJfT7N0l+TrTldOaufDlJnPi7F/u3OV5hJeZREC
         MJYtf2ozt6DoJSKbjmVC32KYMe8LrEl97KgKzG+cNGtcJ87+ratvz/iDVGWclHXy2a4W
         uJ+FWHG4R2CtZ3mAVgEUQjfXofr3jlHdiPVrz52Mcno9X1R9QdihuWX+o+TrQIdiSJus
         EibM4iYB1PBJKsliJudYZmPM0HADlMxxQgeF7oTlgEzOa4AV6DqU9lGcfPX7lSXTWtt7
         n7oZbFLd0+62NJCEIgckEwVAunUdJIKzw47df3CsBCIe320HB8VLRbcfVuIDcR8viEVR
         +TZw==
X-Gm-Message-State: AOAM533obc4mr/jTKdZAPdBNXhQCiSMx+AxTw4/kBRT+1S3JUyvT6kku
	YiXp/8zWdRLJfKvkhqoT7qo=
X-Google-Smtp-Source: ABdhPJyYpdVIZ6TT0O4QzNZpFrQLwZzBqAAvW4Mu6Md7E4IVrf9AKbW2WfU9FAIKN8RkFrr9zG9nwQ==
X-Received: by 2002:a17:906:eb99:: with SMTP id mh25mr38244801ejb.330.1626874648655;
        Wed, 21 Jul 2021 06:37:28 -0700 (PDT)
Received: from agape ([5.171.73.45])
        by smtp.gmail.com with ESMTPSA id k21sm8320045ejj.55.2021.07.21.06.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 06:37:28 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/16] staging: rtl8723bs: fix camel case inside function
Date: Wed, 21 Jul 2021 15:37:09 +0200
Message-Id: <831b5f56cc6df8885ac61837fe53f63e021b289b.1626874164.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1626874164.git.fabioaiuto83@gmail.com>
References: <cover.1626874164.git.fabioaiuto83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix camel case inside function Hal_GetChnlGroup8723B()

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index bd0e9f05eb5c..246a5362a54f 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -2061,18 +2061,18 @@ s32 rtl8723b_InitLLTTable(struct adapter *padapter)
 	return ret;
 }
 
-static void Hal_GetChnlGroup8723B(u8 Channel, u8 *pGroup)
-{
-	if (1  <= Channel && Channel <= 2)
-		*pGroup = 0;
-	else if (3  <= Channel && Channel <= 5)
-		*pGroup = 1;
-	else if (6  <= Channel && Channel <= 8)
-		*pGroup = 2;
-	else if (9  <= Channel && Channel <= 11)
-		*pGroup = 3;
-	else if (12 <= Channel && Channel <= 14)
-		*pGroup = 4;
+static void Hal_GetChnlGroup8723B(u8 channel, u8 *group)
+{
+	if (1  <= channel && channel <= 2)
+		*group = 0;
+	else if (3  <= channel && channel <= 5)
+		*group = 1;
+	else if (6  <= channel && channel <= 8)
+		*group = 2;
+	else if (9  <= channel && channel <= 11)
+		*group = 3;
+	else if (12 <= channel && channel <= 14)
+		*group = 4;
 }
 
 void Hal_InitPGData(struct adapter *padapter, u8 *PROMContent)
-- 
2.20.1

