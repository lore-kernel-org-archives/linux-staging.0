Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819514A2C
	for <linux-staging@lists.linux.dev>; Fri, 22 Jul 2022 18:26:32 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id o18so5057616pgu.9
        for <linux-staging@lists.linux.dev>; Fri, 22 Jul 2022 11:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U1Vpm+Ol39J44Ip/w/HGMbvmcj0WPHsL80jPsnskDEw=;
        b=CIGDJTjDuxvqk+hCAVZdusqUVAB4D0wVz5qJlyJOS1t/EvRJV94W6dZYKkmoSp5htk
         85ooyVSgoL9yjlHJdM4YDgysnOay2oPLsQxV/rIxWIm8Zgh+7SxljgH9WF8y+m+LNBqO
         haHm4fnrh9Tyc+Go6wHoM8L9WTGyeY2QCM33mmTnCjlkL8OGlXahSv/+899vGQVbsbbK
         iBDcJrO/pFAUcDftanvX7cAnnwfbJ4Gn22olrqlzxChGUcdif1Iqlu+N1ygzF5LaDlPH
         Pgo77iJjki4ipA6pJSQPXRjRdvEfypfvoRlseeKoijA7jP5J/b9xRJwKDpgXXOlncLrv
         Lojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U1Vpm+Ol39J44Ip/w/HGMbvmcj0WPHsL80jPsnskDEw=;
        b=DZLibHF14h/VMa70ukqGAszFXqexBYKi08wnZdRpju4ra3fPhPGzobRgLs+6zXDT/u
         tp/ru4WMotJ0u/hS6SbA2DZOFHM71V6uGPZyLqRe+/Y5FSqsDjqwyXVMD6vN9FBcnRwI
         E8UoTZTzlFCYNZqYf3S3KSdEEzRgiRiaZ4gYjsZmiDkm00nTblC2gDf86q4fPSuCqSUX
         taLjmMjq9Dr93elZGXSfy/Yx2pIkIG4iyRd7nLgFE0UB7F2erKMkrVb8EJ7FnCnZIz7+
         qyQNvT+xmnVfYQSSnMLjTthTg99/PR9aMJahsdYG+O4Mn+3yeBdHw42MbGe69rFnQkjj
         adMA==
X-Gm-Message-State: AJIora969EZJMCaAEm2M9bhWR+e9LOnUhXVoC6+hrFqnNdIufXa6Xa/s
	Hn6loQlG6ZDar+V5sVZpbkY=
X-Google-Smtp-Source: AGRyM1s3AfvMh+6Az1vFDMlygz2ppZ+CXyD+YBPfhW1Rh2oGSjnY+p3TwbFP2r7HMBo+hBDNTVCFFA==
X-Received: by 2002:a63:ff4c:0:b0:412:b100:786b with SMTP id s12-20020a63ff4c000000b00412b100786bmr874215pgk.537.1658514391994;
        Fri, 22 Jul 2022 11:26:31 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d01c:7038:fdc9:680c:9dce:420d])
        by smtp.googlemail.com with ESMTPSA id n8-20020a170902e54800b0016d21c1b265sm2173044plf.275.2022.07.22.11.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 11:26:31 -0700 (PDT)
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
Subject: [PATCH] media: staging: media: zoran: Deleted dead code
Date: Fri, 22 Jul 2022 23:56:17 +0530
Message-Id: <20220722182622.23719-1-abhijeet.srivastava2308@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Deleted part of code in block comment

Signed-off-by: Abhijeet Srivastava <abhijeet.srivastava2308@gmail.com>
---
 drivers/staging/media/zoran/zoran_driver.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
index b408c1d4e0a7..836edf623571 100644
--- a/drivers/staging/media/zoran/zoran_driver.c
+++ b/drivers/staging/media/zoran/zoran_driver.c
@@ -746,11 +746,6 @@ static const struct v4l2_ioctl_ops zoran_ioctl_ops = {
 	.vidioc_enum_input		    = zoran_enum_input,
 	.vidioc_g_input			    = zoran_g_input,
 	.vidioc_s_input			    = zoran_s_input,
-
-/*	.vidioc_enum_output		    = zoran_enum_output,
- *	.vidioc_g_output		    = zoran_g_output,
- *	.vidioc_s_output		    = zoran_s_output,
- */
 	.vidioc_g_std			    = zoran_g_std,
 	.vidioc_s_std			    = zoran_s_std,
 	.vidioc_create_bufs		    = vb2_ioctl_create_bufs,
@@ -762,13 +757,9 @@ static const struct v4l2_ioctl_ops zoran_ioctl_ops = {
 	.vidioc_streamon		    = vb2_ioctl_streamon,
 	.vidioc_streamoff		    = vb2_ioctl_streamoff,
 	.vidioc_enum_fmt_vid_cap	    = zoran_enum_fmt_vid_cap,
-/*	.vidioc_enum_fmt_vid_out	    = zoran_enum_fmt_vid_out,*/
 	.vidioc_g_fmt_vid_cap		    = zoran_g_fmt_vid_cap,
-/*	.vidioc_g_fmt_vid_out               = zoran_g_fmt_vid_out,*/
 	.vidioc_s_fmt_vid_cap		    = zoran_s_fmt_vid_cap,
-/*	.vidioc_s_fmt_vid_out               = zoran_s_fmt_vid_out,*/
 	.vidioc_try_fmt_vid_cap		    = zoran_try_fmt_vid_cap,
-/*	.vidioc_try_fmt_vid_out		    = zoran_try_fmt_vid_out,*/
 	.vidioc_subscribe_event             = v4l2_ctrl_subscribe_event,
 	.vidioc_unsubscribe_event           = v4l2_event_unsubscribe,
 };
-- 
2.34.1

