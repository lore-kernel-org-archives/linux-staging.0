Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF8F2CA2
	for <linux-staging@lists.linux.dev>; Thu, 27 Jan 2022 01:44:41 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id r14so1312816qtt.5
        for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 17:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fkZRVSlN4OVqtWVL7pewLYQ6zSvcJSeKEV0uiFIaRLk=;
        b=dH5AjtjcUNRW+nbSzvOeXBjGXOwYbtL3LGiDQxPOv2Jd0Xz8ZpG66rlr80WsqXfIxS
         IeVSSkW0TY+us/IaD+OJr90QsyPSqiBM9QbHlWVUfzdZquhT7Fw9RNYnZzzFL8ZfZbJo
         0nanawA37PuhwHwyemb9WmwmD5T0mML991BB/sYoysqrr8VtNKr3AjVUkxqHtvAlgqYM
         defAdyrdpcVU6/xUWtn6SmGrdVGp+fOPxF6iLOwMXuFOOmqnvaCP4KARYbtZ+zWe7xlT
         VjQjAVVUBzq+t+szZ1wG+87BFZZtobEtRReSCKtBPI0cHjsOogAjfu3tLOFD6Ch5izPd
         2CmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fkZRVSlN4OVqtWVL7pewLYQ6zSvcJSeKEV0uiFIaRLk=;
        b=BzpSMIsDjEac4uvzJ3LKqzpguacypI9Uuf1+D9vTUfndOLmkmFVdi6wzO+BT4SXltT
         Yi012VXdvxkdSHRQeQL+spolXZFMcRbEvqzwBE8v12mWm/gYRACca4LkYF++clDxLWhQ
         SEQ6RiJL3RUJDuqP9GIEJiuW6jD2aRj55TudyFmEL9RdxCHiPABf8FOh3Y4F9vQxDqsV
         t2JlTmajlBSu5XxPHv0emuKYV9YztYC4H8f4ldgdeHXZrRZ9s7BgsTijbk1YS1p7fwaL
         xsCNgdiceCftF89weRe05n3eEvA9Jxgg5X/uZtg9b87M8BIO1ongT7JldCNJQkLQ18au
         Az+g==
X-Gm-Message-State: AOAM5327bXNPk49kGM2ISB3MKkt8LzKlIuIuZ0dZocZliOOstW9RWgWC
	1CvGk1heAdck8e0zj/jbVOQ=
X-Google-Smtp-Source: ABdhPJy4vAwIjbPf59Lgx5QWmb2pX3lLzFpQDOjoRe8jLEPWzH36QASNhH77p7m6WXw3/OOm9bkHAQ==
X-Received: by 2002:a05:622a:1008:: with SMTP id d8mr1201056qte.222.1643247880468;
        Wed, 26 Jan 2022 17:44:40 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id h6sm730432qko.7.2022.01.26.17.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 17:44:40 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: nsaenz@kernel.org
Cc: rdunlap@infradead.org,
	unixbhaskar@gmail.com,
	stefan.wahren@i2se.com,
	dave.stevenson@raspberrypi.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Minghao Chi (CGEL ZTE)" <chi.minghao@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>,
	CGEL ZTE <cgel.zte@gmail.com>
Subject: [PATCH] vchiq-mmal: Remove redundant 'flush_workqueue()' calls
Date: Thu, 27 Jan 2022 01:44:32 +0000
Message-Id: <20220127014432.1185206-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Minghao Chi (CGEL ZTE)" <chi.minghao@zte.com.cn>

'destroy_workqueue()' already drains the queue before destroying it,
so there is no need to flush it explicitly.

Remove the redundant 'flush_workqueue()' calls.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi (CGEL ZTE) <chi.minghao@zte.com.cn>
Signed-off-by: CGEL ZTE <cgel.zte@gmail.com>
---
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 76d3f0399964..60305c63c6f6 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -1844,7 +1844,6 @@ int vchiq_mmal_finalise(struct vchiq_mmal_instance *instance)
 	mutex_unlock(&instance->vchiq_mutex);
 
 	vchiq_shutdown(instance->vchiq_instance);
-	flush_workqueue(instance->bulk_wq);
 	destroy_workqueue(instance->bulk_wq);
 
 	vfree(instance->bulk_scratch);
-- 
2.25.1

