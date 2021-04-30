Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842CB2F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:58:02 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id a4so12350042ejk.1
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=esklRFhcv92jAvcOLhHGS3GTMlKhQ0QkDSmO8wy1pRY=;
        b=nKeBhsTC/8rjGBpua0mTmIOPgSdF7/aB8EqOb2PFCUFMRIB1troydDdf1jYXXhfYKA
         4pqT8IW9I7kxoGJB4qHsN78lubfr05xIaz/jkWaotu4qCVgs4TcE5bUdPLR1nqJlX8hY
         N/KkYsncX69e9vhen3jecNx9m9sTPpwTl+Fyy7e7DBlfWsilQr134oFcmdURIzQg9JYq
         wgf9DgLBNOWHocjmZioP8nEZS011mxTXmrayYr0gkmF2cbr52VH26LioMbcN7XNXxTpE
         tn3LWQOmaDZ9VcOo0uG1Q/2IaVUQSHOW09kpOVLukIKMj0EdtsCCGZDm7ZZWsicOO5Qf
         v40g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=esklRFhcv92jAvcOLhHGS3GTMlKhQ0QkDSmO8wy1pRY=;
        b=HcWkgaPKx41fIBn/6y02GanBnq91OcGar0ztmKWCwWaBgcJ/aI4tS/Gu675bSM2pAJ
         hEIP05ttV3BDkYig92s4cY+td+kb3nJbTKiOtxHNdZwkn+/ShV3kdfvLgxIzyaLTdWo7
         5dOoMcj4uLHD/RLXr8U8TlBoSVnqcPoUB6lh6YKBbE7z+J9QW0QoFkhLBh29kNbp9mYC
         4ANNgR0EC9mRi1V83yjZP2wuUbDRgPXw49ssdvhLA/2aB+nwsuCIegRLfDrCDecOYwH4
         cx4SetETopzq4I+YoeVcquDsB/VuldMwAEZUgHyzESUEkKTTgzvI4GxioiuUU4HAOjY+
         W5Lg==
X-Gm-Message-State: AOAM5324rm/+N/r+Tbp7A/lFV0zGpZvZNIgHbyHXPgdnnABOUkdpoCyO
	wMrzxhiJSMzaqsJnnUWhcvU=
X-Google-Smtp-Source: ABdhPJzhe2S0b7ukQqof4118OOSqK5krVjl2deH+lVNCH9hNQ7d4C/JICbudXA5gyvNPrW+ZzbaBBA==
X-Received: by 2002:a17:907:2623:: with SMTP id aq3mr4719540ejc.262.1619794681187;
        Fri, 30 Apr 2021 07:58:01 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id u1sm1425763edv.90.2021.04.30.07.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:58:00 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 33/43] staging: rtl8723bs: remove unused enum
Date: Fri, 30 Apr 2021 16:56:55 +0200
Message-Id: <029a9639ef046e44defc59854d6bb9a86dd3db4f.1619794331.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619794331.git.fabioaiuto83@gmail.com>
References: <cover.1619794331.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused enum.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
index c5444f965699..c4616a69425d 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
+++ b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
@@ -78,12 +78,6 @@ enum {
 	BTC_CHIP_MAX
 };
 
-enum {
-	BTC_MSG_INTERFACE	= 0x0,
-	BTC_MSG_ALGORITHM	= 0x1,
-	BTC_MSG_MAX
-};
-
 /*  following is for BTC_MSG_INTERFACE */
 #define INTF_INIT	BIT0
 #define INTF_NOTIFY	BIT2
-- 
2.20.1

