Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3952F6D10
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 06:43:45 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id b8-20020a17090a5508b029014d0fbe9b64so724228pji.5
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 23:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dcsh/9mtL1pzvY0j0UgWraj+0Jc1yK6/3oHw6URUNrU=;
        b=QBn6DuPcKpAFSiiPz8CHPbeQFR3uxDi67HLT6IP0ZaA4rRw70m9ZPedbLDDFsIIuJ/
         XiBoVwZ1QnE9iLuCtyrqF26ViSuGt9klvyHhyTycWCGv37D7S9uhBRBnCNCEzAZdtwaI
         0EIErsmQgoHHQmJ7d3n0VmRqLBqfZdnX1Qrv7TVN8YrdXo6UY3hzGdNA+2iVaKHSXz1b
         xio2CDrw9fjyQd2GOlO+9vsRGtkHhqJeA6GE4EtqWdWRvIZpzF9a+bcETyPN4UbguFwJ
         UaciV/dtjMNWSEc5L3MXvRp9gYen8ezLQxsPW0GnO3zzqUn0MVRKPB9NYg/8t5VAhdG4
         iCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dcsh/9mtL1pzvY0j0UgWraj+0Jc1yK6/3oHw6URUNrU=;
        b=OWzbF5VfxQM7hFOjJjwtDt7v0URqXvJT+qHVRKRLLPSrSu5b+8EEqMOzv3Z8SKlAmg
         1P1lFzazJT031AGnOCxT5fk9Dz8ijD9yUToEKpwRuL/NM+QAS0WGJ/pCRh7XMTz7pC+Q
         Q8fjzttUDYP1KUh7/VsfPf8M/tjWPDwSkD82js5/yStAZF8xirv4+hSO2PPNKaLcV1zw
         UfNMo0ac0VOc+e+Wl+aLtZ4G0FXVNw0waT+Qi//ZtILhui6pXr3fN201ip+rlbhyqEQo
         VqO/M7oS/ODyO1/LBDEQwqpvE1VyccYnUEZcljTYEmgg5w9l25KXiPohbQ5xEHbfaFce
         MQJg==
X-Gm-Message-State: AOAM530T5PPc8ddGJa7C1EBzEMYsHdoQ+gmuW4iS1rRenWyjfOGLhIR1
	LW4uE4RYlj8/q5trX6v5oSoI9iXgx6e7hA==
X-Google-Smtp-Source: ABdhPJz4kTyvwNyBJpVANobnxmZ7JplrEIqkyXbpSP1VqONXNpWK96Lr+/aYnoaHKh4cQBHK1hcQUQ==
X-Received: by 2002:a17:90a:3be4:: with SMTP id e91mr1808156pjc.113.1617777824783;
        Tue, 06 Apr 2021 23:43:44 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id z23sm20509608pgn.88.2021.04.06.23.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 23:43:44 -0700 (PDT)
Date: Tue, 6 Apr 2021 23:43:42 -0700
From: Pavle Rohalj <pavle.rohalj@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 27/49] staging: sm750fb: Rename function params to snake
 case in sm750_accel.h
Message-ID: <5460f1029f91f3a7f0ca98fa787eb9caa57eb83b.1617776878.git.pavle.rohalj@gmail.com>
References: <cover.1617776878.git.pavle.rohalj@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617776878.git.pavle.rohalj@gmail.com>

Fix "Avoid CamelCase" checkpatch.pl checks for function parameters
in sm750_accel.h, in particular for functions sm750_hw_fillrect,
sm750_hw_copyarea and sm750_hw_imageblit.

Signed-off-by: Pavle Rohalj <pavle.rohalj@gmail.com>
---
 drivers/staging/sm750fb/sm750_accel.h | 42 +++++++++++++--------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.h b/drivers/staging/sm750fb/sm750_accel.h
index 2c79cb730a0a..8a5d1fe5075a 100644
--- a/drivers/staging/sm750fb/sm750_accel.h
+++ b/drivers/staging/sm750fb/sm750_accel.h
@@ -190,19 +190,19 @@ void sm750_hw_set2dformat(struct lynx_accel *accel, int fmt);
 void sm750_hw_de_init(struct lynx_accel *accel);
 
 int sm750_hw_fillrect(struct lynx_accel *accel,
-		      u32 base, u32 pitch, u32 Bpp,
+		      u32 base, u32 pitch, u32 bpp,
 		      u32 x, u32 y, u32 width, u32 height,
 		      u32 color, u32 rop);
 
 /**
  * sm750_hm_copyarea
- * @sBase: Address of source: offset in frame buffer
- * @sPitch: Pitch value of source surface in BYTE
+ * @s_base: Address of source: offset in frame buffer
+ * @s_pitch: Pitch value of source surface in BYTE
  * @sx: Starting x coordinate of source surface
  * @sy: Starting y coordinate of source surface
- * @dBase: Address of destination: offset in frame buffer
- * @dPitch: Pitch value of destination surface in BYTE
- * @Bpp: Color depth of destination surface
+ * @d_base: Address of destination: offset in frame buffer
+ * @d_pitch: Pitch value of destination surface in BYTE
+ * @bpp: Color depth of destination surface
  * @dx: Starting x coordinate of destination surface
  * @dy: Starting y coordinate of destination surface
  * @width: width of rectangle in pixel value
@@ -210,34 +210,34 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
  * @rop2: ROP value
  */
 int sm750_hw_copyarea(struct lynx_accel *accel,
-		      unsigned int sBase, unsigned int sPitch,
+		      unsigned int s_base, unsigned int s_pitch,
 		      unsigned int sx, unsigned int sy,
-		      unsigned int dBase, unsigned int dPitch,
-		      unsigned int Bpp, unsigned int dx, unsigned int dy,
+		      unsigned int d_base, unsigned int d_pitch,
+		      unsigned int bpp, unsigned int dx, unsigned int dy,
 		      unsigned int width, unsigned int height,
 		      unsigned int rop2);
 
 /**
  * sm750_hw_imageblit
- * @pSrcbuf: pointer to start of source buffer in system memory
- * @srcDelta: Pitch value (in bytes) of the source buffer, +ive means top down
+ * @src_buf: pointer to start of source buffer in system memory
+ * @src_delta: Pitch value (in bytes) of the source buffer, +ive means top down
  *>-----      and -ive mean button up
- * @startBit: Mono data can start at any bit in a byte, this value should be
+ * @start_bit: Mono data can start at any bit in a byte, this value should be
  *>-----      0 to 7
- * @dBase: Address of destination: offset in frame buffer
- * @dPitch: Pitch value of destination surface in BYTE
- * @bytePerPixel: Color depth of destination surface
+ * @d_base: Address of destination: offset in frame buffer
+ * @d_pitch: Pitch value of destination surface in BYTE
+ * @byte_per_pixel: Color depth of destination surface
  * @dx: Starting x coordinate of destination surface
  * @dy: Starting y coordinate of destination surface
  * @width: width of rectangle in pixel value
  * @height: height of rectangle in pixel value
- * @fColor: Foreground color (corresponding to a 1 in the monochrome data
- * @bColor: Background color (corresponding to a 0 in the monochrome data
+ * @f_color: Foreground color (corresponding to a 1 in the monochrome data
+ * @b_color: Background color (corresponding to a 0 in the monochrome data
  * @rop2: ROP value
  */
-int sm750_hw_imageblit(struct lynx_accel *accel, const char *pSrcbuf,
-		       u32 srcDelta, u32 startBit, u32 dBase, u32 dPitch,
-		       u32 bytePerPixel, u32 dx, u32 dy, u32 width,
-		       u32 height, u32 fColor, u32 bColor, u32 rop2);
+int sm750_hw_imageblit(struct lynx_accel *accel, const char *src_buf,
+		       u32 src_delta, u32 start_bit, u32 d_base, u32 d_pitch,
+		       u32 byte_per_pixel, u32 dx, u32 dy, u32 width,
+		       u32 height, u32 f_color, u32 b_color, u32 rop2);
 
 #endif
-- 
2.30.2

