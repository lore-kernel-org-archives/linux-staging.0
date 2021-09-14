Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4443FC3
	for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 21:38:28 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id u4so462175qta.2
        for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 14:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gTyzltWgTFXOPjw+JtVdJBDzeHI6HlS3kPelko2mAhw=;
        b=pTJXXzRDKNPU9M1obXdrsuGlbMwi0taGqkvHnjZmaU4JR8i2I/61GJlKgJl73KlWAl
         1tJeDR25y7tSKG2u7mIL/9kaEgY11SGN/Y/3Orpbt3heF0j5nu7n5BoHanImH0Bf7sFI
         BhiiuTQytiILqQsx+dj9HwGu4OjxuchYWvsmZWvdpZOO4K8eoxP3UF9ci2Rvl6nIU8+t
         rFP3s1csAXONWuyqUE+/blK9iUExireE6XvtJkCZTSgsBO5OQuOnWMY3PANTm/919Ytf
         pAC3048sHWVfZE5D7bqZo4VCtGhVNsExZgtXqoxHEw9pS5dQz3FOryzx9bYE7toAT+os
         gbmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gTyzltWgTFXOPjw+JtVdJBDzeHI6HlS3kPelko2mAhw=;
        b=dZqNnVPUuXvCh6QJW6uY1b/jRfDYceUJovoZl3ibJ3HlF+XU0UGWjl5Xa9eBhLMrnV
         tCaCFMfoayNqCJ7kGSQLdUQPnqhghchU093WDKH/PS6KRiIRTRkP+vyBU514IJV66TBO
         mwQUNl5Pin0gy9cZX40xVyqV8lanLb5UiBWX7LIMXUc7ezB19sL84gOyQl4ApmRK55ge
         i+h73hxdzVYBXKrg17OvYaXAUd++HtfsROsY3QOZDrOBCq1ZywwF+Xvhmc71ON2H/fAv
         z0Hdehu7UQoAOwM/3UjcI+yVI5WkUaB/OGTccU9L4Y6wU9uZlct2S+TiGuOHtnguCJsV
         bn3g==
X-Gm-Message-State: AOAM532Q03PqSUc2plTLkJaJkprxXym9TGIe99/J/VkuI6gULjFkfyH3
	OLuVn5cVb0VWj3NCb43akzKRb60YemFPuQ==
X-Google-Smtp-Source: ABdhPJyWMHfuCic8pX9ljyiNAr9gMqISRMOcByncvz5LKp6v6+PdH7vYTqxTcP1pVbEqgYtrKinMUw==
X-Received: by 2002:ac8:4905:: with SMTP id e5mr6898010qtq.415.1631655507126;
        Tue, 14 Sep 2021 14:38:27 -0700 (PDT)
Received: from localhost.localdomain ([191.84.239.65])
        by smtp.gmail.com with ESMTPSA id o7sm6716611qtw.87.2021.09.14.14.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 14:38:26 -0700 (PDT)
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
Subject: [PATCH 8/8] staging: vchiq_arm: use __func__ to get function name in debug message
Date: Tue, 14 Sep 2021 18:35:40 -0300
Message-Id: <20210914213532.396654-8-gascoar@gmail.com>
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

Avoid hardcoded function name using "%s", __func__. This prevents
potential naming conflict if the function is eventually renamed.

Reported by checkpatch.pl
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 72d9a6e37ae9..2d498fb0d19f 100644
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

