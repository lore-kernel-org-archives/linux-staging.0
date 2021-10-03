Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51B029CA
	for <linux-staging@lists.linux.dev>; Sun,  3 Oct 2021 20:00:48 +0000 (UTC)
Received: by mail-vk1-f179.google.com with SMTP id f126so6060365vke.3
        for <linux-staging@lists.linux.dev>; Sun, 03 Oct 2021 13:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8bFrZAcb9WzVQXID1RbOeEU4t3ZJiJEDIEoV1+0KG6A=;
        b=PeYJuSC835yzUsOygkosppyw7q6a2uwDvrdu1o+SLSy0kj7bW+aPEoLJTW63y8cjKc
         diojPyG8dxepMI0yFVqdL/xBT74Szk7J7T873AJ7r7BAYGTMUQFz2TIcz8EPClCIh2Gn
         xmvlHuo7F70vEjaMTRDJRUi8/41C2dXjtflousMrGlfDpKGj5qZlsnE7I/WhE5KlddH0
         138HTfXp17QeH2G2SCDKFSLoenjF0wfC1+XVoe0WSLFuPxZ8hNdIwkMOuqMYp9OQPOFI
         0BLWiUBEPx2peHjhCoerMcgCJB8cyUmPCb1rA2r8BLzVqQPtELnjwRXzq/c75CTuf8sT
         ImIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8bFrZAcb9WzVQXID1RbOeEU4t3ZJiJEDIEoV1+0KG6A=;
        b=8MBCxNkrnOvJZme95qiuuPauG7xyUvqRZ58t/ShTsSXpwg/+lPYHX8WlMm4eNG5dqU
         CQW6jSRWN8AUbw4hp27B8PxujyYnoYew97p7qSYeyvnqby1Injarh9VuagYjPglyg0hD
         zufIkmt3YZHM5YiQ+IRBFoPdckLapwLVBgUD3Nqo2bT4+G1DsJKWbaZ/qiZo4k3h/Xwn
         4vD+jJPeMxdwtMtOuxoD9J+nCoVbjBDwatepLTkgKlQkkVXIm3oXkYz9bG7/PCrUIteJ
         ZWTgK/2rnzd94oX5TAKfWexdwN/+OjlvUOJaKz5Tve2pWsyM3ct1sWcPnUlgFw+1Xp9r
         Oc3w==
X-Gm-Message-State: AOAM531NDWWIeQCyufutr/wCYU7OSKSn9GERBQsjsgAFFjhNyCfM2wgy
	dWX59dhbsZ97j/JYEMt9UFIRq6XSaVQIYw==
X-Google-Smtp-Source: ABdhPJyP18cz+60Uf30VXcI02hfHj8l4puTSHVQi3EurvqOZiDksxwbM9fYGxmTufcNT6WSWd1BVgA==
X-Received: by 2002:ac5:c5b7:: with SMTP id f23mr13266663vkl.20.1633291247566;
        Sun, 03 Oct 2021 13:00:47 -0700 (PDT)
Received: from localhost.localdomain ([181.23.73.135])
        by smtp.gmail.com with ESMTPSA id x21sm6691019uao.2.2021.10.03.13.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Oct 2021 13:00:47 -0700 (PDT)
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
Subject: [PATCH 3/9] staging: vchiq_core.h: fix CamelCase in function declaration
Date: Sun,  3 Oct 2021 16:57:55 -0300
Message-Id: <20211003195758.36572-4-gascoar@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211003195758.36572-1-gascoar@gmail.com>
References: <20211003195758.36572-1-gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renaming function declaration to avoid CamelCase use.

As this was already fixed in the function definition in vchiq_core.c in commit
801b1aa002d3 ("staging: vc04_services: fix CamelCase"), the current change make
the names of the variables in the function definition and declaration match.

Reported by checkpatch.pl

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 893b07698268..383c3bcf787e 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -622,7 +622,7 @@ extern void
 vchiq_set_conn_state(struct vchiq_state *state, enum vchiq_connstate newstate);
 
 extern void
-vchiq_log_dump_mem(const char *label, uint32_t addr, const void *voidMem, size_t numBytes);
+vchiq_log_dump_mem(const char *label, uint32_t addr, const void *void_mem, size_t num_bytes);
 
 extern enum vchiq_status vchiq_remove_service(unsigned int service);
 
-- 
2.33.0

