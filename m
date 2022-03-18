Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB79915A7
	for <linux-staging@lists.linux.dev>; Fri, 18 Mar 2022 16:50:50 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id m12so10909646edc.12
        for <linux-staging@lists.linux.dev>; Fri, 18 Mar 2022 09:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Oijxu/f5iYqZvIjDXs+VJYzgILezr7W6S5yxU4cLB60=;
        b=MJbIasCfRhwa1NH1dypo3beHOiq9TBtIHjvCEGUEZ7NpriFAL1IoyGPICKVH8vEY/r
         67Zw5yWC5jkH9CfENfL8ssHzagmKZk97sJWKBH1RGJRlVbciKijZPCn1nF16TqvxQt1N
         kIzUwgY3WmovpFOU5+5CF2iRXzr4AI5HxGeLvcHAd9/MXqo55KocpszME6BtYeemHL2o
         CrcZKqXiopX0YvwOhj8UmaGKVF2hvMTSrekJ5NKgTF3+AYgZBuSWA9v7g6Zjbk+YUNqh
         XeWWJ+6k2fPEBjijBmqIMuJy3ncLys/r+K4I/N7bJj9+D28ryfb4HXGzt8Itr6egKiU8
         pnBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Oijxu/f5iYqZvIjDXs+VJYzgILezr7W6S5yxU4cLB60=;
        b=wgCJncOdjAR1RUujWFN2PcI/czi51TYBp3sfgBPRv9Zpz0OsbteGMYY8UCyo3gSAoH
         Y3j9G7C4EMDkqVCNjysM/3LQKzhevUclVwslzzH8zbzBOiL+LNm9uwNno6zqQvOGkTUD
         xDRGs2SI1MUzdbZo9bf10RYkyAVUrpSangdt2APMsLbVtEnhZzC6GhqBBCkOuyRoXzOf
         9jwHmtoADlxCCzaBKWJuhcZfDtoXY+ZwhnoADSuoipwhoNqnBN6S5BgMeRj+vqH+H4kj
         K/KdLU8mKmoqJWGe291Ud4cgZpJfPZeUyhXg+wP51YolA3e7QZTAfe/etQEsJW6n94mI
         mSKg==
X-Gm-Message-State: AOAM533Hwlaocwhlv7W//rspn2oOcHhu9dAb+efXUYH6EbEd1YveJGbe
	DdZyRIqjxOcVItmE5W7tJwnWUQyS3Zwz8g==
X-Google-Smtp-Source: ABdhPJzHe/FYbC6iOGD84lzpd3XCiGnXiREZKFepXaNGJAi4f2Qgu2pKiNJKo79P3iPLU/XjvSpvNg==
X-Received: by 2002:a50:bac3:0:b0:418:edb0:4ae8 with SMTP id x61-20020a50bac3000000b00418edb04ae8mr10109911ede.219.1647622249016;
        Fri, 18 Mar 2022 09:50:49 -0700 (PDT)
Received: from nam-dell (dslb-002-203-132-165.002.203.pools.vodafone-ip.de. [2.203.132.165])
        by smtp.gmail.com with ESMTPSA id g2-20020aa7dc42000000b00418ef55eabcsm3613764edu.83.2022.03.18.09.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Mar 2022 09:50:48 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcaov@gmail.com>
Subject: [PATCH] staging: sm750fb: add necessary #include in sm750_accel.h, sm750_cursor.h
Date: Fri, 18 Mar 2022 17:50:46 +0100
Message-Id: <20220318165046.33745-1-namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In sm750_cursor.h, struct lynx_cursor is used without including the
header file where this struct is defined. Similar thing is seen in
sm750_accel.h.

The module can still be compiled because there is "#include "sm750.h""
before every "#include "sm750_accel.h"" and "#include "sm750_cursor.h"".
However, the order of #include should not affect the ability to compile.

Add "#include "sm750.h"" to sm750_accel.h and sm750_cursor.h.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 drivers/staging/sm750fb/sm750_accel.h  | 2 ++
 drivers/staging/sm750fb/sm750_cursor.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/staging/sm750fb/sm750_accel.h b/drivers/staging/sm750fb/sm750_accel.h
index 2c79cb730a0a..fe6ff196272c 100644
--- a/drivers/staging/sm750fb/sm750_accel.h
+++ b/drivers/staging/sm750fb/sm750_accel.h
@@ -2,6 +2,8 @@
 #ifndef ACCEL_H__
 #define ACCEL_H__
 
+#include "sm750.h"
+
 #define HW_ROP2_COPY 0xc
 #define HW_ROP2_XOR 0x6
 
diff --git a/drivers/staging/sm750fb/sm750_cursor.h b/drivers/staging/sm750fb/sm750_cursor.h
index b59643dd61ed..f023b691ac0b 100644
--- a/drivers/staging/sm750fb/sm750_cursor.h
+++ b/drivers/staging/sm750fb/sm750_cursor.h
@@ -2,6 +2,8 @@
 #ifndef LYNX_CURSOR_H__
 #define LYNX_CURSOR_H__
 
+#include "sm750.h"
+
 /* hw_cursor_xxx works for voyager,718 and 750 */
 void sm750_hw_cursor_enable(struct lynx_cursor *cursor);
 void sm750_hw_cursor_disable(struct lynx_cursor *cursor);
-- 
2.25.1

