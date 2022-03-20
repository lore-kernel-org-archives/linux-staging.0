Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6198C20E4
	for <linux-staging@lists.linux.dev>; Sun, 20 Mar 2022 03:33:56 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id i65so3773925qkd.7
        for <linux-staging@lists.linux.dev>; Sat, 19 Mar 2022 20:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AE/BXY7F2KOdTssv98/tsVCVvRVwtSj3MkZKgJjE5vc=;
        b=foBrR5EryWGwNwgjnDx/Obcd/RLWgFzR+sE3TcdOQabxWQUQHQ4mX6taWXpEImn3Yx
         O4MqKBfWvNPpbGOGrTGyebQIqYaVHCRaokkvu6snpTt3IZj2OIV2LQGtMNGSr3bOJKsM
         nOfMgBI/s9VpGnG4RB77QVaE2lal22Ta9sAyrRiJzASFHbZSMVRwwamxL9jpAYuXu2kt
         KIrUX52xO+fEQEtxvXvXVCGEgQ4vBKNN/+F6Q+d/X2BJSenXibdZ6jawCOsKFal5D9Bp
         ozKDDRayHzjbVbzDCk/Tz2JHimrC8ejeNk0MKjlj98vcmqkIZGtsFIXVuAK8JRkVKhG5
         itXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AE/BXY7F2KOdTssv98/tsVCVvRVwtSj3MkZKgJjE5vc=;
        b=y9MssrBNuucglMORVsgitZ2556al8pEfV1iJFhGFn1RLkFc3U4Sl3jOTiF2I/tTZK4
         w0ff/RZymXmgED1iDgou/sWl2zsOe61jdiTLifvLrC7e+kKDeenUmWjZ+d+ViYYThSLM
         Lx5QXI9mEiOps7JyLnwKXC+Te7TLU/ya34LxiZUb6w5/Kvjjfhxmmishox/WcvTLb5b8
         68QWYy2s8Kyb6zDdF8lDHqt4toOGMRy0BaFThic7IuzxnjimR8qNvSUHU3DIUeZrpB/s
         FDauJ21MK/SCNNoNvwRrUt1emWJwvU7+fhmjalSmVxHWm8ftKZ9ATkKljaMINDHgqOav
         0BiQ==
X-Gm-Message-State: AOAM532Xo6y82Dc9vrViR0BeF+tIf0NHg3qxkBwIEE7N0A36z6bUu7ho
	CJ1ZIXQcLDg3iZkQLZbCYuA=
X-Google-Smtp-Source: ABdhPJz2dyv1mrOQ4RZ3BPPCQ1QJj7P7SK5PWCQUaFblmIjV9r7zPOHHQtCLeh297KhYgXpAXnWNyg==
X-Received: by 2002:a05:620a:2985:b0:67d:b9ac:90b2 with SMTP id r5-20020a05620a298500b0067db9ac90b2mr9923453qkp.436.1647747235069;
        Sat, 19 Mar 2022 20:33:55 -0700 (PDT)
Received: from localhost.localdomain ([159.223.186.39])
        by smtp.gmail.com with ESMTPSA id j4-20020a37c244000000b0067d79a3fd0esm6250340qkm.106.2022.03.19.20.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Mar 2022 20:33:54 -0700 (PDT)
From: "Ryan C. England" <rcengland@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arve@android.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	"Ryan C. England" <rcengland@gmail.com>
Subject: [PATCH] staging: android: ashmem: Fixed a struct coding style issue
Date: Sun, 20 Mar 2022 03:33:37 +0000
Message-Id: <20220320033337.47118-1-rcengland@gmail.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed a coding style issue.

Signed-off-by: Ryan C. England <rcengland@gmail.com>
---
 drivers/staging/android/ashmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/android/ashmem.c b/drivers/staging/android/ashmem.c
index ddbde3f8430e..f2bf7995b403 100644
--- a/drivers/staging/android/ashmem.c
+++ b/drivers/staging/android/ashmem.c
@@ -377,7 +377,7 @@ ashmem_vmfile_get_unmapped_area(struct file *file, unsigned long addr,
 
 static int ashmem_mmap(struct file *file, struct vm_area_struct *vma)
 {
-	static struct file_operations vmfile_fops;
+	const struct file_operations vmfile_fops;
 	struct ashmem_area *asma = file->private_data;
 	int ret = 0;
 
-- 
2.27.0

