Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E007C3FC3
	for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 21:37:58 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id x5so395864qtq.13
        for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 14:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uFOWREUn6nPF1dbjd6wIX22KxI3ogfGK/7UecMqtepU=;
        b=jg3VVYrAF1rC/rFJAcn55n8+lDtPIjwOrXSbxG8V5B2QLbOUt9VV7nO+Z08/QlwBwb
         jaPT5ERNI6/m7AuT2Qnd8j2cwdOOnrONAF1DS/LJ4Aw9Ci+CpO3OIqdmU6sX/r1gQOSM
         5am9GGs0z9qCbGEA4GB/SDuw7VDf1S8kbH1ICOswS6gp6b6b2Q6pAPnfSoGBfDdMmtPl
         rq2akVpBM93uiJbvs4Mn32n3AFfwuPJh1z4tGpwOldOZ/NzGDOz/qTBFXdqrE8ceEHtv
         RyzLCJpFC9tbmxuEXHwJ/+0HmXdZJrNdKUTRi7wPdjglHxvRQTqSkh+64HQOBIDC6foX
         GsWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uFOWREUn6nPF1dbjd6wIX22KxI3ogfGK/7UecMqtepU=;
        b=8HGxGT4Iho1JIqx5QffLX9EgAfSMuJ0m2UHdjL29JuUuVIMBp5fd5ODChH6pA+f/Qh
         bxviyW02fbbIKHJlBTCdNb5QCVx4cTamrkQigfnaWKj+6l8yrytBrwu2tDDhoIbDxwj9
         3ubslyWDSi3MWNxSUr3QHUtI+15ynKwjQrLm7AxTzOXjhQMTvtJbjgZD8Z+x49YfWdPM
         uwUAsxYlOfP8vdzAPvEMRF2j0r//oO0qm92IlawcSjdIdk4kgOO9C607u1po/pthHJaw
         t+sEJbdfL2mEXijtLBBsd0y+kEFc/XB8TyclA7QY/KwiXxoakQf234sJZvTBr2FItFT+
         lo+g==
X-Gm-Message-State: AOAM532RmHx6o4wvHC7POhBvGQtoYgVDUFSuS0YZLe42TWu2g2p5Gefr
	vF1CCLWejHhC+SYzL0P6/52dktbP3a2SfQ==
X-Google-Smtp-Source: ABdhPJz//yVjuwYxXdOob2M5XM7o6FbU9VvjnzPxZ21PXHH7WCT1xlEon7eiIWrK04qnvvcc2zU+Nw==
X-Received: by 2002:ac8:7594:: with SMTP id s20mr6975586qtq.381.1631655477784;
        Tue, 14 Sep 2021 14:37:57 -0700 (PDT)
Received: from localhost.localdomain ([191.84.239.65])
        by smtp.gmail.com with ESMTPSA id o7sm6716611qtw.87.2021.09.14.14.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 14:37:57 -0700 (PDT)
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
Subject: [PATCH 7/8] staging: vchiq_arm: remove extra blank line
Date: Tue, 14 Sep 2021 18:35:38 -0300
Message-Id: <20210914213532.396654-7-gascoar@gmail.com>
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

Remove unnecessary blank line.

Reported by checkpatch.pl
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
index e8e39a154c74..8f5182df17b6 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
@@ -151,7 +151,6 @@ vchiq_dump_service_use_state(struct vchiq_state *state);
 extern struct vchiq_arm_state*
 vchiq_platform_get_arm_state(struct vchiq_state *state);
 
-
 extern enum vchiq_status
 vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
 		   enum USE_TYPE_E use_type);
-- 
2.33.0

