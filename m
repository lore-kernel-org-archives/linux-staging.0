Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF682C82
	for <linux-staging@lists.linux.dev>; Thu, 30 Dec 2021 14:56:33 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id d198-20020a1c1dcf000000b0034569cdd2a2so13447971wmd.5
        for <linux-staging@lists.linux.dev>; Thu, 30 Dec 2021 06:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JDmpSF45YcS1E3Eg1OsibbyFEleKy63whnxqUOdxM+E=;
        b=khdGs1JnrOKUM15e4EVNN3MlK1bDfnUDA7mIWNeLiouDoIIdNOhLuw0/BbYAmL7QL6
         0nexo1aKPyo2juNavxS2QGdrR/ckNrDr4Vc1gYSGtyvSplaWjRuUZXPejg/vDECyn/V8
         vCerTclSAa7dteafS93aZs7jdMudfGrbp8Jj4XQRLaffq9O7/IQEmjkcCQ9ckLZyijJf
         Bg64Ifxk+Q89kJIKZQOGAhHixYIsaN0jPJXLfbpkw9JNHbphA7X99OgL6ELL8bgXCeom
         ZdjgARvgY1ohY3E8sbyaIDyU7vqlB5G2wBp+u4W1yx6YOmhMp0qq2lASOpuI7XG0DdbE
         Scog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=JDmpSF45YcS1E3Eg1OsibbyFEleKy63whnxqUOdxM+E=;
        b=DmSPGM0scSpusfqUrRi6S3INtc4MwpYum67EELz0GykKyHz1p5gnLFGtXnDcAx2UqO
         mOqb1ubC+UyJ6dzswle8+NKBk3UIidTDn8yh3uamWVFgPiimsklAEkFzw6d8HKEoiZ1C
         F7bxpz37OLpEHrPchxjw70I+hNuZRpywX0ZTNSmV1DUPF4BxXXq27s9r8HtVOVYuLeWW
         9qr7HkKXu17riBrp6XJSox6QNDRMvE4aIJfKFEIWO1QWNsnjF08xpoYelF6H3Kj3IFbF
         6dL7lh6cCApNKfGJwiW1ec9r7Q0SYIVt0xynoIJ67EULa4OQA+RtPnciFbJve361vSRY
         5BOQ==
X-Gm-Message-State: AOAM532azLaEkbr6Yx+ZWv7gjKv6BF69rXozqo/iF2CZaHtZjVXiwSYc
	nbRx73gn7+LhG7BD1xdPwE4=
X-Google-Smtp-Source: ABdhPJy5RxDepYYn0RG6O4bcZK03BLBuezi5xdz/C202ZMRpjK4y1jXrCU3Y048l4Dre1/Gu1p3NJw==
X-Received: by 2002:a05:600c:4153:: with SMTP id h19mr26107175wmm.142.1640876191790;
        Thu, 30 Dec 2021 06:56:31 -0800 (PST)
Received: from pswork.fritz.box (mue-88-130-61-102.dsl.tropolys.de. [88.130.61.102])
        by smtp.gmail.com with ESMTPSA id d10sm26572238wri.57.2021.12.30.06.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Dec 2021 06:56:31 -0800 (PST)
From: Padmanabha Srinivasaiah <treasure4paddy@gmail.com>
To: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stefan.wahren@i2se.com
Cc: gregkh@linuxfoundation.org,
	nsaenz@kernel.org,
	treasure4paddy@gmail.com,
	Gaston Gonzalez <gascoar@gmail.com>,
	Ojaswin Mujoo <ojaswin98@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Phil Elwell <phil@raspberrypi.com>,
	bcm-kernel-feedback-list@broadcom.com
Subject: [PATCH v2] staging: vc04_services: Fix RCU dereference check
Date: Thu, 30 Dec 2021 15:54:11 +0100
Message-Id: <20211230145415.11962-1-treasure4paddy@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211230133430.GA10256@pswork>
References: <20211230133430.GA10256@pswork>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

In service_callback path RCU dereferenced pointer struct vchiq_service
need to be accessed inside rcu read-critical section.

Accessing same with rcu_read_[lock/unlock] fixes the issue.

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
Changes in v2:
	RCU dereferenced pointer need to be accessed inside rcu
read-side critical section.

 .../vc04_services/interface/vchiq_arm/vchiq_arm.c      | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 6759a6261500..8ddd400ab2c3 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1053,24 +1053,30 @@ service_callback(enum vchiq_reason reason, struct vchiq_header *header,
 	struct vchiq_service *service;
 	struct vchiq_instance *instance;
 	bool skip_completion = false;
+	unsigned int localport;
 
 	DEBUG_INITIALISE(g_state.local);
 
 	DEBUG_TRACE(SERVICE_CALLBACK_LINE);
 
+	rcu_read_lock();
 	service = handle_to_service(handle);
-	if (WARN_ON(!service))
+	if (WARN_ON(!service)) {
+		rcu_read_unlock();
 		return VCHIQ_SUCCESS;
+	}
 
 	user_service = (struct user_service *)service->base.userdata;
 	instance = user_service->instance;
+	localport = service->localport;
+	rcu_read_unlock();
 
 	if (!instance || instance->closing)
 		return VCHIQ_SUCCESS;
 
 	vchiq_log_trace(vchiq_arm_log_level,
 			"%s - service %lx(%d,%p), reason %d, header %lx, instance %lx, bulk_userdata %lx",
-			__func__, (unsigned long)user_service, service->localport,
+			__func__, (unsigned long)user_service, (int)localport,
 			user_service->userdata, reason, (unsigned long)header,
 			(unsigned long)instance, (unsigned long)bulk_userdata);
 
-- 
2.17.1

