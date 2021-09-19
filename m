Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5AE3FC3
	for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 22:06:34 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id g11so10030054qvd.2
        for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 15:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b700IZOvcmDVrq+0HZ+RP1WwJQWxcExsUcbv+nvnXKY=;
        b=Vp8vCU0BfQKHWL7fU64lnVUwpF1PWnTE97HCEbS8ZbUW2Y3rSjVbgVoYwrPtbyKs4l
         VB3ncPyVjF7MwxRIMgjllDLrZ3EY5D8bRiWQy1StUdgvFxmbKurFt+m52GG4uVlhyX99
         l7nN4e+pK8BwYfbrbU/B2Y5JbVpesXCuHwcEiiPksMRFMvsqZ8mO8v/AQxaZH/UGOxFm
         HcXLre04c6B8lgTJETWEVs86rdcwll8EKBxGLBacSE+Be8DCcWkx/4WWQ+KOvfLpQplu
         JvLJUYNuB0y7LPCKa7OvpPNGawJNZ3U7HeZS+YLgpvOdfuhcWeO/0YhD19aeQ1qkgIcK
         5ftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b700IZOvcmDVrq+0HZ+RP1WwJQWxcExsUcbv+nvnXKY=;
        b=tocKsR1qQLMUOc8X0V4kVzL+rFStEe0LRZDG1pBfcHuSYXkIbnfEf1XUu7JSYFjj/n
         MLpvHh/RKhsdO84FYKE8jzelx7AxkHTi/dA/tQXNW1vpjMN75ws4v8lngm1HY+78LrrB
         5RFhuOrRbx+XhncV7tTA+gkVdRfTqDMmJdF/wzQ0DPvn05mIU17aM4MMmMXKGkenY3We
         l5hDSzaDuaUYzpKu4MQecK0S6K/VPMNzKPV6i0uYYm04XquA3RQQvSeaLS5uMtWAKYwR
         e+LK5/ZokEHbdt5QhiDWCRvak7D10KFIm22YbAwr4LtPOCtfMWpYcb3rvYY30o7yKEYF
         /j5A==
X-Gm-Message-State: AOAM530LVLEqchuImc4XljChCSpu1Fy9x7i5oIIdye6qag5GGdFqKwnf
	FnW+Azl5Nxy/tjVKwB6B0LoZs75Ckx0=
X-Google-Smtp-Source: ABdhPJyvkDxySbpKskXmjexAAElJnXfWuNwqFgXqy/i6V9jE8lprk/H9LTY87IBm7g1/8+7a1D0KKw==
X-Received: by 2002:ad4:45c3:: with SMTP id v3mr22656038qvt.41.1632089193618;
        Sun, 19 Sep 2021 15:06:33 -0700 (PDT)
Received: from localhost.localdomain ([191.84.236.195])
        by smtp.gmail.com with ESMTPSA id t23sm246313qkj.31.2021.09.19.15.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 15:06:33 -0700 (PDT)
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
Subject: [PATCH v2 4/7] staging: vchiq_arm: cleanup blank lines
Date: Sun, 19 Sep 2021 18:59:11 -0300
Message-Id: <20210919215914.539805-5-gascoar@gmail.com>
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

Remove unnecessary blank lines after open braces and before close
braces.

Reported by checkpatch.pl

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 9464a4777ff6..778540faaa1c 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1218,7 +1218,6 @@ int vchiq_dump_platform_service_state(void *dump_context,
 struct vchiq_state *
 vchiq_get_state(void)
 {
-
 	if (!g_state.remote)
 		pr_err("%s: g_state.remote == NULL\n", __func__);
 	else if (g_state.remote->initialised != 1)
@@ -1339,7 +1338,6 @@ vchiq_arm_init_state(struct vchiq_state *state,
 
 		arm_state->state = state;
 		arm_state->first_connect = 0;
-
 	}
 }
 
-- 
2.33.0

