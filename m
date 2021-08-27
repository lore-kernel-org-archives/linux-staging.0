Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0C072
	for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 09:41:55 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id v10so9476802wrd.4
        for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 02:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ua0URsGmpA85c1J9Q/0oD8kSmR0urI2TcJUSPZW85OY=;
        b=I/9t4a9WXxuIH0zC1qiZoDMYe1A/GDv3lAfc+kNpdI8yJX5aRBjc6Nyq07oxfDZ2ea
         BpDhD1Knt57oOQpinVZkqZHhnqvNET3Yo5bJbt2MeDl4hSYUFHVHab+DkcUkgc7PHnRb
         u5VCg0p1rIYePl/KQ6ZC9mT5Q4UFyg65pV8tvszSFC+p6pb+kPRBw1sNuwq5gH009R7y
         8eJG0MMEXs36oJk3oloHX8X1Mpj7dO/ju/zBaHXnhXBLp0hWtfgsVrobJfdrgKe27sGr
         r6Pe67Z0YHN0LwpQJWQmZmFKbwm9j9heCaOiTWELPpqqBSAL/JGYAhVOEb2zfFxB8T/B
         tkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ua0URsGmpA85c1J9Q/0oD8kSmR0urI2TcJUSPZW85OY=;
        b=s7sQWFp4RhthRlPriKaE6Tqp9bwv6oQ598jUf4S1lO+o3GcXcEZ77BDvtWyTDh52zk
         c1R/jjRILOoj+zOxCjl+ZKMifKUmgqfpvsS0Oifu6AznNMzEGmaGsmIi3edD10M+JVMi
         5ns7wjdasPOZ0YntrHMdVHSvEynTeG825A35vJ4ft978eAptdIv8Xmr4J/aY+huHy05u
         LsGoQ4kMiw8E3lkx4nCKTGatwRcXDZoT1wwgDnoe7qiEiqGqjc+rhZzfwcTRf8OSfBvB
         W7xF1kRi2v3qFtzrAgjTkAy7ZTXHtZLiV+tOis/Q3yiOr+dD/VQ2Icys99Rl5BtLakOh
         d28w==
X-Gm-Message-State: AOAM5317gx3s7C2o4NIf8XB/lELmY3nd+nV0QdSE4rWIYu1h9luQu3X8
	s24P6irSXNgVrGz0pNwAjaY=
X-Google-Smtp-Source: ABdhPJyv7oAIOS2YcIALkXCfzvIgTuUE3UTAdHR6/OAv6YsiCkUaF+biaXIN5EAwdimwF+KABJ+pew==
X-Received: by 2002:a5d:5241:: with SMTP id k1mr9375070wrc.14.1630057313986;
        Fri, 27 Aug 2021 02:41:53 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::884b])
        by smtp.gmail.com with ESMTPSA id b15sm6500034wru.1.2021.08.27.02.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 02:41:53 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/4] staging: r8188eu: rename fields of struct dyn_primary_cca
Date: Fri, 27 Aug 2021 11:41:42 +0200
Message-Id: <20210827094144.13290-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210827094144.13290-1-straube.linux@gmail.com>
References: <20210827094144.13290-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename fields of struct dyn_primary_cca to avoid camel case.
PriCCA_flag -> pri_cca_flag
DupRTS_flag -> dup_rts_flag
Monitor_flag -> monitor_flag

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm_RTL8188E.c | 8 ++++----
 drivers/staging/r8188eu/include/odm.h      | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm_RTL8188E.c b/drivers/staging/r8188eu/hal/odm_RTL8188E.c
index 10fe1ecc0342..70afa0a21bf4 100644
--- a/drivers/staging/r8188eu/hal/odm_RTL8188E.c
+++ b/drivers/staging/r8188eu/hal/odm_RTL8188E.c
@@ -329,16 +329,16 @@ void odm_PrimaryCCA_Init(struct odm_dm_struct *dm_odm)
 {
 	struct dyn_primary_cca *PrimaryCCA = &dm_odm->DM_PriCCA;
 
-	PrimaryCCA->DupRTS_flag = 0;
+	PrimaryCCA->dup_rts_flag = 0;
 	PrimaryCCA->intf_flag = 0;
 	PrimaryCCA->intf_type = 0;
-	PrimaryCCA->Monitor_flag = 0;
-	PrimaryCCA->PriCCA_flag = 0;
+	PrimaryCCA->monitor_flag = 0;
+	PrimaryCCA->pri_cca_flag = 0;
 }
 
 bool ODM_DynamicPrimaryCCA_DupRTS(struct odm_dm_struct *dm_odm)
 {
 	struct dyn_primary_cca *PrimaryCCA = &dm_odm->DM_PriCCA;
 
-	return	PrimaryCCA->DupRTS_flag;
+	return PrimaryCCA->dup_rts_flag;
 }
diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index 19458e66603c..ee051e053ac6 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -154,11 +154,11 @@ struct false_alarm_stats {
 };
 
 struct dyn_primary_cca {
-	u8		PriCCA_flag;
+	u8		pri_cca_flag;
 	u8		intf_flag;
 	u8		intf_type;
-	u8		DupRTS_flag;
-	u8		Monitor_flag;
+	u8		dup_rts_flag;
+	u8		monitor_flag;
 };
 
 struct rx_hpc {
-- 
2.32.0

