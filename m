Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69ED6D0D
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 16:40:07 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id u17so16722419ejk.2
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 09:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TYC5pS0xZoRYRV3BpSxKjUXSyW8aTbxm6/R1LCQeLzw=;
        b=qV50w6B8dKqAjAmUayknbkDnjoTNg3BVKtkUfavuH2Ko5BoDXs6W0KfMdPVqXa4t40
         CFDr4rS4U6HJBrhrhHCWn6mDvzzMXyNckepu1qbjeaHYsUkzgXRxVj0jwXGiM56tZfbg
         F8JFEvZa+GaJBynVMqfAT743ycIV11ef+8zDPhBPQR3OSkI1t4A0TseXbpkcR6NVTmVB
         7RSydu7KZnvqQg0j4kiqfeizcy4KPervJAYw4gKmXA8/j7RXHN6tCcVZQrw9Jx5vjWWR
         6ufSUQMJeCqrFIrAcQAmPv4FpkDArjAVCNCBsqq6vPXACC85QxngpL/MdNWvQ1vFDWbT
         k24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TYC5pS0xZoRYRV3BpSxKjUXSyW8aTbxm6/R1LCQeLzw=;
        b=JYJT+YwEDKhAkz6UNASWVs99nIlJtMkzuGXz8AWlA5R6bK38Bc6pnMguUoTvSG23Td
         Qy5/Im1SRKeCugmu7fi22sz9KayN36kTMEkB283BHCF1NuMrmj7DHGyJpB5JW4M1Jncs
         5KYxRLIJYBa2IU8AFF9rBTkOz0NhAiB14KQln830EM064ZH3Ins/kxocOURUWJCGncKH
         W4IGO90LsEob4WJiaXJLcXIu7J2w7IRxCfw0fwn37pu6m2FDOqeO8QazPb4IqXE8/pfg
         l/XWyi7ntngsqZ4anaeD56OAT+WHGRIaOpBGgk234Xxp1I0EKJsJRitxxkPfwVKe5C9H
         jR9g==
X-Gm-Message-State: AOAM533+Z2eFMF8xXD0mNJGtA19GXuTQwd4OYf1gqaPcgrf8S1t0fV0B
	fGEA4qSl4mY0/nw2D5zHb0E=
X-Google-Smtp-Source: ABdhPJy7sW6ic8uagw1PdBfYwaIz1gA5ezwo92Wh8hrIC5f8GuoRKE48Me3mP1HmWhy7b0RmPOzZ4g==
X-Received: by 2002:a17:906:430f:: with SMTP id j15mr21808675ejm.543.1617727206298;
        Tue, 06 Apr 2021 09:40:06 -0700 (PDT)
Received: from localhost.localdomain (host-79-42-91-147.retail.telecomitalia.it. [79.42.91.147])
        by smtp.gmail.com with ESMTPSA id u24sm14117326edt.85.2021.04.06.09.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 09:40:05 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy-kernel@googlegroups.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [Outreachy kernel] [PATCH] staging: rtl8723bs: hal: Add spaces around operator in HalBtc8723b1Ant.h
Date: Tue,  6 Apr 2021 18:40:01 +0200
Message-Id: <20210406164001.13646-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.30.2
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added spaces around operators in file HalBtc8723b1Ant.h. Issue detected
by checkpatch.pl. Spaces are preferred to improve readibility.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.h b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.h
index 59e8c68cdc20..719e19420a3b 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.h
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.h
@@ -15,7 +15,7 @@
 #define	BT_INFO_8723B_1ANT_B_CONNECTION		BIT0
 
 #define	BT_INFO_8723B_1ANT_A2DP_BASIC_RATE(_BT_INFO_EXT_)	\
-		(((_BT_INFO_EXT_&BIT0)) ? true : false)
+		(((_BT_INFO_EXT_ & BIT0)) ? true : false)
 
 #define	BTC_RSSI_COEX_THRESH_TOL_8723B_1ANT 2
 
-- 
2.30.2

