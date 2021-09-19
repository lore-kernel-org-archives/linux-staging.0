Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1900E3FC3
	for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 22:06:32 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id a14so2180060qvb.6
        for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 15:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mKpje/Y92jR84VIMNNbzSjTlUCixt6FDWJQ+8cv/w1Q=;
        b=MawK2iJeLSjzey9cfpgZFpypwtawe4w+nousG5KvG26e+uw+bUs1IzP1D73/yt1L99
         0zshOirhW47/7sYHwjLDtg/NtQQ4hatop0WAY++cbPpffjV/qzK+H295wZHG60frStqs
         Fb9qFyfz3SfkpCqIvnEL6+QcO79A9BXWdP13kQFilelU4wZQ4v68UwI7EQ4YIPJi4omY
         3DvlyBS86P1YCKHi1GfbMTBPibVU+AoRdwRn/0eLTGv9QLl2fxLPafqMsXznMaP+A0ei
         pqITHkBhsKMI6gnlTxgimQwLoPVJUsad8b4XCh1eOoPQup+Pu3PFLp6joOVl4cu7+N8D
         FVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mKpje/Y92jR84VIMNNbzSjTlUCixt6FDWJQ+8cv/w1Q=;
        b=Qs7yUStIQedjI9JPQgfdTuKcMrjTk0VDqUVprkwILVeVrPaE2aaWRRjPaX+S+5JxOx
         OYT7PeAHUlpVyE8MEidMPS1mM+J8iVfQgO4a3mNw+IzbZSKlxamSyWFcCN0bIc+S6Fc+
         qd44slJ6S3/aaNq0WAJwsbzIur+GzFL533NAbVc90glBixLzD14jtfQT/YRCU3G1avfC
         keHaIYSosyTcsSMMawU7pWAVMvVZ404ffaNzU30bUap3XsJtEJDGoY6ngC1Y6Wy2ayXf
         hldt1Z0SMlZsmlcF4vOMs49jG5GAWCZV7aX79PRxi5ev5zDmIRho6fjdPDXvRhR5HTnT
         CVxw==
X-Gm-Message-State: AOAM533w25J436UAKpsMhl8jrqiRIxVPqjr9CI9/BERUsCJxYTNLAQ4R
	zq2KnfhcTSZvhT8GleUo+PYQkuKVHT0=
X-Google-Smtp-Source: ABdhPJzbcP5EilKkmcub8FPrk1SASVA5fhYZpcc0aOEdoFaCI6DKYOs5D3IyNUN833zLkq3fd1xSzg==
X-Received: by 2002:a05:6214:1593:: with SMTP id m19mr22329365qvw.36.1632089190983;
        Sun, 19 Sep 2021 15:06:30 -0700 (PDT)
Received: from localhost.localdomain ([191.84.236.195])
        by smtp.gmail.com with ESMTPSA id t23sm246313qkj.31.2021.09.19.15.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 15:06:30 -0700 (PDT)
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
Subject: [PATCH v2 3/7] staging: vchiq_arm: clarify multiplication expressions
Date: Sun, 19 Sep 2021 18:59:10 -0300
Message-Id: <20210919215914.539805-4-gascoar@gmail.com>
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

Add spaces around '*' in multiplication expressions to enhance
readability.

Reported by checkpatch.pl

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index e8b84b2b1ac3..9464a4777ff6 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -466,8 +466,8 @@ int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
 
 	g_free_fragments = g_fragments_base;
 	for (i = 0; i < (MAX_FRAGMENTS - 1); i++) {
-		*(char **)&g_fragments_base[i*g_fragments_size] =
-			&g_fragments_base[(i + 1)*g_fragments_size];
+		*(char **)&g_fragments_base[i * g_fragments_size] =
+			&g_fragments_base[(i + 1) * g_fragments_size];
 	}
 	*(char **)&g_fragments_base[i * g_fragments_size] = NULL;
 	sema_init(&g_free_fragments_sema, MAX_FRAGMENTS);
-- 
2.33.0

