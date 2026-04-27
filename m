Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A23133B97F
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 06:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777269877; cv=none; b=RiMSy6KlpGYI4XKOz7AiV++s060OlX7dbDGUPv97IxMHJ2CFf9nQ8BwkEYdqpzOCIKwSKqaDPHSVN9JDnzUY4SiAmYH/lghOme2rRJe4RwEvdNcYlmIoPbdMzTHhrpPP8lhoIYiipa1mVKAlHIvHItYvnIJddtSkOfHVbzilW9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777269877; c=relaxed/simple;
	bh=fNr3b7fw70sqLgouWfcwXGCaFZJWVHHM2iEuT9RpR2w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WQsp26liz2sBqrmJbY1Uew1Ak6aIPuQR84KxYGXHNQB6fbGlAVyHIPWIINFQaEonQEy11de8PqN7ovigaG0bZZCzLlkmHk8ug+i8opHQud12ghv6I8S+pxmfO3KFCsZbtHjn1aP1Xhi2lVVUeHUhIpgC44eRWyrhnZTK5SZ3hH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gi/dTsMp; arc=none smtp.client-ip=74.125.82.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gi/dTsMp"
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-12dbd0f7ecaso3739418c88.0
        for <linux-staging@lists.linux.dev>; Sun, 26 Apr 2026 23:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777269876; x=1777874676; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uFigvvanWv8vhl/O/OuGrd11IAkg2hPEA62yM/WOpfo=;
        b=Gi/dTsMpOMf9ru6SEIxPoHcgGDsEp+71Ma6BRsoYzY60ZTrgjXFMA1/xv5/WjxEoXe
         crvPF7h/3jVAfF8YTnI6QOIo3qgBMMJtIiS3mwtUZK2lfh80iUvwxrG4Qm8zcpGot7nO
         QzuZHxRXJcXwx3rzYoGM3kw2ArL9l6FMVq7C2L7jrIQDBUKqTuOnLho9bSpS4Lqoroea
         DAw95mIjT/9SSQfIRGNN+7Ne611qZuO8au8syrpmsplL6IpLPvGB/6woZSvvj9wet0kq
         lSNUY7M8NUbNrisks1riqQroP4K/ofQszuwdTzq1Kd6QcgF5bkLdtOwrEtzRrPwXVVTh
         tDow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777269876; x=1777874676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFigvvanWv8vhl/O/OuGrd11IAkg2hPEA62yM/WOpfo=;
        b=j+JgF4H8lPXrV+/IyYdPBulZDWS3IPawFP9GOtNQQw839LTQbpc/exLGBkF/QLRC07
         5RqDiQikYHpsrSqWukgkTQ8XaOxncnvdAMvqfiZDh1+35kyhhHS+lX96phYtVOhoPRZM
         6fkmGIxZp5P6rFBY49J/KqMYmywhVdkAp9srGVyV7ooRMEkj0li9sffwrn0EhdUsgr4V
         fh5PxEKflKvUptJVRiwFJVtUkCIpAQrCYgHtcd7217NaaUE7APOn7xgjwT7+6QhLG1yH
         DmG2IRPCMoIKq9yU6tsoqBqQ2SvYbiZOX/kSurTQzULY6Uv2LpKtNVkpONgTZa9tt+d2
         tsRg==
X-Forwarded-Encrypted: i=1; AFNElJ8sIj5zMO9ibCHLHrqnCqAJ/H8IHzKdY2nnBgtwUWhpfTAcFlwwlNYMUuBObczkt4hGx1JeeSKAeZwqx/AR@lists.linux.dev
X-Gm-Message-State: AOJu0YxWfJ4Hmv0NqbYFX4AxLYdzHVYJsGweAoz8LpnP1mImciMaapPh
	mmldhsiHzMEphFWzZksy6+KVQgN2T1fXUtedq42ta7kyaGmPuDSfPOC7
X-Gm-Gg: AeBDievJXZZQVQ3cjKimCE2PekQSlPLHVniV1oQdNps9EEinJ5qNEQ92IQEK8gTGL1v
	WVZSwO3am11HdRJZLS0qMVujHflIZ7WZwYT3oZ8xRo3+QXKqM4kq5Em9CbZHYLiMnMnM6GE8FMH
	pwraIWwEo57ed7N8yTVJ/97iHjgf5GnZPFkS7rcH3Y25y1hj29fMUVyWiMS8pvmly+rMVwwJpkb
	430OMg3miV/vCF6kWoWOeqRyNiBLCKOi5tX4na31ULFu6g3D32M1gyHp2i9d4k3CYvAyP2YJgL/
	+tG7aa5WfaYGQflXWR3G5UnjeX+8BAz8scEndH5KKVfOsvecNZTeGR0bdDwTivGeM8zmh02v3Ng
	K37OaNMG6gBTBSwiUIr6d3/y2eue1R7BsHZ7+BvEGvyTNho6WVQ1OqwSptKDcVQvTOFIKme5YLb
	cxaRfzL0upaX3BehnE+Pmwq430Ghtai3U320mFkNkSwSebfQMUDc9GWj7ZLhWHy60wmQ==
X-Received: by 2002:a05:7022:6728:b0:12b:ec67:3529 with SMTP id a92af1059eb24-12c73f781e0mr22886533c88.14.1777269875596;
        Sun, 26 Apr 2026 23:04:35 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12da8b8fbc4sm42459501c88.4.2026.04.26.23.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 23:04:35 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] staging: sm750fb: fix typo in comment
Date: Mon, 27 Apr 2026 06:04:20 +0000
Message-Id: <20260427060420.1076-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typo in a comment.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/sm750fb/sm750_accel.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index 0f94d859e91c..5c7bd1ef25df 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -93,8 +93,7 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
 
 	if (accel->de_wait() != 0) {
 		/*
-		 * int time wait and always busy,seems hardware
-		 * got something error
+		 * Timeout waiting and engine always busy, seems like a hardware issue
 		 */
 		pr_debug("De engine always busy\n");
 		return -1;
-- 
2.34.1

