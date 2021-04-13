Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA1271
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 19:50:21 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id d10so12698331pgf.12
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 12:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xuSm7lduvaNieNDTtoqbp4d4Yshagez+v52iHy5UOJg=;
        b=eFmB2glJriyWzg8p5ap5w+1U0RcYO2BC0Ga/uhAsjZJRbnNPvA+vHTkBbKE6c75bgY
         oglGjlVL5y+n6GUS9sPMp+UWd939RbhrUcqzFyqvbz0vJx4WDi3AlBjSLwe+p+zOfwtB
         XCgDxmS4Yi9U2ABrBRhKX46x3AwnHUCoMQQthsYml0JLTRWRn4xbVpFqKMUwJdA5ru++
         zeYutmRaNc9P5d6dCVHwFfOLWgGGX2mei5uBc0tC99t5VEL3XjiPtnbdNaspn1MA6SeA
         djQF0iXzr+kpVAkFSo7/W7QK5IgrEZ/RShE4ueoHKqXzfNE7O62ZBZSdWuGZXvGosEo+
         +9Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xuSm7lduvaNieNDTtoqbp4d4Yshagez+v52iHy5UOJg=;
        b=BYQlNVHqRie/tpDLx6+9o3h43u5PSU4YGl1KnPX6d8BxMruhLXtnn308oMV+Pdnp/+
         E6WBz0nUdr1AQAlRlsfGNfXrB7E0D6Xoowrl9SJ8sCyHbYabUvUjnD3rdkJG+LNuG5QZ
         rpvvWc3G4N/dwBr33tud8FdObP3kriK5toh2MyDob/mcj4Vy5HcKL3frI7K6L4CrDIz8
         AOiulXP57OItczuLgbOCIRDB7APPMzsP9FYtz8+4Hb6GzaFT4VTS0zsI0ViwRDucru3p
         ushW5y/L/zA0iViQ/gvshZDnF4cTFJ5IAZAkwZ+9cQNLQdfvhm39Uct5bVuvRyZJ2vP+
         FoZw==
X-Gm-Message-State: AOAM533XcJY6+lebEnJwNuoZmnut3Sab7BLIZZlFYMLlFOcEwXGasb7A
	9C5FDDd561ste9jULbasDBA=
X-Google-Smtp-Source: ABdhPJzF9lSPapn0zS9nxnfdhmu58sA5DNzZCVas/BZDZGyPeyWS6jcTw5Od1DhnRnUzjRdVZYnvEA==
X-Received: by 2002:a63:1717:: with SMTP id x23mr33416121pgl.89.1618343421478;
        Tue, 13 Apr 2021 12:50:21 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id q13sm91536pgp.37.2021.04.13.12.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 12:50:21 -0700 (PDT)
Date: Wed, 14 Apr 2021 01:20:16 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in
Subject: [PATCH v4 1/2] staging: media: zoran: add spaces around '<<' operator
Message-ID: <b0c00d95962a836d16a9ab2a0ee66d99f548b15d.1618342050.git.mitaliborkar810@gmail.com>
References: <cover.1618342050.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618342050.git.mitaliborkar810@gmail.com>

Added spaces around '<<' operator to improve readability and meet linux
kernel coding style.
Reported by checkpatch

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---

Changes from v3:- No changes.
Changes from v2:- No changes.
Changes from v1:- No changes.

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

