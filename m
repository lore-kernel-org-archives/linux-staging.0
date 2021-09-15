Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6033FC9
	for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 20:19:01 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id a66so4948227qkc.1
        for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 13:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mfYd+b856xF2znmD8vgv1lw332UND5JAV7Y9/ZlVnqk=;
        b=k7fZAN97lE5ze7C04Wg6etzrSao88Z9OtgDKyk/eluPgGMtFifQZMQwiQa6TBClJkg
         31YNla82F1B5i60Pq5+IgcQuOht1Nv+bgVJqG5zb0kQRVbtpB0fu1I0d4+XVJILfh0D4
         8VVDLb4dlpEq1aJCz3aw2gWMjC4wkPjgEIe4LwYqj0oDIzqhXHobAzYWo3KkiF6y27av
         SObKjSxZ5dZ45MnSZRepS7RTTB5AMqw7K0eYsBSfY0N1QuxDgu8D2YuvFpaDW2A1sguK
         JUdgKWqPAVE7amr2JqNXhkUImtOIfu5xSGAh9KykCzMpYgqSyMmIOTn9QxRiTbzJRGB7
         kQ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mfYd+b856xF2znmD8vgv1lw332UND5JAV7Y9/ZlVnqk=;
        b=vaWfuxUxjxVnFd+Mgg9lppOXnkr1P+NilbcCAGseILPqgTiKDmkvOFS/ntMCnurUQA
         JEGHY9VrREg0KUzUTILdHWGIvzuep5gAnW9ATuZ4AcDmUKfSh5MXZc+Zd0+E/s1udxuE
         KWX0+FqMstEDJTFfy+C7pmMsAUlqpl9hw/Pq2Aq80+XsXNJ5kXq6SvYe06qB9m9fr6zT
         ymSK2Vhzk/NRIJwkwp0H/n6PqZM7Oj0odmPyLORn01dJGW2vKwTjevgl/aY1CW+kIDgu
         bQbOkRjjusR2l6WtVdnGfFC5zrl/faO6j5QzNHMRR5TYeol4pEYkGWSPEqSr1vHKAIAF
         w7xQ==
X-Gm-Message-State: AOAM532HtyY0KABUh4UprXV9mgbAr5n6S5JOB9w3fd16CereUCxgV/+2
	V9wOcVJzP67WGVozOBg9tf85EQ6rdEkTQw==
X-Google-Smtp-Source: ABdhPJzgD5iWxrGAhpj9ZBFHXfLXvzfkcHSZDD9ZwGxbqTm4bk4nk6PvrPyvHDkf0W86eoXiz2RBNw==
X-Received: by 2002:a37:9947:: with SMTP id b68mr1828225qke.56.1631737140010;
        Wed, 15 Sep 2021 13:19:00 -0700 (PDT)
Received: from debianG.lan ([181.166.206.110])
        by smtp.gmail.com with ESMTPSA id g8sm752834qkm.25.2021.09.15.13.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 13:18:59 -0700 (PDT)
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
Subject: [PATCH 2/7] staging: vchiq_arm: remove unnecessary space in cast
Date: Wed, 15 Sep 2021 17:18:19 -0300
Message-Id: <20210915201824.413202-2-gascoar@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210915201824.413202-1-gascoar@gmail.com>
References: <20210915201824.413202-1-gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As reported by checkpatch.pl, no space is necessary after a cast.

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 22de17f64ed2..e8b84b2b1ac3 100644
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

