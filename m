Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8412FB6
	for <linux-staging@lists.linux.dev>; Wed, 19 May 2021 08:20:31 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id b13-20020a17090a8c8db029015cd97baea9so3151924pjo.0
        for <linux-staging@lists.linux.dev>; Wed, 19 May 2021 01:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XyiYhLHr3hR1GTY2O/8/PlBeJbCviFxRhysxSfK2xtY=;
        b=KKeHp/84kv+UkRgsFu4P3cXC+C79LND1HgMm1EF8pU3EPaISb0wKOCHs+/hWGLLpu5
         7/FmAUxrwe920A3EyPjldVbXpqGcIpTsUNJIvV3gybCUTg8ZAi2jEFjFd5SXw5ty0urV
         B1TyR33IpZBo40QmiMGyuB5RRKrnr4FriF1rPVjy1vuKBO0O0DTSMt4/+5Tz11MPCnhR
         w5705m5rjzvCrHM8ju/cvWKHWsbtJX1DbS5Mdwzq38qCUSkoPy/NxL1vkZZ/MQh15DwS
         Ic6JN77ea8JJk7HlQ/FIKmA+iQ116Y2KKvkfaB8VIrJ/HiNZX0QeTLQKKgsiE01hE+wS
         czjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XyiYhLHr3hR1GTY2O/8/PlBeJbCviFxRhysxSfK2xtY=;
        b=rv/ULbzL4fyDiuhAN6eMpCuJKvK4Te3fbAbWYROFWczLWBxWdqr8kAdOLWGbd8RBUd
         e2Iae0/Fv4kOZGHShmhdMaVVOUSTvwVwb3EeFKpvwAIqkwd2EXnqqyfpYDmfe7Gro2pv
         lqeji1wqbf6BAANwktGTvKcjPKMtr/LAilndmCNv4uu9Gik7bmxr7Aey/wz6jlo8I61o
         xLUuKnav2s5ZR5KNy1o0Alfz2wkCkhdbNw3hcBicdq1w5UB2DxJOC0pSgSP8VZEiEAEL
         QHVuJPpotEvar6M9QuyzIP88PqfILjfkjg0KvXFUQ5CuFwYDYVfU9KuDBTyP7AsCxKv5
         8Fhw==
X-Gm-Message-State: AOAM531fNJKDiAcUTpB3mRC4xj6t7CD5PsIZfvmsGpgxfj9bDNiRpxWH
	e7vYU531tz52fby4d8rP6Sc=
X-Google-Smtp-Source: ABdhPJyBv4/Pk8F8Q6q5ipUi+cz1YJ/a1YsGgGQyvySE+1ap3/11clgvRBoQCV9dKv7mLWLVR7ZgSw==
X-Received: by 2002:a17:902:d204:b029:f0:b65d:a14d with SMTP id t4-20020a170902d204b02900f0b65da14dmr9538869ply.25.1621412430656;
        Wed, 19 May 2021 01:20:30 -0700 (PDT)
Received: from ubuntu.localdomain ([103.196.78.23])
        by smtp.googlemail.com with ESMTPSA id t1sm7804931pgq.47.2021.05.19.01.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 01:20:30 -0700 (PDT)
From: Hriday Hegde <hridayhegde1999@gmail.com>
To: 
Cc: hridayhegde1999@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Martijn Coenen <maco@android.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Christian Brauner <christian@brauner.io>,
	Hridya Valsaraju <hridya@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: android: ashmem: Declared file operation with 'const' keyword
Date: Wed, 19 May 2021 01:19:58 -0700
Message-Id: <20210519081958.7223-1-hridayhegde1999@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixing following warnings found by checkpatch.pl
WARNING: struct file_operations should normally be const
380: FILE: drivers/staging/android/ashmem.c:380:
+	static struct file_operations vmfile_fops;

Signed-off-by: Hriday Hegde <hridayhegde1999@gmail.com>
---
 drivers/staging/android/ashmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/android/ashmem.c b/drivers/staging/android/ashmem.c
index 8ee4320a5dc6..8ff2794b08e3 100644
--- a/drivers/staging/android/ashmem.c
+++ b/drivers/staging/android/ashmem.c
@@ -377,7 +377,7 @@ ashmem_vmfile_get_unmapped_area(struct file *file, unsigned long addr,
 
 static int ashmem_mmap(struct file *file, struct vm_area_struct *vma)
 {
-	static struct file_operations vmfile_fops;
+	static const struct file_operations vmfile_fops;
 	struct ashmem_area *asma = file->private_data;
 	int ret = 0;
 
-- 
2.25.1

