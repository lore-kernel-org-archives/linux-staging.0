Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295306136
	for <linux-staging@lists.linux.dev>; Wed,  2 Mar 2022 21:37:59 +0000 (UTC)
Received: by mail-oo1-f42.google.com with SMTP id w3-20020a4ac183000000b0031d806bbd7eso3484471oop.13
        for <linux-staging@lists.linux.dev>; Wed, 02 Mar 2022 13:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=39y1JmWcKgDkVIZCA/4u9cM4DjLQrzKHYaevJAooNPE=;
        b=AH8ueK28p6pMJytSWAUsygXRasrNFt/rufhA7WrD4agv/SPSDMBsKBsat3+QsLGRnb
         YO3NZ+23JUKmEtoHWVVvpgsHzGwlXNVY9QKT3YcKungAI8rzTTRZwNiQ8dJp0uraiPjP
         ju4w02XAxGa2QphVfNC6s4if/sLwX2Gt8JJi1x3/XRB4kOo3eWraIiKmEiVjQTPG2BgP
         qrKwBFH+DBG0rGDXj8COcM90liOClnUDWQMFGfUn3iibJDd4uUicxYSSfNzhyaqFu5x7
         P9f9bcyybZmqS1ktvLZh3DXxZiezJsSVEPnOO6o0PmRnNoc7Pe8sWvSKNVA8mrNEE1Aa
         9gOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=39y1JmWcKgDkVIZCA/4u9cM4DjLQrzKHYaevJAooNPE=;
        b=ENezj+PbnW+++stOj6M6r1fAjP6gyy2pfKEl/26E8VE2WqBHBbs4ajZgBq7AdV74py
         xhL/YipMCmATkTvZ3gk0zjUa+4Iliisc/yADhdXePqbuh8SN8fFQ4PmpyxoaiJRS+LtN
         X5GBzynh8SpVx6M/r3voqe4dzU1ilFYp4ywhZrDfLtsDcqud/tmK0gFeEd3EM8xd0mq8
         9dZB370TN0jWX9h31W/HXUFW2xVDd9a/qjNsPcGVhMjVUdhDDH4o2C6nY91LKvBKoxDA
         +uX244UZY6ZF+9l43mZ++eyhsBPXXwl/QEJV93tHqq/GtkRP7WB7+r9KCWVJXOCJoiWX
         o7zg==
X-Gm-Message-State: AOAM531ENh+jf6pqbj/EcuCPFiOhUihWOaAlE/Uaa+ykEJrBxdnwwFPi
	P6BUV/vuBIt6Fsm/jUDk2hNhxOfteYQ=
X-Google-Smtp-Source: ABdhPJx5YFHmvUhcSIDSxDbWRjt7BMPVnB2sQ0swaLBzOkzp5cyI6uZkDS1I0+Dwcr/asDsfWTk3GQ==
X-Received: by 2002:a05:6870:a2d0:b0:d9:ae66:b8e2 with SMTP id w16-20020a056870a2d000b000d9ae66b8e2mr1240660oak.7.1646257077997;
        Wed, 02 Mar 2022 13:37:57 -0800 (PST)
Received: from localhost.localdomain ([181.23.87.56])
        by smtp.gmail.com with ESMTPSA id s12-20020a0568302a8c00b005b010d92dadsm69132otu.69.2022.03.02.13.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 13:37:57 -0800 (PST)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	nsaenz@kernel.org,
	stefan.wahren@i2se.com,
	ojaswin98@gmail.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: [PATCH 1/2] staging: vchiq_arm: make vchiq_platform_get_arm_state() static
Date: Wed,  2 Mar 2022 18:36:36 -0300
Message-Id: <216ad30d674b80e0051ecc233ac26ddb1d3e0e75.1646255044.git.gascoar@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646255044.git.gascoar@gmail.com>
References: <cover.1646255044.git.gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix "no previous prototype" W=1 warning by making the function
vchiq_platform_get_arm_state() static.

While at it, realign the function declaration in one line and reposition
the asterisk symbol to fulfill the 'foo *bar' syntax.

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 54ab6208ddae..f0bfacfdea80 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -593,8 +593,7 @@ vchiq_platform_init_state(struct vchiq_state *state)
 	return 0;
 }
 
-struct vchiq_arm_state*
-vchiq_platform_get_arm_state(struct vchiq_state *state)
+static struct vchiq_arm_state *vchiq_platform_get_arm_state(struct vchiq_state *state)
 {
 	struct vchiq_2835_state *platform_state;
 
-- 
2.35.1

