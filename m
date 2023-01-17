Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC6228EC
	for <linux-staging@lists.linux.dev>; Tue, 17 Jan 2023 16:40:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE44CC433EF;
	Tue, 17 Jan 2023 16:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673973602;
	bh=8FfTQZrqyhnZxAAYd4VyprghfHyBrSE/ve6LyDRtWTk=;
	h=From:To:Cc:Subject:Date:From;
	b=oYoZOPhi7sLGeQdjqXEzkYfVO0oZyyN+isGYwClSsk+NynvndqE2R5OvvL0WQJA7p
	 12mc3xH+iu3JVpQNY5qCVK4pIbscQApA99AE69u1PkAqjvSQoDbmOKwZxDsi+gVpuV
	 a6PHnU3ZbXIGq7iRDi9o9w2qd8I2sBJX2k0mjZdce1UfLRoo4vqnlTF1ZIoIdDty5w
	 RAnDaSyLmnHxKxQ5CaTvV7TMEpqbi0HpzzK5QtyJsVvZ+1qH5jVLMhhP3J5pEEIdwK
	 17m5KoEweHls4uxnyKxcYaCbhddRzEUqiiwCvVptGyxOdjUGdzvTYQdLj8d/YyeUmc
	 v1IuNVQblHQiQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <f.fainelli@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Adrien Thierry <athierry@redhat.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: vchiq_arm: fix enum vchiq_status return types
Date: Tue, 17 Jan 2023 17:39:32 +0100
Message-Id: <20230117163957.1109872-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

gcc-13 notices a type mismatch between function declaration
and definition for a few functions that have been converted
from returning vchiq specific status values to regular error
codes:

drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:662:5: error: conflicting types for 'vchiq_initialise' due to enum/integer mismatch; have 'int(struct vchiq_instance **)' [-Werror=enum-int-mismatch]
drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:1411:1: error: conflicting types for 'vchiq_use_internal' due to enum/integer mismatch; have 'int(struct vchiq_state *, struct vchiq_service *, enum USE_TYPE_E)' [-Werror=enum-int-mismatch]
drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:1468:1: error: conflicting types for 'vchiq_release_internal' due to enum/integer mismatch; have 'int(struct vchiq_state *, struct vchiq_service *)' [-Werror=enum-int-mismatch]

Change the declarations to match the actual function definition.

Fixes: a9fbd828be7f ("staging: vchiq_arm: drop enum vchiq_status from vchiq_*_internal")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 .../staging/vc04_services/include/linux/raspberrypi/vchiq.h   | 2 +-
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h b/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
index db1441c0cc66..690ab7165b2c 100644
--- a/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
+++ b/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
@@ -86,7 +86,7 @@ struct vchiq_service_params_kernel {
 
 struct vchiq_instance;
 
-extern enum vchiq_status vchiq_initialise(struct vchiq_instance **pinstance);
+extern int vchiq_initialise(struct vchiq_instance **pinstance);
 extern enum vchiq_status vchiq_shutdown(struct vchiq_instance *instance);
 extern enum vchiq_status vchiq_connect(struct vchiq_instance *instance);
 extern enum vchiq_status vchiq_open_service(struct vchiq_instance *instance,
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
index 2851ef6b9cd0..cd20eb18f275 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
@@ -100,10 +100,10 @@ vchiq_dump_platform_use_state(struct vchiq_state *state);
 extern void
 vchiq_dump_service_use_state(struct vchiq_state *state);
 
-extern enum vchiq_status
+extern int
 vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
 		   enum USE_TYPE_E use_type);
-extern enum vchiq_status
+extern int
 vchiq_release_internal(struct vchiq_state *state,
 		       struct vchiq_service *service);
 
-- 
2.39.0

