Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DB132AAAD
	for <linux-staging@lists.linux.dev>; Sun, 18 Jan 2026 11:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768737297; cv=none; b=rYMs69LP+qfVFfNQHlhZqbOddJuVo8AKgxVVleFHwSuXH0SVp8oXglh5yAgU7d7P/CZ1C7yPBpctZih40HyqAvZWRfGhZ4eH+gVTzeHt4/WiJxea8Jbb0HpvE1EsEhyVchSfVBe2zcE5EZck5/tQkW8C1fZZCXDd6EPA/AGQSRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768737297; c=relaxed/simple;
	bh=zOfSPCiFKqmv34rNskZtHpQC4of07HLOi8SsOKfq/E8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hQMxARkYjUJSCFpgcD4W8o+6b0MEDEMN8ZBLjvxhWsUA7jY1lDJvniu9Tmiiy/3DQkEka1zvwlSJ24QOdc37EyrRqAawUsXuhMtDrqBoPmi9VC5ZBsrje4z0xAWgBNZ+NALerRyq+DgHMRZj8o907nzh+VO0B1OHbdceeZ+Ryr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+E7LRqK; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+E7LRqK"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-432d256c2e6so2861699f8f.3
        for <linux-staging@lists.linux.dev>; Sun, 18 Jan 2026 03:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768737294; x=1769342094; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vh/uPjKkjFTzbQKBGAxp3Ww1JQS4t2qyH2DOcG7BnPY=;
        b=g+E7LRqKjtR7rVVvMqhlgxK3NghUW6JJZQg1MXpShOJPzfgBXW2+xG4bMUrhkI+uu2
         W3foACLE4rxEK+fyxl7EH6lBT39RBJqgAPXwfQLfrV7FpNWZ7CfiCnQBEpZjga7MG4Fk
         6zF4Z68HfFsujWMWQM591Js/08s3vWZjswaA4j0Ofukruz9AOFjZ/zXB/Y/CLp8VEFrz
         cYKryJG3GvAA9EZpbMLzcWIt7WCcTPhXvShRAGa45QLSra8YS3bHE398obfCiTs6oJ2O
         5HigkIfbA+MUs9fo42SVjyCUpQY1L54EKOhbn2rsMB19SiWyQVXg70sDbRGnteDlM6hU
         qi7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768737294; x=1769342094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vh/uPjKkjFTzbQKBGAxp3Ww1JQS4t2qyH2DOcG7BnPY=;
        b=onZ9oaiaI8ZwXWIXmde3GtN6Tv5UVw2lOj+1JaB966AnZBPKDqqaK7c8VLXessOq8Y
         2TsnF8XsT42J9TA/Onjx4p6CT4Tg+pPy1+0qfb4oci2Dhe4G9ky5hJR6dhVw/xcSx000
         GH1ZxkAkoBfqqi8LgoeQu9LmI0vDO/nEIJm6xwHDV9oSQGUohEqy4coNBOtQbfTowFgD
         n3jUxVQ4PSpc/CCKzAyOgrjHrGmn2YVwA2wRac3PLu6hXRgCWh/7lVjoV3hYjRrwSL2r
         jfzJXd1QBHWgq5CZo8YT97jQY33HIrjxiTs7aXno37mn5wpfBupieaUmp8C2Ocypz0kh
         AjPQ==
X-Gm-Message-State: AOJu0YxAm9TnptZSbukm4ixrKUn3NhhnO/DucTRhoYwf95vZJVPjWUCb
	xZmQPjsjoZBjrgQJzVsMAAkjTvfLu035I9df7xG41OAeZPn/McUR7LT0+fR0Qo3/
X-Gm-Gg: AY/fxX7NVt4FXkj5MmG1YNK8KSlfkhuC8u/aCtoWjRPP45ppZ41jswz6IsvpEk1i6l+
	9uLzFZ/2ukje4feE8e2XzQom5KOB166c3ty/aJpNJY/z6HSOMCLYk+JV2ziAXJ7tNfp6RJtIHV/
	DcBrR4kbSH/bMjcYPX7fN98iaRXI/IBjPoijhTbZnpRx50YW6UduizmLnLpGPwElJXjJ+fZ0UUc
	2a8EwyidBwPy90Z5P4SH10s1cggxFfM+LZw3VZTXXjmtkZiJcI4rk9dhizErPVgWP0tD9bmQkeL
	/IiPEBpoMXuaWsVHJeQjhx0kNDP0nhs0lqJO99/vGR5FiAbQXbdKCf+CGieMtRMpHqk5qAJggwa
	COujAG8lbn05NLlnFHmb+X3nmDTX85NGYrRTSzvJbwa7ofBdE11kkzbunrOLZpAI7/Nx+ug+V5b
	7SKxJM47HvZ3b6KbCiR2cr2rCnFwZpMkQfmpxetUPOjyiYF9bqzw==
X-Received: by 2002:a05:6000:186c:b0:42f:b9c6:c89a with SMTP id ffacd0b85a97d-43569bc5a34mr9583808f8f.49.1768737294165;
        Sun, 18 Jan 2026 03:54:54 -0800 (PST)
Received: from localhost.localdomain ([2400:adc1:447:6d00:1c1a:7818:23f6:aae1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356996dad0sm16368686f8f.27.2026.01.18.03.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 03:54:53 -0800 (PST)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Subject: [PATCH v2 3/4] staging: rtl8723bs: fix missing blank line after declaration
Date: Sun, 18 Jan 2026 16:54:44 +0500
Message-ID: <0603893a3f1faea1fa461e3aa139773881770ee0.1768736361.git.mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768736361.git.mahad.ibrahim.dev@gmail.com>
References: <cover.1768736361.git.mahad.ibrahim.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl warning regarding:
- Missing a blank line after declarations

Adhere to kernel coding standards by adding a blank line after variable
declaration.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c
index 1fbb71149cc7..b7176a992518 100644
--- a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c
+++ b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c
@@ -47,6 +47,7 @@ static bool CheckPositive(struct dm_odm_t *pDM_Odm, const u32 Condition1, const
 
 	if ((cond1 & driver1) == cond1) {
 		u32 bitMask = 0;
+
 		if ((cond1 & 0x0F) == 0) /*  BoardType is DONTCARE */
 			return true;
 
-- 
2.47.3

