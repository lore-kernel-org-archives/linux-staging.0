Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1383314261
	for <linux-staging@lists.linux.dev>; Sun, 27 Aug 2023 19:34:02 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6bf01bcb1aeso888084a34.3
        for <linux-staging@lists.linux.dev>; Sun, 27 Aug 2023 12:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693164842; x=1693769642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HfuobNFZiIqUm1JZsSbHScwqD8twWVWxz8M0FngOBaU=;
        b=W6NguLYdal3s4o4UZi28iQ9mrJ62+WJTdtaZbaZ3UUf6GaxfwmPvKNzF0RUDxKhgfJ
         JO/3y11wS8z1VjCTiAnZd8/ppM+OPPXWLzKi7zv3wxQAhG8rveMpuAQs6ccRFl6jsZvA
         R6C9xlGCbpkD/Uslb4IYlsBma08JrXcdauwuqAuP/s1HFxT5UAJuD2RnzAsOd4pGOqhY
         y+KHDPZo4uVuJBkBB3dmnX78w1ucxoqZaN1m1NXp25CXZSN8wQfZ51sVl4mi7hrMUjXL
         uaNOpYaZNQ3J6sD+SXA5Z2GKvd2s3sMCvOc5NH2pe0Tx1qyVGRGC64xNHVXDGbU1rrcX
         QJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693164842; x=1693769642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HfuobNFZiIqUm1JZsSbHScwqD8twWVWxz8M0FngOBaU=;
        b=L0C4zppSbNyYLeifZNaiawPUrEpqUvqorb5esL05WGX9X4fNm50iNnrKr+2d6XF1X9
         iBxCQ5Y/T4Ep4n76MGYqflU+nAiQkNcAiPZTq4o8gOpJsH2AjdXLbf6kDHU48i2mSNYk
         ew6Kf5V9F7pCzXgwu41wol0T3dAnBIA77mOHUOPBTtjvyTpS1V9izpJiDC1VxkDRgcu+
         gLNq0IXhekgqrDWIhwcBk36w7VYPm4CStPSiYHkIKquSio6kkvEDsQDPx49rpIj1B2mU
         ZAehZ7fHXLfavCwTp6LwSI5sMSNO3U2eEuI4xeNkVwGlRkOVpdr7h9TzjK++7EujHLh1
         3dCw==
X-Gm-Message-State: AOJu0YwZE0+/fHHFhA75lyL8zYjwn3upAgKbl+YVbtjmlAnDauTMLn1v
	sB2nwn/0zC14hlNpGDMZ9jrP6j7uClc=
X-Google-Smtp-Source: AGHT+IFF4sh2E0Dky2o8LohJbQLJcVgHVTEO1rtPT6IhI606JqnU5iu2NedcasdSsl1mHsQvibQqHw==
X-Received: by 2002:a05:6830:45b:b0:6bd:bba9:2d63 with SMTP id d27-20020a056830045b00b006bdbba92d63mr12999917otc.9.1693164841915;
        Sun, 27 Aug 2023 12:34:01 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:82ea:8c7c:b784:3f92:988a])
        by smtp.gmail.com with ESMTPSA id l8-20020a9d7348000000b006b96384ba1csm1640272otk.77.2023.08.27.12.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 12:34:01 -0700 (PDT)
From: Alexon Oliveira <alexondunkan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: martyn@welchs.me.uk,
	manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Alexon Oliveira <alexondunkan@gmail.com>
Subject: [PATCH v4 4/4] staging: vme_user: fix check unnecessary space after a cast in vme_fake.c
Date: Sun, 27 Aug 2023 16:32:55 -0300
Message-ID: <603976b29ad4d9a0e4cbd8452ff674ec70a227a8.1693164540.git.alexondunkan@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1693164540.git.alexondunkan@gmail.com>
References: <cover.1693164540.git.alexondunkan@gmail.com>
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

Changes in v2:
- Fixed summary phrase with tags to indicate commit order
in the patch series, noted by Greg KH

Changes in v3:
- Sent patch series in a single email thread, noted by Nam Cao

Changes in v4:
- Versioning the patch series with the forgotten information
about the changes in the previous versions, noted by Greg KH

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

