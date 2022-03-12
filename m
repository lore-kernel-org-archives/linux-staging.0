Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90BE614F
	for <linux-staging@lists.linux.dev>; Sat, 12 Mar 2022 20:41:52 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id cx5so11107412pjb.1
        for <linux-staging@lists.linux.dev>; Sat, 12 Mar 2022 12:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=z0OtbkAFOzZxKR5/4BNUwxuMMsg+2em+OF72Kb9Nh9I=;
        b=GxCc7whH6+vY1PtxE9K8VX8Nj/A/1vqusEa9KgtMMNeyDnmRaXcHRK+m16ac89qTdH
         CzVUvAb8ClcDlB6Q/5hqFSxMRiU3PIvIDVAOXLaHpeiG2hyCM4JvYJVdwMmDlj7jwbqn
         dmjVaWyyp1uvnRgu/kjmeuAm7L2XdDUih8RGWxgsXU4d8JU1wrGUJfc+G4xdVgAjY0ok
         HBjy2pRipPrmwWor5bBbP4adqLM4GPTbRc4Lfja2f1/P5uLWTwNLb5JR8xhx+3Ls4hZ+
         Cmr75+bLftAteOxEA+uBSLSw8MUP+Q0PcL+elCq3DZcynBgX07jFMWPJFQDFXJpUWBjj
         gZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=z0OtbkAFOzZxKR5/4BNUwxuMMsg+2em+OF72Kb9Nh9I=;
        b=Ogs9Xy85/2K3dtkP98RZYSea8fS+aSjOHBZ2fPy7qA6HwWt0B0yPU8dutVzBqX1ML5
         9P+5f3iAcyW+EyyEnB7zNVIDArhpcCxss/ZbIcgvE38dDmTiB5SdKflIJI1QUGDNgsdf
         AG45bHv4RwyOfMCH4NsUlkUcx69iQpxRWyrTajsdtlvDjbLA5fiiW3/vWh0OyAvUJd1x
         kr4HR1YuK87U887UZ0zKlXtM6kFgAZmTx0h7nDa28/iHD5hCHvIWg7cESaHdkmHhYqX6
         wmA0gkv6AWWL0kzQK8lHY6cHsmSE9Ivy/HQJoeQttLwPY3M7DI2Z9ougx/toXKj2j3cG
         TF6w==
X-Gm-Message-State: AOAM533sG0dPybDFaXiBDkv/bxIR6d9ttq+zIfmOFoQQSVvvogTWFxRb
	pSZbFpVnjTRJKDBaPKep5tM=
X-Google-Smtp-Source: ABdhPJzJEOMlOrhBzV/paNYbCbKqWmpAJrTQfrcl695FtmcHwmiiAap0tNnTGpDg2LPwXPXtCnbDZA==
X-Received: by 2002:a17:902:bd86:b0:14d:8437:5113 with SMTP id q6-20020a170902bd8600b0014d84375113mr16505518pls.43.1647117712132;
        Sat, 12 Mar 2022 12:41:52 -0800 (PST)
Received: from localhost.localdomain ([45.250.64.116])
        by smtp.gmail.com with ESMTPSA id f21-20020a056a0022d500b004f7a420c330sm3683389pfj.12.2022.03.12.12.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Mar 2022 12:41:51 -0800 (PST)
From: shaikh kamal <shaikhkamal2012@gmail.com>
To: 
Cc: shaikhkamal2012@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Martijn Coenen <maco@android.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Christian Brauner <brauner@kernel.org>,
	Hridya Valsaraju <hridya@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH]  staging: android: ashmem: Declared file operation with const keyword Warning found by checkpatch.pl script.
Date: Sun, 13 Mar 2022 02:11:27 +0530
Message-Id: <20220312204128.3942-1-shaikhkamal2012@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Signed-off-by: shaikh kamal <shaikhkamal2012@gmail.com>
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
2.17.1

