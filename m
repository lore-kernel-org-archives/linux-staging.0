Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E582F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:58:07 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id f24so7145889ejc.6
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wlFfMaqoDNDPkcgOlBfijVc+2KkNjpgO1LG6F4L15Ok=;
        b=cbTTL8bq32QfkNoTj0g8T7+tQ0ynfgr9/dYZvbZOWjtm6C0bYFEY2AONl394cWuGkL
         66X4AYRlQmUNXVdaiP9tnfA+OvbP+PEuPTeZtEOaT/QRtrTuKC25vQdEcC5zKpn/D/dU
         3gm3ZIgXiZ9CjhQYZQad7vBM0peH1uquOoYpJxNp2z1mx39OYbv4nzerNWkn6UC7qEFj
         qLEkSsEkAteVRIOyPI5p4ePt08kGF+rhJEmyIGZqXfJCJM6+T3lHzG+VGMpKW/EbQzRW
         mn6SQIznh3g36m6n4u6/OvrExrgrSb8jRSItPupWrsj2gRQL7I8L6PTWYhjNQmmwtaAk
         +R9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wlFfMaqoDNDPkcgOlBfijVc+2KkNjpgO1LG6F4L15Ok=;
        b=G0GGZrssezXSToDt+5ib/Q3RARgaanJ3w4GI2lwF9+L7PxhUXNhH6fewNdL/utV5ek
         TkR9kdN17kkSmWorUwEXbbq0PrDaBIgPiJnZL8KPf6QvrpWtN2YzVxWrXco2KdqieZeR
         e85ZvIfc8lmaYrL7uUd3JZgRl7PcH9rYEvFC71sYQ5Vs7P/qK4IDjp3NH3Udt4IjjMq5
         eQBN6wTyvy87x9nQbXS3ZT49WXgulc80cQly9XoYn+mjhgHQixql/q8QjZT9bE1i0uEv
         APY7tLSKCZBQbJUYbpoZ35XyUQ+FPdE6QydMCYpxKb4+r83aWYl21ZoPSORaBHFpMsbc
         53YQ==
X-Gm-Message-State: AOAM531Rxj8bNZ0w4snKy7xSx5M9yXEA2jf9NU4M/nQJ3/Btcwfbml0L
	WaS5ehPRYXNVKt2gyarZrIU=
X-Google-Smtp-Source: ABdhPJy0nItkoE3sEk5/0AU/L4ejFhE2O1A7kqJ0z1775MlpLYqnDdZt1NeoU7Zg0//TpuT7hFHjZA==
X-Received: by 2002:a17:906:4153:: with SMTP id l19mr4752294ejk.109.1619794685826;
        Fri, 30 Apr 2021 07:58:05 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id d1sm2165089eje.26.2021.04.30.07.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:58:05 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 36/43] staging: rtl8723bs: remove unused DbgPrint macro
Date: Fri, 30 Apr 2021 16:56:58 +0200
Message-Id: <00e9b407fa1a7c911295b2fec215d82f5da058f8.1619794331.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619794331.git.fabioaiuto83@gmail.com>
References: <cover.1619794331.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused DbgPrint macro definition.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_debug.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_debug.h b/drivers/staging/rtl8723bs/hal/odm_debug.h
index 5c4412bf6fbd..c6c62bed5f3c 100644
--- a/drivers/staging/rtl8723bs/hal/odm_debug.h
+++ b/drivers/staging/rtl8723bs/hal/odm_debug.h
@@ -86,7 +86,6 @@
 #define ODM_COMP_INIT				BIT31
 
 /*------------------------Export Marco Definition---------------------------*/
-	#define DbgPrint printk
 	#define RT_DISP(dbgtype, dbgflag, printstr)
 
 void ODM_InitDebugSetting(struct dm_odm_t *pDM_Odm);
-- 
2.20.1

