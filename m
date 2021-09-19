Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672FD3FC3
	for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 22:06:37 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id e16so2972681qte.13
        for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 15:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eNeXjhvCGZPX2nOcWVH9hj3paV16QHjNZaxjtD37JKc=;
        b=bdju8P1JNCtH4FfOsfKw7jhE+FYFlGhixvqUVUw+RqDWnnBJqcVQ7uHC8HY/n67igG
         NmbK0lxIa97y48TrV5uezSA9uY1aLC/7M9ewytY/DgBeWukMZoOB7OBpP1e3qDuUxzUb
         f37HvE6PLVO3RPAUj1vJnOa1F/hWZ2uSscEuaJUJZ/aiMyirrS0zEBuCbt7xAeX/2Mj6
         AC0LZ7Bu50G6OwF4FAAPzp3V5EXNhwUczqT9CfsU52E9pJEaEa/BMHLWwJIbbOU4iFDI
         xWA5VfWik7ivuD4hlfuDZ3Hc22O/5tG0i67yJy088RHZv3FN+8SUDUUgLBvMedDVwPjB
         KT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eNeXjhvCGZPX2nOcWVH9hj3paV16QHjNZaxjtD37JKc=;
        b=2tMgRkW5PeklQpwo8n3lBjVeqEJt65sHXc1w+JX9TlvohITyNEb5ZL/ZgoIB+2cvSZ
         5zHejUd6UDR8OwNWYq3Ww8Kr7EWZ0IJDoDOvZaN9tkLPIV3uwEsK/Dzp70CkE02IKrit
         iYdiVbNRQ3SI/8/zIA09QyBQDLmAU6LdlOmitkbMoDjIh4K6KWnj3ikL5WVorJFiEWDf
         qzinTbEznfgrAf8RXQwzASMZnlR+9FdF5HKZiV9oBtw/d++pd3WzIpvcI7up4Om8ne+H
         R0DX49mlHuh0pAjtDQ36lx5YIG7XBvC+dFW9WhDrN0h1ghfTDHKdRx7LALJGnCsGa30V
         kuiw==
X-Gm-Message-State: AOAM533/9V40joNltAa7le8pj33KN6QUSTR/YR8Qoquyir4gSK/uTiYD
	+PDnRR5oflwPLBqwTr4EZNlFT0R6rn0=
X-Google-Smtp-Source: ABdhPJwtILmiTO6cTMW/YTNJdEBI3XfCBQKbiBaQpwYLShtu+IbVkdLRc8b2tAot/kzdA8IX1g3bgw==
X-Received: by 2002:ac8:7c8d:: with SMTP id y13mr638530qtv.27.1632089196296;
        Sun, 19 Sep 2021 15:06:36 -0700 (PDT)
Received: from localhost.localdomain ([191.84.236.195])
        by smtp.gmail.com with ESMTPSA id t23sm246313qkj.31.2021.09.19.15.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 15:06:35 -0700 (PDT)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	nsaenz@kernel.org,
	stefan.wahren@i2se.com,
	arnd@arndb.de,
	dan.carpenter@oracle.com,
	ojaswin98@gmail.com,
	amarjargal16@gmail.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: [PATCH v2 5/7] staging: vchiq_arm: fix quoted strings split across lines
Date: Sun, 19 Sep 2021 18:59:12 -0300
Message-Id: <20210919215914.539805-6-gascoar@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210919215914.539805-1-gascoar@gmail.com>
References: <20210919215914.539805-1-gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Quoted strings should not be split across lines. As put it in
Documentation/process/coding-style.rst: "never break user-visible
strings such as printk messages because that breaks the ability to grep
for them."

Reported by checkpatch.pl

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c    | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 778540faaa1c..3225f0738ef9 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1613,9 +1613,8 @@ vchiq_dump_service_use_state(struct vchiq_state *state)
 	read_unlock_bh(&arm_state->susp_res_lock);
 
 	if (only_nonzero)
-		vchiq_log_warning(vchiq_susp_log_level, "Too many active "
-			"services (%d).  Only dumping up to first %d services "
-			"with non-zero use-count", active_services, found);
+		vchiq_log_warning(vchiq_susp_log_level, "Too many active services (%d). Only dumping up to first %d services with non-zero use-count",
+				  active_services, found);
 
 	for (i = 0; i < found; i++) {
 		vchiq_log_warning(vchiq_susp_log_level, "----- %c%c%c%c:%d service count %d %s",
-- 
2.33.0

