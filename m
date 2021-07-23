Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EC672
	for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 20:05:20 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id hb6so5308032ejc.8
        for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 13:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dKfZJzmgYM4v7FSlpjixVJeClMSClzb6wXHe0cNnptQ=;
        b=r66i3EYsscVfxz7XCSgGC05YmHMXJdD0NncOapBEAkmZMM4aD3M/5R3TZ2jedfim1v
         gTmBn9WAEw88TdyEISAdY4sioV/UESRKF2f/sgIWqK/w2r/+Nz3mhigXLj2VDI0R8rA5
         5LNQbi2zg0MWsrJN3tTFHsF9evI17yWYkeVYYeIkAGqypUP5/O8MBYIUGQ9iCxUbJfVw
         rb2PXUl9j/AzcnAi15VWHQG4IOSgt513j1F9cT4ovhcxU+I5kIOkVb4SjW+tKa12FvbA
         rTYX8Y8T6JvRkPGdIlFps6Ht3L23ywkfVACjPLMpYmtkHRDPqsJh0+Wx978fQFO0cgM8
         vKYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dKfZJzmgYM4v7FSlpjixVJeClMSClzb6wXHe0cNnptQ=;
        b=dGX4wHt1ICyPYp89w6mbwK8wBSzJlAwNOA+YviGyc8XUmJgBJeAPb7aQsu5Mqi7wu8
         5S8tNurqLU3jIOUYXUbDeVQfRYzC0FFGsM8dzHQvZG8ZlZNaT+24fa6M3GgaBtNWoaaz
         T6OF9Z1uhbirrCUGaWSAchzrpsDWpkBGZ/Xw42XlTuGTlqctshb6WFYWzeptCjNCS5Go
         JVF4lNfkOmgDkdAgKqpBDxNytqJS/AylXy+zvedKqckpNTF5KKeuMcwgIzpKfCpFLopW
         +McRfQb0bmSnOnwM3xCUne5vEeejoB+sxP0oawtauQ79OG89X0Y/ftYhUx425heK+CRd
         agGA==
X-Gm-Message-State: AOAM532JszzzJvX58LkUYQQpVcfKtMZKS9cdN4wYHOWr0tHjwL6cM9ht
	cEAnLBSG+ii9klpAgXwwvf0=
X-Google-Smtp-Source: ABdhPJxjl+tW9A98iU/72hdTmj5eoft8okJd6zdND+L4+tVIjKc+eFMWJhBBvsBIMxsUhLmJGyHbdQ==
X-Received: by 2002:a17:907:33cc:: with SMTP id zk12mr6230838ejb.168.1627070718886;
        Fri, 23 Jul 2021 13:05:18 -0700 (PDT)
Received: from localhost.localdomain (host-79-27-97-200.retail.telecomitalia.it. [79.27.97.200])
        by smtp.gmail.com with ESMTPSA id p3sm11563422ejy.20.2021.07.23.13.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 13:05:18 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Martijn Coenen <maco@android.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Christian Brauner <christian@brauner.io>,
	Hridya Valsaraju <hridya@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH] staging: android: Remove set but unused variable in ashmem.c
Date: Fri, 23 Jul 2021 22:05:14 +0200
Message-Id: <20210723200514.10139-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove variable 'inode' tnat is set but unused. Issue detected
by building with warning option -Wunused-but-set-variable.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/android/ashmem.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/android/ashmem.c b/drivers/staging/android/ashmem.c
index ddbde3f8430e..606e988d3f63 100644
--- a/drivers/staging/android/ashmem.c
+++ b/drivers/staging/android/ashmem.c
@@ -406,7 +406,6 @@ static int ashmem_mmap(struct file *file, struct vm_area_struct *vma)
 	if (!asma->file) {
 		char *name = ASHMEM_NAME_DEF;
 		struct file *vmfile;
-		struct inode *inode;
 
 		if (asma->name[ASHMEM_NAME_PREFIX_LEN] != '\0')
 			name = asma->name;
@@ -418,7 +417,6 @@ static int ashmem_mmap(struct file *file, struct vm_area_struct *vma)
 			goto out;
 		}
 		vmfile->f_mode |= FMODE_LSEEK;
-		inode = file_inode(vmfile);
 		lockdep_set_class(&inode->i_rwsem, &backing_shmem_inode_class);
 		asma->file = vmfile;
 		/*
-- 
2.32.0

