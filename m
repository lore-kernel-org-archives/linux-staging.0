Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE402E413
	for <linux-staging@lists.linux.dev>; Sat,  2 May 2026 22:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777759296; cv=none; b=JvUq1o4VzxN32XsQorWFHcZWrIDs2kYJ7alonwK46WwhNtcYJQMqjDMAMkPHfwibi1NC4QnIe0dJXb3i23nEUklEPYusD6IQ4eoz5VvEeCIyQpTQsvemyfzEmQDQBpNoBwf3IhuE2J38vdFPHR6xA86J8s/iDGy1hdThauZx01s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777759296; c=relaxed/simple;
	bh=jTBDf1vVahRre8PjcNcS9z7eEaZo8bvzXxgb70wunhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CKDlmYXZta+PDVmXqZuIsykK7+tpeMMnTIqGW21uTv+/yIT/Cij/AXuKwTqqCs1ZdX5n2NsEyn18D2+qtGCtIR/jnlJwKHWNTKBVPTuHg5L4Kh10hH3DF2BxoXvPhR/dEvU7lAEJRDQ2fw3Ux6rrwpKAFd0L41xR6QZaKeoKTaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F8zV+2Gd; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F8zV+2Gd"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38e7b0903cdso29702281fa.3
        for <linux-staging@lists.linux.dev>; Sat, 02 May 2026 15:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777759294; x=1778364094; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7d/j/j+f5N5NxA0JIqoFFeYYkwVqtJFfaRQsTcnuwQ=;
        b=F8zV+2GdvHxAIkJH2M/KGsTCpTgkbiMpeQQu8/VVt67mlhblrYiryspRyE3BT96YiW
         W6tlRefXJriaMtPi6FT2vT+i25aX23qlW5lwEWgDJXcWMHDtVIGHl6gPC4UApAHTn/98
         z3kZaa1wg+YbbLQxycYaSSpuT49AYoCChYw9mtnLNxN8Mesb1AuaRTkmsSUu9FS6ZY8i
         8yNsbql7dNV5HNX+zO1mNdrUKGMPy/aoGhfSO5Hup/C8F164zH6GuLvf3uiIxX5n5xI/
         nqRoPpL1rUk6B0XAN1lJQELTZf8n1BSjPp+rX7+RARbnPjz4r6lwVXWQLF/FpWp5h437
         RH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777759294; x=1778364094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d7d/j/j+f5N5NxA0JIqoFFeYYkwVqtJFfaRQsTcnuwQ=;
        b=O/v55xAVUykZMLgzQFYF0F9tablUBgvMPjOEvCijSAxpk8HR5mReGhFwOSlP+EyWXX
         S5OQwqatTWRl4b4l+nHSL5Zk/0OhW44+ZgCGJ4KtY0xKahkkTDGie97gWxdrKSDp/oiq
         hVWMou5YcUoKW1pIpDpuKUNj5pu0SYCsG/FmshMz3LNJ9LI4FOogZzt5M//zvTr2SRm4
         yA0KJ8N8z8OhPtLPmWm0Wn1urUEzXamU9lvCZSK0yXbQayxcIb1sRFVqr/8w1Ao8rUk7
         B34WfxGQexW7i+W4ZjLBmQ9ONxxpd91+/07bKHsbkaCkgtHiSqHwg9SH1/qDWgWbA2Bi
         eCFw==
X-Gm-Message-State: AOJu0Yz510WflHs23WhjuG5i39ndSZOswA+VOx0UoULbtB/A4nKr+/ix
	DgLf/XWzfQNRnDCg275Ioh/S4KuKcROxsKELYWWwyuUonFXUbRJ3ftbpFuD6uw==
X-Gm-Gg: AeBDiesvV7OD/eVjUMF6NqekeS3UxrxJMr7QrsdzyuFknIgThBv/4PMi8Alakhgl5Vi
	u0Q2v5YsdmLysv3BiwwfABGubj6OxxHdwNmS2IwUqLigrmZciKbrUjuMrFVNcu1ihRII1jsSqN7
	r0W09MHeIBfMWQcy33bE0E0O/e1A4N/JHKuOYCWxwx9klWCesUXVSCBzbHcIKkj9dMBWwrDVXBa
	/LmM8WK22C73qIjuJI9h0XOWCqtRJlqRGNzGpQigVxctEqnBGYk/cl55lHp+j5Dg7ul+NVNekdn
	9p+Qcs7JXT5p3wXPkCdEp8miytlMqBqcFc4CFHALegfulSANFJFz4Fe1snX3Fg6hsgGZEOG10KO
	QtId5iCCKuO9noQBr8yxFDIYsM7qdsFRDRfAZrhZ+O2sHW1p3yFK8KDqRE+IcDmUjs/LzSxqfZz
	yoNJuqyyBrWxGLiAtSjgHp0YIj59fNMV56aWU=
X-Received: by 2002:a05:6512:33ca:b0:5a4:1902:3d17 with SMTP id 2adb3069b0e04-5a862ec32f2mr1190370e87.12.1777759293653;
        Sat, 02 May 2026 15:01:33 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230d6asm1539179e87.23.2026.05.02.15.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 15:01:33 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 03/10] staging: rtl8723bs: remove unused macros from include/HalVerDef.h
Date: Sun,  3 May 2026 00:55:42 +0300
Message-ID: <20260502220056.59815-4-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260502220056.59815-1-nikolayof23@gmail.com>
References: <20260502220056.59815-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove macros that are wrappers over the fields of 'struct hal_version'
and are never used in driver code.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/include/HalVerDef.h | 30 -------------------
 1 file changed, 30 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/HalVerDef.h b/drivers/staging/rtl8723bs/include/HalVerDef.h
index fbdfb690b73b..cb970b1d37d7 100644
--- a/drivers/staging/rtl8723bs/include/HalVerDef.h
+++ b/drivers/staging/rtl8723bs/include/HalVerDef.h
@@ -51,35 +51,5 @@ struct hal_version { /* tag_HAL_VERSION */
 
 /* hal_version			VersionID; */
 
-/*  Get element */
-#define GET_CVID_IC_TYPE(version)			((enum hal_ic_type_e)((version).ICType))
-#define GET_CVID_CHIP_TYPE(version) ((enum hal_chip_type_e)((version).chip_type))
-#define GET_CVID_MANUFACTUER(version)		((enum hal_vendor_e)((version).VendorType))
-#define GET_CVID_CUT_VERSION(version)		((enum hal_cut_version_e)((version).CUTVersion))
-#define GET_CVID_ROM_VERSION(version)		(((version).ROMVer) & ROM_VERSION_MASK)
-
-/*  */
-/* Common Macro. -- */
-/*  */
-/* hal_version VersionID */
-
-/* hal_chip_type_e */
-#define IS_TEST_CHIP(version)			((GET_CVID_CHIP_TYPE(version) == TEST_CHIP) ? true : false)
-#define IS_NORMAL_CHIP(version)			((GET_CVID_CHIP_TYPE(version) == NORMAL_CHIP) ? true : false)
-
-/* hal_cut_version_e */
-#define IS_A_CUT(version)				((GET_CVID_CUT_VERSION(version) == A_CUT_VERSION) ? true : false)
-#define IS_B_CUT(version)				((GET_CVID_CUT_VERSION(version) == B_CUT_VERSION) ? true : false)
-#define IS_C_CUT(version)				((GET_CVID_CUT_VERSION(version) == C_CUT_VERSION) ? true : false)
-#define IS_D_CUT(version)				((GET_CVID_CUT_VERSION(version) == D_CUT_VERSION) ? true : false)
-#define IS_E_CUT(version)				((GET_CVID_CUT_VERSION(version) == E_CUT_VERSION) ? true : false)
-#define IS_I_CUT(version)				((GET_CVID_CUT_VERSION(version) == I_CUT_VERSION) ? true : false)
-#define IS_J_CUT(version)				((GET_CVID_CUT_VERSION(version) == J_CUT_VERSION) ? true : false)
-#define IS_K_CUT(version)				((GET_CVID_CUT_VERSION(version) == K_CUT_VERSION) ? true : false)
-
-/* hal_vendor_e */
-#define IS_CHIP_VENDOR_TSMC(version)	((GET_CVID_MANUFACTUER(version) == CHIP_VENDOR_TSMC) ? true : false)
-#define IS_CHIP_VENDOR_UMC(version)	((GET_CVID_MANUFACTUER(version) == CHIP_VENDOR_UMC) ? true : false)
-#define IS_CHIP_VENDOR_SMIC(version)	((GET_CVID_MANUFACTUER(version) == CHIP_VENDOR_SMIC) ? true : false)
 
 #endif
-- 
2.54.0

