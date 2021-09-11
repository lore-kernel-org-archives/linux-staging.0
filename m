Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA66B3FD2
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 13:27:19 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id w29so6095557wra.8
        for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 06:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VGq1DOZhi2DNROmAcO611vpT6ynI2fgaBofSq8o3i7w=;
        b=M8mvdCRCLQmauFY9inBdiw4Mo6qS/cHpA33/4IMipeYI5aP5KKRtbAVV+cjxC5An43
         FDr1TMO4Y6gkzblsoCmS6Vsq2Zwqfwxor8c844ZSCRnhSTy5fz87wbyucCbYNRarcjrn
         QOzm47vgi0HdcOB0+/SPST9r+mnx4IKSAqbIAQYsRsYiHs7EX7ES1UWpKOm2nf0R7ngg
         apDtE5Ir9xug2buVAF9eIIvDoZe/3+7nLU9k1mr9/pkKO72yCx6wof6PhfqeFobc4G+I
         +QFy3ggDh2b+XgKDxQQcmx/KdUD6DE3KpCazvNZjWqGn548IiKfebgtCmj/fXYngFcQ8
         3PHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VGq1DOZhi2DNROmAcO611vpT6ynI2fgaBofSq8o3i7w=;
        b=DiZDws5THYzVdosvdus1e1uQB0KkHL5b0HiznB4/gK50fo1mE5y1mlrFrj7XcQkfuY
         S6hUhhRtLlW690eck1ALdRNoMt0MG8NKuBNokPDB1ACErIHdie85fFo8/vtuLpCqvZcI
         fAyK/4hJleEr24cajQeVy13qOH2DJRddx54d3O/zF3wgbwZIIYqvQQOaRm+6GVZzC+zL
         m6wSifnpoP0rFPtcwqAM5t3V7lDvQxUSCWcui1KgnStS6wFaiDObdvc6DkOSk//92FX3
         9Xo3/4MoOeYMr8h/d+PlnDIDfdQu7DExIntFCsIRuuPYNfYQwrayLEAah9isZcijv2sy
         2i3w==
X-Gm-Message-State: AOAM531ttgdVdNP88sMOOGFNIEBvRU1s69GPADmF0bfauBSu3xildhhq
	qUYIdDLgYBYdQtt9JdxLgoc=
X-Google-Smtp-Source: ABdhPJycwvGBSYQm+HxMTd16arWN4J0UoxfS06jcnxyPO9uH1582OYskiSixFQcDZtW4Ewizb5XmWA==
X-Received: by 2002:a05:6000:1b8d:: with SMTP id r13mr3230772wru.230.1631366838270;
        Sat, 11 Sep 2021 06:27:18 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id 48sm1770253wrc.14.2021.09.11.06.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 06:27:17 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 15/18] staging: r8188eu: remove unused ODM_AllocateMemory()
Date: Sat, 11 Sep 2021 15:26:32 +0200
Message-Id: <20210911132635.30369-16-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210911132635.30369-1-straube.linux@gmail.com>
References: <20210911132635.30369-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function ODM_AllocateMemory() is unused, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm_interface.c     | 5 -----
 drivers/staging/r8188eu/include/odm_interface.h | 2 --
 2 files changed, 7 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm_interface.c b/drivers/staging/r8188eu/hal/odm_interface.c
index bbbb11b6cc58..4e56ebf30e76 100644
--- a/drivers/staging/r8188eu/hal/odm_interface.c
+++ b/drivers/staging/r8188eu/hal/odm_interface.c
@@ -71,11 +71,6 @@ u32 ODM_GetRFReg(struct odm_dm_struct *pDM_Odm, enum rf_radio_path	eRFPath, u32
 }
 
 /*  ODM Memory relative API. */
-void ODM_AllocateMemory(struct odm_dm_struct *pDM_Odm, void **pPtr, u32 length)
-{
-	*pPtr = vzalloc(length);
-}
-
 s32 ODM_CompareMemory(struct odm_dm_struct *pDM_Odm, void *pBuf1, void *pBuf2, u32 length)
 {
 	return !memcmp(pBuf1, pBuf2, length);
diff --git a/drivers/staging/r8188eu/include/odm_interface.h b/drivers/staging/r8188eu/include/odm_interface.h
index a50b874fc2d1..2b103aecd859 100644
--- a/drivers/staging/r8188eu/include/odm_interface.h
+++ b/drivers/staging/r8188eu/include/odm_interface.h
@@ -87,8 +87,6 @@ u32 ODM_GetRFReg(struct odm_dm_struct *pDM_Odm, enum rf_radio_path eRFPath,
 		 u32 RegAddr, u32 BitMask);
 
 /*  Memory Relative Function. */
-void ODM_AllocateMemory(struct odm_dm_struct *pDM_Odm, void **pPtr, u32 length);
-
 s32 ODM_CompareMemory(struct odm_dm_struct *pDM_Odm, void *pBuf1, void *pBuf2,
 		      u32 length);
 
-- 
2.33.0

