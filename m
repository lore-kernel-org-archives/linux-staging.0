Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C997870
	for <linux-staging@lists.linux.dev>; Sat, 19 Jun 2021 10:47:43 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id t11-20020a1cc30b0000b02901cec841b6a0so7029756wmf.0
        for <linux-staging@lists.linux.dev>; Sat, 19 Jun 2021 03:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=77HnC0dTisnKWDPVh1Io+8wCN1+6InnJC2WdQmork9k=;
        b=ZBunn+aXi7XpJQKl+iv5ApLLwtRcpaJ70cinJA3ablAioeuZKp4VaSds5C4dApegIp
         O+9+X6+O9QgYK/G2p6ztnrkR4JjArbodggYKTJWyh5Bs71TYJcmhhSGX2+3hn1E54izP
         0GP8tF8J4vWLz9DwPhj2BBhd/d96d8HgQJP4eDEQm1MsKR5pSQ0YJ3NOvNJO4HxZQbO+
         rMUSaVxL2r1skhqvBHho6u5lWudI5aBuEnWw5oG+ysHvHAQQTqaPBO67lsBfLI8noxKL
         hItmgknGRWo+7+/J712F73tP8gHgz6so8K59/ZkGhEf6s5EGz2Q/4ccHz4vmieKNwpUA
         qTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=77HnC0dTisnKWDPVh1Io+8wCN1+6InnJC2WdQmork9k=;
        b=qSzevqZXLF4EGfkeQsTKWHPFOZMfslWul/cLcpBQ+xHOmzmrRKQFjT+CFAoiOzvMLK
         4ueOS90MuN+6kkHem9zJ5gQpiZuW3s2zTHneks0+4VktmdfUCVTED6ioWnmEN70wqQs5
         ywMGYC9edyMGaaVjU9IP8WLYmYa0DIK4d9tDqTbARE2L0geNyEBtVUFNmAkqQfskwOY6
         wyues/1PsJSOUFDiCOEkieUk1KW8vTMQ0rTDHmSdQRxW5W+C92CopiPwXhZRLJPDlEY0
         Q6a5nYQc1X9viDjcPejwWlu3WyVTvk9Jgker4Q8qsDTUBBnAEM3DFPlTijf2A1IwhRbJ
         h2LQ==
X-Gm-Message-State: AOAM533FT9VA+4crU/yfMmeX10hIQKEyDqoFYqWe/4+3VFdemFWQIzKw
	L8QrFNzaNrVbGoZDZxlMc8w=
X-Google-Smtp-Source: ABdhPJypFcwMpkn1Yn2tXDRvha5Tu5Dd5kFUaHKnCauKpVJ+hEDEK/auvFAMr5rCvR7QfRfI6iG/GQ==
X-Received: by 2002:a05:600c:22c9:: with SMTP id 9mr15712389wmg.44.1624099662482;
        Sat, 19 Jun 2021 03:47:42 -0700 (PDT)
Received: from agape ([5.171.81.81])
        by smtp.gmail.com with ESMTPSA id f13sm11713215wrt.86.2021.06.19.03.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jun 2021 03:47:42 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 14/18] staging: rtl8723bs: fix macro value for 2.4Ghz only device
Date: Sat, 19 Jun 2021 12:47:17 +0200
Message-Id: <d4dc048406bb8972b17db51a76a5dce0fa4eabaf.1624099126.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1624099125.git.fabioaiuto83@gmail.com>
References: <cover.1624099125.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix IQK_Matrix_Settings_NUM macro value to 14 which is
the max channel number value allowed in a 2.4Ghz device.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index c349de205f93..abf6547518fb 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -195,10 +195,7 @@ struct odm_rate_adaptive {
 
 #define AVG_THERMAL_NUM		8
 #define IQK_Matrix_REG_NUM	8
-#define IQK_Matrix_Settings_NUM	(14 + 24 + 21) /*   Channels_2_4G_NUM
-						* + Channels_5G_20M_NUM
-						* + Channels_5G
-						*/
+#define IQK_Matrix_Settings_NUM	14 /* Channels_2_4G_NUM */
 
 #define		DM_Type_ByFW			0
 #define		DM_Type_ByDriver		1
-- 
2.20.1

