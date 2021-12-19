Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17FB2CA0
	for <linux-staging@lists.linux.dev>; Sun, 19 Dec 2021 18:20:09 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id j21so25074179edt.9
        for <linux-staging@lists.linux.dev>; Sun, 19 Dec 2021 10:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h2JGTItMZLnyhLTpH8eIkTs8tCi5ANTqOzNBuD2pnIU=;
        b=ooxS5Pi1aTq1KoApuVHAb3j+mIhWhTLHJIYpTMPDJUCl2QGSXGUmOJ7tf0CcpFK8R8
         cx/sXjC9Y+einAyZsFPtoQ3FQxaoUpN2iIeV7Z2sRujSSqW54zhqC8BUIqKoR2cwqWW1
         lwZQOKDb0p8qHdzgx5nfpF39rQBQbWQdZ+LV797QdZyJ6kQJDZJh0O7W6pNDGPHt5klX
         mfRGvETqaKIYdR6qFR0o77ywAQSUQg8EW9tKUbrHF7TpESUMsp8dak/8l5IHmC9FhLAe
         7pq5+FHWeudmap0HL2s1aSWNV+34HNd7HhF/idHO1QJfKS/Dmcholz2JybU7/P4KtXyT
         BIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h2JGTItMZLnyhLTpH8eIkTs8tCi5ANTqOzNBuD2pnIU=;
        b=cOMfmWovx8WA2Vjb0Pv35SyBRLcVdoo6yVrf4MnSoQtPWnnJQ8PxGCz0A32LStNzTP
         xHNElIu89WnSwbONxcM8dX3f6YsOfuFvOvQ5h8cbURqW9VquVM8/5whlAD3Uvq2f4zm2
         CxvBaAZxpps9Qb1F6hrwcbAy6EfcEpprURf0EyjME18KEIQn5+Vy90KJ8FuX+897mW34
         EElAqClhwMuZTY0naHCoFWelCqARy5MxkMriykVtef8kvOnbIuoUai7UBaeO8cRCUgBx
         Jyy9a+BDTrvpb+xW9YWfT5YMH7LqqSoWTMqjPCG+bm9rrPXgqvJ2/XAQK2UhEnjEyN++
         tlNw==
X-Gm-Message-State: AOAM532JYBpNScdNUJvoq/CXNQFhCbiq7GiPmcGHjD3tRihRDG4TCCQe
	I6RCJwmuRAXlecv0iIsDWx0=
X-Google-Smtp-Source: ABdhPJwaS6VqugQvFlRzTs6C2xE6a4EjAnj8tlDm5Ra041uaV2Sbn0I2V98QJIlbgUukrNUWNs/pEA==
X-Received: by 2002:aa7:dd56:: with SMTP id o22mr12387440edw.73.1639938008044;
        Sun, 19 Dec 2021 10:20:08 -0800 (PST)
Received: from tom-desktop.station (net-93-151-129-173.cust.dsl.teletu.it. [93.151.129.173])
        by smtp.gmail.com with ESMTPSA id go35sm1149540ejc.191.2021.12.19.10.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Dec 2021 10:20:07 -0800 (PST)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: linuxfancy@googlegroups.com,
	tomm.merciai@gmail.com,
	Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alberto Merciai <alb3rt0.m3rciai@gmail.com>,
	Karolina Drobnik <karolinadrobnik@gmail.com>,
	=?UTF-8?q?Aldas=20Tara=C5=A1kevi=C4=8Dius?= <aldas60@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: vt6655: drop off byRxMode var in device.h
Date: Sun, 19 Dec 2021 19:20:03 +0100
Message-Id: <20211219182004.25656-1-tomm.merciai@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop off unused variable byRxMode in device.h, this fix following 
checkpatch.pl check:

CHECK: Avoid CamelCase: <byRxMode>
131: FILE: drivers/staging/vt6655/device.h:131:
	unsigned char byRxMode

Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
---
 drivers/staging/vt6655/device.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
index 4706bde1ec1d..84b1dcf80e47 100644
--- a/drivers/staging/vt6655/device.h
+++ b/drivers/staging/vt6655/device.h
@@ -128,8 +128,6 @@ struct vnt_private {
 	u32                         memaddr;
 	u32                         ioaddr;
 
-	unsigned char byRxMode;
-
 	spinlock_t                  lock;
 
 	volatile int                iTDUsed[TYPE_MAXTD];
-- 
2.25.1

