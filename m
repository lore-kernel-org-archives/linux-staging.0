Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918183FC9
	for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 20:19:14 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id s15so3525207qta.10
        for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 13:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h/GsHeyvvkKJdskTxdNmQ/rhjzzyIPbBxi6Rx6oGxp0=;
        b=OPLjVdWj/J6qm2GAbb9pCHOHcNwy/EUQDdiWSwEfafPVyJzDOdHnIfhn3wJIZLw8tv
         O72oEqxtXbhBgHf+0NjMZT9HyH4iJe+yyEVsIvqUzuLGkZUL7lnJD1g8e+81dn74PN2s
         5s+EgXdbDDy+xXgxe5ulH3dSFjiIoN6fJ6PAYB9U5wQ6x+jkDksnBnK8mcwc3K8cYuJZ
         zgGolzYS4dMIpWyxawfgKfRNVVGv/bOMUEIoDROubFDF9QY/G7GNPs+883u463uGKDLg
         G8616MvtX89q0g/+/BHVXTLcMjzeo8/gdtKyhvHfdw64cqb2/giPgLHSgMhZKnMinyNN
         Ddmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h/GsHeyvvkKJdskTxdNmQ/rhjzzyIPbBxi6Rx6oGxp0=;
        b=gGYc6JWf+7I65wj+pYJiAw/D+6H/omaRgduy/NS1gI6gmZmbwFoskW+JVBz3x0eMt2
         NFAA+OHx8hP5VY/Vtc6RGjp0QdFV+azPBC2+B/w6gcDyHtJDJ8Hg+VgwXoIl8xiLkQL/
         kVwZMhbMnlfCbznj0uAuIPceGM+9h8GddqFB3JsEnE7P4JATjT6D8qbNkjOd8cYrc5S/
         KrKtj1KnxzXNiV1jaTsBtIQmjKUtzfH7YxMC2pnU+aCv6tY3J5GPpTS6olCbJx7t5LTt
         bZSUYYTptknoPXCMaqrwPMGlXRe6B73JRK0ytQ8R961r7XKFdZBCaGXBhQIwP2/O7UNq
         2oXw==
X-Gm-Message-State: AOAM533qa+ZsSPD85+bNk5KCR3qNjQTB/7cEiTXEHxaNxzWJksxZiedH
	xAWgGGScL6By5nb2Z7Vh/3B0T8EyeaIZSg==
X-Google-Smtp-Source: ABdhPJxZ1EBd1dS8DIl61uigIBDjQDvMDAwA6xYfYIZQ2gxXT9JtaQR3cQE41+4hbxcJ3UUEh6sbcw==
X-Received: by 2002:a05:622a:44e:: with SMTP id o14mr1717786qtx.33.1631737153540;
        Wed, 15 Sep 2021 13:19:13 -0700 (PDT)
Received: from debianG.lan ([181.166.206.110])
        by smtp.gmail.com with ESMTPSA id g8sm752834qkm.25.2021.09.15.13.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 13:19:13 -0700 (PDT)
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
Subject: [PATCH 7/7] staging: vchiq_arm: use __func__ to get function name in debug message
Date: Wed, 15 Sep 2021 17:18:24 -0300
Message-Id: <20210915201824.413202-7-gascoar@gmail.com>
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

Avoid hardcoded function name using "%s", __func__. This prevents
potential naming conflict if the function is eventually renamed.

Reported by checkpatch.pl

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 3225f0738ef9..fcff2e5bd73f 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1025,7 +1025,7 @@ service_callback(enum vchiq_reason reason, struct vchiq_header *header,
 			spin_unlock(&msg_queue_spinlock);
 			DEBUG_TRACE(SERVICE_CALLBACK_LINE);
 			DEBUG_COUNT(MSG_QUEUE_FULL_COUNT);
-			vchiq_log_trace(vchiq_arm_log_level, "service_callback - msg queue full");
+			vchiq_log_trace(vchiq_arm_log_level, "%s - msg queue full", __func__);
 			/*
 			 * If there is no MESSAGE_AVAILABLE in the completion
 			 * queue, add one
-- 
2.33.0

