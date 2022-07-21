Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B824B4690
	for <linux-staging@lists.linux.dev>; Thu, 21 Jul 2022 17:37:39 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id d7so2463342plr.9
        for <linux-staging@lists.linux.dev>; Thu, 21 Jul 2022 10:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7A7f3vsCoMPD+oJ+DRhT8m5bm216n3txZjp85zwns54=;
        b=fcxHtD+v0Oc9pKDm4ZTw/rm1K57I0OQz/UHDeHsDbMw+3Td+wBMXFhXOHEGrAhrxr3
         SLLB/p1ps0OE6wLB8PRZh26P8D25wo2Vh8f8aZ1YIclS6UbuStT/fV+15MWMKgS3PUt/
         EkHav+1hzaMnAMZyRndLXSlViTpoZvO7c6qGu7vztPAHHScqrmqgrJhLD0hhq6yZNi1k
         5ogKzoifhm4vADyYuT5/WqSQGRZOLHZoDG0iDh1Q3HO/nu5Q2azJ7e99v+Cbyu+Pdlsy
         9Bz6MPEmHJ5aBGbIwP5pMfhTZ17GC8Xv73ZuVfYmjXxw22bzndmo76HMMlLuF8TFpNum
         FJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7A7f3vsCoMPD+oJ+DRhT8m5bm216n3txZjp85zwns54=;
        b=pbOVeQXh9K/U6B8eZItLb3NM+R9pb3ughw4yRoMjCd+uSLR7W0RvVBEebrM6jzMcgf
         h/5iYJhcrePxnp+fZN/NGjEPub/t9eXakOHXLE0gqx0/1LkeKKejaRwxkGjIeu9wNH3t
         7HZmG+5ZmiUAJwfU4/XwqCY2iUbS6PZxSDx8fN9TQDR5jhzo7Z+BhxPbTLGpjdzuh3XT
         FPvT/GYDNyXALzJkv5sd3wxl1ojVTaW+lpvAz62sHkXcYokn8oxEv0ZHQZjydWiXK4RM
         a1TYN3yGdZ08oJY+IStbYZgRKiBoZ2G1c43Z5PZDTzGhu+40peGdYylb+xY8eKWkOcAw
         7MJg==
X-Gm-Message-State: AJIora9rq/BN+z7fRJjrMOBh+kAZXFaKjFPk4a166/bFYcFWuHpJpfDx
	2MqPpcqNcijdSsVHjM3e/jk=
X-Google-Smtp-Source: AGRyM1uHlIPUVPRS+0S6K83Tv/R6O1KC9VAqTt4sA26lM1hbFUgDjkfUujDhCqIiUbzhOB/8olB6fA==
X-Received: by 2002:a17:90b:4b81:b0:1ef:cd2c:bf2e with SMTP id lr1-20020a17090b4b8100b001efcd2cbf2emr12282986pjb.137.1658425059113;
        Thu, 21 Jul 2022 10:37:39 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d01c:7038:1b61:a224:b8d7:290b])
        by smtp.googlemail.com with ESMTPSA id q9-20020a17090a7a8900b001f219c5ae7dsm1711714pjf.31.2022.07.21.10.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 10:37:38 -0700 (PDT)
From: Abhijeet Srivastava <abhijeet.srivastava2308@gmail.com>
To: 
Cc: abhijeet.srivastava2308@gmail.com,
	Corentin Labbe <clabbe@baylibre.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	mjpeg-users@lists.sourceforge.net,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: staging: media: zoran: Fixed Block comments
Date: Thu, 21 Jul 2022 23:07:22 +0530
Message-Id: <20220721173729.63844-1-abhijeet.srivastava2308@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Warning found by checkpatch.pl script.

Signed-off-by: Abhijeet Srivastava <abhijeet.srivastava2308@gmail.com>
---
 drivers/staging/media/zoran/zoran_driver.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
index 4304b7e21709..b408c1d4e0a7 100644
--- a/drivers/staging/media/zoran/zoran_driver.c
+++ b/drivers/staging/media/zoran/zoran_driver.c
@@ -746,9 +746,11 @@ static const struct v4l2_ioctl_ops zoran_ioctl_ops = {
 	.vidioc_enum_input		    = zoran_enum_input,
 	.vidioc_g_input			    = zoran_g_input,
 	.vidioc_s_input			    = zoran_s_input,
+
 /*	.vidioc_enum_output		    = zoran_enum_output,
-	.vidioc_g_output		    = zoran_g_output,
-	.vidioc_s_output		    = zoran_s_output,*/
+ *	.vidioc_g_output		    = zoran_g_output,
+ *	.vidioc_s_output		    = zoran_s_output,
+ */
 	.vidioc_g_std			    = zoran_g_std,
 	.vidioc_s_std			    = zoran_s_std,
 	.vidioc_create_bufs		    = vb2_ioctl_create_bufs,
-- 
2.34.1

