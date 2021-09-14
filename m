Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BFC3FC3
	for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 21:36:39 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id di6so649469qvb.1
        for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 14:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NYT43AQgWkXWw9PkZN5kpZUGD9/3+eOTi7mNOSzM89U=;
        b=IdyiQpCpSlX05iDj4TDDswyyQwy3Ko7uev0BLGA0YL+ZKgzsrWzcylhJZ+6FUFCcuA
         yLWXY940XkeV2te/Lu2mOD/JCgSBty0SytQrjnP+IcZwoHXStlqZLzf+yCdJwRIG4mR6
         GBrBFcIUYNLrW8Wt3VGezoNBGrXoSnJRlNwKYQtL/IlMee4yU0D1Kv7YqHa8oOHWkIjv
         8m0C7YYHgX1xAxsX5FW6nLycaL7HUk/av/2tcUzQ+LIVc2/9I6eeS7KI4d+r7dbr9653
         EHBSdKJ9SqmeG581RBylOwHyX+NwwmUg0js/N9uPD81kyhx8q9kfhr12jWsAICRa+EvY
         aKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NYT43AQgWkXWw9PkZN5kpZUGD9/3+eOTi7mNOSzM89U=;
        b=PMQAjtc2t/bSRkgSi3SECN83ud3GW0wbKQeNjUT70rNOkwVWG8Pq1m6MbC9ACiF9KT
         4rSSIBcmsdcFc0lNH2Gq2bEBCuPaJf+pNu8t9TlYCGywMcRW0wqiYSXhK+18AG8vfUiD
         T4XFvhQzyG9uZmDkymxBc8dmUPBWmYBbayv0Jk9+sA7N8monKUAOyyZLxByJWVrRR7f7
         uheaia24DhtvlDAoWBUZG9VCLuJvnd+w7iQzdCG1z0DKY0L4tJZ9NCexWmrXGp4lwGKg
         w8/h5D+CZhNu87aL+lEa4whi2oVKedKJeVCc+KNEME/M/W2NHQ4QBeqe8Juas3ML8K4Q
         OEbQ==
X-Gm-Message-State: AOAM532xFx041WFY3efKpCNHWjibgNYucgR4Ml9Drp9IBRziE7L/jVmV
	9J7KEKLnNASdl362Nk81cxCzIz4DZN7JOA==
X-Google-Smtp-Source: ABdhPJzpz7XV+yBcY5vgeLriCCYzEfZt9KOkoP0JcRfhwDWYH7QwH6mt6xvlSAySwJbXQL775ULqQg==
X-Received: by 2002:a0c:ab4e:: with SMTP id i14mr7743350qvb.28.1631655398247;
        Tue, 14 Sep 2021 14:36:38 -0700 (PDT)
Received: from localhost.localdomain ([191.84.239.65])
        by smtp.gmail.com with ESMTPSA id o7sm6716611qtw.87.2021.09.14.14.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 14:36:37 -0700 (PDT)
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
Subject: [PATCH 3/8] staging: vchiq_arm: remove unnecessary space in cast
Date: Tue, 14 Sep 2021 18:35:30 -0300
Message-Id: <20210914213532.396654-3-gascoar@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210914213532.396654-1-gascoar@gmail.com>
References: <20210914213532.396654-1-gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As reported by checkpatch.pl, no space is necessary after a cast.
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 435f1bd68ba3..f8b3997125e4 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -337,7 +337,7 @@ create_pagelist(char *buf, char __user *ubuf,
 		down(&g_free_fragments_mutex);
 		fragments = g_free_fragments;
 		WARN_ON(!fragments);
-		g_free_fragments = *(char **) g_free_fragments;
+		g_free_fragments = *(char **)g_free_fragments;
 		up(&g_free_fragments_mutex);
 		pagelist->type = PAGELIST_READ_WITH_FRAGMENTS +
 			(fragments - g_fragments_base) / g_fragments_size;
-- 
2.33.0

