Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95021A2392
	for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 10:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773572341; cv=none; b=eQdNYwcGNR1+0o+JDrFh5dSA6kVbw6eNeHGTQBVbofPCAB+SGd2WdLgSn0qq7Sv1+TNxpNbTMoR2zOlTNjsQMAl9jru8UrH+tMMeGAuzkNdzmm+8/S8ChtO9XuQLqyaHIG7OlFc+nkD9EuWMGmRW2wONqDxednF6Y4bPFoix9sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773572341; c=relaxed/simple;
	bh=j4XA5xELSfK1fZFHR8TSjVwoCFyEQzH9HCSBv9nGUjo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LN71N9fQ6UREBgiJ6BKOOeHby6rGDyMbcxdMdCQMDtg9jqhJyFZz1hvUCz/9ss1TgRGfccd7hS8atwPipiKw/hqFpNSzTD2tcCVOz31qGkj+OAUj/YOLHl3VQyGPufY+dTzfhQxtVGiODIrIKSB2dzKwS3c9G1XqONw0HXbEoCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nT6wKdwv; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nT6wKdwv"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439afc58ac7so4276156f8f.0
        for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 03:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773572338; x=1774177138; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DDWezVGPsLaY+EZX4t3/fksS/loBe8oTtJGFDBsLxP4=;
        b=nT6wKdwvsFzAgd2UFqTrSNJawoQEgjJ+B7dhrBxp+XpVXPvqjhKr7u+UetRtBy/F+w
         LgidgPBwtjtf5pXVPJ39cgJXgoLrSuYXsLvfF62G/Xu91gWoeRXrpVUwN0tYp/UcePeG
         kxCcKVnVD3IZplf98UpQ/W02jfQdcqGxprdc+5clwTdufkgot+aNSMd97K9CjS0Z37sz
         mQjq4kCxLD7QinSqsW0k6GZ2jqJfVJepKDooKxFfF753H/CICFfjWc0PNtb+HkyOLWZm
         V+qwkl3LrR19OKC9P7X24ALwRcaBvMc5TmO4bFIxcjHXZ94WXQ1ZegCCUKQC23dUTaSt
         bF2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773572338; x=1774177138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDWezVGPsLaY+EZX4t3/fksS/loBe8oTtJGFDBsLxP4=;
        b=MFFDUjTXmKOllVdIiFJbHJr4tP8SRG1FonnV7CTrqJss4rvxt6SNWM8zA4yNmc2Jvy
         qDDQsSHmAkxAqeT49ZrqSiblFeKPIrlqZUt/YaU0u1zV16fauvf9RWeM3R/4h479kf/V
         /7BvABdFBxY2R1tALxXVUZ1oVBKV4J0fjXLk1B+nkdYimDQLMoRodjwKJ6S1p4BNmYiO
         yESsnOeXJ1ex5d5M+sFtrOjLIt1RP1SHosFkG3n5yMZ8laD/B7CQaFTIn3h5hX/6HLHe
         OwZoEdqF4jHl7MZtFrtTVMbtqihZCZGK5yy9z8mafbzy4IdAt3FztbaDo77D1omIbyuz
         YICQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaoyOFfr0WMYgMiix6omb0Hq+b8XFiemM4ZANRSIOOa5X14lON5ew+/i4+vBuoo1mgwK1sp6Evss4W8DS8@lists.linux.dev
X-Gm-Message-State: AOJu0Ywnp0TNJfdS5XNM2psLCuEjUhNTM9kRlsR9iw2dWgAPlp6UAsI1
	NbYNQXedKw6Px8zxzKivWdRNURA0yRDX7rL1WCeb53Zd7bhTmlRMdO/5c/nMaX3SSWM=
X-Gm-Gg: ATEYQzynZ84oZC12Y04sOEdyQ9IO2oA5jJncbzcBddNdyYEps5bKtBp0cBjK3AWA5/l
	wENhLZsJ+mi0XvagEiuPPIbKs23T9pMxN2nHa1AbpGvHmOACwFYF7Fs4o6rQlCmMJytxqiCCLec
	C/NFExea0ygcoyZUhmCoqknhWn+IWGLvcciLq4QcdOFnwG5g4n7Lnvl7VXzD8YkmWQsrQNT4Lay
	tEirgw7HEW34Jm5RbHvuwT2Z9oMK25WAWx4mw31ziLCWHcWf7kUiWdBOypyXhN/Px9pPxd61gvf
	r+2YvMZeD5xqBhH0j+6jCxxER7K6CybAlI9VqQUgY/ubzhim4JTOVgL4mancYZW6hHgkAqGv8uB
	sN4WCSeHjb86DhFG7pu+TxvnAoeVrNGgp9Iz2Nw4/Tdy88n5ysREk6sdGxL+yOHcNMnAPJSnIAK
	8MVSIhdLfASH7aVWHVOU2KmOJLZWaGmVXFR44byXCtrQcAzZjro4rJy9Mh/TIs7fd0uaLL+m5lj
	zKX36FQKTd6o2e32gJA6IDBtJPHeMRz2Q==
X-Received: by 2002:a05:6000:4305:b0:439:ae2f:83f9 with SMTP id ffacd0b85a97d-43a04d83c3dmr16927584f8f.11.1773572337755;
        Sun, 15 Mar 2026 03:58:57 -0700 (PDT)
Received: from misharch.salamander-pythagorean.ts.net (net-93-146-220-2.cust.vodafonedsl.it. [93.146.220.2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe21b631sm38010070f8f.27.2026.03.15.03.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 03:58:57 -0700 (PDT)
From: Giacomo Di Clerico <giacomodiclerico@gmail.com>
To: pure.logic@nexus-software.ie
Cc: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Giacomo Di Clerico <giacomodiclerico@gmail.com>
Subject: [PATCH] staging: greybus: loopback: remove unused argument from macro
Date: Sun, 15 Mar 2026 11:58:53 +0100
Message-ID: <20260315105853.34609-1-giacomodiclerico@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The gb_dev_loopback_ro_attr macro accepted a 'conn' argument which
was never used in its expansion. Remove it from both the macro
definition and its invocation.

Signed-off-by: Giacomo Di Clerico <giacomodiclerico@gmail.com>
---
 drivers/staging/greybus/loopback.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index aa9c73cb0ae5..855d5051c55d 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -193,7 +193,7 @@ static ssize_t field##_store(struct device *dev,			\
 }									\
 static DEVICE_ATTR_RW(field)
 
-#define gb_dev_loopback_ro_attr(field, conn)				\
+#define gb_dev_loopback_ro_attr(field)				\
 static ssize_t field##_show(struct device *dev,		\
 			    struct device_attribute *attr,		\
 			    char *buf)					\
@@ -305,7 +305,7 @@ gb_dev_loopback_rw_attr(us_wait, d);
 /* Maximum iterations for a given operation: 1-(2^32-1), 0 implies infinite */
 gb_dev_loopback_rw_attr(iteration_max, u);
 /* The current index of the for (i = 0; i < iteration_max; i++) loop */
-gb_dev_loopback_ro_attr(iteration_count, false);
+gb_dev_loopback_ro_attr(iteration_count);
 /* A flag to indicate synchronous or asynchronous operations */
 gb_dev_loopback_rw_attr(async, u);
 /* Timeout of an individual asynchronous request */
-- 
2.53.0

