Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB42D2C93
	for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 13:51:47 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 67-20020a1c1946000000b0030d4c90fa87so3108866wmz.2
        for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 06:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5uajmj1YgSvRkUX34I9MKZYDxwuicYCwxleBLDv7Pa4=;
        b=L4MKbPboOjuQfZ+MuVhn4BOeBMDc2apxjo+B+h31CWFVt44wwhYQL5/2g10UbILlPX
         j3lAIA5qXO8XJAVXPU9z7nPH2kBDRrSPdTBVKCKKhkrLSLHJYPwNkfqjvZsGOWM227oK
         XctO8l0g7NPprioJu+8YgoRsFE9GACshuAY1lp8KmW2n54UvnwjMj2BGFuxPEf6CSjqj
         v6rBzy8VzZIksQIsCIlaVF57MkveQ5mtBVUW4M2KbRRyD2VmuE6GreQCdUzBJUHRR3E7
         L4aCmlCWiBvxSxdPrqSukzQC8A6ckSQSAgtshVmAvrZyyFUR6f1ozWe3Icu7fzCMWhON
         WNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5uajmj1YgSvRkUX34I9MKZYDxwuicYCwxleBLDv7Pa4=;
        b=FixWr9bkKJXkawBribyCPcTqzZTW0Ml6GBujdGBCDk2qyTiTOsHi9fsE5onZ5v5CET
         0ttEAuRTY47mXeB/9/CmRuqtqHOcCLSjg3+GXCzW3NFRK1m6FpAmep4pCD/BqDUdTK7w
         ReOZBo4CWFlk15s9hNJEfkOgp7zvjzAFpnc0/46zNHdVcbX6SpABKt5uGoQwazUCqauc
         AaKh6BlE9LMJpExWD0l+K6ROHmAc46ncR4eIeeczyH0DqvRC88EMAxvEnVy9DyJc6fm4
         I6gC8FFuE017XIZ1e8TGbL6mZUDbdwNfwJlKKh93Jl+5Mmd5BL7ZKQrVYWDxoaALA9qr
         sbiQ==
X-Gm-Message-State: AOAM5307xWB5s4NYPy9Z9i7N12WLqHP6g8gseklrcR0YmNxFozmOv4QR
	2oMYba5zL+r1txuGqzVUTGFHc5lFCrc=
X-Google-Smtp-Source: ABdhPJy+PPiu6sj8YeA/vP3HKM37k8CAYjttrIOafbhOoH8zmKDYqxMM5u+U9XcEe32wAh7+xorOjg==
X-Received: by 2002:a05:600c:198d:: with SMTP id t13mr6211887wmq.21.1634651506269;
        Tue, 19 Oct 2021 06:51:46 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::3de4])
        by smtp.gmail.com with ESMTPSA id i203sm2280699wma.48.2021.10.19.06.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 06:51:45 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 5/7] staging: r8188eu: remove unused fields from enum odm_common_info_def
Date: Tue, 19 Oct 2021 15:51:35 +0200
Message-Id: <20211019135137.9893-6-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211019135137.9893-1-straube.linux@gmail.com>
References: <20211019135137.9893-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused fields from enum odm_common_info_def.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/odm.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index 1ad7ee5919ef..97a24f8d2f53 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -246,7 +246,6 @@ enum odm_common_info_def {
 	ODM_CMNINFO_SCAN,
 	ODM_CMNINFO_POWER_SAVING,
 	ODM_CMNINFO_NET_CLOSED,
-	ODM_CMNINFO_MP_MODE,
 /*  POINTER REFERENCE----------- */
 
 /* CALL BY VALUE------------- */
@@ -255,11 +254,6 @@ enum odm_common_info_def {
 	ODM_CMNINFO_LINK,
 	ODM_CMNINFO_RSSI_MIN,
 	ODM_CMNINFO_RF_ANTENNA_TYPE,		/*  u8 */
-	ODM_CMNINFO_BT_DISABLED,
-	ODM_CMNINFO_BT_OPERATION,
-	ODM_CMNINFO_BT_DIG,
-	ODM_CMNINFO_BT_BUSY,			/* Check Bt is using or not */
-	ODM_CMNINFO_BT_DISABLE_EDCA,
 /* CALL BY VALUE-------------*/
 };
 
-- 
2.33.1

