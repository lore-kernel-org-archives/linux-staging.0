Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00391CA85;
	Tue, 19 Dec 2023 15:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HOjOJxEQ"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d3aa0321b5so23892245ad.2;
        Tue, 19 Dec 2023 07:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702998730; x=1703603530; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=baJt6G/4qPb8zglT/xyJaL6ZBHyfDB+Q6WEILSj7ppg=;
        b=HOjOJxEQchhGlksYcvmFBnGkSJiudie+qFV+D5Jn0Eoo1Zl3ABOJehbUBOIxskw9vx
         LDIHon8e8GFa2KmKTafDeQlvnXNbum6sWJkv/hVZKa9p2aZPveRh4ANXB/U9+arFg8RK
         ZQ1B71iW9n6dJ357hc82saN+C0Jp8a13/Z580JrgjAJtu5maUOmhQiJYD0+WHMPMdrZn
         VKFce8SlnESTTvEwvGjZeRu7Mfw+4s1m5jd+UlGXd1znVDmKEkFRfgIaK5Z82jxAsM21
         391+st+uIososkhYdmJVfofQJeH49+zsV3p2zDGZ5wA767ZMRdFt5cIfhfapzrEtnMq7
         c59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702998730; x=1703603530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=baJt6G/4qPb8zglT/xyJaL6ZBHyfDB+Q6WEILSj7ppg=;
        b=usfdsqHkrCakL3k0+gfsNhtQeIDV6otrTZkb7frx+7ncuDl5lOJGyK3R5fAsUTfdLY
         9C6mG22lLwXhcwntprECnB/NJJmkzQ88740Ar6iOOkaCGa396R3O77jvgZAIZ2o539cd
         U3u0Umrx3UmSvD63Fz8flEZc4DC+7kkhiH1rlJEXihUlNWZrZ1u/BI6VfpSPBoXENS4O
         tJvEFo9Vp6fdopct3AShmibPvh/llHV2Nkc1m+ZoJgiewBc35m2eaFqaoccE8QQcfBc8
         cPhSOJrUUwyLAZtGPBZU1Oyyru3DmgvOw3Vub+uBzeWl6uL/bTmwOEIxNDEivHM4WHhm
         kulA==
X-Gm-Message-State: AOJu0YwCh55SV2s2jWIlIufVQaenuURA19WsxCGaa2nvqS8Q4czW5SDF
	ahDBrvyyfS0LZqZPXvxDiKc=
X-Google-Smtp-Source: AGHT+IHfdZ6R0U+E2xX6yCPVgWUy5sQVy2si5HU/UPm//vCJHd77Xz2+r2mUt2rvJPYe/t6oROHAYQ==
X-Received: by 2002:a17:90a:578c:b0:285:cc9c:7406 with SMTP id g12-20020a17090a578c00b00285cc9c7406mr12346074pji.15.1702998730174;
        Tue, 19 Dec 2023 07:12:10 -0800 (PST)
Received: from yqt-VirtualBox ([223.166.246.87])
        by smtp.gmail.com with ESMTPSA id pl18-20020a17090b269200b0028ae9a419f0sm1713763pjb.44.2023.12.19.07.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 07:12:09 -0800 (PST)
From: Piro Yang <piroyangg@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Piro Yang <piroyangg@gmail.com>,
	linux-staging@lists.linux.dev,
	Linux Outreachy <outreachy@lists.linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3] staging:vme_user:Fix the issue of return the wrong error code
Date: Tue, 19 Dec 2023 23:12:02 +0800
Message-Id: <20231219151202.50368-1-piroyangg@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the issue of returning the -ENOSYS error code when an error occurs

The error code of -ENOSYS indicates Invalid system call number, but there is not system call error

Replace -ENOSYS error code by returning -EINVAL error code

Signed-off-by: Piro Yang <piroyangg@gmail.com>
---
 v3: change the description and format for the patch

 v2: split two different changes,
     only fix the issue of wrong error code
---
 drivers/staging/vme_user/vme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index 5c416c31ec57..9bc2d35405af 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -341,7 +341,7 @@ int vme_slave_set(struct vme_resource *resource, int enabled,
 
 	if (!bridge->slave_set) {
 		dev_err(bridge->parent, "Function not supported\n");
-		return -ENOSYS;
+		return -EINVAL;
 	}
 
 	if (!(((image->address_attr & aspace) == aspace) &&
-- 
2.25.1

