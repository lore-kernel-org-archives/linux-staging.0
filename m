Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBF52F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:44:38 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id u17so105745742ejk.2
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y6sZe3osaLDDSPNYI5JYp+0cY5GbbYZW8NCqEYTYFpk=;
        b=kpYbP3v49ZrJXNwFUerq2hy9le+XzMitFt2alpXjW2HSr6gqoVABUkUrVDPHkflZma
         a8T1smhe3QwTby6/jtxzmRrGrKHWX5yL+cVC2Q4rETf9B3E7+k5VmvmvvoLgD4oPoV02
         Lt21ZLItPpencJ6U5/GMgKU/6zY2igXvHVZdYU5rqwXZJzg6UaIDte5jqeEDRcNrWBNn
         xzXHQtvIK4GAjTiV7hQ83ilqYYKO8shKFHMgUITs3kIWNLTGgjp9clfEMoVVc6QzRUas
         hXxIZbIoKcJAl2yrtXjwnGWapjNDvIfngvjiY7UyCHMIU2fG+TjDUA8dH7HOkph7BRdz
         19Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y6sZe3osaLDDSPNYI5JYp+0cY5GbbYZW8NCqEYTYFpk=;
        b=rOsx4YJYkWjaZfYOVw9HN/bBL7e2mmUi6cHwevof1P/FICcuw7gZMzgl51IkfMLfrQ
         BqFAeK5VOmhiHBrI8ughCZZf+7Mz5BS8E6N0C86eIfBPMofS/GofRK3IIfL0Ldv/cPqV
         voPCqak4nI4EnhEfbZ2MQUwHL5kRSj/EbDtZBJx5LV8cgoq7qWYO2UbZ2fR8lwlfR1qM
         2OsBsBl/qfjN1YjoDgBr41XbDt49U60ovDw7zWx99kVLahgJD8/1yRpWTJYqAsV0Roki
         sKnuzBjijiQBbYYWJ2NKlcL5neKae5yOZTQtxuvMgoaVp9magPmpnB8LnrXWnmhDH5Xy
         7MJw==
X-Gm-Message-State: AOAM5311zltf4/zGBZvBFOjThrkTwm1G2sBjvJi+D6tttfYULgJM1c+V
	mXIQgmFhqtuG/yo/yjGAKxE=
X-Google-Smtp-Source: ABdhPJy0Lz6O3LYFyKcHfI3WF1K3JbYsO1gUycGds5RHf+oQXAwlKtyyI4BRHUjxCGS5v8Bywyfl7w==
X-Received: by 2002:a17:906:3b84:: with SMTP id u4mr4774831ejf.131.1619793876943;
        Fri, 30 Apr 2021 07:44:36 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id bu8sm1536032edb.77.2021.04.30.07.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:44:36 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 15/43] staging: rtl8723bs: remove empty ifdef block
Date: Fri, 30 Apr 2021 16:43:45 +0200
Message-Id: <21cb62753847caa30017b04004ead2b6d75b3191.1619793405.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619793405.git.fabioaiuto83@gmail.com>
References: <cover.1619793405.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove empty ifdef block

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_debug.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_debug.h b/drivers/staging/rtl8723bs/hal/odm_debug.h
index c359eabebb67..8ae9948fb0c6 100644
--- a/drivers/staging/rtl8723bs/hal/odm_debug.h
+++ b/drivers/staging/rtl8723bs/hal/odm_debug.h
@@ -95,10 +95,6 @@
 	#define ASSERT(expr)
 #endif
 
-#if DBG
-#else
-#endif
-
 void ODM_InitDebugSetting(struct dm_odm_t *pDM_Odm);
 
 #endif	/*  __ODM_DBG_H__ */
-- 
2.20.1

