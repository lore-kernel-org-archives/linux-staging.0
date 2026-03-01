Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B4A221DB1
	for <linux-staging@lists.linux.dev>; Sun,  1 Mar 2026 21:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772401495; cv=none; b=sh43ZpndVLT6nPEC/OSUWcTKFDco5tK2Krv8M1bT2ijvA1N1hIbR7hDLmF8T9NfLcNTGWoQTxs1TRJGpE2fxD3cbPo3hwMrIq+ZW3nrJCbulQIgK5qiRQHQitUdsNhr2em3PSSk4gHCwak1Y4FoTOpWhy4hLH6295VyO2En3ejw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772401495; c=relaxed/simple;
	bh=/bLY/OiBTT23uQpdBtKHmiRAv6u3vqIvvDp1+ObZ8PE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oY0BsEn2MofzXpQ1N3mn75KEH8rAgi3yhUrKDxmgADZ4l55pqu4D08NRKX7FmgBQsI+gjdHJ77TrvS381cyFphuD4njiEXvPU6m2H7mNtsKUPSZZgk8tNd8KGkllP7+qTERoa35i1yCRz/0AyUnQfyn32yqcxbB1NDa8QAoBIuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bAPzP2Xj; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bAPzP2Xj"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3870902760cso57348501fa.3
        for <linux-staging@lists.linux.dev>; Sun, 01 Mar 2026 13:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772401492; x=1773006292; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k/PWoH5CsN7c/aVZfwGGMr4G0Szu4wefmjBI0fFAv2M=;
        b=bAPzP2XjHZeBctdIFEdND6b6LkhC+PizEVXz1GRAOOv62Jzy6roWZa35HcVxGEd+R7
         ++Y8u3DsmXqq8+0Oi8bOdZaxm6xz4m5Cy9jLW2TO1UWdOYIFkpCSaHJy9eEspgb9CCex
         HnpHAdkWgGH1CA8K7jR3uSsUW0KB9UCBt8xznb1gPM4qXQRU3LSa0UYgTe5pzvJU8Pbw
         EKo1Ztxr/CYMv/0rN/pDcgZ7qKNPGXJGwxfyt2QuceaZUGMpTCBs9DuScf+5xPzd5hG0
         R6zBjXqZ5UbxmGZLiAcD+fDLbnR7P7ndKBacPxCX26zOLWMQRsfSUpJve+JBncMQCipj
         jTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772401492; x=1773006292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/PWoH5CsN7c/aVZfwGGMr4G0Szu4wefmjBI0fFAv2M=;
        b=HdKi5Hj/jAPPGNIMRpEqjkXSj/0kHELZoP+zXtrQB4BVDWRLMPeA6uB3w/kgdNvxaD
         yUbWTIsNlN5BzL7qX/JLmUOiB46iTCIXdvI24FQXwYDF3v52ufaPcT8hI9UG8NH0+xnY
         vNJTfU8pvUKPZHOAgNT5v3VbEeXWZ9GPnoOfGuC6rf0hVpBDbG3bV5GE82C9eWIykgPK
         a+7YOgGrkB0Nsxzl/UCmcKQ9kIgxj1N6jP+sDBSR8WkeB5QlIogYKoAopYmLcJPtirru
         had6zUQ2hk2Wxtn7MBbVKUqIWWznhVcS9Hvl7o7zPVWEQ2u2h3GN2HPeuHop5igQ3Xm6
         ngUA==
X-Gm-Message-State: AOJu0Yz+ZMC8wysIVDCE1dcSSBLUdMC1KkvvAv2+QqZ8q5NGJ0Xe9rVp
	/3a/UiupdEoUJ4NHXVxy329mgngFUaZn9y+1gJa24twuOYF0Ncub1sDb
X-Gm-Gg: ATEYQzwMt3wlWcq4g2g/g1X/YJ1kfrX1GOCbkW+Pt4tp6dOnVPp4lkdjdMaxyEAphTm
	551mPLrHaZMjK4MqWo2tBgUToLM1kx1OjEWDkHItF2DHcVMVh7xS0ZahkpxqhCvK8DN0R3W55Dz
	z0bJD6D5r9wfM+5wCsQH27VNY6mEmovqVGk8gdLoG59t9cJMp8DVMOimWap5vUHsiEtEm6++Nsc
	LQDNNSMT43KFy0ENtfIFdjc5sinpiSUG8W4Y6v6B5Va+haAv5tlXByNkjso1i+v9LQwwGXbTAF/
	VLk2cvNVsyBNSXCzlFnKBy3yGD82DlQ8S5vye2HxuoVDO4bB3SNktE36ZNzPa1Zlcf5c+xome5x
	wtiQ2+x89wg3fOhlMBcOnQtPwX6kKMdIEs4B9q+0VOqkDAns7p70WfqHV9zXP2Q1laDK1my1oSe
	K6ObHJArSsIBxWMFgRj/etQttc+YtrM5k9x+PfDufS7oh7ApUqE/nX0rb676WP8dMwcO3ofaz38
	Q==
X-Received: by 2002:a05:651c:50f:b0:385:f7ce:f321 with SMTP id 38308e7fff4ca-389ff15f271mr55836741fa.26.1772401491773;
        Sun, 01 Mar 2026 13:44:51 -0800 (PST)
Received: from T6NXCV08J99224A.lan (81-237-238-191-no600.tbcn.telia.com. [81.237.238.191])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115bd89b3sm1233535e87.0.2026.03.01.13.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 13:44:51 -0800 (PST)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: hansg@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Subject: [PATCH] staging: atomisp: use __func__ in debug message in atomisp_cmd.c
Date: Sun,  1 Mar 2026 22:44:25 +0100
Message-ID: <20260301214425.3949-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace hardcoded function name string with __func__ macro in
dev_dbg call as recommended by kernel coding style.

Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index de0446997154..be916ca13453 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -4010,7 +4010,7 @@ static int css_input_resolution_changed(struct atomisp_sub_device *asd,
 	struct atomisp_metadata_buf *md_buf = NULL, *_md_buf;
 	unsigned int i;
 
-	dev_dbg(asd->isp->dev, "css_input_resolution_changed to %ux%u\n",
+	dev_dbg(asd->isp->dev, "%s: to %ux%u\n", __func__,
 		ffmt->width, ffmt->height);
 
 	if (IS_ISP2401)
-- 
2.43.0

