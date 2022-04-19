Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BA17A
	for <linux-staging@lists.linux.dev>; Tue, 19 Apr 2022 13:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1650375391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TisNtD1J5PmBK8R9kgSJt0gLr8nDMGO0aIKPyed6r2U=;
	b=aB/SJzkVlzYqxgFoJFVDWWuWbPgLiGWujMWDHDUL7gVCGtT87CH+OtTJc4rqsgiuU0DEcd
	VoUifLbMZkjeCJiLgTeTqeDjCrPrvVJC7zlDvY5dhdkFP2W4emxYnnQ1Nex+nLwLzQ9s9I
	zdX+gMzaQF3u1gYVpfBrjfrnmpUFZZ8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-65-1_wE7NCnNDCXM3-kLv_spA-1; Tue, 19 Apr 2022 09:36:30 -0400
X-MC-Unique: 1_wE7NCnNDCXM3-kLv_spA-1
Received: by mail-qv1-f70.google.com with SMTP id b8-20020a056214002800b0044666054d36so3290738qvr.12
        for <linux-staging@lists.linux.dev>; Tue, 19 Apr 2022 06:36:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TisNtD1J5PmBK8R9kgSJt0gLr8nDMGO0aIKPyed6r2U=;
        b=YR3uGB6/YQEIaW7BxwFjyD/FawnJxPaTiQzrAbdTsabJ/R0Q7Q6MONRzjceaxQqdjw
         YIxYVDvGw1+lZikvey7vwk2PY+F06uGsQ8eKmIqwhrarWxPeotJ5rGtC9EagF/pb3BpF
         jQk/eLQ/KyVYWRUsSpY7RHKXwO4WxKvxS8xALecs9OzhB0bU1dAj0lNMvDOsxmR8AKrK
         hgzbDV+B2UhIq9g8gLG675DCiMUOXh+7IYi5JT0C5F0FMWLiu7cbQnuvHCPrOqWl6ZoO
         elmz3CfwnYNZIiJFJ/kIcLEnigLT1HUdEpHPbK7N+CrIGjG52qnydUAr9+3GLqoLca1X
         qMrg==
X-Gm-Message-State: AOAM53381wgs/5Iec/aHKu4cVDMAcwRrL53Swx+sekJWWFHW3o/IBIO/
	bjFVrJmGo2IpHj2VxX0062c142GRZTWvbBGyF+F9o2YgvLQbOqUFa5Awb3FiYy0IloCAXaVw9ty
	25l4jXGvWaGrfDtuvvuK0bERifQ==
X-Received: by 2002:a05:620a:2888:b0:699:b9a0:b618 with SMTP id j8-20020a05620a288800b00699b9a0b618mr9595096qkp.358.1650375390162;
        Tue, 19 Apr 2022 06:36:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxV2T4w1vEBvKKqeuAZm2QIyB+6IhmSfNN720JnV76tZFvQn/+PTuuEUmczxU5MaDozm5Jaaw==
X-Received: by 2002:a05:620a:2888:b0:699:b9a0:b618 with SMTP id j8-20020a05620a288800b00699b9a0b618mr9595073qkp.358.1650375389924;
        Tue, 19 Apr 2022 06:36:29 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id s19-20020a05622a179300b002e1ceeb21d0sm4355qtk.97.2022.04.19.06.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 06:36:29 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: nsaenz@kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	gregkh@linuxfoundation.org,
	stefan.wahren@i2se.com,
	gascoar@gmail.com,
	ojaswin98@gmail.com
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tom Rix <trix@redhat.com>
Subject: [PATCH v2] staging: vchiq_arm: change vchiq_platform_init from global to static
Date: Tue, 19 Apr 2022 09:36:16 -0400
Message-Id: <20220419133616.544255-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Smatch reports this issue
vchiq_arm.c:466:5: warning: symbol 'vchiq_platform_init' was not declared. Should it be static?

vchiq_platform_init is only used in vchiq_arm.c.  Single file variables should
not be global so change vchiq_platform_init's storage-class specifier to static.

Signed-off-by: Tom Rix <trix@redhat.com>
---
v2: refomat commit log

 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 0596ac61e286..7de98655e8ec 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -463,7 +463,7 @@ free_pagelist(struct vchiq_pagelist_info *pagelistinfo,
 	cleanup_pagelistinfo(pagelistinfo);
 }
 
-int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
+static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
 {
 	struct device *dev = &pdev->dev;
 	struct vchiq_drvdata *drvdata = platform_get_drvdata(pdev);
-- 
2.27.0

