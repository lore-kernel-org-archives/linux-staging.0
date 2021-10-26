Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473FA2CA4
	for <linux-staging@lists.linux.dev>; Tue, 26 Oct 2021 21:28:27 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id g125so528325oif.9
        for <linux-staging@lists.linux.dev>; Tue, 26 Oct 2021 14:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=otYjN9az6nPkaATonKfc0dOSOmU88ZE1cbGt7BRctxc=;
        b=LkZysTXZ1DLHHxC1+y//iILNS0jCdiDf7gt/eQBdMPlBlkZAdvOEIWTkIy+ccCp3SA
         189WXdO1AIjmaqPRr5f69d9/nUo9mTV7e/lZQAbvbHgR1xCEQcUThTgoJ6Iea+VxovNi
         Iku5ecZisAZ6fwmNDF0Dtg0sudQM6QbkhdzOsBmyBqnJVa6D46+cyk/kzeRZJxv1gpBL
         KsePun7Y0iarfnQDyj0G5XpomLbA71q4PSK9WiP+iUAicjTS5hzMa65Ki6o+aPyZLHLw
         50L5eYIHN3qEZLQJ8+vSErXxsCt9GGl8/pAoqPZlyXCISCCWLiPk/dG8s2F9zoFuUxeE
         MrdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=otYjN9az6nPkaATonKfc0dOSOmU88ZE1cbGt7BRctxc=;
        b=UwaSNRZzO0u/jbbwo2INLKP4ONQYEkJReD2fUPf31MOH6K9O72SDKJ/sVqgXlv1CCC
         OFQf+KB0GznZV8x1/601VTxfmK59us67PiJB9b+NSF1VteI8u3cXJDMwoDobF/n1aMa3
         h/SXwQLAmC9JWG8m8in/05V39e4uEdFapsbsqcsaygdxfl1p8HzFZXw8HcO2LGP5JPTo
         IBtRlJlivB4HGnmP/JXl/bTRhVdLxYlrdrEtlseOzcd3p9Z74HOdNAztN7+Cl20pigtT
         5G20c3f2breNKx/QM7GmzVItYH1lalmkOYjsV5ozpQoz3lYneuTcuhQEjl+YKYWhBSLY
         5uPA==
X-Gm-Message-State: AOAM531ZvgVMOptIFuYcu9OYHo5kJssqNp8UOpz3rVybTeJD152Xa2/W
	BPoHDDXTwoCz0nZ53elNLBHd6BQFvEIzsg==
X-Google-Smtp-Source: ABdhPJwy5RmaUkFv5Tt+YnFiDI9CTREkD2Bnd8jXOqWsQLf1wpGJQ+IMxbzdNO5ggIyDyFrpK/iA3g==
X-Received: by 2002:aca:4356:: with SMTP id q83mr953667oia.157.1635283706144;
        Tue, 26 Oct 2021 14:28:26 -0700 (PDT)
Received: from localhost.localdomain ([181.23.91.138])
        by smtp.gmail.com with ESMTPSA id l26sm5002623oti.45.2021.10.26.14.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 14:28:25 -0700 (PDT)
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
Subject: [PATCH] staging: vchiq_core: get rid of typedef
Date: Tue, 26 Oct 2021 18:27:56 -0300
Message-Id: <20211026212756.25557-1-gascoar@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Get rid of typedef and use proper kernel type instead.

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
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

