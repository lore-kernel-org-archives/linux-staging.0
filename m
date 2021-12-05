Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417172CA8
	for <linux-staging@lists.linux.dev>; Sun,  5 Dec 2021 13:59:34 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id v1so32150565edx.2
        for <linux-staging@lists.linux.dev>; Sun, 05 Dec 2021 05:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4Woq3HlHO11za/Z8dWOzGeHMcMYdN1R19HxtEMwFIAg=;
        b=N4oJAjk6+V+5Oh9/bZA4bR9NI8uGFmDf0Za46qdJUZs5Jsz2TPEalWRJh82s9lVPhd
         EbTLXPYZ71FyIiEP846aoB8VygKe8ffZWenStW4lKExavzZ6ZK68LyjQvkNmYny/AIZ6
         xwYRQM38A0IWxJbI0PZoJq7t20w0mX/TVZosGzkWR9D4RJSL5TRjxsmOX05nEkmhAyCC
         qWnEkiW1lfn0Zq+WwwiZ6YNd1wjSUQhN3/BxszuTYlOHrqGTTasw6uaLzaLT6IHGOneQ
         6499RZVEzG9GY5TdFqhlbDuzFGP7TbpuevIczwWOqLAoDman7xFumR7+YRu1Es7aR2Ck
         zJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4Woq3HlHO11za/Z8dWOzGeHMcMYdN1R19HxtEMwFIAg=;
        b=pPjVd5cmI+7zyvtiukZ9Fubxv7eRwsCXmlvJNa2uY/tuyR8i8x7Zv+nojzh1ak20wH
         kd5UFK/W7UGAj4BOiOYwF3XcTtcLb8CyzrHWSLfYXPFmX1Lh+4CrbFmf3q0wjsvhhaNd
         yM2IEd99P9IdXJxEdKm3D6bV9T8YRLz2+X2F2xJrfNdCfcFHRNa8/GoGVYhIaA4yiBcg
         2/UeqF3LetKogSjrSd+iTZxmGbW5NzDZdwA45B+15ScUIp5RYaflb0d4C91wIapLHTnp
         Vk934SAZpdWUGexnX+fAhPhs+skclcPhVS5/XfXn/ouS78gPFr9twAYdaLMJMal4czsN
         57FQ==
X-Gm-Message-State: AOAM533/Ik095R1/vinBorYteX6c2xfk/0eShY2DiLgmXkLOJuk1K9G0
	1OdGZPXfCm4e7XT0sIGJN5s=
X-Google-Smtp-Source: ABdhPJwVSqLsF7seQb3loYSztRDEescEwXD7kSzmUYOU3NW7DrwiLY6dMYrQRoGl/8dO29VctB+rjA==
X-Received: by 2002:a17:906:e28b:: with SMTP id gg11mr38796707ejb.23.1638712772569;
        Sun, 05 Dec 2021 05:59:32 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::5a05])
        by smtp.gmail.com with ESMTPSA id yd20sm5146451ejb.47.2021.12.05.05.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 05:59:32 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 07/12] staging: r8188eu: remove duplicate defines
Date: Sun,  5 Dec 2021 14:59:14 +0100
Message-Id: <20211205135919.30460-8-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211205135919.30460-1-straube.linux@gmail.com>
References: <20211205135919.30460-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following constants are defined in three different header files.

IQK_MAC_REG_NUM
IQK_ADDA_REG_NUM
IQK_BB_REG_NUM
HP_THERMAL_NUM

Keep them in odm.h and remove them from Hal8188EPhyCfg.h and
rtl8188e_dm.h.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/Hal8188EPhyCfg.h | 5 -----
 drivers/staging/r8188eu/include/rtl8188e_dm.h    | 7 +------
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h b/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
index f4cfd11b36c1..addc6a5354a6 100644
--- a/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
+++ b/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
@@ -11,11 +11,6 @@
 #define MAX_TXPWR_IDX_NMODE_92S		63
 #define Reset_Cnt_Limit			3
 
-#define IQK_MAC_REG_NUM			4
-#define IQK_ADDA_REG_NUM		16
-#define IQK_BB_REG_NUM			9
-#define HP_THERMAL_NUM			8
-
 #define MAX_AGGR_NUM			0x07
 
 /*--------------------------Define Parameters-------------------------------*/
diff --git a/drivers/staging/r8188eu/include/rtl8188e_dm.h b/drivers/staging/r8188eu/include/rtl8188e_dm.h
index 208bea050f6f..0b3a9a1a4e5c 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_dm.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_dm.h
@@ -8,12 +8,7 @@ enum{
 	UP_LINK,
 	DOWN_LINK,
 };
-/*  duplicate code,will move to ODM ######### */
-#define IQK_MAC_REG_NUM		4
-#define IQK_ADDA_REG_NUM		16
-#define IQK_BB_REG_NUM			9
-#define HP_THERMAL_NUM		8
-/*  duplicate code,will move to ODM ######### */
+
 struct	dm_priv {
 	u32	InitODMFlag;
 
-- 
2.34.1

