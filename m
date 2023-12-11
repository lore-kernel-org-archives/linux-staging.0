Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7624BAA1;
	Mon, 11 Dec 2023 15:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lDVCG/aA"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6ce7632b032so2421001b3a.1;
        Mon, 11 Dec 2023 07:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702310106; x=1702914906; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NvzZ6GPm6FBKY13t74SyXbkcqS52Q/SYf3epLnEDjq0=;
        b=lDVCG/aAjgOspBvjVotQFFp7iDm4a2dFPbBCsG3DUEhahdeEVdKU21jFExquMwFOhw
         bsXitgjp6/KcBXpDB8/Ge4TZBBZu/PFdT545VNwS+nzv1cA9NgRomqfbY908Fg1gO9fu
         zgxi27GAisLUgpoIGj2DOiZ6aq4tUsuvDOscI55qP2B6IbrKKq7UDFWvp9l75ejoMvPF
         goQ6LJpuLVYcECUhdMM9xmCt5VimF10Qu+58PfwFc8ZaScHT8DHHt86S623MkmPvw3gp
         3DFP/QVeu6LfKfZU45KmVgCVkVGac1iTOBHR8RroOh6LKo2Rqcf/67YeMS7HObJP9sZd
         LpSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702310106; x=1702914906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NvzZ6GPm6FBKY13t74SyXbkcqS52Q/SYf3epLnEDjq0=;
        b=iTidIhOMuMzqahYRkGozEwGCo1IeT18XUxyJIfBnY4Seyyp+4F9+ZiuZekEndA48eN
         ikXLfucWGus8EjidN5ldrgauSZEf543meHdcaYTphulQlucMZwz1I8a4St2IBvhIbiLs
         phV5ezeWUPuOakkyYkrq+/bt14mGHzRMhIa8LfKF9AiBW5WLyosYtYmBvvmqXihSABNK
         68JMeu4z8b8/zwXJxTgfkYBrWAK39ajs8CH2KpUv0xJ6g7vPAcapGpsaStFsNLk8jmga
         e1VULH8VEW4QMzIQXlcMV1cbIKAwwMA1boP49i03i+QFZTRx4lNAwoC7TehwhZuu5x45
         lLZw==
X-Gm-Message-State: AOJu0YyEqAwdYswf6Xjil+Dd7X/ZUC335n/zacggQBYkx/wIQsJSO3Id
	vd6BLVuo5XHE4DmxbFZmfTU=
X-Google-Smtp-Source: AGHT+IEv5Jn3dltTrGp5+G1vApnJxPRoM3hLU6VPEwFnlcyynK+8IbpQ1xP6Yefp+y7/AartPzpX+g==
X-Received: by 2002:a05:6a00:98e:b0:6ce:6185:44e1 with SMTP id u14-20020a056a00098e00b006ce618544e1mr1849376pfg.66.1702310105961;
        Mon, 11 Dec 2023 07:55:05 -0800 (PST)
Received: from yqt-VirtualBox ([223.166.246.87])
        by smtp.gmail.com with ESMTPSA id d15-20020aa7814f000000b006cdd00f91fdsm193168pfn.185.2023.12.11.07.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 07:55:05 -0800 (PST)
From: Piro Yang <piroyangg@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Piro Yang <piroyangg@gmail.com>,
	linux-staging@lists.linux.dev,
	Linux Outreachy <outreachy@lists.linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging:vme_user:fix the issue of using the wrong error code
Date: Mon, 11 Dec 2023 23:54:53 +0800
Message-Id: <20231211155453.105409-1-piroyangg@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

1. the error code of ENOSYS indicates Invalid system call number,
   but there is not system call

2. unified the logging error message, when slave_set func is NULL

Signed-off-by: Piro Yang <piroyangg@gmail.com>
---
 drivers/staging/vme_user/vme.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index 5c416c31ec57..e9461a7a7ab8 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -340,8 +340,8 @@ int vme_slave_set(struct vme_resource *resource, int enabled,
 	image = list_entry(resource->entry, struct vme_slave_resource, list);
 
 	if (!bridge->slave_set) {
-		dev_err(bridge->parent, "Function not supported\n");
-		return -ENOSYS;
+		dev_err(bridge->parent, "%s not supported\n", __func__);
+		return -EINVAL;
 	}
 
 	if (!(((image->address_attr & aspace) == aspace) &&
-- 
2.25.1

