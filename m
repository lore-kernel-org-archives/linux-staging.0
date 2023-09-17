Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC524C60
	for <linux-staging@lists.linux.dev>; Sun, 17 Sep 2023 15:44:31 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2bcbfb3705dso59172911fa.1
        for <linux-staging@lists.linux.dev>; Sun, 17 Sep 2023 08:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694965470; x=1695570270; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kyE2cahixYUhSxqHETVMaNUic+89+Aiv8SH8B+785uI=;
        b=JzttGeWtifYvIaYgtEcVqRAka8GZ4YEUBDvPVn7spZtcSYzRy/u/mqPUSovtdaSibu
         8R6nWCTQQmnUO2VshP8V7/gARWEJrQgCFgzAt3CFog2Kish70jHgr1CXJ3fWTk2Oz7LC
         c2FG98bjAkPBPWDNa7XmCiRVTFENVkS0uD5tm/CSDY8kebbB58KN0qm27HSt4cmiwpPr
         DaS2coBG+UOF6AUzsZMrXIvELQOsLuqhxDfkcEurUCECrMp3j9QCTSgFjEyBFnHF+Y7m
         8ZVtZQt8IrDZRfW6t2E22jVjmy1QV1bpzwOaJBVhrvDL2qpW6EofcfB5tUcfm+wq2ZUG
         nfKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694965470; x=1695570270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kyE2cahixYUhSxqHETVMaNUic+89+Aiv8SH8B+785uI=;
        b=NIOAW8fmH0vPIZaqrastKKcigXsHEFCghjq6BSmfZA4nD42U+2xd4b33OxSKB/Z9rV
         1+ahoQ8mf+STgkBj8P2ctWdrMvaeeVvE84pgEqRcg7GJgnxcajJLqFygc4FW/lQYyGM5
         gL1VIjyy77RDnThV88t/q4DX9YPGfo9RZsb2yxJYb64IT/5SfbG/7H0YuGbRq8HovDJz
         4B08f4pD/z67k7b6+4CDL2xOzatCBVDTh+VtWOKwnfMN0i4+w0mOaRuWibpT3SjGr1Ex
         VfRiAd+nOcm7OExYfDLXg6YapbZwB8bq2BrKXMxgUWYmFgeKyoOqjg5RUV4HXGtsDkmm
         LWcQ==
X-Gm-Message-State: AOJu0YzSqC/zMpAGSOTlkkQeFxRhju0LmIZamM8GdzCjIQ9X2U1GpBtG
	pQ7HOD5cFLHBO0p7NBCE94U=
X-Google-Smtp-Source: AGHT+IEX25Wx2tJPOYCZ/eMzwF4zM4wpul2EIIBw1pw2JVFiB+wZEFEffTxiQFokZgxXv7dCE4tYIg==
X-Received: by 2002:a2e:a7c9:0:b0:2bf:ff17:811e with SMTP id x9-20020a2ea7c9000000b002bfff17811emr2215422ljp.14.1694965469323;
        Sun, 17 Sep 2023 08:44:29 -0700 (PDT)
Received: from HP-ENVY-Notebook.lan (81-229-94-10-no68.tbcn.telia.com. [81.229.94.10])
        by smtp.googlemail.com with ESMTPSA id h19-20020a2e9ed3000000b002b836d8c839sm1668550ljk.40.2023.09.17.08.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 08:44:28 -0700 (PDT)
From: Jonathan Bergh <bergh.jonathan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jonathan Bergh <bergh.jonathan@gmail.com>
Subject: [PATCH] staging: vme_user: Replace strcpy with strscpy
Date: Sun, 17 Sep 2023 17:43:02 +0200
Message-Id: <20230917154302.913956-1-bergh.jonathan@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace strcpy with strscpy as preferred by checkpatch in vme_fake.c to
prevent warnings.

Signed-off-by: Jonathan Bergh <bergh.jonathan@gmail.com>
---
 drivers/staging/vme_user/vme_fake.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index 9bcb89a84d53..0cf5700e151f 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -1093,7 +1093,7 @@ static int __init fake_init(void)
 	tasklet_init(&fake_device->int_tasklet, fake_VIRQ_tasklet,
 			(unsigned long) fake_bridge);
 
-	strcpy(fake_bridge->name, driver_name);
+	strscpy(fake_bridge->name, driver_name, sizeof(fake_bridge->name));
 
 	/* Add master windows to list */
 	INIT_LIST_HEAD(&fake_bridge->master_resources);
-- 
2.34.1

