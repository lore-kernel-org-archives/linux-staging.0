Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C02D15099E;
	Wed, 27 Mar 2024 23:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711581964; cv=none; b=NqR9PFciXqiUiOZiICwYmmsirSdlBLNHUlXseeSJ7sYqrvY5qvsBcKM7qcJHO3at5y2eE6JE6TJf9AEMlapn9s7S65e1sPOaGpGgsfjWhrVqEufZUdbg4TyQzIIgVV7iRAMMATu4BT8OzCzEFhDbc4JURh9k6cxrngfISxNQ5KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711581964; c=relaxed/simple;
	bh=PlZwKOxY2H1fF/5+DcCGrpjUWbv+K7OzN+L2CRgdJgw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fc+ebiieNVgKqI7sROZN83i+RiwIs9cE0kZM67WgWoTlbkUk4wDjYLh4/zbkL+ng5MGKSXPm898uYQ3AET5slEzB2RkG44pXtrVh+2TGETi8bhD4JZSR3DwmUNxeoKHVYuEpJZWE/dlPBKNZRiIG7/sybupil54GKekqcwMLwEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L1U86NPk; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1U86NPk"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1def3340682so3617365ad.1;
        Wed, 27 Mar 2024 16:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711581963; x=1712186763; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+T12fKZNKy57IbrXvGN5IsMMR+Ds6fYdnTifIne9es8=;
        b=L1U86NPkCWpiamM4/mlG8e9DI2BSHWiZgvCEHGeZ1tNQ9QC8cFNWjG/FugzI3+VwJi
         AaiHXkt43HGOTBuHoun8TWXTQF7W9AwLbj0h3viDJwdMcVjBxi6UHatMMpJTYj7wE9Yr
         7bfhkCocjKdDfFoN+taz/d5zqjAkR0Ygxclb39bZSrU6lhdqx5oBx+PqLwezpnWNZ7MD
         Bk6uOu5/wJbS67Y9s5lIsYgMYGmbMEQOKDo4tcRtjQ91FpqAZv2ZGvynu46R+gJyGEGT
         9cEOu16hkMKHF2ZSvWM3AFF0hmYxj/NVXpvTbt5n0moMeti1K0P2sCkAAXpKjmIjwPfk
         LQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711581963; x=1712186763;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+T12fKZNKy57IbrXvGN5IsMMR+Ds6fYdnTifIne9es8=;
        b=e8akZ8Z1p+vpvzZbWEiGGZoTXtEdJpu85+kwsOloNuCaH1t7MicbICMij0fUrLq4HV
         s/r5JU8Svot743dGgAznpf0JHyMwOViV6YMulYlhC07BVr7Oei3ENkyLI240d0CPhcez
         ZU6S1mraMf0dErEUz2VLxVBtwmKJQuDqw3jlcGVTsbvzYrz1/vQkD33Ef+zSDIg3fKn3
         R/AzNFWl5iPzM0Pqoe20ySVf7KQlVfpf96znrPwI1JINWEu2u7lzmDIH80a2C0H9YogV
         UhF8etRY/xbfVNYH8JmZNj9xWaEA8gQhyTGTZj3Mcd6waAEDNYh6W/6UEi8OH0lOkhw7
         PEjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuO8Qy3ypmMlKutlvsm8SqdXJoHgausv18QNyYT1dxunEIqsBFP8b62YBFIwn6UQtVYKM617oIXqcZEA4LdW1qySFcGj1SDjw6dtTo+w==
X-Gm-Message-State: AOJu0YwxmicUcFF6RqYpqwTmVKTL26XavVr04FZ6g68OJdoxiODPEHFV
	POjayTYbewuhchHOYQzFNCOZAgpqdMd480D5cG9ztWGhN/SV+76u
X-Google-Smtp-Source: AGHT+IFGmK2mHH1d0ldDTEZLVZxkzXuLt7pevdi4dU+j5vH/TEDCDM75FYmrZOE/gNxmbxDI5S4fpA==
X-Received: by 2002:a17:902:ecd1:b0:1e0:b287:c1d8 with SMTP id a17-20020a170902ecd100b001e0b287c1d8mr1432604plh.5.1711581962667;
        Wed, 27 Mar 2024 16:26:02 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.68])
        by smtp.gmail.com with ESMTPSA id f8-20020a17090274c800b001e1020d4070sm72877plt.307.2024.03.27.16.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 16:26:02 -0700 (PDT)
Date: Thu, 28 Mar 2024 04:55:57 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: alison.schofield@intel.com, paul@paul-moore.com, mic@digikod.net,
	fabio.maria.de.francesco@linux.intel.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: outreachy@lists.linux.dev, linux-security-module@vger.kernel.org
Subject: [PATCH] LANDLOCK: use kmem_cache for landlock_object
Message-ID: <ZgSrBVidW1U6yP+h@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use kmem_cache replace kzalloc() calls with kmem_cache_zalloc() for
struct landlock_object and update the related dependencies.

Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>
---
 security/landlock/fs.c     |  2 +-
 security/landlock/object.c | 14 ++++++++++++--
 security/landlock/object.h |  4 ++++
 security/landlock/setup.c  |  2 ++
 4 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/security/landlock/fs.c b/security/landlock/fs.c
index fc520a06f9af..227dd67dd902 100644
--- a/security/landlock/fs.c
+++ b/security/landlock/fs.c
@@ -124,7 +124,7 @@ static struct landlock_object *get_inode_object(struct inode *const inode)
 	if (unlikely(rcu_access_pointer(inode_sec->object))) {
 		/* Someone else just created the object, bail out and retry. */
 		spin_unlock(&inode->i_lock);
-		kfree(new_object);
+		kmem_cache_free(landlock_object_cache, new_object);
 
 		rcu_read_lock();
 		goto retry;
diff --git a/security/landlock/object.c b/security/landlock/object.c
index 1f50612f0185..df1354215617 100644
--- a/security/landlock/object.c
+++ b/security/landlock/object.c
@@ -17,6 +17,15 @@
 
 #include "object.h"
 
+struct kmem_cache *landlock_object_cache;
+
+void __init landlock_object_init(void)
+{
+	landlock_object_cache = kmem_cache_create(
+		"landlock_object_cache", sizeof(struct landlock_object), 0,
+		SLAB_PANIC, NULL);
+}
+
 struct landlock_object *
 landlock_create_object(const struct landlock_object_underops *const underops,
 		       void *const underobj)
@@ -25,7 +34,8 @@ landlock_create_object(const struct landlock_object_underops *const underops,
 
 	if (WARN_ON_ONCE(!underops || !underobj))
 		return ERR_PTR(-ENOENT);
-	new_object = kzalloc(sizeof(*new_object), GFP_KERNEL_ACCOUNT);
+	new_object =
+		kmem_cache_zalloc(landlock_object_cache, GFP_KERNEL_ACCOUNT);
 	if (!new_object)
 		return ERR_PTR(-ENOMEM);
 	refcount_set(&new_object->usage, 1);
@@ -62,6 +72,6 @@ void landlock_put_object(struct landlock_object *const object)
 		 * @object->underobj to @object (if it still exists).
 		 */
 		object->underops->release(object);
-		kfree_rcu(object, rcu_free);
+		kmem_cache_free(landlock_object_cache, object);
 	}
 }
diff --git a/security/landlock/object.h b/security/landlock/object.h
index 5f28c35e8aa8..8ba1af3ddc2e 100644
--- a/security/landlock/object.h
+++ b/security/landlock/object.h
@@ -13,6 +13,10 @@
 #include <linux/refcount.h>
 #include <linux/spinlock.h>
 
+extern struct kmem_cache *landlock_object_cache;
+
+void __init landlock_object_init(void);
+
 struct landlock_object;
 
 /**
diff --git a/security/landlock/setup.c b/security/landlock/setup.c
index f6dd33143b7f..a5fca4582ee1 100644
--- a/security/landlock/setup.c
+++ b/security/landlock/setup.c
@@ -16,6 +16,7 @@
 #include "net.h"
 #include "ptrace.h"
 #include "setup.h"
+#include "object.h"
 
 bool landlock_initialized __ro_after_init = false;
 
@@ -33,6 +34,7 @@ const struct lsm_id landlock_lsmid = {
 
 static int __init landlock_init(void)
 {
+	landlock_object_init();
 	landlock_add_cred_hooks();
 	landlock_add_ptrace_hooks();
 	landlock_add_fs_hooks();
-- 
2.40.1

