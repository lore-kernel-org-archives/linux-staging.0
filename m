Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB62934B1A8
	for <linux-staging@lists.linux.dev>; Tue, 23 Dec 2025 19:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766517859; cv=none; b=MVT+I254xDVVEl+AKs1adZcbzgKs7ELdTLDmhk220W95+wRD0cc5/czgLp767OJdQU67ST9ZpBkSIa16Zg53aFnAlXYjOppUSp94gGegG2Ork4Nr6qsv/IQYNgWBZgKNOmNeC78RbZahsuGYtxBi2c8JzBoMHuXZ3NvfuTVQTzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766517859; c=relaxed/simple;
	bh=Svz13no7Ji+bCzqqG+VAYqznHhuJawGZwtywOvf/dOI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DQhXlLoY7DHozBxxHqlWPPyrY3BiPKcjrYC7yTcHkUJ3qOGbdt3xhl0P6Cdz2PW6fPTOqnl0ffppgbtFXBRn/SIgYjQpqlQ3jWtxavzyOQEMqM5QiolBfWjfUvJQko1yo7vQdnjVJ2zDedht2jrfJsEY3FXAALRlQpWbsPyS00Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MLJomRxD; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MLJomRxD"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7b6dd81e2d4so5535400b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 23 Dec 2025 11:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766517857; x=1767122657; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J355jvWq3/NjdApMIDzGb+6LceMfHS1TaMoQRJB+idQ=;
        b=MLJomRxD7fdzGO5iq7DLDJBApgR40gWFBIJARwUjeinUlNlivYCgAy7pH5tL/vQ1x2
         CtMmM/gfFwH4g4FolTMb557Y7w26UuD9YSb9hLcKzsjwx1/tOcSFAvS12MonEfxr/KiU
         JlGu/g7sm5+J8LJ/slaNmWs8gjkpRlD21xM+LhPOSBgJ1k6Nv0iPZ9J7JJNDkER+KeTx
         8hTj/Rh4FDP0Y6Y8zY5lQQ7nKr1sIfsK6F9FGxhBJQS09RoUJv7qLOHMlZJIswiuVBU/
         tdaU59KAf/f4WbzJFeec/3v47IaOQon2t2HW7qPapbE0zzFwYpe4sjynUVNQmjpaXk5+
         HRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766517857; x=1767122657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J355jvWq3/NjdApMIDzGb+6LceMfHS1TaMoQRJB+idQ=;
        b=QvKWoptB+OZ0e3s0emoZMvyfqZmOouQSy7/WCMZAe7J5Frw6g3Rnxn50x2ktOLQTuX
         WnH7IuDVh1sW67yZHmv40rt6WY0RiUI5EgMk7c/GSFRAlab4u9T6LJawWuPB8ky2GDDr
         7Zzv9Nu8RvrCP73orkwpZMLKoNrK/CPJRBl+vlCImXYPfCXX92h0S1BOo300hrmY1jYf
         gSFsQp7Zkp7AMs+wax1yJWQ5zvrIy8W4c/usJjyUEaYr3TCTaZGwE5iDsnaEbLuoblZI
         rNXc21QgH2bUybsUOMSXrWaObN6Xuj8jSd0L00hwUV1pU4xJeXqDvx5wOPm1/G9L8ukc
         7TJQ==
X-Gm-Message-State: AOJu0YyURclDpvpCvU0UXM6BWhk2u21uA4bzP/Su1inmM2rcYHYrmgr8
	KFS7Zel1Iwf3a+whUroPz8ov2tznL+9T0ywWTwIehYvH7gzgoOZvnc7GS6Guxg==
X-Gm-Gg: AY/fxX63iYsXMjMvckdfiXLl0KrxRSrWp1NjDq6F4kMpohoqXi5y0LPlYRrsFPT0qxz
	6UspXLbjo4yYR5UziExUhejxkKlRpJbzL5mT1bohH//71MeeslmKnJdwYpIzyjxMDftmh1Dyrt+
	X8HHqCrFUbOpz5X5yGY9ZoGnNnRoqqwXMa+qDpjJUw8+Kqr+W93nU4JPnNg9cjlKaBj+QK/unKF
	Aiy5dYvUUdWfV/cbdm6Rj+NywFHNFWs47pA9RACtqsDqTvZ3R1JL2kzFfRCzvOduxAAnih/79vN
	X/5ZMHntM5+njL9UhNpO1Yci8oAOAf7hgqmCltpuyGAWNNuKwq6FCuvod7ZLuOcA5Sam3hO4Xlp
	RTudhGmdMz3n0HkyX5BO7dfaWUFm5uWJdh10/YV6zCz6M9NA1ZIoGGeeUqFXbJmbGkLQ1LLvRUM
	hmW4Xko9Hc9T2h4uiWBW8MA042+wn/dKW+oaVJoUSrjtDBrTyI9hMEWVs=
X-Google-Smtp-Source: AGHT+IEtKTnVfpDxV0s2dltrBPrV8taJGOWI57HInnkAFZ3bEn+679+iNLgjIfqw/JI+WE5dDnlz0Q==
X-Received: by 2002:a05:6a00:6caa:b0:7e8:4433:8fb2 with SMTP id d2e1a72fcca58-7ff6667ce4bmr14247139b3a.58.1766517856743;
        Tue, 23 Dec 2025 11:24:16 -0800 (PST)
Received: from localhost.localdomain ([2409:40c2:1052:c28c:d56c:4c53:fd22:65f7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e197983sm14508437b3a.33.2025.12.23.11.24.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 23 Dec 2025 11:24:16 -0800 (PST)
From: Tejas Chaudhari <tejaschaudhari038@gmail.com>
To: linux-staging@lists.linux.dev
Cc: linux-fbdev@vger.kernel.org,
	sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	Tejas Chaudhari <tejaschaudhari038@gmail.com>
Subject: [PATCH] staging: sm750fb: rename fixId to fix_id
Date: Wed, 24 Dec 2025 00:54:07 +0530
Message-Id: <20251223192407.15817-1-tejaschaudhari038@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the local fixId array to fix_id to follow
kernel naming conventions and fix a checkpatch
CamelCase warning.

No functional changes.

Signed-off-by: Tejas Chaudhari <tejaschaudhari038@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 15b5de33b..7afb58561 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -740,7 +740,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 		"kernel HELPERS prepared vesa_modes",
 	};
 
-	static const char *fixId[2] = {
+	static const char *fix_id[2] = {
 		"sm750_fb1", "sm750_fb2",
 	};
 
@@ -862,7 +862,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	fix->ywrapstep = crtc->ywrapstep;
 	fix->accel = FB_ACCEL_SMI;
 
-	strscpy(fix->id, fixId[index], sizeof(fix->id));
+	strscpy(fix->id, fix_id[index], sizeof(fix->id));
 
 	fix->smem_start = crtc->o_screen + sm750_dev->vidmem_start;
 	pr_info("fix->smem_start = %lx\n", fix->smem_start);
-- 
2.39.5 (Apple Git-154)

