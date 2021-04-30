Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787992F9C
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:57:39 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id w3so105738868ejc.4
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kxnsY7XxgR5LPkLt/HzBZqQVJx7TOeoHfiVCxdpmUW4=;
        b=j4JGWIvbwXGC57+Mfn3DaUM/wuFL0F6FTYluNcYgq6ICmQV9eGJSxxSjJlo9MNDFdG
         S+3MQ3rtjIBwVEGllK+3HzJRfdVd1rIoaZAIufvdirOiEbj9EcG1DERcOHlWB1oSa87s
         3PKQ3hkS8eW7cstLQQeSN0qd2MetUbLdhbTY1j1hZT7zVs+1rs1dOoNyOqt/0Y82Y1a8
         4QRaXDSzffIBbRw6nZ2ETTzZ02QvvssHJBEvJT02SlrhD9okw4xX+MKj1yugihv2BWJu
         NlDcv9y4wpuzYXVCKVzQ4Kiv8zp4YPL8+7wiTzlsVdDaz75JWmt/ADuZLeuLrrikCVtl
         Pzwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kxnsY7XxgR5LPkLt/HzBZqQVJx7TOeoHfiVCxdpmUW4=;
        b=PdBrcsIaHPXMLmtGb5lB4SOAlGuEi4ELFctBcdfGdXyJi+mj4IdeUdnhUm2cTChGCc
         JWWowYvbJ7z9Yk3n3GpbRUL/DOurvUxNW6KW6LV5aWoNBzPIotpAv6XEZMTlbyQgDZ9i
         K8IzQ728YqMgiWhSV9RsTf9wLNRugiZFshMF3XQGqlVoditotGhE6e49SA9yOEezoLYG
         S2G+YgUniG1/gWXqPOIAfegyVx2Z7EcxMz0mK25IsPU7zf0kMcYI5Y+Jx6/PK8Bpn94Z
         JhTNZLpFyfZvS1OyQgcAQNzXbZR7VLV5zemIBqnyiXDcXZCmh8k8MAH6WRnOMxKt+uim
         dZPA==
X-Gm-Message-State: AOAM531pk6TiG3XKKk1S/juH43J1Iz0v0ISwzjdqqV2UEwteUUHemScI
	dPltjYlq1zHxqQDiUJZQjtc=
X-Google-Smtp-Source: ABdhPJyi7EtRhj0YeM8fWzfhkdUBdWEQCASJEQYZYPo9pD8ZPOlca7k+9cxRIIz53BQxwlfvNnd79g==
X-Received: by 2002:a17:907:3e1f:: with SMTP id hp31mr4749102ejc.163.1619794658138;
        Fri, 30 Apr 2021 07:57:38 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id p24sm1495441edt.5.2021.04.30.07.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:57:37 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 19/43] staging: rtl8723bs: remove unused RT_PRINTK macro
Date: Fri, 30 Apr 2021 16:56:41 +0200
Message-Id: <edf86e39fce8a53f52c8c8463d134ea426f58b60.1619794331.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619794331.git.fabioaiuto83@gmail.com>
References: <cover.1619794331.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused RT_PRINTK macro definition.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_debug.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_debug.h b/drivers/staging/rtl8723bs/hal/odm_debug.h
index 3faf4da42bd7..5c4412bf6fbd 100644
--- a/drivers/staging/rtl8723bs/hal/odm_debug.h
+++ b/drivers/staging/rtl8723bs/hal/odm_debug.h
@@ -87,8 +87,6 @@
 
 /*------------------------Export Marco Definition---------------------------*/
 	#define DbgPrint printk
-	#define RT_PRINTK(fmt, args...)\
-		DbgPrint("%s(): " fmt, __func__, ## args)
 	#define RT_DISP(dbgtype, dbgflag, printstr)
 
 void ODM_InitDebugSetting(struct dm_odm_t *pDM_Odm);
-- 
2.20.1

