Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D74E32F770
	for <linux-staging@lists.linux.dev>; Thu,  7 May 2026 11:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778151760; cv=none; b=NDvXj1Wa8QoJWbOuX+h7yLx6rpR63QzRdiHTbmyjpgGrOXxPaUubxKC5l3w3gF2aeS5YvTRbUm41CuCFqnKcWgTZHs4rz7WGZB18gbDSvfvqIBXr775z5aeq8ItAiY5vawQrQWrroQdYD4luTzfYcwPbh9YdV9UfoFeZUAwM2yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778151760; c=relaxed/simple;
	bh=cMgJqIA89J5jSDyNSTxWxOeL0VqIoE8Nxhg1/ff2B9s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UqaZCJJI8vb8ECxMPqZqSD5Nl7clZ6k/GWge/NOZ/KS01bI9ocA/SW8/5iVEpu4KKrwv+QI0ds4vXLQYcftidjMpgWpU3aVfLJPkC3pi+3v2Pi6aU9igr6NGIzzfk6bFMAqSnzOUbFl2UKk7M6drBVSnnyUSp7M4fFRueIj4lp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qCt8xzu1; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qCt8xzu1"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-364e5d895e3so606075a91.2
        for <linux-staging@lists.linux.dev>; Thu, 07 May 2026 04:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778151757; x=1778756557; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7del58ZNoXTYS1UrwtFFdHbvVnfss3cuhksZj/ziuKs=;
        b=qCt8xzu1xvq7JCFjNQokk7MEa8D1q/DPAYJxi017B3tK7wRLnO1SfuQk43HjMplMlz
         SnkhALnoU8RSY861S+blX8SfrqvHL0mrQcVk7hIJj3okRWp5ktXzukJsGZ4jMX7oQBYP
         9+0rjY6o1gGUeE24JFXvcr9RnXy0REiLU0sxK04EpGXeJqytKqOhFCFdHFOpmURe8bGK
         SviQII3d/4T/sX+nXCmc1P9wiVSOlT/+mHns35S6zzWVMjaKzVAr5U3ljb4WK3TAckbf
         quWfbImC3+JwAQ476LaKVdaZYoOJys1RKy4YZARP4ORTRGUMGD3CbKXbCLcZFG/VeGru
         HmiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778151757; x=1778756557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7del58ZNoXTYS1UrwtFFdHbvVnfss3cuhksZj/ziuKs=;
        b=MPrI1zEzx5YvQw+zSKWDtj2c2Mf1IbM9YdWnC5j2sQ/2VZIOMmko+RSeAmXLOAn1lQ
         MDqj5LdrShFUq3X5H0rSMlwOXF2c/n8POO5R5V4KihVg6+zJIe8WrMNBWib5nqr4a920
         uGf+eSOfWuy05axF7DROWBnUp59A/0mJ1FPObitJ8ly+OJjK3gXXeZbFCqddVLq1js3W
         avH57Uks2U6oUSALE7EkODZdGDxvARusmdAXWHmeVoqNZ+g4d2uRTJ9KHFWtikQpZ+/b
         J39TZd2jxIa2NIWT5RX2afR9SzFY52QxkYcTC9bIt5hf50w0XE1fO/GGKQa/J6w6FtNl
         IU4w==
X-Forwarded-Encrypted: i=1; AFNElJ9OGpOr+t6XAaTpjRQZTbTmk7y/yGmhsZXL2UxHYKpEITMqBH8t/y1K4Ba3CXxPGwLZsDPRUOOSchcJa90u@lists.linux.dev
X-Gm-Message-State: AOJu0YyaNq1ANCSAzxewzG6cZ2Lm7OBhLI8qHI6v0jJyivajgEdgIuBV
	OVCgfhBUXxdUIK1kqPq3eAYE/OVHsCSp2nEsVZkjHed78KWPCs9OeQq3
X-Gm-Gg: AeBDiesuImLmldYNb055IUearW7fq70+BBksdpwnjhsZcVT135hSyuuFDWd3VAef1z5
	XH2HsbyboDX6DwXM7QFtMbnwhqhNUOsauwJsDnr8md3Flp4DsMqZZ2NyN8XsYZ3twxWIUnPG+7K
	Z9TlggRcm3N+XSyQYArKZsgOTaQsOXLPtVC2fjeIUriOqAt3pLsoDpi2SPuZWj8j0M6heLrTjFu
	X9Rc3rfM57jnoVGx9UlmKhdapWC0fqwJYMZEwSDkqHf8tFkSjsiC0LvLrEL3LIqrDS3nA5N0oEK
	uN4cX4oEscSs/+ajq/SboEPcSR5QdBXGqDKjPpbOtu4OkfIeYxVQC3Lu3QgQjewldoEXfGrrOAD
	Q/m13++IDSQQaARkzRBTcLbipyjVOSosZgTvq7DGgieA9qPkCPem2UOQ75SONA4ZQgd+sfBHkle
	OMUUOow/BM5J06v2Yr0ra/iEG6XKzcXDwjO9QZe+A5+AA=
X-Received: by 2002:a17:90b:55cc:b0:366:16d1:6a25 with SMTP id 98e67ed59e1d1-36616d172e4mr1466210a91.5.1778151756721;
        Thu, 07 May 2026 04:02:36 -0700 (PDT)
Received: from phu-arch.lan ([2405:4802:1bf7:b0a0:33c8:3ea:357a:8f94])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365d8e3dad8sm3961371a91.1.2026.05.07.04.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 04:02:35 -0700 (PDT)
From: Nguyen Hai Phu <nguyenhaiphu06@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Nguyen Hai Phu <nguyenhaiphu06@gmail.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: media/ipu7: Remove unused struct ia_gofo_secondary_boot_config
Date: Thu,  7 May 2026 18:01:55 +0700
Message-ID: <20260507110209.127549-1-nguyenhaiphu06@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The struct ia_gofo_secondary_boot_config in abi/ipu7_fw_boot_abi.h is
not used in the driver. Remove it to cleanup the ABI headers.

Signed-off-by: Nguyen Hai Phu <nguyenhaiphu06@gmail.com>
---
 drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h b/drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h
index a1519c4fe661..21d1ff7ab29a 100644
--- a/drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h
+++ b/drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h
@@ -91,17 +91,6 @@ struct ia_gofo_boot_config {
 	struct syscom_config_s syscom_context_config;
 };
 
-struct ia_gofo_secondary_boot_config {
-	u32 length;
-	struct ia_gofo_version_s config_version;
-	struct ia_gofo_msg_version_list client_version_support;
-	u8 reserved1[IA_GOFO_BOOT_SECONDARY_RESERVED_FIELDS];
-	u16 checksum;
-	u8 padding[2];
-	u32 reserved2[IA_GOFO_BOOT_SECONDARY_RESERVED_SIZE];
-	struct syscom_config_s syscom_context_config;
-};
-
 #pragma pack(pop)
 
 #define IA_GOFO_WDT_TIMEOUT_ERR			0xdead0401U
-- 
2.54.0

