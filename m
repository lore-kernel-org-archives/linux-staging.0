Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B85A70
	for <linux-staging@lists.linux.dev>; Sat, 22 May 2021 05:34:37 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id e17so5866085pfl.5
        for <linux-staging@lists.linux.dev>; Fri, 21 May 2021 22:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TgOIq8VQUiDYqV2oMi59dexKwHlFeeaw85QP4XFGgRc=;
        b=MCY5AqSIip8PhtjxQZv7h/SHPr82k8l1oyfAhvjpAmCkLpBx46eyAn4KmwjXg2ZjCw
         OatljgGfJF+rpMIwlVnH0aMjkR1Q9+tRpUgWpnflDEzf8+X1BaUKMqA7RHApRt0z9cXJ
         6/zMMSMe69VcHdVoYPq3kgxicCBqwvoOwbtOeeuxdlcvcHGAUnx+k3NCqtkuueaa9/jS
         faFIWALpZm9hMzeX4UfqT1BIJjzWcf8PiiF9cmYVaIAHkXsUJlG2J5O//8rhfiYpoRHE
         cAgT6wZxitJ+t953efZKS05DelxzlQQCowHVLTUlLuhjeoxM1mCjwovWC2kdoVDsZsUC
         eD0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TgOIq8VQUiDYqV2oMi59dexKwHlFeeaw85QP4XFGgRc=;
        b=oP7enxuZa0LPdRtAd2YKX+g27BH3aeegWRWev9QNl/Ov2vCb+u6iNGP8r3GRq3GCzk
         02Ly9TY+SYACQuqMWoQO8tCj8zs+GbNdjU+F3iw8uoyuqu3TOBQ8gf0PF0rma7dGi1OL
         1uYNxQJoa2AH5BUrrvAJhUdBFIK+JnyIqp2SxvD1qqFkPMtnY+wa/7ysadBl7RAIrDUQ
         nAiylVlJuSsQd2NoMYc31TTkWl7IFbgk56oFNwE2PuPBC/zmSdoYDWp/Dii8+tSpYfEO
         ip1JGJKm2kvx5L1ookw3jDi7e/fv9+j49dOwVke8ps2vwSAFC3pkeU8JctI30FVB+v1q
         wJnQ==
X-Gm-Message-State: AOAM533namZnkMVcPKqSxecLmurMKRq29BzpZExeXGexrzsDjqqfZfmH
	b3JOa9D3dC2MGU7PIjzFHmU=
X-Google-Smtp-Source: ABdhPJwW8ppPaLRjqYdBnCxQ/XpGGbWLECoAm0jnlNMRh+X8UVub3UKkGlSZ1SWmhNa6g18HOf0UBw==
X-Received: by 2002:a63:df53:: with SMTP id h19mr2482048pgj.20.1621661676962;
        Fri, 21 May 2021 22:34:36 -0700 (PDT)
Received: from phi-nguyen-z390.lan ([118.200.63.8])
        by smtp.gmail.com with ESMTPSA id i29sm6146520pgn.72.2021.05.21.22.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 22:34:36 -0700 (PDT)
From: Nguyen Dinh Phi <phind.uet@gmail.com>
To: nsaenz@kernel.org,
	gregkh@linuxfoundation.org,
	stefan.wahren@i2se.com,
	arnd@arndb.de,
	dan.carpenter@oracle.com,
	phil@raspberrypi.com,
	amarjargal16@gmail.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: vchiq_arm: Using copy_from_user() to copy data from userspace address
Date: Sat, 22 May 2021 13:34:29 +0800
Message-Id: <20210522053429.82710-1-phind.uet@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit to fix the following sparse warning:
incorrect type in assignment (different address spaces)
expected void *[assigned] userdata
got void [noderef] __user *userdata

Signed-off-by: Nguyen Dinh Phi <phind.uet@gmail.com>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c    | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index afbf01b7364c..2a4fc599f977 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -960,7 +960,10 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_instance *instance,
 			current->pid);
 		userdata = &waiter->bulk_waiter;
 	} else {
-		userdata = args->userdata;
+		if (copy_from_user(userdata, args->userdata, sizeof(args->userdata))) {
+			ret = -EFAULT;
+			goto out;
+		}
 	}
 
 	status = vchiq_bulk_transfer(args->handle, NULL, args->data, args->size,
-- 
2.25.1

