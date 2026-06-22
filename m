Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4BBCA45
	for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 04:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782102450; cv=none; b=QfxVXwJ/0A9zHwzuENLesGWEyzfMVl0Gw8byiRuPd5UIIW6Q14BM+teiK79PGaugeQMNJWoFw698JvDGIBFcZ+mhwfEz8IzqTKd+0F+D3MB83/7tCmrE6s1wpHU16qJH9m+W5Wv7OFOx2PLB42evQv23Iqvimj6jbFqs7exhmSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782102450; c=relaxed/simple;
	bh=3v9bMiL1cHjLHvUZl+0+SdkKVbShGBW3Q6hXOxWiyuU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OXf/kBYdqk2JE/qZQ3/SRSSl8qYOkLfPYG3IKftLTR1xffeetBS8jmYHnz1Tfl88iHcs6vRtZ03Gw1tBI8sU98Bd8pb4nGqWFcXkKmfeNBf3sw+FrKlP79I4SZBCFyFjbiZBqBkrX6IRCutweeXUuV2bbdDdjUYCh/BJgPefBrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GOLO8f3V; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GOLO8f3V"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c40397e746so22691365ad.3
        for <linux-staging@lists.linux.dev>; Sun, 21 Jun 2026 21:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782102448; x=1782707248; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6VzAs6AH3TNjyBp93Ecb8QiyKrxhvN/1oDoDDuY4Io=;
        b=GOLO8f3VSTE7gfyicxw5rrRGYXPwecV5JVdCU4Avd0lM4uM6FOwhWSM9kH4Dlb1FqC
         JDV8LMWpe8nyUH0eOMPeCcHrDQ9f1ilgsBdNIDTVZETd4W1chMyq0jYlQuOTiohQ2Mrd
         7qieMzQ3vviZxFH5ca1SOWYtLomWHP9bMch6JNRQPjJL0gg0XHncsgR8RXtUGKxnZhI8
         Vba6qCkKoqjFyNlQ0csWI9/LMZ8vg0vRVJbbBj2btfzipzEDce84LhNT90kxwHdos+oR
         Kj4u+EJFV6Ujw4JiAkV81tTuFNGVgXKJVF2tnyeSs1NQC/QU5v5JYl6SwxlK24ByDyp+
         XBNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782102448; x=1782707248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6VzAs6AH3TNjyBp93Ecb8QiyKrxhvN/1oDoDDuY4Io=;
        b=FUDpjuFQbSAtzBEWcwNITVjHc/GMXpWX3wMdqJ2bifk+3DoZuER/oEb+GOOg5oL8YQ
         TxKO7SnT1hya87HNr/i/fEnYtANYhTrRyaBGN6lLRgqUasFZh0oSzKoaDW4SzSz3/JtU
         dkpsZU3uGXiNuFeEfZeE2XFVhjVcCTmOpw0fjfinc1UvGLkCTWTkQnQfNeZmeRvmfgeA
         321Y/HxpgGnA/UsHcSlCAsitywK5ikJKxwOw9hKqQh7ewAwN0FY2e9/06uFag31MuoCe
         MT0FioXyvKlQGfQQqCYf4w0DM19fJLJ5cZYet/uwrua0C0CBTG+oJ9Iom128/cfWlpBn
         wp+w==
X-Forwarded-Encrypted: i=1; AHgh+RrqcQV5U00R+z5a+IpSbn+LjaTJtZyDKwlblwb0bne6j8TTN8SjZ8NwXsiWTp80iX6FpjS1kO8BfwJhkq//@lists.linux.dev
X-Gm-Message-State: AOJu0YzIKwXv9dKYUCgAVr+xgxG0exh5ARX7BLad7EpCqek5zp8vQ6Ht
	uDqzP8iAKCRWycXphQRI5e4mqWh1ZuMqyd5HrBn3a8DFfnVWbRVLJcnSQK5dDkZ/
X-Gm-Gg: AfdE7cljqm2YSgwsV9JueKDqRye7BCIxLWZPgOtIQof6zYQTWeKaRwmxK6hEOHSxtF1
	KaUd7omLy0SMKpIhs5ipUhUUqTNzDXKOZgXiChepkHdOiygYoTh+ZsCu0dBWr8p8mj5eCuxytLE
	/yafKv2Z42B/FiE3R/rh4Lcgr7TZvBzMl2qxFcEAftB3EXwxzf1E/BqbACN3kXeFXg75ocYLqJf
	9IxVhxk9YyY1jzEAqX69TOUQtQzXNfxwJxZEEpmktn53kn5yqhjGrsXxzIcUR4ziCrur4YNSffN
	GXqHAF5CT0HMINuIBxL4yjvmWUY3RGETP8Jb01MNsXNQ2j1DbNW8OzQ32BvK7MVuzP06S+xKmsY
	YrRl3djKmrZ7qCbtKbfS48ZtltZz1zMLr7DN/Bw/QDo8LGruwpOt87UQZoedkCxw7GJLRdNLIfP
	aNIcYtr32cGh4EnVShMpzCqmLRgZoPWEcfjBwSzZfszAtCNJb09oJJDaJJVKecixv89KaU3EE55
	tivpFNiwjG1pFySwxdB2feFwlNgrT0pYZ1ahQwSAMBFdTvvugt07f+KfA==
X-Received: by 2002:a17:902:ea0b:b0:2c6:a772:7e43 with SMTP id d9443c01a7336-2c742b1cea8mr97469225ad.18.1782102448080;
        Sun, 21 Jun 2026 21:27:28 -0700 (PDT)
Received: from kapoor.mahindrauniversity.edu.in ([122.184.65.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436f7df4sm68123595ad.31.2026.06.21.21.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 21:27:27 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>,
	linux-staging@lists.linux.dev,
	greybus-dev@lists.linaro.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [staging] staging: greybus: loopback: add missing comment for mutex
Date: Mon, 22 Jun 2026 09:57:21 +0530
Message-ID: <20260622042721.31760-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a comment for the mutex as suggested by checkpatch.

Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/staging/greybus/loopback.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index ea57b1f5d..bf827e672 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -61,7 +61,7 @@ struct gb_loopback {
 
 	struct dentry *file;
 	struct kfifo kfifo_lat;
-	struct mutex mutex;
+	struct mutex mutex;		/* protects the entire structure */
 	struct task_struct *task;
 	struct device *dev;
 	wait_queue_head_t wq;
-- 
2.53.0

