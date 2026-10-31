Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793436427;
	b=4IestC6xFyjiy9JVskf/btNf4HPJ43ckGccfyhH3ynrQJBcrBHgdlSJmeDKLyRpcWsFM
	 19uct53rH7ZAJ/hLIGRZkaYjCLLC2tPXLj6xu/Ii5nUFh7icVW7Ylq0Fcd9XMIvXnhrS7
	 d5Xj7gU5iGIZ9GKPiZ/AwhDXL6SJ3BaMPZ4Xs0xyInQWrRmsE4DYjaNilbd1Fj9Fua/9G
	 S+QtXE6X8ac8ugNWkG8BXQJi53ewdZDf77ZMz4MpfwTQQUiYv8GC8lXoUP62xOOcptrL3
	 1a31uGd8lPIEpDRAMvHZB080ZZ4qhZcyJzRxCCZEceGDtQUn+op0Fv6n+Jq6UjfVZjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793436427;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tQZ+SMI7bX5fVz6VQ//lpX/hBzSPPOS0UylhAHpyrgQ=;
	b=fB9cBAMlNm29ONbAImd4sHVWtHYEBtVg8mXm+OUpR7efe4U4D/pw/m3ybSRT5hQxHqls
	 QQco7tAxLPzdcuB+uVmrktip23vIOa/t9l8p1isYKusp/8xthi9rjUUgvd+i68e2VEMPu
	 UinbCpgUGIwC28A8V8LsNe+wueahy7AU6hEm+A3LE3wSMgAwS3RwQMKLk8zKncwOI2S2z
	 WnnPmbkxCr313L4PGZ3oStF21p1V5DdDH7EHBh+aYfQDhwnU5zCKuDAqGptbW0gOEEXj8
	 BJhwUitYNK2HAFmHbt1Cqrt/mTjiaaSN2iiSZ0hyzLdZWxaUI3QdDeoC8jalCA/cLDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="g/xVg7iZ";
	arc=none smtp.remote-ip=74.125.82.193
Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231CF606A31A
	for <linux-staging@lists.linux.dev>; Sat, 31 Oct 2026 08:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 231CF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g/xVg7iZ
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-35829219da8so3009840eec.0
        for <linux-staging@lists.linux.dev>; Sat, 31 Oct 2026 01:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793436425; x=1794041225; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tQZ+SMI7bX5fVz6VQ//lpX/hBzSPPOS0UylhAHpyrgQ=;
        b=g/xVg7iZ2R4IQOASKrhDZ/0ZRRLBBIp9wDVrB8o/bvpPsjYsAgnrjv2tNgM3D37xN7
         CBMLueAHv9oS2Kkp9eq7OYmk4LAJ2XcJwXlzrH4bAzQVqEVF0CUQXku+LHEP1mFk4jti
         IdIf+luqJncDh5oECe2CIjACCAzweVoDxph1b4hyXTNy9OGEEHhEOcfszPDhm329Xkq/
         dvfYWfXV4XlS9RDt0GgSKwKWQIUCL7XjuGeeoX+WzaIM9Y6trpYXtztsr7uxM3LKnulV
         5+bbmZ1q0ivmaAc9M6jMmLTr5qoz652YKPlIT2nj6UW3xZ9ETPoZ6T+dE0l0nVwWnRoM
         CKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793436425; x=1794041225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tQZ+SMI7bX5fVz6VQ//lpX/hBzSPPOS0UylhAHpyrgQ=;
        b=t9PSO8aN8lpML5oY4k1k5Ffy3hsxvgKsgqyygdmD3TkE8FtXswt4jcIkAGADU7RCav
         bKD7Jc0BvCg+ip3ZzH9bumWIPhVwt1FGnaiW9Ffy+rh1mXtNH+DHDbRf0TbZDaB0d16M
         MfhJ4qBcFlfER4bZI2dZ8NJgiX3Qpc1dH8RrZlJkNqhYWfs6MDkNiYgEsfPo4Ardhzwk
         na2CFxKu2GsT1w3l7U9ag4NA2UqgqGKtQjh7pt36yb9oMl6POTnDRQeW7uC74rhafxbh
         faQXvOMqNWud4IT7nwbVFqQnwh0f2lrav6RoZ7JboMom0Y+IDGx2j5DmzcQYmJev+YTp
         tmzA==
X-Forwarded-Encrypted: i=1; AKwUvBzN843/kW0OdS+sUYh5tmIl/Q5kmW87UZzy1ahuG1bTrcB0nzj2MoKlZtgO5pUJtUE/w6q1T761kh0C0Iag@lists.linux.dev
X-Gm-Message-State: AFq9FYLCUc8JJszJD7XOYOT9kWBX9NCAcafPm0MfM/+BXwi/YCiTQ92v
	y8+8BoVdFHuJwVGBtNBQq8VjgKR1JGb+leN2txLaXD9xN0mTI1/aOcg7
X-Gm-Gg: AYBFou2+Bf6Il71iKvTTMEDq5zHoEnKZ482wO1RLW/mRgKT3RfRtLzUnJHfWkBxzIZO
	u6AhOcFg6JVwTIJId4pp7TawyEdh3/xicVp2POGwivDFQbQPdyYjcimyRrIXkA8x/pZOyU/phgV
	0Lxwd/Wn58reoz0qhxaQTWHB0HAOmwFFmWEKBp4RV800glbB7RPk7jO3g/RzFCJlbVemJpAvBus
	4Sb4+gK3elflYB+esY262qP08p4IrUAebbkYji1ZxxqeZq/hsYg5q5JuHIkaddJERldw8DUPOd7
	65PJ2/4KVKCEzMdt2KlBsW1pELv0iiATi9Kst1jecubhWi+LKtlHg5Q5pLrSENle1jzme6hunW+
	Ja2OskBksaKBAA9/nrwHv/rMs3bc0WobXNXOvtZ7jFCrS2Qkx3Z1dVgSm71Y4ZIx9gMeX4rPz/k
	YBoc0C2OSEy3kdg4nsxV20MI1csrpVAREjBX9izsEw7mRQEHa1n4MCi1yS5bXptL125Wqdjkruj
	BZrvnwtp5Dm9l5Lq3OIb3yGUx9+Fz21+IfBSsu0dsUGVBFJR8Tmjk6ri6NWElx/Ih+6c3PNyVEQ
	SjlemQiyKwR1dDUEPIdV+60yOJ/nOslnvHpjF2j3g8MzOAwr9GNP6Wxahx51GDtVLQhMPnPg
X-Received: by 2002:a05:7301:5408:b0:36a:1446:4852 with SMTP id 5a478bee46e88-36a30008540mr10632884eec.5.1793436425057;
        Sat, 31 Oct 2026 01:47:05 -0700 (PDT)
Received: from 49152.tail67c8a6.ts.net ([170.62.100.241])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm19952736eec.16.2026.10.31.01.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 01:47:04 -0700 (PDT)
From: Ken <ken3009le@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ken <ken3009le@gmail.com>
Subject: [PATCH] staging: greybus: light: use sysfs_emit() instead of sprintf()
Date: Sat, 31 Oct 2026 15:46:48 +0700
Message-ID: <20261031084648.213333-1-ken3009le@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to Documentation/filesystems/sysfs.rst, the show() callback
should use sysfs_emit() instead of sprintf() or snprintf().
Convert fade_*_show() and color_show() to use sysfs_emit() for safer
buffer handling and consistency with other greybus drivers.

Signed-off-by: Ken <ken3009le@gmail.com>
---
 drivers/staging/greybus/light.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index cab02b5da..2689f9a75 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -173,7 +173,7 @@ static ssize_t fade_##__dir##_show(struct device *dev,			\
 	struct led_classdev *cdev = dev_get_drvdata(dev);		\
 	struct gb_channel *channel = get_channel_from_cdev(cdev);	\
 									\
-	return sprintf(buf, "%u\n", channel->fade_##__dir);		\
+	return sysfs_emit(buf, "%u\n", channel->fade_##__dir);		\
 }									\
 									\
 static ssize_t fade_##__dir##_store(struct device *dev,			\
@@ -220,7 +220,7 @@ static ssize_t color_show(struct device *dev, struct device_attribute *attr,
 	struct led_classdev *cdev = dev_get_drvdata(dev);
 	struct gb_channel *channel = get_channel_from_cdev(cdev);
 
-	return sprintf(buf, "0x%08x\n", channel->color);
+	return sysfs_emit(buf, "0x%08x\n", channel->color);
 }
 
 static ssize_t color_store(struct device *dev, struct device_attribute *attr,
-- 
2.43.0

