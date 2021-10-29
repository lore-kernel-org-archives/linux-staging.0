Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AAE2C87
	for <linux-staging@lists.linux.dev>; Fri, 29 Oct 2021 20:01:13 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id o4so14907574oia.10
        for <linux-staging@lists.linux.dev>; Fri, 29 Oct 2021 13:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PHumhMIUr438aWWlrs+78cdgsF1iUwE1HgS3gt+l/Ls=;
        b=qSwRjZWjohXQH7S/AeV/tL1D+waYUomj9nwx2FRu9gr84XTV+znEdx3TbITF/Fc3sz
         RlulexcGv2ic9dbKiDvM786MBVDSLC0zfCO7j9q5kM8rHP0PDlr3sA0D7kt1hBvRtJd3
         tHLUoGaCdkk3Q1M2aSeYi8TKIg9RkhTPevPa2equkrz0iPhp+ajmqcZKSZoP6Eg7zy8V
         IcdlVxBvbpRmqQCZqdP3thsz14hIPaV+lHmidDNU9DKpj6T8vYZHHrppF5PXbUtHPz3O
         UWyzrfLa19f3BLTKDOPCYrlasARJyQqML7Qi2A7yXi/qyNKiQyXhz7xmx+joEORhFvKW
         Sgdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PHumhMIUr438aWWlrs+78cdgsF1iUwE1HgS3gt+l/Ls=;
        b=sxFtrT4PsRse8cpVGtB8g/SY9c99aPi2la+uyvOt7VSiljrFS2dDdPWRzG5uJ/COWA
         3IPFTnp6TCLjvkgIDBsD46FND2hkuqcNhafm1K/5TLo9Xm+ARiPfcWj49MA2l+tSZada
         TJJZ8QW7IJXVeZgpf+XwK7QsAubgKwp+sZa1gUxjz+6/WrAB8BL2NrbK5b2BLLBixuRY
         gRmX/fBthrmIXKNRAbA2OE8YuhZ1tySFwlxxqfWtCKhwS/3hp6TsKGeR9qG0BVfjnJGu
         2IqedYTguLdHKnzl/8qX7AdgsP45LqAbBSPKhGo4BcKhyYKnYf874OwHSeRJmafpkwis
         eS3g==
X-Gm-Message-State: AOAM533E9pIjhpSWkfisDM1xKGbEw4DUe/NW/UH1Xvu5wjJZ6IRTMzGA
	Sjn6MPRv1yP8GEKlZeZWX0ckWJQmR7s=
X-Google-Smtp-Source: ABdhPJzeBQkPFaHl2wBYEVOxaarNNmQ1BtUFuNj4uSlEJXQcPIQL5Evmiu4WHVAMmvGxXGLHJPlR3Q==
X-Received: by 2002:a05:6808:23ca:: with SMTP id bq10mr9944414oib.6.1635537672112;
        Fri, 29 Oct 2021 13:01:12 -0700 (PDT)
Received: from localhost.localdomain ([181.23.79.14])
        by smtp.gmail.com with ESMTPSA id w5sm2180498otq.46.2021.10.29.13.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 13:01:11 -0700 (PDT)
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
Subject: [PATCH v2] staging: vchiq_core: get rid of typedef
Date: Fri, 29 Oct 2021 17:00:12 -0300
Message-Id: <20211029200012.45986-1-gascoar@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The typedef BITSET_T is acting as a synonym of u32. However, using the type u32
directly makes the code more readable. Furthermore, typedef should only be used
in some cases, [1]. Hence, get rid of it.

[1] Documentation/process/coding-style.rst

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
v1 -> v2: improve changelog specifing which typedef is being removed.

 .../staging/vc04_services/interface/vchiq_arm/vchiq_core.c  | 6 +++---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_core.h  | 4 +---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index ab97a35e63f9..7fe20d4b7ba2 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -711,7 +711,7 @@ reserve_space(struct vchiq_state *state, size_t space, int is_blocking)
 }
 
 static void
-process_free_data_message(struct vchiq_state *state, BITSET_T *service_found,
+process_free_data_message(struct vchiq_state *state, u32 *service_found,
 			  struct vchiq_header *header)
 {
 	int msgid = header->msgid;
@@ -767,7 +767,7 @@ process_free_data_message(struct vchiq_state *state, BITSET_T *service_found,
 
 /* Called by the recycle thread. */
 static void
-process_free_queue(struct vchiq_state *state, BITSET_T *service_found,
+process_free_queue(struct vchiq_state *state, u32 *service_found,
 		   size_t length)
 {
 	struct vchiq_shared_state *local = state->local;
@@ -1981,7 +1981,7 @@ recycle_func(void *v)
 {
 	struct vchiq_state *state = v;
 	struct vchiq_shared_state *local = state->local;
-	BITSET_T *found;
+	u32 *found;
 	size_t length;
 
 	length = sizeof(*found) * BITSET_SIZE(VCHIQ_MAX_SERVICES);
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 3e50910ecba3..53a98949b294 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -74,9 +74,7 @@
 	((fourcc) >>  8) & 0xff, \
 	(fourcc) & 0xff
 
-typedef u32 BITSET_T;
-
-static_assert((sizeof(BITSET_T) * 8) == 32);
+static_assert((sizeof(u32) * 8) == 32);
 
 #define BITSET_SIZE(b)        ((b + 31) >> 5)
 #define BITSET_WORD(b)        (b >> 5)
-- 
2.33.1

