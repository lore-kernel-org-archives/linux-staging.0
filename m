Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1128113633F;
	Sat, 28 Jun 2025 06:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751092299; cv=none; b=uWaMRlHSrVJZTJ/83fxy18xRjeyxgRxJrXHdqco+DmHezZ3yiDSi9HqfCzSEVZNdUcNnCK7nbEuGyAG68eHDEMsgaZMzqiwzcXoAOEAHLD0w8yKWWT0AjiVN0LAmVLF5h7/2ZoueCmnHKrO0ppDYArDH+1NHA5WimyoCZJJjLzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751092299; c=relaxed/simple;
	bh=OcjJRmPKs4f/dFfmS1CrK8xQIj20niQNZEq7XVMVMXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SegjAcHrEFkYsshQGpzul5uf4VjozRp3D3ZKdxk4fhZ+/nMB4HEnoaeCBzxSK7DqhIzbeHjd6LQ4EcBg/p6ThySktueQ818gD5w2yXI2bEYfXUcE9z4sgLTgejtM5rHQ4HjMYQO5dIG59Z7R2kkiWWm1BpLINqfClsT0XQOGkvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CHpQbwoj; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CHpQbwoj"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-747fba9f962so2915665b3a.0;
        Fri, 27 Jun 2025 23:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751092297; x=1751697097; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QOBUCLBuTfXdSALdN6Vhehv2a8w9yUjOo7KeQ2AcNNY=;
        b=CHpQbwojLXKp2ldFSjzJgPyt33NpbRulSx+XTGUPpiauD9KJfVKEjoAPaMLvgKDtIe
         XGzWFUO+9ji3F9cdbjF0hUmBNMIWkMvjQaqmvpWz+S18cU3f9A9cSVLhLh8YyDWJSfcD
         8DISoXl18GiCgqzm44RixVEkwIsR9RBre9RkzX8yp2ffvx9GsTCxPjx/fFIYK5Fgk4ot
         1iz3SDLu+37yYSHcjobL2YlpS334eu9eZ4nraJK33rCpw948jR6YLm6orUdMqHyOVdTH
         0nN5cOWVtBpuscv6KAqMc405Ldazy73Lk7c7K+z2qCQ0InCykNxV2Wed+4D9SLR+2KuE
         l9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751092297; x=1751697097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QOBUCLBuTfXdSALdN6Vhehv2a8w9yUjOo7KeQ2AcNNY=;
        b=r1j96m+xjHPX0hEXe+1pMnIW1enZnP5B8kcL+qE0huKfs829/e9FTpjfNutK5a5vgi
         fhXRrKxBcCCr09uGaLkpUUrWJU12BudIE0vOM/czwCl8Y2XututwB9RC8xFk9nbVNlbP
         DJqMQrC95sdi4eHT19mHs+NzCrP3iDvcwJaTwfwGgnCoBq3GlVz4OJ87L3dgnrp7+ZDl
         ND29u7JSHhQ5NmyQ097DQhYTvPuIaRpuaP1z9hVjHB7o3ZbBSed5RC7XqYBDTBoSluIV
         znXQcv1lng3tMicDNVWbu+IlqJ6V0wI4tDHLSfoE0Lp8osk0WFB6K1ZMrzwFSZBSLF4C
         R9kQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlnaRqLPWrUjJgdCKeumrGldH9icCd6QVerCxEw7bJt6uA/5iD/xCz+Rism0nUYGVDSpbmH358d9v03ov+Ni5iCAAa1Q==@lists.linux.dev, AJvYcCVzazWtvp9eX6gOu2BZ9oXVfNShYcv/PeBw+/kvpGWlC/8qVNOTRFxSOgw7Km7X/Z91z2iSQfQVXt7kib/0Dg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyu4nd3jsTIPs4l2zqV93GH3fDYibXOtKBnaMD5uCpfKqggAka5
	+TR7rM2dSWbmp0AGZo6YuUHW++0gpHWg/B/pJBuiP/LooUnGYRi3ceYE
X-Gm-Gg: ASbGncvJKLVg8MjvBltxVYxAYlzK3MPMfsinndhbQ0cgKvtrMKcXsv065X2mLHwK/c4
	W+v4jMNvIeM8mcxaMSZBYtN+YX3Q3NTgOLvRxNVUDeC1FCKy89q0WP3rp4/OnAyZXuczNYsjayu
	rgkVeM+z642GT8naUPj70BJGArYohQ5EHjBuQX7XHDoFhcWfMN8LwL8q1A1cnjh4FjCcWzToZDt
	yAmxGbjlORMNQK6pSRBsu56zgcVInYMQwBNEKFcSgyhIeIYCBdXiYDx7morMPDczlCsj4FOoVDR
	DsnW1hI2cHjAebtae66D9JH9b7Dv10egqLvKlhaSiOborygkCk686uodinwsM0hQasqFkz9ZOZK
	cWCY3fTC+++fMLdzJMw==
X-Google-Smtp-Source: AGHT+IEWpizPCQsGrOAiyMcr0FAuPQFRdWyOcJk3cOZz1JJvdwfoh/5L9YaZDy/VEMzWehbaSMmfOg==
X-Received: by 2002:a05:6a00:ac02:b0:74a:d2a3:80dd with SMTP id d2e1a72fcca58-74ae3e7b7f9mr15110492b3a.3.1751092297180;
        Fri, 27 Jun 2025 23:31:37 -0700 (PDT)
Received: from manjaro.domain.name ([2401:4900:1c30:2179:50ec:85e6:275e:cc56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57ef669sm3656147b3a.158.2025.06.27.23.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 23:31:36 -0700 (PDT)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: pure.logic@nexus-software.ie,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] greybus: loopback: remove gb_loopback_async_wait_all()
Date: Sat, 28 Jun 2025 12:01:21 +0530
Message-ID: <20250628063121.362685-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove redundant gb_loopback_async_wait_all() as connection is disabled
at the beginning and no further incoming/outgoing requests are possible.

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 drivers/staging/greybus/loopback.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index 1f19323b0e1a..9d0d4308ad25 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -1110,13 +1110,6 @@ static void gb_loopback_disconnect(struct gb_bundle *bundle)
 	gb_connection_latency_tag_disable(gb->connection);
 	debugfs_remove(gb->file);
 
-	/*
-	 * FIXME: gb_loopback_async_wait_all() is redundant now, as connection
-	 * is disabled at the beginning and so we can't have any more
-	 * incoming/outgoing requests.
-	 */
-	gb_loopback_async_wait_all(gb);
-
 	spin_lock_irqsave(&gb_dev.lock, flags);
 	gb_dev.count--;
 	spin_unlock_irqrestore(&gb_dev.lock, flags);
-- 
2.49.0

