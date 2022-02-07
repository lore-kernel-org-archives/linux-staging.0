Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB052F23
	for <linux-staging@lists.linux.dev>; Mon,  7 Feb 2022 03:17:17 +0000 (UTC)
Received: by mail-oo1-f47.google.com with SMTP id 189-20020a4a03c6000000b003179d7b30d8so1712385ooi.2
        for <linux-staging@lists.linux.dev>; Sun, 06 Feb 2022 19:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pVL1XarGkGpNrMFF5FpaCxOCFgNox/eu94U3iNLWgOk=;
        b=UzVcUxMLk6QizfUc8c/7P9RNR++92zr5T0oDttbGCWP7UGcZ7xi9Nxd6CknDb6Zn1I
         VK31u/QMNp/hkXmq3vnr9FMoKmAcs4R7UNr7Ylv6LXSdmsH0XMjW+Mr70MzA7kWubIPS
         KitfUUKfznChgEkaPtDIip9U1lHKb3/zj3jAlD0FEL4LhOzBulb8bLHuV8sg3R9gJ8KI
         PzL+YdOj5NyVN13ZbEitnZ1091DJjypEHJ4TXyVckOtJ0q7eD58XQHIGvDqRZE4qJ7kg
         QU652s5nHCrxnq9vvfjdO7sQrKegfL11u2VFTOdhjzMksD0vXllCCrTAJAvwDF8tnhg4
         T55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pVL1XarGkGpNrMFF5FpaCxOCFgNox/eu94U3iNLWgOk=;
        b=6hNpFSiEV4tRJ7Bguxmrrsg1HBLOJz52LnrmZ2mpLFeK88NgQmtc8St+mBrBfCxY4z
         vNFowgC26Y/1e0w+ZuAI3WoWGTTLIplnHPlC5zggLoy7kaz+0hBnbXmEj2BxAkvFB7ZE
         mGHY9IZFcrLYEEu4NrotnfTycnXvNRBrBAOcs14jju0vt+q++2fkCHGeuT0XwCixVDPs
         fvm+ubn7TcIkyzrvv+0s5M7SAErVfHMQSXuNIfK0efvMntSgi9wIMwYHG37HMQpgk7ok
         JYnzPMzqxkAQnUqdxH5+TPO9K9J6QYkWtIB4SjavmIKli28yu5tQFIgywi+AOKscD26d
         04kQ==
X-Gm-Message-State: AOAM530SseCJtohmuxoJeglUOXV8BT9dyn8/xI8nBc+/Q6+8BQkHrmRU
	xD6yILFmtvgcrFdMFAfLH/o=
X-Google-Smtp-Source: ABdhPJz5HxJMSDPOW73LlU/PtUzQWEN6ctR43Vhlii0R+CgbtJvTVDKLZbk8OSHZQBi3hgAOzBobWw==
X-Received: by 2002:a05:6870:3654:: with SMTP id v20mr2726890oak.17.1644203837175;
        Sun, 06 Feb 2022 19:17:17 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:4cd8:12bf:4134:806a:5a4a:2a88])
        by smtp.gmail.com with ESMTPSA id w62sm3704537oie.4.2022.02.06.19.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 19:17:16 -0800 (PST)
From: Leonardo Araujo <leonardo.aa88@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	"Leonardo Araujo" <leonardo.aa88@gmail.com>
Subject: [PATCH] Staging : android: Struct file_operations should be const
Date: Mon,  7 Feb 2022 00:17:11 -0300
Message-Id: <20220207031711.13644-1-leonardo.aa88@gmail.com>
X-Mailer: git-send-email 2.29.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Leonardo Araujo" <leonardo.aa88@gmail.com>

WARNING: struct file_operations should normally be const

Signed-off-by: Leonardo Araujo <leonardo.aa88@gmail.com>
---
 drivers/staging/android/ashmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/android/ashmem.c b/drivers/staging/android/ashmem.c
index ddbde3f8430e..4c6b420fbf4d 100644
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
2.29.0

