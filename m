Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454F9531AF8
	for <linux-staging@lists.linux.dev>; Tue, 22 Sep 2026 22:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790117604; cv=none; b=UeUaLjiAntmOzObxzRf/G38ktDryUVmsIITyquNbSOAxnEItkYnYCKTzy0CiYwF5Wa3hb/1El9zMb7nYonen3KLczWyj6C7mW6TS0CIH2MUQMFzR7dQRCzhuu8GjQ72Ch8o4q3Y5hQB2worO+Ay1Pzz+u4EbfjknWTscJB2vHXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790117604; c=relaxed/simple;
	bh=REPZkL1thDeVzHCspF0PHUx7OtBPKunpJ9Mv1lOEFOc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Kg8yO15cgzsWy6h3aIyu5Ra0RhDtvRNKSfdY3XouH/5kUaMrtUYdjdcPhvazuS53/3aaDU6Bglc0NW7DJJv+ePr5FdkVH60yTxDBKEdOJMoUinFZVxp6RQXn/Jx0adBPYFeU+ZvJN40JYkmKwKKl3tSNhs0a55U1J5ghRppfJks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jL10iWo3; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jL10iWo3"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466ccbd4773so139094fac.2
        for <linux-staging@lists.linux.dev>; Tue, 22 Sep 2026 15:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790117597; x=1790722397; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GdRvNmdqEASsHQpM6tI7sJS6Hgv3J1YdSsDajcpZjZY=;
        b=jL10iWo3Fs2ilr3neSx2ce5/Ax2jcE7wkx/mhVhA60McoWNhSy23cm8Mz4D6VD/r9+
         Ds6MaQavyLJMHP+ujG0BQCx9SXF8F+Ew4p8lr7q6JQ1TjVx/ri0HzT57NZK7XmRt6NnK
         A2Nkg5GpAB1UMH6CZTFJ3we9f7IwOLFqwwzjcunnCOefdat0mUxdnvdWxuGO1Fwsl3rU
         RPbhnLvPGe1vTudE9WH/Sow6bHfgwAFaVZJ5s2GbJopj49Y7A+JyUNfiQouhyJi1isvm
         UQ7HNWdXUjQyim20smx7//lpLSMt7/0/y3rL/N1tD4+ByvPytsKIXkkkntMMlrkrQs3w
         +Cfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790117597; x=1790722397;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GdRvNmdqEASsHQpM6tI7sJS6Hgv3J1YdSsDajcpZjZY=;
        b=wP0hQVKrd9GHAH3NiSRvRcmDZ+hzKP//rAFgGsI5QC/wjXqhqSQUWrGFgk4j93m85S
         mjqJJBSL49rBuBQTil88/f/aFyLnOqBLdYTT8HRj7lsr66uv1CrkmHW3q7uZIfHERarC
         OEpDL5EvWSQ8C1L/84CU67FIImRf3zuz2yb/OOw8tXWZ4+B7XIkz9va1pEfWDoeSFzFK
         XkhE0saBQriQTF3LLtdERvxTaeIkiNXNJHSimMP3hbtMUdOo0Y8DNbsCCpTAgGAqLMDO
         GN37SIaoeDY2Ca92kduxZtJBKC0cskrz+pt5SdIXVClR3QLRVCU2IoOk2N23Ks3ofXF5
         2DSA==
X-Forwarded-Encrypted: i=1; AKwUvBzbWl9weZkFRZv/pnSUj5Tb7kwvGe11dOTZqNiICEkQKUpaC5R3aa9IJk+5cqFQiBF90LIn3Gy/zo2nRIG6@lists.linux.dev
X-Gm-Message-State: AFuF++kqj6FNV1eIe1bjR+NLRxmJSNnL/ZydevW1PUudJCN7WNGLdT1c
	w8ph8jboTjue5NGNBVEgK7z6481rlmIhrfmzulNWqepD1ZJ5KthcznxYco8/aSpi
X-Gm-Gg: AYBFou3BCBzEqM1Hv/M9wJoKGDSWOc8dXw4rF8csJdhjbiiQUIS5pjktx++rtpkiHCS
	voZ/r9wFr0U6MdStQ3nXreJsxqm9XkxJSLb9FDL4V3H/xOtL6XBGGfa3ZiTzCSLzndudoWyCDIy
	lOG6uEKdjKVZ0r43zmOgG4ZV80Pjnks1ciKpsWYkoKhYBLgLbOhws/qvfymCgfFXsnouY5jdKjo
	Rf1ePt5MzTSg9/UJcP5wm+TMsrLY4Qnpc3ylTGUfZ9RPzTkfKBcuiSVI4TbPGbQ1g4s1BgpN/YD
	EPTxDDYFoiSf5cr/jX7+xD2JaNIjH0/LUgyVzFJEhZm8DRT28UZR60QVunGZG7LxjC8kl1DN+Si
	FGhx/e/6CaROIYjJwIALPo3r35i3nGzfyO5leZASz5zBoSbT6aMmvyZ7Q4zSicPkorn/B20QlPo
	7ZglEoOeD0lDjMyr1b/bRJtk6QK7zO7w+ElDrLxgNVri3gT0MGSA+fjEVlOLCbJFMRfrRrlJ+/J
	P9XV93Sx1hb/6/fmAfW77Zl
X-Received: by 2002:a05:6870:658d:b0:47d:7ee6:98da with SMTP id 586e51a60fabf-490891d5ca1mr994227fac.8.1790117597104;
        Tue, 22 Sep 2026 15:53:17 -0700 (PDT)
Received: from Arch ([201.110.78.131])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4908e66112asm869709fac.9.2026.09.22.15.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:53:16 -0700 (PDT)
From: =?UTF-8?q?I=C3=B1aki=20Sobera=20Sotomayor?= <inakisobera8@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?I=C3=B1aki=20Sobera=20Sotomayor?= <inakisobera8@gmail.com>
Subject: [PATCH] staging: sm750fb: mark g_fbmode as const
Date: Tue, 22 Sep 2026 16:55:01 -0600
Message-ID: <20260922225501.1792665-1-inakisobera8@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The g_fbmode array of pointers is only used during module initialization
to parse display options and is never modified. Marking both the pointers
and the array const allows the compiler to place it in .rodata, which
avoids accidental modifications and cleans up a checkpatch warning.

Signed-off-by: Iñaki Sobera Sotomayor <inakisobera8@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 8b93bfeb2..c3f391cdd 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -12,7 +12,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel __ro_after_init;
 static int g_nomtrr __ro_after_init;
-static const char *g_fbmode[] = {NULL, NULL};
+static const char * const g_fbmode[] = {NULL, NULL};
 static const char *g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview __ro_after_init;
-- 
2.55.0

