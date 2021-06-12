Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6CD72
	for <linux-staging@lists.linux.dev>; Sat, 12 Jun 2021 11:45:22 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id s17-20020a17090a8811b029016e89654f93so2168802pjn.1
        for <linux-staging@lists.linux.dev>; Sat, 12 Jun 2021 04:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yETzIEA0FE51iHDiilpc4taiEHo/TOmRxZBfjJ3S7Bw=;
        b=INPsrGFMJW9mzsR/+ohw+zzIRzDn+VFI2/sI+DNCnyqJxTh6myJ82Ps1jj9LrtGb6J
         5n+oMRbDavZqOjstkv7tuaphQQqhlEDTedd6WYsQnfDWTtqzySBRtESH6PcsloCRIsXG
         gcsXonkmQJPMsv8EhAfvBl4fr46vSX6GI7GtQw3kDOdeXdvCUUmYJk10E0EGz4G7WtTQ
         wNLhkDpCIss7IPzkISxsxCBxTnJdK/Fw/Pue7mKeNUZgXzdsPq2JR1/7EWPmImXJePrn
         TFgfdRHenFtGTZNMww1uufw63w31WlH+FOGoHKczMesW5ZviySs3dRW5n82YHpcJcgON
         F0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yETzIEA0FE51iHDiilpc4taiEHo/TOmRxZBfjJ3S7Bw=;
        b=FsR/q/ucFMkxue11MfQxfNBuk6KCDC18EjDshfqScxDDu7cGmrR0PVRC0j8ejF5meZ
         Hpu7CUL0wTYCt8Qc+DYqhDkVPG+Bhbt77f37lyLW3nprP/4EoqQaw3p6Oqx4jfDIFGTE
         uzHIU2bycgwBrBHDm015s3d27mHiCiINgSIq5itAiPo7Yq/y0fbrwJJjjqDHaLszRbim
         Nxl23XLsbqZFsEthYBRWQKtgK1AyyD9Syq1xwnSfM7tf/b2aMl6n0ns7kLEH26K+YmCu
         MnhX4V3hXSkuO0lc6uCvympyzhXOu7eO69nk2RaOs0LlB1kJ2V5YlI8bzwI10O8RzXAl
         hiwg==
X-Gm-Message-State: AOAM533her22Jmh6viMKe5rrthM4xHZMCSy5ONL5FKUbhwMOVULqvC4L
	uVSFxwL9IQRAo0kfW6noiWE=
X-Google-Smtp-Source: ABdhPJxCShIv1IMMtVGH1gBsgPqeHLYwuMVVNRSYR7O5mVUCKfza4jq7durCcWsjhxPb39NYNTZF3w==
X-Received: by 2002:a17:90a:4f0a:: with SMTP id p10mr13860518pjh.36.1623498321660;
        Sat, 12 Jun 2021 04:45:21 -0700 (PDT)
Received: from localhost.localdomain ([117.222.175.26])
        by smtp.googlemail.com with ESMTPSA id b5sm1648762pfp.102.2021.06.12.04.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jun 2021 04:45:21 -0700 (PDT)
From: arjuncr <arjuncr00@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arjuncr00@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fix for checkpatch.pl
Date: Sat, 12 Jun 2021 17:15:05 +0530
Message-Id: <20210612114505.6833-1-arjuncr00@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: arjuncr <arjuncr00@gmail.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 63c65dd67..cdb451dd3 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -62,9 +62,9 @@ out:									      \
 }                                                                             \
 EXPORT_SYMBOL(func);
 
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8,)
 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16,)
 
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
-- 
2.25.1

