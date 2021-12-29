Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED52B29CA
	for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 15:33:46 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id s1so45222464wrg.1
        for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 07:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=yaFPtv68FbWYXGv8VLXk7KGh6SEfuXe5S0bPe1jKtfY=;
        b=jk3C/jHTfzsqW+Hy0loflhYtDDtvEBT1DbQxyp9C1LBXQ035oUqiFLlEDD4T2wYXZT
         SCmD1VlLZyOj3aL5xF81F0v5KDmA36PJYj/2Jfm4rTSNCk7TeHtcFgmDWzzgoWdsJwdU
         xLumxBO11BthYZoeqFrA/+gSaY6UvZLmDY2joWg6jKogL6Y12sdkYp2LgxIke7u52ros
         ZpvOZlPvJFIVdJtzWPn1xDZNkBjnsbIDkhaKj+AcXwwQpi6ydMp1lBfFd6YI3oRtasCl
         B+B0kCbfyDflM7pC9gDTWfisOc0AvXuRcCMWGv6Ljq3z8hC4ricTVwoQ+Zv+JhrlPf+a
         ZT0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=yaFPtv68FbWYXGv8VLXk7KGh6SEfuXe5S0bPe1jKtfY=;
        b=gpTwneZrW9vuQkgnKnzblOE7ZFETpd6IlO0To8ONQYgu/pbwHccirfF73q3gp1v/Tp
         1ZwvtVl8VHv3JaM1spLO+AelNZwoTFF4hP9sAmFiDS4QVW16t83U2rSlrDo3MlanbuLs
         EYUWsfmCSfuwMWJRIKFxPf5XT9R/QI1JC041JSgiqg6AaUpdeHOAKgJekiUIFuAjCA0k
         Cr/0aF8ufmIXLOasIObWezOzhNYjoI6GHczfVwxzPSeDCNPg9Y3ql4tvqTnwYiBhQQ2Z
         75odI7HVOIe/yNcHCIDtTkmFwZpLMNOV1wAdcqWYZteh1gPeDhagnzU6qOFdPgNdjAaj
         HM5w==
X-Gm-Message-State: AOAM5314Du6pSrfFXhlmfTOCa0w0/W6mdHkLj90wrw2QzBDSqvW2nnPU
	BHIShE5kWCbpmLL+9+TXS6A=
X-Google-Smtp-Source: ABdhPJxHX/R+GnbR8HnzoKbDUijAmc3zIEpe+luqaDUulZ5jxVlaVvrMbn4pLGtC37tYfdBm/4Y1Tg==
X-Received: by 2002:adf:e8cd:: with SMTP id k13mr21643961wrn.10.1640792025183;
        Wed, 29 Dec 2021 07:33:45 -0800 (PST)
Received: from pswork.fritz.box (i5E86B42B.versanet.de. [94.134.180.43])
        by smtp.gmail.com with ESMTPSA id l10sm6801522wmq.7.2021.12.29.07.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 07:33:44 -0800 (PST)
From: Padmanabha Srinivasaiah <treasure4paddy@gmail.com>
To: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	nsaenz@kernel.org,
	treasure4paddy@gmail.com,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Gaston Gonzalez <gascoar@gmail.com>,
	Ojaswin Mujoo <ojaswin98@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Phil Elwell <phil@raspberrypi.com>,
	bcm-kernel-feedback-list@broadcom.com
Subject: [PATCH] staging: vc04_services: Fix RCU dereference check
Date: Wed, 29 Dec 2021 16:32:40 +0100
Message-Id: <20211229153243.6064-1-treasure4paddy@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

In service_callback path RCU dereference done without
rcu_read_[lock/unlock] pair, fixing same by using them.

[   32.201659] =============================
[   32.201664] WARNING: suspicious RCU usage
[   32.201670] 5.15.11-rt24-v8+ #3 Not tainted
[   32.201680] -----------------------------
[   32.201685] drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h:529 suspicious rcu_dereference_check() usage!
[   32.201695]
[   32.201695] other info that might help us debug this:
[   32.201695]
[   32.201700]
[   32.201700] rcu_scheduler_active = 2, debug_locks = 1
[   32.201708] no locks held by vchiq-slot/0/98.
[   32.201715]
[   32.201715] stack backtrace:
[   32.201723] CPU: 1 PID: 98 Comm: vchiq-slot/0 Not tainted 5.15.11-rt24-v8+ #3
[   32.201733] Hardware name: Raspberry Pi 4 Model B Rev 1.4 (DT)
[   32.201739] Call trace:
[   32.201742]  dump_backtrace+0x0/0x1b8
[   32.201772]  show_stack+0x20/0x30
[   32.201784]  dump_stack_lvl+0x8c/0xb8
[   32.201799]  dump_stack+0x18/0x34
[   32.201808]  lockdep_rcu_suspicious+0xe4/0xf8
[   32.201817]  service_callback+0x124/0x400
[   32.201830]  slot_handler_func+0xf60/0x1e20
[   32.201839]  kthread+0x19c/0x1a8
[   32.201849]  ret_from_fork+0x10/0x20

Signed-off-by: Padmanabha Srinivasaiah <treasure4paddy@gmail.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 6759a6261500..ee1b48db9681 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1058,7 +1058,10 @@ service_callback(enum vchiq_reason reason, struct vchiq_header *header,
 
 	DEBUG_TRACE(SERVICE_CALLBACK_LINE);
 
+	rcu_read_lock();
 	service = handle_to_service(handle);
+	rcu_read_unlock();
+
 	if (WARN_ON(!service))
 		return VCHIQ_SUCCESS;
 
-- 
2.17.1

