Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF19823236F
	for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 20:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836133; cv=none; b=q3wDHqlWO6Cm6WiRYCy0xBQLxD+x1ZaGzVEvlvm6kBRN4VKtfebmwc5iO3qsUYmkb9367WWD0lrYgHhr3kLdUNT9WByy5GNIuAKJiZ89gY5bB3Yh8TcgBN3UmrLlrzEerybSLywdQwAtzlFGAX5n6TAt1p+P2VNhjHOcVrbLJR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836133; c=relaxed/simple;
	bh=9qC6SADjVBvrGdZqgD61dD4ij9DtU63SWTFy4hBsTVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bNowL53Ii/1DDzRuu3vBz6Gwr0PtvoYxEoINPUfsHqyTNrbr/M7843frj5BkppuVebTpsBZGHjrnE7VwVQzjciOpm7AptGwS0mvZCdiIvsJPZKogBrkWkMPGfVGQVDJGqx1kv3p6xRzQpDRoM+woQK2kFZLoFR57yRkYiDwuccE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=NxSL1q4G; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="NxSL1q4G"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-af28bc68846so46039a12.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 13:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744836131; x=1745440931; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WSCp68TzSTwAIQNUn8peisTtRZqQcqQfdhU/AvOcNRM=;
        b=NxSL1q4G6SbxlzNLnVFC2FL2olmN29syZKGL5dAJ/67POLX7OqDeQ3PClGc3prx+aW
         0tb2EEU+Egp/8I2H0uM7MaMkoEtaunbXnqiYwUNOet1SpnWX7ejb7c+xDwMhaTpLgq7z
         VTBWO/deY+0XoqZZNrULsL1R16Ap4oUEWHBxZ0Of+Hmi2WV1P6lIG7chDUujZqlw6JSr
         JTcirXYQB/jLoQZu6WdihxAjNoZknsf99GYv5AIcuIRSQ6IKM0xbRh78N6SLSsQEnsEd
         8YFGUDF08ASXPLesrUV6LSad5b7s4fusyZkweh6J78XSb/+KMjo7151C3gVfeDv4dawX
         0cgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744836131; x=1745440931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WSCp68TzSTwAIQNUn8peisTtRZqQcqQfdhU/AvOcNRM=;
        b=Ha487UcGLdKFt4eyKRJDNGh5AW46QDI074AGQZ9UsJYXRSUsv3icabjI6gMF1cBwFl
         bj00USRLdEJDEESAy2S3FrlFrw4dr3cBVUM5r8Gp+Anouu7GGwb7xumYKHCnQjvtKxev
         qsEun+qeJLeWBpX/8HRtWB57XelSaqtLqGULXNy85L6ut9qVpHqlWkO0K+Mjm6pg/ahf
         QlnlvP7/Oy1+PSKC1hFG5mzIpKhicmOByptL4O1qLZNvXZ45ryTtNzgyN6e3ccpLZVYm
         rvqDw/oPC9cd6jySB95kc2qlHjhB+UnqCGKASnYLLy9qXzJEBpHA+qsa0BWzgy/X4lXT
         IAVg==
X-Gm-Message-State: AOJu0YwV5PhoiRcV/n7QG8qL7VGQ61Sh/92TBq1i+cSo4iZ37dpk9dw+
	3NRVKDZCOjloX8seF4/JV8im/SrQzpEcKupCGvp7/KXXj3ovlZK7nwj9eAnaWg==
X-Gm-Gg: ASbGncsMsQ9OLwAuApgxyZuVaZby9p/5OfJqczh2seCT6c1PJ4DYo2raBmUUO1Tt0qf
	1fsgCED1RgIyb/5GsGb0kVeVBWUzkBgwHL2wwHVvnbVuPdmhi00jzpTLgOAbuuhRulIJMx8kp70
	KA7K4Au2Nq7T+6EeGwynm+baK7/VsaV0ri9I+XaMj8r3daEvl+N6otadeCEpa82wFvi1KsQ7Ky4
	+tr+LBbpw5zkMatQsSngVgf8fZk09gfrpZDNpDnQMPj/o4MuKyuRpl8fBCELgJ+AclAjDx+N+68
	NW/TzMYv/4zXtQT8Eon/bHrbgmuLORzrncXf2tCGJGFpz9TxUJ4FjtAWI6Umhx4D4tLumPobvuB
	vwR0Zbg==
X-Google-Smtp-Source: AGHT+IFUJCXUb8UliTOdXtwXcqyxAlTjdp3qL3EnJlnAZaSnWvHEsplxd3fYc7soqNPAW70n8SA9Tw==
X-Received: by 2002:a17:90b:53cc:b0:2ee:45fd:34f2 with SMTP id 98e67ed59e1d1-30863d25d6bmr4360821a91.6.1744836130996;
        Wed, 16 Apr 2025 13:42:10 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308613cb07esm2088367a91.44.2025.04.16.13.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:42:10 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 03/18] staging: gpib: agilent_82357a: gpib_interface
Date: Wed, 16 Apr 2025 20:41:49 +0000
Message-ID: <20250416204204.8009-4-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416204204.8009-1-matchstick@neverthere.org>
References: <20250416204204.8009-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/agilent_82357a/agilent_82357a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index 7076e9f57d69..9e41fe611264 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -1434,7 +1434,7 @@ static void agilent_82357a_detach(struct gpib_board *board)
 	mutex_unlock(&agilent_82357a_hotplug_lock);
 }
 
-static gpib_interface_t agilent_82357a_gpib_interface = {
+static struct gpib_interface agilent_82357a_gpib_interface = {
 	.name = "agilent_82357a",
 	.attach = agilent_82357a_attach,
 	.detach = agilent_82357a_detach,
-- 
2.43.0

