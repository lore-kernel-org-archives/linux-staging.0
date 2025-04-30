Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC981E5B68
	for <linux-staging@lists.linux.dev>; Wed, 30 Apr 2025 05:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745992629; cv=none; b=C0CIeMDbUHTCpwz//cSQDwSAuA8EIvWy7uMh9YZTzuFlJgCaaSkoRpNK4pe4JeAHqGpEFgch50O97SopKD7xFaJxQ35cyGid0jZQgF4sUYJ6Sg7/JuK1MVl0e1cgUtzMXPhmrIOU/O7GLoH5zCH4SHxotkAaF54aWiFuxjQ7gtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745992629; c=relaxed/simple;
	bh=Q8oRezpxhjtbo/i8XWyshLvllP4XgKFGJRaq7eiuqLw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pIPwbsOe1UTEIUsW0zbYs8rQ0x56ffTN9VbF8Btn35rPbQX2yCmjQKb8Tnek1lByv41Zm0iyNWzP/cy7wfG27cd79BJfB6uxo9sceQwKM1BN+a4BJf8jYbHVmKUp3B7EB1SuCU7JeKo9A+5Vt2KIL9sWqCYz0/OS6ySSLwvyfW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OapPz5Zj; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OapPz5Zj"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-22c50beb0d5so12136525ad.3
        for <linux-staging@lists.linux.dev>; Tue, 29 Apr 2025 22:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745992627; x=1746597427; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gxqpYYyqRc/LkPwuRTFKMCZAvt0yI3GNo6xrU1qo1uo=;
        b=OapPz5Zj5cfzaHK4x0CWARoSSP1jih4B5OD6DnDbdQwPPCodoxK8KgDpeILLsJpItd
         4Vwqg0B0IWY9WcKV9Y8BTmquHG+9sGFr48g6gSwv4vi9jGr4gUFrqB/EMhafYFnCWPGU
         ThwnFYkT24APEKYMpPr9kkIXTnJWPQg4eywRThMTRjqaFSZQLgajuf4vxyz/a8wz79Sn
         /JqbSPswLk4AJQ6Rk9SQ/vVjSwL2p2M+OPL7b9r34Y5EQtOIh8rEIyLvzuciir9T461T
         p/Z/q2+SIS0wLJs0s5oyB+o1GKwEt6fDq5QS0mC6ViXffuuwQccPOu73KP3c0o+qnGn2
         2CYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745992627; x=1746597427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gxqpYYyqRc/LkPwuRTFKMCZAvt0yI3GNo6xrU1qo1uo=;
        b=DJCC+fMFb09UTOFKwwjO4/xxs7Ghr2XXl8Vc222DwskR69snOEtuAx3igV4v3wH6ky
         6tmyEIpjuz2wioWvDhqX7pc9fZBC2MHEKadNbMUx7gVoAiTRnUYDAIBfanjAyvHrCyA4
         m7Qw6kNpbynd3Ms/lMva+d6goi0x1lLObrZadoWTFwZIuKE53JtuqbNI8YDHlcQg8IyX
         4XXr+rAFmXUyEzAC2G5op6f1M5bb0YpXAkBM8LCQBHUYiT3OsXOrq83SEDTNKDeVLaeH
         Uf0d00Bqw3xX3pfo0aXoq/U7WACnQHlKijLrzsxaYEswQu4v4GXMwiEc2r1PGAAzOKKB
         MamQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvx+ZSycxS7Db470gjzBN7m/T5Oq2JMOxph5JRS0NNjFEkqSEQdnocDq7CLTEhfWo7IedFQhrvJSmrooVz@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6eK6l8vlHR0El758O7kT9yFf2bgROXrwvpqXp6gIOokaeFF2+
	eDUszSk/qJG30Yfbw8SIjZ8eNAbU0DKq1FN2ERjs9Pd9nLdwvGdD
X-Gm-Gg: ASbGnct0LWNRR+CfDtskh/t7Fy2d5JV1FpmwIyL9hvOIeFVajn9wukfXFEv31CjU7BJ
	lS59rtQ5EENCm3fxFSrwumrsJyL9DMCsUgrLNdOUN6rdv+FQfUyFQiu/9S1PAtjrjaE92LI6Uqr
	RjnuOH7xFtvQpLUCoP5PjNZxqlbpMEWDej4+xXFOgWTqGT0r5ZHsfsnMuteL22nkffcx6eI/Llx
	65f64itVBLq07FNEJxdgKBYn7DBg3pUHi66Xg9P+4gCDFz67dDBeEt0uxIdZsRtrKHTKMaVtgFf
	qDTzOOXO0av6BWWIj6SoGbOfHctbWlKJsPOChp2G1hUGavouipausbAk68LU0UcGuVMusZK3+FA
	3qwh9vK1rm3ZWU0STnQzlk7SNNRhtuBdfU5tM72J9Kt+kHg1+QHp9l6Y=
X-Google-Smtp-Source: AGHT+IHhIvAwTelVq5EzRdwK4Z+rMEnqowV4KnHaI0jJZJ22/eMzZEknVetHiEUoNLoXoVJhtkSEGQ==
X-Received: by 2002:a17:902:cecb:b0:22c:336f:cb5c with SMTP id d9443c01a7336-22df34ddc12mr11240725ad.6.1745992627314;
        Tue, 29 Apr 2025 22:57:07 -0700 (PDT)
Received: from kerneldev.localdomain (162-225-124-171.lightspeed.sntcca.sbcglobal.net. [162.225.124.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5221a82sm113383895ad.257.2025.04.29.22.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 22:57:06 -0700 (PDT)
From: Eric Florin <ericflorin.kernel@gmail.com>
To: teddy.wang@siliconmotion.com
Cc: sudipm.mukherjee@gmail.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Eric Florin <ericflorin.kernel@gmail.com>
Subject: [PATCH 4/5] staging: sm750fb: rename sm750_hw_cursor_setData
Date: Tue, 29 Apr 2025 22:55:38 -0700
Message-Id: <1ce4ddfd5ddf0443fd5a01ea5a4cb76a90e8cf30.1745982772.git.ericflorin.kernel@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1745982772.git.ericflorin.kernel@gmail.com>
References: <cover.1745982772.git.ericflorin.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename sm750_hw_cursor_setData to sm750_hw_cursor_set_data to conform
with kernel style guidelines as reported by checkpatch.pl

CHECK: Avoid CamelCase: <sm750_hw_cursor_setData>

Signed-off-by: Eric Florin <ericflorin.kernel@gmail.com>
---
 drivers/staging/sm750fb/sm750.c        | 6 ++----
 drivers/staging/sm750fb/sm750_cursor.c | 4 ++--
 drivers/staging/sm750fb/sm750_cursor.h | 4 ++--
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 483a30841c77..d74836fbdfa3 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -145,10 +145,8 @@ static int lynxfb_ops_cursor(struct fb_info *info, struct fb_cursor *fbcursor)
 	}
 
 	if (fbcursor->set & (FB_CUR_SETSHAPE | FB_CUR_SETIMAGE)) {
-		sm750_hw_cursor_setData(cursor,
-					fbcursor->rop,
-					fbcursor->image.data,
-					fbcursor->mask);
+		sm750_hw_cursor_set_data(cursor, fbcursor->rop, fbcursor->image.data,
+					 fbcursor->mask);
 	}
 
 	if (fbcursor->enable)
diff --git a/drivers/staging/sm750fb/sm750_cursor.c b/drivers/staging/sm750fb/sm750_cursor.c
index e80d6efe0ab1..3aa26ef00011 100644
--- a/drivers/staging/sm750fb/sm750_cursor.c
+++ b/drivers/staging/sm750fb/sm750_cursor.c
@@ -81,8 +81,8 @@ void sm750_hw_cursor_set_color(struct lynx_cursor *cursor, u32 fg, u32 bg)
 	poke32(HWC_COLOR_3, 0xffe0);
 }
 
-void sm750_hw_cursor_setData(struct lynx_cursor *cursor, u16 rop,
-			     const u8 *pcol, const u8 *pmsk)
+void sm750_hw_cursor_set_data(struct lynx_cursor *cursor, u16 rop,
+			      const u8 *pcol, const u8 *pmsk)
 {
 	int i, j, count, pitch, offset;
 	u8 color, mask, opr;
diff --git a/drivers/staging/sm750fb/sm750_cursor.h b/drivers/staging/sm750fb/sm750_cursor.h
index edfa6a8202cd..cbb896a35160 100644
--- a/drivers/staging/sm750fb/sm750_cursor.h
+++ b/drivers/staging/sm750fb/sm750_cursor.h
@@ -8,8 +8,8 @@ void sm750_hw_cursor_disable(struct lynx_cursor *cursor);
 void sm750_hw_cursor_set_size(struct lynx_cursor *cursor, int w, int h);
 void sm750_hw_cursor_set_pos(struct lynx_cursor *cursor, int x, int y);
 void sm750_hw_cursor_set_color(struct lynx_cursor *cursor, u32 fg, u32 bg);
-void sm750_hw_cursor_setData(struct lynx_cursor *cursor, u16 rop,
-			     const u8 *data, const u8 *mask);
+void sm750_hw_cursor_set_data(struct lynx_cursor *cursor, u16 rop,
+			      const u8 *data, const u8 *mask);
 void sm750_hw_cursor_setData2(struct lynx_cursor *cursor, u16 rop,
 			      const u8 *data, const u8 *mask);
 #endif
-- 
2.39.5

