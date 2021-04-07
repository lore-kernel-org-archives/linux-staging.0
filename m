Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96DA6D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 14:35:14 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id x16so19647343iob.1
        for <linux-staging@lists.linux.dev>; Wed, 07 Apr 2021 07:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=McRaPZtaI1790tMkGUX982lxKKNwJ+80GSAvJnU1nu4=;
        b=WcBkhGP7Nysne78NG4fnVBZWzjevmx21rC2qbAUg4IlDiM3kfIf14TnPrUsBkZKykL
         6TXktiCGa4MsmfGuLxOg9BQCgdO6CSIaJNAPeEtyxeECP2wZQiFLgpJufnh6v8nNNZ7X
         Q5CILzPDHOMIIvoL1jKQWKFnPQxwbpuJEdEVsFmGeZsdNq4YruIL5ni0sjS9YXhGCiCK
         NaT9sDT7TshdSUBjObb2ZUv6FtkJHtGueH+ucSPo7Ee1pG+kkVuud3X+fCP4J24J2K5y
         dY+Bg7397uzLLtqDOjH/zbg4i8sUBTPIlEYecYEcr4CG3TlJfYvpcoCBsVhEyPtg0c+m
         0jGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=McRaPZtaI1790tMkGUX982lxKKNwJ+80GSAvJnU1nu4=;
        b=CHqEC+KSkoSmz0I6CQTUD5KVVmXeqeTff8KCS2eLGUD5cm+uzQkmzcs76qQkPL4PXJ
         h3qz+Wmt+zRYqbxFR+w72zRhagYb0iuPCmr84e1QQ4ATP2Sotmu47SyN7pRzuZhnwMV6
         y/NTqEcHp0xmMSpeVMJ2rvlvCgUjO4ghoC3xTnslYifiWUSB/AcWwnGK9120KfY+bboD
         vctLidvZ0CyUC+W7aors800DmF1Bl70tLAkgRcyR4qXbtd6gRHba84NEDhJDNylkx25u
         0mINsSWCAX0ubRZfS8s0apFKqjhzyyBtzwlHaV6Lm73cIqfJ0Ya3jd8ZMmKCC2ydr23A
         beNg==
X-Gm-Message-State: AOAM533vZnPoaCZV63ZUOsJKUTgfHIvh/3qVR6WGGUBJwF+j6vFMjTId
	1UZiQA53H8tGPb/VVPsSCVc=
X-Google-Smtp-Source: ABdhPJwixaGP6whEJsF6nRmSeCzhqKzUSt7Mhs/eJYWYBR/YNb0TbcJ8fadKJhz4NEEBRuQvQCEAOA==
X-Received: by 2002:a6b:ec14:: with SMTP id c20mr2872508ioh.122.1617806113932;
        Wed, 07 Apr 2021 07:35:13 -0700 (PDT)
Received: from Ubu (97-116-48-27.mpls.qwest.net. [97.116.48.27])
        by smtp.gmail.com with ESMTPSA id v8sm954276ilq.0.2021.04.07.07.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 07:35:13 -0700 (PDT)
From: Barney Goette <barneygoette@gmail.com>
To: gregkh@linuxfoundation.org,
	arve@android.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Barney Goette <barneygoette@gmail.com>
Subject: [PATCH] Staging: android: ashmem: Fixed a const coding style issue
Date: Wed,  7 Apr 2021 09:35:02 -0500
Message-Id: <20210407143502.3414-1-barneygoette@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed a coding style issue.
Reported by checkpatch.

Signed-off-by: Barney Goette <barneygoette@gmail.com>
---
 drivers/staging/android/ashmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/android/ashmem.c b/drivers/staging/android/ashmem.c
index d66a64e42273..7854fd410efa 100644
--- a/drivers/staging/android/ashmem.c
+++ b/drivers/staging/android/ashmem.c
@@ -376,7 +376,7 @@ ashmem_vmfile_get_unmapped_area(struct file *file, unsigned long addr,
 
 static int ashmem_mmap(struct file *file, struct vm_area_struct *vma)
 {
-	static struct file_operations vmfile_fops;
+	static const struct file_operations vmfile_fops;
 	struct ashmem_area *asma = file->private_data;
 	int ret = 0;
 
-- 
2.25.1

