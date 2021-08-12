Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC1170
	for <linux-staging@lists.linux.dev>; Thu, 12 Aug 2021 00:25:31 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id yk17so7808632ejb.11
        for <linux-staging@lists.linux.dev>; Wed, 11 Aug 2021 17:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dmbSK95IAXEHKOt1kFCKjuXIU0Vg0AxKnCR0OMtOosc=;
        b=uQsRNUOtNpDlm5YjMZSJUpsgXBGHfU5ek4Lr9ER4BypV31RqEUsZjgIz6fCRMTmiCG
         UHyoD1QX+v4XukF3/PnBrWHYKaJlxggrkoI3vNPpP3sNob0zXQmVrssO3uvNnCLxyepe
         FuU3JS9vHK/zDhqCDAtWWIt5OrTU9MX483kuOOdQtgKR+4kA2w35FX/Jjl+3NFNfM7Og
         w891xqXLDyyLqsT1eDdLuO0Ebbfff6eTgjr1Cen2oBp4FGLg/gLfpK5doBkpiZTBrpWf
         jesESAM6fUUSxVuYRfrVcJHraL+CNuIKhsJe32uc3IQSl0r3O9FQmJZrALnupuzrfh60
         CFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dmbSK95IAXEHKOt1kFCKjuXIU0Vg0AxKnCR0OMtOosc=;
        b=JMgwXg2VpQmBWvVT30/d6J5nQmIH8UQBZeVa40Ins3nSiyccWZ8MFTEBb3xBvV5Ykk
         Drk1OKHD4761FRa76gxApTK7SUJ43anas7CW8isYiEsBYFcZuqgLtNwIQxfP7uSEr3IM
         lzrVDkp49p7K+z4N0wuVpHr56ykT8lcGxMa1MnJdfgvalStmErqafxpu0EKI7O/dYDfk
         XFb8un9NFG18PgKIH7v1kmE35fpczR3ZqMR/HtlUUybPTNO4i5TJnqndGhb0jD6pB2DR
         8DeJoTmnwK4TPeg6WPLZ+dcWaqxVF5WtyGDOuI/6swOOS/XHaf6Ovv0NApVWDGN4pi/m
         7lSw==
X-Gm-Message-State: AOAM531qu+crYSS+AoU22+XMJePAwhi7W483tqTeTtvFp7pHbOjzy5YB
	sqpJPl0CyfQi2/BUu4WyGdo=
X-Google-Smtp-Source: ABdhPJw9mXgJSEtM9MlQP0B2I/hzUHPv9plSLllnMWJs+Vr07CXo/TZcW+asNngCgiLiRx80n2VLTQ==
X-Received: by 2002:a17:906:150c:: with SMTP id b12mr1075003ejd.275.1628727930172;
        Wed, 11 Aug 2021 17:25:30 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-109-211.retail.telecomitalia.it. [79.22.109.211])
        by smtp.gmail.com with ESMTPSA id l20sm265048ejb.23.2021.08.11.17.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 17:25:29 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Martin Kaiser <martin@kaiser.cx>,
	Michael Straube <straube.linux@gmail.com>,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH 2/3] staging: r8188eu: Remove code related to unsupported channels
Date: Thu, 12 Aug 2021 02:25:18 +0200
Message-Id: <20210812002519.23678-3-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210812002519.23678-1-fmdefrancesco@gmail.com>
References: <20210812002519.23678-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove all code related to unsupported channel
bandwidths. rtl8188eu* NICs work only on 20 and
40 Mhz channels.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/include/odm.h    | 3 ---
 drivers/staging/r8188eu/include/rtw_rf.h | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index a1f8c7fe595c..4dadb22bcc89 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -567,9 +567,6 @@ enum odm_security {
 enum odm_bw {
 	ODM_BW20M		= 0,
 	ODM_BW40M		= 1,
-	ODM_BW80M		= 2,
-	ODM_BW160M		= 3,
-	ODM_BW10M		= 4,
 };
 
 /*  ODM_CMNINFO_BOARD_TYPE */
diff --git a/drivers/staging/r8188eu/include/rtw_rf.h b/drivers/staging/r8188eu/include/rtw_rf.h
index 0f790da7e0aa..48129da9c93f 100644
--- a/drivers/staging/r8188eu/include/rtw_rf.h
+++ b/drivers/staging/r8188eu/include/rtw_rf.h
@@ -97,9 +97,6 @@ enum rf90_radio_path {
 enum ht_channel_width {
 	HT_CHANNEL_WIDTH_20 = 0,
 	HT_CHANNEL_WIDTH_40 = 1,
-	HT_CHANNEL_WIDTH_80 = 2,
-	HT_CHANNEL_WIDTH_160 = 3,
-	HT_CHANNEL_WIDTH_10 = 4,
 };
 
 /*  */
-- 
2.32.0

