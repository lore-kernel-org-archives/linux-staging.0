Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191AF4398EE
	for <linux-staging@lists.linux.dev>; Mon,  7 Sep 2026 16:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799849; cv=none; b=SrvR/pJ6nDe9Lo+f1lFuwIKrVkdTnNUWJhcVyp320x9czH5EC7162t/zsN1IpUnczWXVEcUjhGaKi4K0LPTxJAiLj0GQnx/j/ULxsY91qj9zCCxmhMLYvoLNHRpH7gk9H/fT9n2MPQ9ewQlogTNoYaRYvAnPXt7KJhBW+2v/4bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799849; c=relaxed/simple;
	bh=MKgoXYTXSjlrtYrBtVpRepPWqUSRXg6w982y1Pay3bs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dlBijDcFSnkYR4i1/TzigVNsKaXzVvtWrDiqmubiffhnJiT3Js1paCxc7GMAZ8XrHmhNgBjo4J50odfpRzAO4jJFghI9OujsJDd9QUKr9+U/UrstHv/kOk6hFvVNHP7uoGr2YTLmejF+qnjvjyAhY1VcJiD+6OwMuLZwSri53rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BqeGfOqj; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BqeGfOqj"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso2665201a91.1
        for <linux-staging@lists.linux.dev>; Mon, 07 Sep 2026 09:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788799846; x=1789404646; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mJA+EFreX2+ndoSjltuac97HgB0U6+rcf3y9yIV00LQ=;
        b=BqeGfOqjSjq7tywg6fCXJTPES48QOjAKYPpAihodnTHy85nyHcaDMTA1xVhZ5Ys04n
         V5WN2W7TNPm5N2eERCZiq4d5dZUr/BXfwAzsFwm8ar9vU4Z/7Z0MOmvbxBqBdFaARmKZ
         AkMOPDn6yb6X69l8WDIJHvciLq/MWzT18LCsV5H2zjRxUIRtuqI/1odulTx4i6c9Kxn/
         IMH4BPCwBGPF08FqZaqHLcXrsODx18TyoY8LmiM81qzIqYFyvtEaIWq9MjOn4KK7JUM2
         STsgc7HFUukS9yP24MoD0Z0DOEqxwZkzJQPxH2bhuW8kT87E7H5Y1A2GHH8Wsb8+X4I4
         ZCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788799846; x=1789404646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mJA+EFreX2+ndoSjltuac97HgB0U6+rcf3y9yIV00LQ=;
        b=pmzZDce0gVDGRZVpu+umxCnLkf/JNAozZU05bWqSZVzVjXIOxHFqRQSO6lrFgxlh2q
         BR0cKAlcCyPdPn18jGY41o9U0aDuDMtepd+6nsxc/X+aNgWtJoXQMfvL0i5HNez8Sm0+
         BUn4f9UW7C8xPFd/sP6fbbKJcWA8SHE6tbPn2jcIzamWrDPn4SAra1OdsRVXUCW66e1Z
         UyEYbD4u3G3dxNIqRVxBHgD+ov9sj4qgllVipx2neWyl7XX2YTx3adTqzYWZC4+HaQi7
         A+1NU7qOzkHTzwPq6lT2+/O8EvNlwK0EiS8/jcHZQkeUNTqpmdkimBUuvNCUzDRuQ2vx
         2J1w==
X-Forwarded-Encrypted: i=1; AKwUvBxveDR/tsWEsMxJang217W8S/6qhJHi/SqzBXbTUTIKv+lXHHFbqyklPO/Gqs5drnJ9nJx3qDZOVqCG+6T9@lists.linux.dev
X-Gm-Message-State: AFuF++lGQOZ/TyOxcmdXO1x/lfvjIX9O/f39ayTv4iPQ8r9dbFdhxKL6
	5RmzIZ3dxdx6bFu/ArBqtTpvxlUo+Sm9bjJd3FH2utfoRAwKBuzgwlQE
X-Gm-Gg: AYBFou3xn33+v4jItMTFCnA0Ny+duEAm+cd+l4MySeLcjkFT7BQUA0lY7SQwrByYPtf
	B8e8ay9LMki0yY2NifvDSuJIwqwfFcaZlkkXEgeZTIDJa74LG9buh+7Y1WZJdrH5VsZCTsRYShR
	H5bmvVoSTxDizSjx8JHqJbqb7bnYwQ2JKnI0y2GsyzpZbHRNtbgToRP8p7yc5IWC0OFWIALAowK
	4f6UVyl+HwVBHK4s4FStFh9uGJX3Fp44fOfLJuELBo4KfpiMxIPxcj7owbosKTLLsTaT+JMaLGO
	lZp/6YRHAtoyjvK8s0Ioz7ssEmJ6Oquf1HcvtWzeKNwYa6VRA3zwXRYf6QeOYx10AQA8ybuRL6D
	H4FybxgY6Nh7sj4/54i8mXmM9r+MzJj3CBRRQF0QFFnKVNpE+1GDW7s7UmZgmJXRQ8h10xpTg+b
	UOoHl9EKP9nCVUBqlHnJtuuuSAjqii7SxfoWzCP1YE/UAN2XZKdUn8Vnfz6SvR3FYB
X-Received: by 2002:a17:90b:4d06:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-39b2614df74mr34283307a91.1.1788799846338;
        Mon, 07 Sep 2026 09:50:46 -0700 (PDT)
Received: from G15-5520 ([103.246.195.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm808934eec.14.2026.09.07.09.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 09:50:46 -0700 (PDT)
From: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org (open list:STAGING - ATOMISP DRIVER),
	linux-kernel@vger.kernel.org (open list:INTEL MID (Mobile Internet Device) PLATFORM),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Cc: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
Subject: [PATCH v2] staging: media: atomisp: Use C99 initializers for ACPI IDs
Date: Mon,  7 Sep 2026 16:50:33 +0000
Message-ID: <20260907165033.8460-1-lalitshankarch@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use designated initializers for the ACPI ID tables.

Signed-off-by: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 4 ++--
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index f9cc5f45fe00..5e4bdbc4a127 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -857,8 +857,8 @@ static int gc2235_probe(struct i2c_client *client)
 }
 
 static const struct acpi_device_id gc2235_acpi_match[] = {
-	{ "INT33F8" },
-	{},
+	{ .id = "INT33F8" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, gc2235_acpi_match);
 
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index 2c41c496daa6..2d95ad91db69 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -995,8 +995,8 @@ static int ov2722_probe(struct i2c_client *client)
 }
 
 static const struct acpi_device_id ov2722_acpi_match[] = {
-	{ "INT33FB" },
-	{},
+	{ .id = "INT33FB" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, ov2722_acpi_match);
 
-- 
2.53.0

