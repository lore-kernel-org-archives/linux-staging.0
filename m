Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976DB3D667D
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 10:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770200043; cv=none; b=rLtV2TnCnRNvJRlZAANqURLsRi40Wv6bQ/x87aBsS0y2UWZbyWe4ARyIxwzO6RmwUqXttSod5ZzeaP7Z4RhzA5VhB/Q8nNDqCxIKGeDb3JvwYIBj49YT0GCVqGF+JCUJEhiV0wwusXJgi+NFm0gV5p/+WDSOlqyCMDS7Np5RIkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770200043; c=relaxed/simple;
	bh=TCdAquG7plrfYtQ2b2TWW4MjP9XqF+4B8hOZUPTel8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ivEzaVtcN7iehIrqgWvFk6c2/uFFQMGAO3fk0pMGKxkbuj1JZFtpxj56QWe/fXlYUyh2egY1OZHa+n+a6OGWGKxSCwvpChaomHH03Cig2/qQ8zz97FhsYpdEsH3d9z3te2ZOJdip/naN7HoPvIzQnja1rSTeYPBkbgpZjudWfwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fzwhIl8A; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fzwhIl8A"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-506251815a3so972261cf.0
        for <linux-staging@lists.linux.dev>; Wed, 04 Feb 2026 02:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770200042; x=1770804842; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sFFi0szND7oE8w8xJDzQ/XyKXHeShqmhkjNpXUOPUes=;
        b=fzwhIl8AH1isBng3a3LUObXM0PMZjarhJLa5vLJBM14UCp20kV4ZUKHQF85s8T/XQo
         WygMI8MMp0jmscEkTZPMKYiC3Kz9vyN9Qi7CUeyXGrphQFowZmoxqxeDksHDByraWdOl
         K0n5iLXflF76wxRHMkU9jTlpWDMo2F+k7L9EKV+4kI82quITuOJcUA+PzLOU3LEerBMo
         x4Dqk/+0KbH0Dt3hj5ZyGLzhh5GrHN+KI25EXECrc2kuUOdbUQCcQJnawSnKfR31j9gq
         Mqouz6VJL6l9vr4GY4JnvUCxDv9K9++Saxf+EHcSpvPcT7pp7DkDrTwWDQwg6xj+Bh3s
         eLmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770200042; x=1770804842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFFi0szND7oE8w8xJDzQ/XyKXHeShqmhkjNpXUOPUes=;
        b=vmkOXKMBaY6c3EbQl2ah0SxI0OjM7L5Q4suzAZhMZRQs97bqBZXVgrC3cdVsGp+2tM
         sTPIjELvx9f5cTCZKZx4b7R3r84euyL6RphyPCZ8qTkaRU4DoDNetDIkJWOOoBwmZXoc
         L0ucxftJjCgTEfn+CE3QQD//YLpMpfVAZT2d+hTnTq9QWWN2S+qN47hd/tCt3ktsxoCJ
         C0GCrLcl2O563L6f1PbJuoWkOqUoCt81bmYGMbxTsjqzFOwZQ/pcZLsxOfE87mUDC0q2
         5isDtIag2dw9JFyaT4b6GQ0EbaDAorR3HTpyYy478U0CcGm6fAHyM6sRMuZbxe7/ffio
         0TsQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6RxMoUzqftNJwiIxsTIIni/QHCOUY/3rdKn+93QzLqbTmZAQCvGyMKEsMrpJWlq/V1EALelqdnBHF9neG@lists.linux.dev
X-Gm-Message-State: AOJu0Ywf2/T17pGMdF1Rf6kMllUvJ3EVqeHHaSPCvdiEfaz9crFXW/uk
	3eoQicCdmbE1OnQGT2RlJq4udVwiXt8vMnz8LyylnMbkc9O3DAVisKRM
X-Gm-Gg: AZuq6aLR7z8DAUjNOJj/F4ompUcRKfgl+LTZEDAaHdH2OrtxiGFHXX8yKieJctCrS3X
	mVQoP1Kdqhq7yL5hPAmA9AOGgpaOG4ZV6e3k1GUb3iJ7ZzszRyalF50i2C0tLygdtgMOxbP2cAe
	4uTrDY6yBSONjDhf4Hd07loq6viOetf/t5+ecBH6Qw7GCdWeuLjQg7RUmvVehRBtq5NW/3J6+Qq
	nGyQ8Jcfm2KP3q4d4VnwTNCBz9wAhYg+IBSEd550vACfHT99wNxqpxwHb0D/Yc0IkMiXY+qWWP0
	bPyvnvZeDfE3d7a9yeYh/Tgj1tYtKvkZelviM0YRidMWm5SZUtB91aZOJMlnrhc1OlDw6fjNshU
	e8cASpDLLUKCJWtgynvIoxtRG72Dgt1NEyVqxhgfTJ2H1H8oRAfiEOc8xYn//FHxY0QpjgPXdHn
	7/oKLhvtTNFzUWXw==
X-Received: by 2002:ac8:588f:0:b0:502:9b85:a609 with SMTP id d75a77b69052e-5061c151b03mr25198421cf.30.1770200042436;
        Wed, 04 Feb 2026 02:14:02 -0800 (PST)
Received: from Mac.home ([76.64.58.244])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5061c1e9971sm14014141cf.21.2026.02.04.02.14.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Feb 2026 02:14:01 -0800 (PST)
From: Neel Bullywon <neelb2403@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Neel Bullywon <neelb2403@gmail.com>
Subject: [PATCH v2] staging: greybus: gbphy: replace sprintf() with sysfs_emit()
Date: Wed,  4 Feb 2026 05:13:42 -0500
Message-ID: <20260204101342.71267-1-neelb2403@gmail.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replaced sprintf() with sysfs_emit() in the protocol_id_show() sysfs
attribute function. This code is safe, as replacing sprintf() with
sysfs_emit() gets rid of calls to sprintf()
as part of kernel hardening and sysfs_emit() is more appropriate in
this context.

Signed-off-by: Neel Bullywon <neelb2403@gmail.com>
---
This was compile-tested only (no VM/hardware used)
---
 drivers/staging/greybus/gbphy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/gbphy.c b/drivers/staging/greybus/gbphy.c
index 60cf09a302a7..55f132b09cee 100644
--- a/drivers/staging/greybus/gbphy.c
+++ b/drivers/staging/greybus/gbphy.c
@@ -31,7 +31,7 @@ static ssize_t protocol_id_show(struct device *dev,
 {
 	struct gbphy_device *gbphy_dev = to_gbphy_dev(dev);
 
-	return sprintf(buf, "0x%02x\n", gbphy_dev->cport_desc->protocol_id);
+	return sysfs_emit(buf, "0x%02x\n", gbphy_dev->cport_desc->protocol_id);
 }
 static DEVICE_ATTR_RO(protocol_id);
 
-- 
2.44.0

