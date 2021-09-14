Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50FB3FC3
	for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 21:37:44 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id w8so675341qvt.0
        for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 14:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sN887L5dw+wolgQTxQ/Mi09l/5z12JpLwvV7NlzvMdY=;
        b=Om58aM4UuMcBrVCOPH8vqo0wAIVhL0KjYsQ1osJufp464nG9URvJjW+MJT57oEbCCo
         Cih3N0uZZwY176vyJmiIe5gkU44EEswkJORnmKmTVkxlF+NqX0Nj461cptOmAWa1RwpP
         DEqtK6IpSDYcpu+9CMpu0bZVWaH/fPdPgK7fxqvvTBu7/1EANsCkfnEbLHTlQ0vlKPdl
         qGLnKRXZIYiFgHVJHGf3PyCLd0vge+GSIGDRLKFWxwCiHPk7MxOuyi1AQw0n822tlKxK
         5NOa1F0Dynan7n9SQRotwPkwRJiO0t3a6QDATqG6k9HygSlk7+PBBTZCUx4IWbMiFTqw
         o8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sN887L5dw+wolgQTxQ/Mi09l/5z12JpLwvV7NlzvMdY=;
        b=3WPwoYmxHbPGgKjH5q08+oMsC/MsqDytSf4BMJ0Hr/n5oEv7ArhHKeWBe4gPg5Wr/S
         beMQ42epMCw/3NceQ3cv2DYqKoojCwEWEdfHg3RFXXG7uSRIR7ALDVZhqMstklGpuOfv
         QsrG9236i4WKTXLJQqbpO9ZYWFtrHumUSq+cOAmKkd1Qd0CwBZRLA3IA/zUByW/PJ6Wa
         2Jeo/Nr36Amhaoo+f24kr1OpMCPhPfKCURTeGoIiojgmvQXP5DRLoM7WC+VBQCWwZOVr
         a6SeCrG1oYYR5Ruiy18TRjMyBZVX4c/Iu0ueN1CsIL4LBlWtpIMNuOMFZDKt449Hciyo
         E1eA==
X-Gm-Message-State: AOAM531jKjNQmD8mxhiGR/mOGfK6VR+r7lG+2DkR4cdZZi/xAovJi9sb
	MNSESvi8lrfIP8dl7e5xR5ORro5Mjphp5w==
X-Google-Smtp-Source: ABdhPJzMRDhqa4mXzcHqmNPW45fcwjAo/ztjQhsIyC+dpiqiuISSJw0z5wrXutsAHo27RhhOnMN28w==
X-Received: by 2002:a0c:8e05:: with SMTP id v5mr7698418qvb.25.1631655463525;
        Tue, 14 Sep 2021 14:37:43 -0700 (PDT)
Received: from localhost.localdomain ([191.84.239.65])
        by smtp.gmail.com with ESMTPSA id o7sm6716611qtw.87.2021.09.14.14.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 14:37:43 -0700 (PDT)
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
Subject: [PATCH 6/8] staging: vchiq_arm: fix quoted strings split across lines
Date: Tue, 14 Sep 2021 18:35:36 -0300
Message-Id: <20210914213532.396654-6-gascoar@gmail.com>
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

Quoted strings should not be split across lines. Quoting 
Documentation/process/coding-style.rst: "never break user-visible
strings such as printk messages because that breaks the ability to grep
for them."

Reported by checkpatch.pl
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c    | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index ffacf1c7212b..72d9a6e37ae9 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1613,9 +1613,8 @@ vchiq_dump_service_use_state(struct vchiq_state *state)
 	read_unlock_bh(&arm_state->susp_res_lock);
 
 	if (only_nonzero)
-		vchiq_log_warning(vchiq_susp_log_level, "Too many active "
-			"services (%d).  Only dumping up to first %d services "
-			"with non-zero use-count", active_services, found);
+		vchiq_log_warning(vchiq_susp_log_level, "Too many active services (%d). Only dumping up to first %d services with non-zero use-count",
+				  active_services, found);
 
 	for (i = 0; i < found; i++) {
 		vchiq_log_warning(vchiq_susp_log_level, "----- %c%c%c%c:%d service count %d %s",
-- 
2.33.0

