Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793436510;
	b=P/47uQhK3UFWZIQ41jP/K2k/1NZPuMAwjWHW94RMHDScEgjJL8VEod+C8k27p0/Rp59O
	 u855oWsWs0qO+uO3P8zzoKNDT1LqzNeJVbDyld3Q5KX6tH7V+AQdRNJbCTKtK7ZdFk9RC
	 Jd1MvxQ5H7225OnSLF9AbsYe7sREL8NeYGt6Q9c6taqnqzVUrDbIb6zhJqvB9QcfQu9Bg
	 rH+GdQgzD5Y5lx66bJ+oOB0iRSOD7e0e2RruqahVhapNN+4Tq2K2lhisZhxhIQWkSycxQ
	 jGGaHumgPljf3AByi/5zlipXnTWCE9GnjL1uH2EOwX3nXQq0Aczx4Qqsms/i2RvwtBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793436510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hDQTovz7Ix9maIgBq+C0wW/9n5tDPpyQGeZtV66dPdQ=;
	b=x7eo30ubpW/A/IzVTwpgxf1w8J5lYYQV/pHNmKN6k13ad4OdhSP7j2OM2TCaVM6rCjzP
	 yUv6501XnP6CM31k6bk5U2JUNoOgR78EyingEyU+FNQqgbx+cXeuI9qb/8w+dYDdidzYJ
	 QNg2/nuEM6KbtP9PWIotUYSYvdEKVrjzGhD5QrTAhcNHCtvEwHG5hJCdf0OI3Rov4vV9q
	 w4GP3vR0Ea23IF/IQrsSYPqP15WgOJS4G5WXWNO8Rpc/sbqSUgcUJypAWRJaHglVmqC/W
	 WFBVyGzqRBm9mNri037Ojf4qykD7tSU5QIGn7I+wSL4bbsCoxPaBFQDI9hVagSfV46A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=waiRlsNK;
	arc=none smtp.remote-ip=74.125.229.131
Received: from mail-dl2-f3.google.com (mail-dl2-f3.google.com [74.125.229.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DBC606A31C
	for <linux-staging@lists.linux.dev>; Sat, 31 Oct 2026 08:48:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81DBC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=waiRlsNK
Received: by mail-dl2-f3.google.com with SMTP id a92af1059eb24-1afb6473195so35561c88.0
        for <linux-staging@lists.linux.dev>; Sat, 31 Oct 2026 01:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793436509; x=1794041309; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hDQTovz7Ix9maIgBq+C0wW/9n5tDPpyQGeZtV66dPdQ=;
        b=waiRlsNKOSGOpTekBPpf+mlvaTVIjpsdopIhaW0EcZJ+2qW0xgnbqu91BxDzlglS+B
         HcRHt3EjU8Jt+I28WR2Q4TNEpLglfeIjlgXDFbWm5lVNmdZvNF84N9n7cxgJ9K4+epvC
         dRoPGVkv0Vp6wHNFicFtd06U76j8MGOKlqAlrkFdVSwoMqkAskQ0+RBfJpaOFoCCCusJ
         tq9Y77aIg4rCs+2a8GxYQLIFJxi0foxL/gyucyFuE6Pw6jDjzVQTnS7L1Abypp8tqj2H
         /LLEf+t+fqqIlAD9q6HJFpsikzYMy2Z1Glwz3y9eSXW359tKv4DZ3U6LZkjUc+AGRYqN
         TR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793436509; x=1794041309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hDQTovz7Ix9maIgBq+C0wW/9n5tDPpyQGeZtV66dPdQ=;
        b=blt4k40yuBIzsu+VxmJDyK0+Jpoxz0J0G3+7NgzKb2nA4uG4UQmJWSQEowSiyj4OwN
         LRbIV8jWO28YmzKO+okJ1NXH9A1OH3igkdLOx45A4BxCmkgZOjdG9FixN0G+BMsjb4z8
         IdA8tx1oywX+NJuaIEXLbWD87hFZPf+l40kuXUH5f6Ajq2tQmlDI8EtFdy0BDlUGIZlV
         y8DKsr+HvnHZA+JPr5aIxNP4evcj3gx1aNUrDf3646ksID2eht1THgTtRDs24LMJ7jDG
         Pq4q2Cj5KXrwoLTIFQjIzZaj35jZeXb2fOqTJImujhwfL268plfMeBnBoyGrJCBZEltR
         r+oA==
X-Forwarded-Encrypted: i=1; AKwUvBz1LLTsosowOsso1ZHmesWdHBimYe/taQ0wjPFv2RIhsJlO6+40KbQGi7PuQHCLMjNQ8SspKsnLSMiRB6BX@lists.linux.dev
X-Gm-Message-State: AFq9FYI2DLL9KMvCQm71S1LUw8WIK9k/emZucrRQBal+bJ7AG4NM4Jvq
	4NN/giGQgKTRI5+/WETZd5fAShdOVCJPcScJkbMF50XOqFKox8mk4j/J
X-Gm-Gg: AYBFou1H/w0Zew1d1Iwd3oDy/J02EyjrLmV7qQ4jJ4SwKHF7BvTsNzxYDSNH1J9LX2r
	IC2yKNUvGjNAcxAPZQdJDSZekPnv86WWgnX8OH4KiuzN1qsIlFs9d0mce2q6POMkapZzT/S5oUk
	CymCnbA/zj0y/r6/NNyt/WpiMEnEktmps86QfcBAV/KcAnN48ToP4hsLklyUb2xogJkN6M8W5ez
	NguU29WlpjIoC3CBGeKlGvhAJMPIpeGbKEdiI/Edb92D91OE7vLrlStH/lceW3cKBgr38foLN09
	oyZdR3LotwofPbJ+wTsHp+psCVideo98YC91EoX+LH9eHOXzxuLEjL0IWdUiTYjUsGJ0sTgihLu
	TrqUHdkS9Fgzj4idIMxW48sENR/Se5bQ7QQx7bRBUaIkDOUHAw+WrXOqgWmJ6qhIojY7eVkcMFr
	dN/zEqfBeTnZdskE1aUEijRAjrTABWGagXdg0RHDqtL/rDZoMpefSFmNGJc/Jwn0sc3rV0+xOVg
	CfzDsgrYxwaWPGenpLLOvDwpBtb8ie9oEGQjIf2KcGibaa/Fzamp5u+jQskmNhFAn1pLRA7gCu8
	24h+GdmrCyqsyhEb/Ox6q5lHjrRx1fY9+QqQH6jqAOzLRwT6sPbMRHBosw+WOcFiYQnae8AX
X-Received: by 2002:a05:7022:4392:b0:1a4:c892:b14f with SMTP id a92af1059eb24-1ac5de53bc8mr10454378c88.29.1793436509417;
        Sat, 31 Oct 2026 01:48:29 -0700 (PDT)
Received: from 49152.tail67c8a6.ts.net ([170.62.100.241])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac194b5437sm15684575c88.13.2026.10.31.01.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 01:48:29 -0700 (PDT)
From: Kenzema <ken3009le@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kenzema <ken3009le@gmail.com>
Subject: [PATCH] staging: greybus: light: use sysfs_emit() instead of sprintf()
Date: Sat, 31 Oct 2026 15:48:13 +0700
Message-ID: <20261031084813.214366-1-ken3009le@gmail.com>
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

Signed-off-by: Kenzema <ken3009le@gmail.com>
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

