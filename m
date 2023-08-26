Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC65010941
	for <linux-staging@lists.linux.dev>; Sat, 26 Aug 2023 21:07:43 +0000 (UTC)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1c8e9d75ce1so1200848fac.3
        for <linux-staging@lists.linux.dev>; Sat, 26 Aug 2023 14:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693084062; x=1693688862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ZyTeNGFnmQqE613GDKmKhvLAFe/AnQBwlsX/erp5GQ=;
        b=F5JiEwbYoIU+ln+iqlWcPcVtM4ikg727AXK4/DMPwmas6P6QWtWxADpAy1ZPjfJI7Q
         et2euTDprhrkB4XtgwjttJe74m7aHk92hkHaT4lEoPxNc/ei0ZUsmbbMAmKksVvVvT8p
         bBfnYErPWjgnnN62KqESbzleqno7oRF3sz0g467YjnH1VQkHbv5bOeOV3PwKoP7fFTb9
         /38CiYq0iPIJZxjOk/SUXOneVp5yekJacuHFL9Gi/9/pSXO2WtfnYQHNJme5//uzvQZJ
         Lbzyos/qfQuE3Hctjac02Q40mXUaNi7G42oMPtHg5fefSAUKFcO+EcJIUgfjdqlQigj1
         BPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693084062; x=1693688862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ZyTeNGFnmQqE613GDKmKhvLAFe/AnQBwlsX/erp5GQ=;
        b=A0gbO2HdXdnqeorR2WYK/RR4nAoWQy3V2HvprAr1MYYBrO7cZX4mMjGYRCIAnlFQfi
         n37jj+9ZiFmVw8EMmJkfjFZGZltQgbeshg/VKy75AKcDJNc9QNdfEqRGWoct+IEXraio
         U4e345Y0C9ZN52Di/E+CZQP7TSvLUC6az86HwEnmeB3g5qRKkoi5KLvfHniqzUXAaxx4
         6gn2l53uGmZgDT9NQg9DRZ1vb8BaItNMzLNjWeLhDF+cuttf/0D2luIk6Hu8cAdnyFkM
         1XnHMTDLGuEOyByoG+gD39CougCDlMbQFc1mAu3Rz7pkodk/JpCKu7xu7DFpUfocCT65
         26wQ==
X-Gm-Message-State: AOJu0Yy0JuCFH16SBjfea4Sq3OBhAOSX8o/9tz7x2/hny2qKuvUUsFTT
	ELCopFS9xggEsvURHPIXP4A=
X-Google-Smtp-Source: AGHT+IGr00EAhq6uWk1se+am4DAXkfUvAJpPrf0iDTs9CP82H184D9ynRddJTamvciCtHrFTWH8IHw==
X-Received: by 2002:a05:6871:586:b0:1be:e925:3dce with SMTP id u6-20020a056871058600b001bee9253dcemr7357215oan.7.1693084062707;
        Sat, 26 Aug 2023 14:07:42 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:82ea:8c7c:b784:3f92:988a])
        by smtp.gmail.com with ESMTPSA id w3-20020a0c8e43000000b0064f50e2c551sm1488377qvb.1.2023.08.26.14.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 14:07:42 -0700 (PDT)
From: Alexon Oliveira <alexondunkan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: martyn@welchs.me.uk,
	manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Alexon Oliveira <alexondunkan@gmail.com>
Subject: [PATCH 4/4] staging: vme_user: fix check unnecessary space after a cast in vme_fake.c
Date: Sat, 26 Aug 2023 18:05:18 -0300
Message-ID: <603976b29ad4d9a0e4cbd8452ff674ec70a227a8.1693082101.git.alexondunkan@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1693082101.git.alexondunkan@gmail.com>
References: <cover.1693082101.git.alexondunkan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed all CHECK: No space is necessary after a cast
as reported by checkpatch to adhere to the Linux kernel
coding-style guidelines.

Signed-off-by: Alexon Oliveira <alexondunkan@gmail.com>
---
 drivers/staging/vme_user/vme_fake.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index 4258ed6033e7..4ccb16dd0d0b 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -95,7 +95,7 @@ static void fake_VIRQ_tasklet(unsigned long data)
 	struct vme_bridge *fake_bridge;
 	struct fake_driver *bridge;
 
-	fake_bridge = (struct vme_bridge *) data;
+	fake_bridge = (struct vme_bridge *)data;
 	bridge = fake_bridge->driver_priv;
 
 	vme_irq_handler(fake_bridge, bridge->int_level, bridge->int_statid);
@@ -1092,7 +1092,7 @@ static int __init fake_init(void)
 	mutex_init(&fake_device->vme_int);
 	mutex_init(&fake_bridge->irq_mtx);
 	tasklet_init(&fake_device->int_tasklet, fake_VIRQ_tasklet,
-		     (unsigned long) fake_bridge);
+		     (unsigned long)fake_bridge);
 
 	strcpy(fake_bridge->name, driver_name);
 
-- 
2.41.0

