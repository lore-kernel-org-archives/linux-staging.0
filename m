Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3446030E83E
	for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 04:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768192500; cv=none; b=HdZAailpP/dxPfqBCQd/2U7Afpb6x8Rnqzw5xloeptQmm4/hSDOGPBxahLLGHQo095eD4PdGMYP1WxmysAA81x/GzkpqNHH5Pfzs4u6XbGWUBoEhhfnOScPvpUfUqwe1hfcFaiSR0xHWoBCI6if0BETjIJ0Zi61tIwB4uP0TkR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768192500; c=relaxed/simple;
	bh=c4nGlG7g5k0pyGglUIdv26GU5aT0EvFsas/+WmURApY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ttCU1jpMueCNXuHRuvmTTLrOB0tjv0PC6Bs8ZGtEDhOfUoJN0jOdM4i4JD7LSt7LXZbzTuPeraPsIZBcZ9lONXiVcSwqb6oYZZkmK8MZyBEfdK4ylobcGHSzQODlJse9kwZczzIjgQTRx4mIWFzRHUeKw6bLGH7pVw1ukaEbNyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hlmq20oV; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hlmq20oV"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-81f223c70d8so1372868b3a.1
        for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 20:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768192487; x=1768797287; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yrGvw2leaOau8CaO83+b40kh4e9meJ6JDbfsmfJGOgc=;
        b=Hlmq20oV+NrwWcegpBm+c1G5Kpm5xTZPMOHaVl/241wtOgqXN3cOtfRKyXG5R/91x/
         Qwn8hLqS0Nz2Ch3w0OypmGamVG2HcJwQRTwN/R2bgL4md5kaMdIVb87ndwFkydAl2VUd
         W63j1nEFM2d9ImIbY9783088gfwcSMsjxnV5r7p6cR85nrltMiDysRWd/n55R4AhaN0L
         1OBKW4m9OZy7D4FjRg93UjBRted7TSs8T1+RJowBhDhdIiUH8Yx3u7T+fQ5NtWFn/Sbt
         0WTI0f8KlgGxtZ6zlaSu0NMsU2L1/9fdRxCFAm9eGcQky42U7LgAl6FzrftFarwThoCT
         +8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768192487; x=1768797287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yrGvw2leaOau8CaO83+b40kh4e9meJ6JDbfsmfJGOgc=;
        b=S9XLVBXsqu7LC0+B3FcZfkhz2Q40VcNz1utywdARIDzfBoVO25mdElcwaOVO/fTo7r
         4zngfpnxFU1zGoTsKS4fB4GWN0r+v0v2BEmpCm8YPUPyv7fVDtIDkqhEZLLtMl56tILB
         7kkORak9VVneSvkX5Ro6HN9bcUn+pK4f79XqGUtNpa8mdK/kMWjINW/H6vpPWUt0ycBs
         PLdNteXRBh/MMKh9LRILYqCS6afqfCSLBUhZI41H/xqAZaxssn47AIYc5/5BBJlxT+dJ
         Oi8elS3HDPVfZy2lLfraJ0n/K3iRr3XB7a+eNNF+GWI+hm3Dwkv6Wx5TZvab1kkgOoyS
         7s4w==
X-Forwarded-Encrypted: i=1; AJvYcCXrWPL/dJ4N+mV9IXcj5vRJCekIrKzhM2sg6lGE0M1nTvczlC9wiKhJ4W/5tlE623mDLokriiIY/D9oY80a@lists.linux.dev
X-Gm-Message-State: AOJu0YxpG2Yx6/JymR5AnrPgQUQ9CK8Q+m7afk2LQzn5437I3WU2YpzV
	X3/PoIS0LZsBqan/K009JbfJVtblUUyEI3S1wnAgsSJ8EeaYsVgz9uYp
X-Gm-Gg: AY/fxX5Tf8Fst4uv8dJ/mpRzgry3MwLxsYLz3M/gUdpK324WBXdWqUECSsQeELydkUn
	jakXCgrRaJnk367JsBGaGEu5SJqKcYYy8nEiDx5o36P05IatOp4lX+rzFokQ9DjSN2TboF4dAay
	Fv3W/fP+SEG+sgQiL3121daarjYlQgv0S+LvKHWWjctQnG89RXIt/g6kbiDKvw78E9ISBoTTnLM
	Q1V68SPSyw54RhP56vycsKbGWyHYK/VyulV8sKI0gzxxNiTM6Wa3LDzr3zQZeEVg1yQA2Ogn5KY
	+I7qaZUkr4tzQ5qWqd4rJelXJJ6mvgmeBmJGeyqk+NTTBtEdpYxTFxCmKZuzNbaBA4szos97qDd
	06pdfP48fzzUhwB7xqnjjNdbDQtcky1yHvILZJrpIpx0n5gQkNZelGkF/GnHeyl0kZFs10o6+O9
	wO/8bpTonQduDdjxSmY6mC
X-Google-Smtp-Source: AGHT+IG2cMvtjAR0xqMsJcBMhFQVKQuquqJbEjDEpoSxhTzhFwM9Scpk3f9Hopp8RtbVlioxO83Jww==
X-Received: by 2002:a05:6a00:a116:b0:806:12ff:3877 with SMTP id d2e1a72fcca58-81b7d3584ffmr14877520b3a.4.1768192486680;
        Sun, 11 Jan 2026 20:34:46 -0800 (PST)
Received: from UbuntuDevVM.. ([103.171.99.41])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f3909d2cbsm5418655b3a.48.2026.01.11.20.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 20:34:46 -0800 (PST)
From: Nayana Mariyappa <nayana.mariyappa@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Nayana Mariyappa <nayana.mariyappa@gmail.com>
Subject: [PATCH v2 1/4] staging: rtl8723bs: fix block comment style
Date: Mon, 12 Jan 2026 04:34:26 +0000
Message-ID: <20260112043429.42615-2-nayana.mariyappa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112043429.42615-1-nayana.mariyappa@gmail.com>
References: <20260112043429.42615-1-nayana.mariyappa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed multi-line block comments in osdep_service.c to follow kernel
coding style.
No functional change.

Signed-off-by: Nayana Mariyappa <nayana.mariyappa@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/osdep_service.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index a00f9f0c85c5..8f6dd3560303 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -6,10 +6,10 @@
  ******************************************************************************/
 #include <drv_types.h>
 
-/*
-* Translate the OS dependent @param error_code to OS independent RTW_STATUS_CODE
-* @return: one of RTW_STATUS_CODE
-*/
+/**
+ * Translate the OS dependent @param error_code to OS independent RTW_STATUS_CODE
+ * @return: one of RTW_STATUS_CODE
+ */
 inline int RTW_STATUS_CODE(int error_code)
 {
 	if (error_code >= 0)
-- 
2.43.0

