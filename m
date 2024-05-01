Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7724C635
	for <linux-staging@lists.linux.dev>; Wed,  1 May 2024 05:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714543108; cv=none; b=bTUzERCTXpggff3WKWNGDf9dghLBp621g21+eMPX9WoiwG1+BSRz8xOmqz2SA4kBDkigXXKMynLR6XGH56efGB4bNf57ZmZpyiLf1sMqzR72XVnk+mDd2+DseMZHBxTABEDZgfly1Ef1fzfVnmF9k6E2VgSbi7CCELOaaq4Zbig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714543108; c=relaxed/simple;
	bh=qFOxNZDdgb4xgczhp7k/37TYS9T8b5TqtSX9kQNfMB4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QgVqYuhqiFEOgzctWLfIJhk8NkznnslCjBjD4BaS0751+3CEjSfPN4/g7UhwvRiqVfHHsvTTILy96JzByBd48Tbk1ht3lh7kqFlWZBcCpXrtbhRMxZEAIP06r16KySXiWXofNJGfD2qnq1TWgPS8Gg/Wto2wAXHUOwBqQNJoWvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jOkbs/PJ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jOkbs/PJ"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-41b79451128so37654575e9.0
        for <linux-staging@lists.linux.dev>; Tue, 30 Apr 2024 22:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714543106; x=1715147906; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3hiWw6jP2yYUJTSlYbKDexViseqF5lmbHWHi/tGYz+w=;
        b=jOkbs/PJb9fKGK9Mbx/GUNen4iQz6nMZUJd9tXfMIN+1epIC+Ojkh1g8c7z6T5SkGo
         SkTscSeQYuxqEj7fCk1aeYaf6nT5DlD5LoMlRvZcj51+fZAqDLA2fng6UA18s8W3amPI
         CkWWIW7a7aVNAN4P5JJU1FcAVHukmO/tZv4ultZ34fgkh+c0bWPIpURMchiXEVdE7br6
         CR0ZteHxXHh3O2cpEXzPihN2tlt+d0ZVQqfhPO8hkEpdm3qILN5h/fWm/SL9dfUvfFgv
         +nDHuXBVGALoG+7BobEqimq5jQZVLpm+tppuvq+zbxJyNkHLMlX1EC7g4IFlUUqL53N2
         1kkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714543106; x=1715147906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3hiWw6jP2yYUJTSlYbKDexViseqF5lmbHWHi/tGYz+w=;
        b=LSN7K95Q+IpeKfKGtQARy53uaJ5kZz6GGJ2uXwjL6gwadN6vN3ZZnPhE6oqistIUYF
         n6vt4Bk1cz7Yhn5YK4963zYDlkIyNep1Zt+z9SECHR2wLzOsC5ridlXERRdWo3yZ+yA6
         tgaTcdpB0GoGQRn/ADi4cJHeCubMqloqAtHMnR4RXWPuABcLftKmoY+BNxyGGBxeDzvx
         OcYhMqQbCydc+f8jKH6r6bKKTqu7J10zHntGmWx9ipurgxnK+JJpQlV18QFUwLaQO5K3
         ZBVJLvwBYge8bUUlYqCI+Z1osGY0TvxxdpwWZpM19Mf9rMj3JDWn9rFjYvFWC69xtLr5
         5s6Q==
X-Gm-Message-State: AOJu0YwFQ1vfm+Q42yLR4oMR1bGdWYuozJNPFNYLozMaVOS+Qom6BmA/
	P06PLyOhy/cGMAw+/LC/OotZbjoGF2Mv7MALF3J8W9P6oTyf3YNO
X-Google-Smtp-Source: AGHT+IGSsffDeCqMeZYpwWvnrTyvTJE6ovsRobFE+nE77rXh8klVag5MujXA89iVOdsPZMVzGiBzuA==
X-Received: by 2002:a05:600c:1988:b0:418:f5a9:b91c with SMTP id t8-20020a05600c198800b00418f5a9b91cmr965776wmq.33.1714543105688;
        Tue, 30 Apr 2024 22:58:25 -0700 (PDT)
Received: from YOGA.local ([2a06:c701:737b:ef00:e314:db5d:b033:4fc2])
        by smtp.gmail.com with ESMTPSA id s7-20020a5d5107000000b0034c61e211a5sm12451390wrt.63.2024.04.30.22.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 22:58:25 -0700 (PDT)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org,
	felixkimbu1@gmail.com,
	dan.carpenter@linaro.org,
	krzysztof.kozlowski@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] staging: pi433: Rename goto label.
Date: Wed,  1 May 2024 08:58:20 +0300
Message-Id: <20240501055820.603272-3-ikobh7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240501055820.603272-1-ikobh7@gmail.com>
References: <20240501055820.603272-1-ikobh7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use destroy_class_and_remove_dbfs instead of unreg_class_and_remove_dbfs.

Signed-off-by: Shahar Avidar <ikobh7@gmail.com>
---
 drivers/staging/pi433/pi433_if.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index c8c1d296184b..4fffd7007040 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -1409,11 +1409,11 @@ static int __init pi433_init(void)
 
 	status = spi_register_driver(&pi433_spi_driver);
 	if (status < 0)
-		goto unreg_class_and_remove_dbfs;
+		goto destroy_class_and_remove_dbfs;
 
 	return 0;
 
-unreg_class_and_remove_dbfs:
+destroy_class_and_remove_dbfs:
 	debugfs_remove(root_dir);
 	class_destroy(pi433_class);
 unreg_chrdev:
-- 
2.34.1

