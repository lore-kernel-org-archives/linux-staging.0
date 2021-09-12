Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BB53FD0
	for <linux-staging@lists.linux.dev>; Sun, 12 Sep 2021 13:38:52 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id n27so10486927oij.0
        for <linux-staging@lists.linux.dev>; Sun, 12 Sep 2021 06:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O5ZWGZmPnammQ04Toa5uVC3kIpyJsyrgJg39bwT6488=;
        b=IOsk+hvpEYnvUmtgxv+3zhefOSuJqSbkV8JnhMqNpoTFlAAny766aYeMs8aeaJFIq+
         QbNjJAYcaSiQjoe1FlgTeW96zaKBwZHshnt1D1UTgvydoQVoG7p63L02AHtlsB5OW7lz
         7YEGRX/AUsVkHQJixisAHwGbcTD/K2DbP8IBz+huCSFzEp+xn+CB6uiCr5clFuvLmJti
         ix2TWb0CqP8xyK+zvvMuN0f3TVLVB/hcTOTrP4nWEkmT6eCWikHzwPAaG2TuoPnBYm5F
         R7mXYhfh4XD/XqKsYGqhvA3MxV19N1s+WqWJikojfCXIx+IQyMgO3/2EqtwV8RJkGIvH
         +XFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O5ZWGZmPnammQ04Toa5uVC3kIpyJsyrgJg39bwT6488=;
        b=rP0zwpQS6QuYgdWAOJ/m5/mqZKdPew383QP1bLe4dj0LWJRYj+Qqnk/92CrkpJwo6n
         riQE3lC2qC378RR3TnU8ROHHhS7K9TOSiUXZWlyiFpybRR4LlgdVhDK7NV87XdCCh2vy
         rfUKyh7NJJTzdYy1kljIspUfhWDWMZLARDSFe1/mrBrnCeH1BmGo+Pm2M7gNju7V7cna
         ZAQHtx7fkdPpK34d+MeIASKu+QyVPiUsYvDv8Mqx3efQvN3yL/0OlDE6/J/kHW2S0BQu
         QqG2KNfRPe63hH957XKbCxtppVznfJdaJUsQZuraqY9vjqyYAKaq5Tx9yp1+RXt41oqt
         ytqg==
X-Gm-Message-State: AOAM533A/RZjLPIvSkThcEzHhO8UYFx7KLOUiapMBKSI8YAa9dRSZoBV
	6OeQWdzEQurg4Zgpg72v3UgHhUEAN1w=
X-Google-Smtp-Source: ABdhPJyAVNxu9oL4gcklUE+FcSb5eLgLwLCJZhG3eBTWK+U1uAqSp4QI/5iiwnXlQW7Q+YgqGgwL6Q==
X-Received: by 2002:a05:6808:1910:: with SMTP id bf16mr4617945oib.56.1631453931619;
        Sun, 12 Sep 2021 06:38:51 -0700 (PDT)
Received: from localhost.localdomain ([191.84.239.65])
        by smtp.gmail.com with ESMTPSA id a15sm1131853otq.13.2021.09.12.06.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Sep 2021 06:38:51 -0700 (PDT)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	nsaenz@kernel.org,
	stefan.wahren@i2se.com,
	arnd@arndb.de,
	dan.carpenter@oracle.com,
	ojaswin98@gmail.com,
	phil@raspberrypi.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: [PATCH 1/2] staging: vchiq_dev: remove braces from if block
Date: Sun, 12 Sep 2021 10:37:50 -0300
Message-Id: <20210912133751.269885-1-gascoar@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary braces from if block.

Reported by checkpatch.pl

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
index 788fa5a987a3..c990d5d7bfb5 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
@@ -447,9 +447,8 @@ static int vchiq_ioc_await_completion(struct vchiq_instance *instance,
 	DEBUG_INITIALISE(g_state.local)
 
 	DEBUG_TRACE(AWAIT_COMPLETION_LINE);
-	if (!instance->connected) {
+	if (!instance->connected)
 		return -ENOTCONN;
-	}
 
 	mutex_lock(&instance->completion_mutex);
 
-- 
2.33.0

