Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07743FC3
	for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 22:06:42 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id t4so36201869qkb.9
        for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 15:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h/GsHeyvvkKJdskTxdNmQ/rhjzzyIPbBxi6Rx6oGxp0=;
        b=EwRZXHZ2ZxDHgukg6GrKwx/vTr0nhMBZQfpi+FrmLDNCeENzzH1sf4puo5sCKCq/M+
         HkVrHJZtzMqa0US0pWeKBUMJgBO97pz3vFKIjj4aVl9KBsTT6x2Gdsd9yHFQlpFbA25B
         C7j2njdMeNH8sWHr2jONX+rLKoF4/IsZ29y9KLEoJ04xyaTFJBkJxXmqrfp2TW4rf49w
         Tj40Usf5WWP7bG2Oz4uptbmmFvpgVzr5KcvV44BVZTUYVYaSczVw3PcR/iTAzEaP8VRg
         SPuMDj/9C5oYnWGm60WEhEPcDYhAk/e4HdOo9Bc/ugArvAWNzHHk5sG8fOR6XMl12Wf0
         UTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h/GsHeyvvkKJdskTxdNmQ/rhjzzyIPbBxi6Rx6oGxp0=;
        b=7vWk1QtjSw/GqfyQ2MU++EerKlx3nn04Tyzs6g20A++NyEvDKvfxtey00mbBagdRTp
         +ivuT6mYHMSXeVnbI0rO22dr12PcJfiqCUQWUk2pIDJkjubxWxwdyXjBcHwgrl8KJh++
         jZhd9YKXJFNNesbLl+dPgi0ryRYWaDprGEaCiW1u0XG7XqPfpZIfdIESY0T4H+vYX/ng
         IpEgg43y8OqRhH/j1hYGCUozfyTt3ZdFJ6FzpHn6oiBXB6Xy/GzZCJ5lN4MRomale2gN
         Y6yk9CoahH2EDM1ckHcqBGjqVApz2aBMc54o8l/e3TE7VDJCIWnPEcW682/xQVdF+j9E
         zhsQ==
X-Gm-Message-State: AOAM531mwSvxhEYYL8290YK0f7RKrSxmYgOH8fB1DPWSzphpZLkkcHxb
	mxAUzGRwontSD+auOF1rfrVYyiqoS7A=
X-Google-Smtp-Source: ABdhPJyfsmmaw+e54+EKhacYU+CLQadhZShHYn6/qVyVc1PUf6FwE2BQXyPk/MBkIkFJiEBXwFX08w==
X-Received: by 2002:a37:f515:: with SMTP id l21mr21014533qkk.234.1632089201692;
        Sun, 19 Sep 2021 15:06:41 -0700 (PDT)
Received: from localhost.localdomain ([191.84.236.195])
        by smtp.gmail.com with ESMTPSA id t23sm246313qkj.31.2021.09.19.15.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 15:06:41 -0700 (PDT)
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
Subject: [PATCH v2 7/7] staging: vchiq_arm: use __func__ to get function name in debug message
Date: Sun, 19 Sep 2021 18:59:14 -0300
Message-Id: <20210919215914.539805-8-gascoar@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210919215914.539805-1-gascoar@gmail.com>
References: <20210919215914.539805-1-gascoar@gmail.com>
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

