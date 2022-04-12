Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A4C1FA1;
	Tue, 12 Apr 2022 07:15:53 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id s137so13686120pgs.5;
        Tue, 12 Apr 2022 00:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ytee5BXPFue//i/S5H9XW0vp//57/msLsOSPYDoD7pA=;
        b=HWT0wuY+bs4wBailgXc8fTEGU1IYrL1BQo966ATg49Crbz7KaAeqizYOrHHpbjyeTD
         cjoUyPKKQbOy7JJtZt1y2fDZrnjWyVt2P4n8qCFkq2PX8JWDVNeOrDjxwbwrafTENTzQ
         38zoChLnzdTWZXYZy+XNTTPsX8dcdX99l4SzSvvEIFiVRZzjozKgGXPJuR1Rd11nBjw5
         dCFTenCkAnzMwKD4DPj0HA3DuPNCUdhGVKWHxPP0lp+dlQl1v4AlqRqC6IwyYEmkgbw3
         TwB8Xdu2txkZtyvYRBXy5TL3CcIC4CMjv3gAgBeVhVgQtHCNdW0ZKzwT4d3OrVUKgNyu
         zXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ytee5BXPFue//i/S5H9XW0vp//57/msLsOSPYDoD7pA=;
        b=odDfO22WQYi5wqbXOfhouf4467otWG9lM96o+MpKogJT/ThtsMv/43Obvad1ndQkzg
         NkFRhwE913BSttZoc8q6C5ZH7NYalOxl0RojjZo2i50A/gKi6tzqjOC91r4z6xht9c2c
         3hkSyqn+r6KhsGSAl7s5901JfGNUQlyl5X/myvPjzlyeYMcKkloHYJhohk7ABidicE/T
         0HRoMD30KfWOClRmsbOpXMConuyvYzrR0BZGODOEH6cT0bi2CW/jvjORlo4QwNhNblc+
         jffu9RliMUL1Ni1ViupzW4JLgkAuzjXiDVpvoD1+RJN5wSWdo2BEeiSr7gy2qIDB5YrK
         kfLw==
X-Gm-Message-State: AOAM531s6tjOOO2lrC/SzMmMDTRJFG4rtHrO/nON1UwujQMNX78wbYMS
	flCCTlyY9vHaghwllqLso9Q=
X-Google-Smtp-Source: ABdhPJyKoajIN6GLvhNakduARZrxYQmKrsEnBaTRWINhHNf1z4d3cpC7qDOxmLta/u9eiTAuI8cZLA==
X-Received: by 2002:a05:6a00:140e:b0:4e1:c81a:625c with SMTP id l14-20020a056a00140e00b004e1c81a625cmr36649535pfu.39.1649747753210;
        Tue, 12 Apr 2022 00:15:53 -0700 (PDT)
Received: from aliyaR-laptop.domain.name ([14.139.241.88])
        by smtp.googlemail.com with ESMTPSA id s3-20020a056a00194300b004f6664d26eesm40384711pfk.88.2022.04.12.00.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 00:15:52 -0700 (PDT)
From: aliya-rahmani <aliyarahmani786@gmail.com>
To: florian.c.schilhabel@googlemail.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev,
	Aliya Rahmani <aliyarahmani786@gmail.com>
Subject: [PATCH v3] staging: rtl8712: efuse: code style - avoid macro argument precedence issues
Date: Tue, 12 Apr 2022 12:44:57 +0530
Message-Id: <20220412071456.40980-1-aliyarahmani786@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aliya Rahmani <aliyarahmani786@gmail.com>

This patch fixes checkpatch warnings of precedence issues. Added parentheses
around macro arguments 'offset' and 'word_en'.

Signed-off-by: Aliya Rahmani <aliyarahmani786@gmail.com>
---
v1 -> v2: Updated the description of the fixes.

v2 -> v3: Rework the changes and commit message.
---

 drivers/staging/rtl8712/rtl8712_efuse.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl8712_efuse.h b/drivers/staging/rtl8712/rtl8712_efuse.h
index 4969d307e978..2e1ea9d7a295 100644
--- a/drivers/staging/rtl8712/rtl8712_efuse.h
+++ b/drivers/staging/rtl8712/rtl8712_efuse.h
@@ -15,8 +15,8 @@
 
 #define GET_EFUSE_OFFSET(header)	((header & 0xF0) >> 4)
 #define GET_EFUSE_WORD_EN(header)	(header & 0x0F)
-#define MAKE_EFUSE_HEADER(offset, word_en)	(((offset & 0x0F) << 4) | \
-						(word_en & 0x0F))
+#define MAKE_EFUSE_HEADER(offset, word_en)	((((offset) & 0x0F) << 4) | \
+						((word_en) & 0x0F))
 /*--------------------------------------------------------------------------*/
 struct PGPKT_STRUCT {
 	u8 offset;
-- 
2.25.1

