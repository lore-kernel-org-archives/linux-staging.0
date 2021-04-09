Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8916D13
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 18:44:41 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id m11so4803105pfc.11
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 11:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=DEZQwU7+bR4zHFrlZFkoLnzYpfePzyjEKTTsW+6yMQA=;
        b=hWYEFRmZHHq7fkA7wJ3zyzQ33SlB4kEy087wSHjM57p38jnVLjOrnmCarDHQGPzJhU
         qEI5AEHfF+CiRpBP0a1E9vCGCIosskyPta844Nhlq0nP+jd3pnIR26+WXJOQW3JdsYX3
         cM7R0w33zniJwQjNlFXcUc0nYDz/wNrLUjzn0rPbOF/UxkLHE4jX2X6PtfCYlqVGLlma
         SggnWL6Tsbzx3lBbHcjPNlvCavJmCIaHivPMqOtGYLXpBdHB6A/x3As85EMMDBLjdY19
         lcAgzQd1PrCWtg1sopDtS0TLTCTMOamDypm7zi5tyhgZt4HbA3FJ7BAQJiNZjcLPcRIb
         sa9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=DEZQwU7+bR4zHFrlZFkoLnzYpfePzyjEKTTsW+6yMQA=;
        b=cTxVY42QOwU3qyN2hbHU0XiqnNggT2V1QIKqOxUwJ9V0NaH1N5yAy9zcWIVoWAiBxR
         0odUSc41HFECtzLLJi+S7C/osgU7++9z5GYfFi9a68OJiI/AbclEpQ2FaGp6wih7y03Q
         RT9AEN3a2ZIoyfyembrKXbiX4V/uL0R40L/6jSWkseGsJWtWvmRwL6deTErqDdUPM1+m
         rHubjeL4xbQaxTGpQ6Th9K9nZiOfLeOLXREY7mVtg7yWcnJyu1+pN5PLaHmOdrn4iILF
         BGL7tyoS1FaQbACCsb7fVcJW4ViSwT3z+bX/W/bqxovvHUQpA/phz2AJFVdS7IuS6Ap1
         HpVw==
X-Gm-Message-State: AOAM532xfqYRFK1w8g1AnjJDgCQ7e1xublyhuzi3rFaF0OXwbkFctzcP
	GIpDP3gledsjOZwW+jB6JvQ=
X-Google-Smtp-Source: ABdhPJzu4bCXLSjenPJXTSJRDLycnPDpmuiYYHlU7pIMsQcYVkOsPHaxzavx0ken+t5E3ME7fIMb+w==
X-Received: by 2002:aa7:950d:0:b029:244:4dd5:cd0a with SMTP id b13-20020aa7950d0000b02902444dd5cd0amr9255389pfp.59.1617993881518;
        Fri, 09 Apr 2021 11:44:41 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id l191sm3151921pfd.36.2021.04.09.11.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 11:44:41 -0700 (PDT)
Date: Sat, 10 Apr 2021 00:14:34 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in
Subject: [PATCH v2 1/2] media: zoran: add spaces around '<<'
Message-ID: <YHCgksbiLv0pFF2F@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

No changes required in this patch. 
In v1:- Added spaces around '<<' operator to improve readability and meet linux kernel coding
style

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---

Changes from v1:- No changes required in this patch. Below is the git
diff of v1.

 drivers/staging/media/zoran/zr36057.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/zoran/zr36057.h b/drivers/staging/media/zoran/zr36057.h
index 71b651add35a..a2a75fd9f535 100644
--- a/drivers/staging/media/zoran/zr36057.h
+++ b/drivers/staging/media/zoran/zr36057.h
@@ -30,13 +30,13 @@
 #define ZR36057_VFESPFR_HOR_DCM          14
 #define ZR36057_VFESPFR_VER_DCM          8
 #define ZR36057_VFESPFR_DISP_MODE        6
-#define ZR36057_VFESPFR_YUV422          (0<<3)
-#define ZR36057_VFESPFR_RGB888          (1<<3)
-#define ZR36057_VFESPFR_RGB565          (2<<3)
-#define ZR36057_VFESPFR_RGB555          (3<<3)
-#define ZR36057_VFESPFR_ERR_DIF          (1<<2)
-#define ZR36057_VFESPFR_PACK24          (1<<1)
-#define ZR36057_VFESPFR_LITTLE_ENDIAN    (1<<0)
+#define ZR36057_VFESPFR_YUV422          (0 << 3)
+#define ZR36057_VFESPFR_RGB888          (1 << 3)
+#define ZR36057_VFESPFR_RGB565          (2 << 3)
+#define ZR36057_VFESPFR_RGB555          (3 << 3)
+#define ZR36057_VFESPFR_ERR_DIF          (1 << 2)
+#define ZR36057_VFESPFR_PACK24          (1 << 1)
+#define ZR36057_VFESPFR_LITTLE_ENDIAN    (1 << 0)
 
 #define ZR36057_VDTR            0x00c	/* Video Display "Top" Register */
 
-- 
2.30.2

