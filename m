Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016DF18EA5;
	Wed, 27 Mar 2024 23:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711581729; cv=none; b=ZQH1tIB2xslRxL+hG9bej+/wheFZU7cI6tgrre3O5lXdlL9ttYORPykFJ4D6t81eMRWZmsBU2E2wd0s71O7Ynnnck6PsT/tZXpMn0cFk/APMiImdKzTC1rzyMHDNtnAQwfx4UZSLSex4G9Vm5SNqjNHQkvETg7DhYiGrxgSFzyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711581729; c=relaxed/simple;
	bh=genQle1dnjC/tcYAhJLWj2ZdmStfOip7SwdldmDZJ10=;
	h=Date:From:To:Cc:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S2x3Xsm7bo2jIXYwaLNYq4AYuSbuy99PWzA1SEIErsTGXdtbEXBw67972lEBUksJ3TTuZIPcTGqEejWE5/gfrTWbmVjzk5PNhczbYN/QwQ8HVXojzloX0VGmXXkbOn4fjNU4FosBvtzdIu6mW80fF6goQNvvzBTV1Lz8psEy+eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lx2/4UDb; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lx2/4UDb"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1e0189323b4so2873675ad.1;
        Wed, 27 Mar 2024 16:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711581727; x=1712186527; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+mD4qrrRfeWTdIqZYGCrVV289ijc09GRQuxlRnO0N+Q=;
        b=Lx2/4UDb24epsonH6SD4BgFBh9CN+pb1D9p1MJhN0QXD69lcp0HQ3Cyn7XHI0xSoQU
         lfAQSOXZuyG/WGogQzaSEAirnoq8aKCv7g5kgQex5XmsgmuNhOFuGH1UktY3GVlS33jn
         2J6RhozlHbgyw43SMRIMCmj4TxLf9QcuAP06qcQ6DiQe6OBhPLb8iMHquUYtlAJRcZco
         CKa4FF4q+UXeARO2C7lmRTJRs2Bhv7GgCl5j2UQ69li7qZIl8Max7puyyKigVyWSCDJd
         lnvEw/5PhTK43b30DRIP+jd5GSBnNhGf8SddksVvg4Wl9GWenkdMay9B/cQD/r2nnVps
         sgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711581727; x=1712186527;
        h=content-disposition:mime-version:message-id:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+mD4qrrRfeWTdIqZYGCrVV289ijc09GRQuxlRnO0N+Q=;
        b=KpjeZnqfAIZm0RIVVr+qS99enTHCwVjUJlmS53f4X8c78HHOyKaiLac4jPTBNsh48l
         Tvg99HZQ8BaRErRNM6ngWJ5hYCMUJPccAj5yWS4ZQfXgnLW0hiQKUNRIm2zCzN/1Unkt
         s2eMiKXb8dRA5R7893fFyIge4HKmK/1A1HUnEQL6ddCPwyW62nQXnFgVy+YHkqySlndO
         +MRZ+CPEL1tgRG8TfQtDTH+wlOXJbFgWkKltpWL307dXnHD5qMf/2Ngllu59TKP7d3IG
         Q2ZiiZbq/KoaJPLJqkJpQGH+eBRNnWkE7T6YeMhXSvLba1CR2uCOmp07+1ABxEtlMMVK
         n4QQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhhIZ+B1nI9RfBhDPEZQa/HAKpPzNeiYa/fE8ZDA2afc71NZJMzERBmCoxo5JROwSdfbyb6Vr57XHd7oIorAdk2yvnpcjojzD932gjGLZae21mk3JuRdUysOnLCGFevI5GzpwHiHO0vA==
X-Gm-Message-State: AOJu0YzAYMf7C80OsZsaiZ97Eg9nzt36qTkZQMcoEJxkA2lkrcF6UNYF
	e0A4MHxcC3Hy0+PONCFXh00sjZ97S2Sp9OfGv+khVQeJcMqIsLfp
X-Google-Smtp-Source: AGHT+IGZQaRcemCZ5KSFdtOfMK2+k/2WDtxscZha6+vWJRcDx88RUiNrhozYlw7oFmDM1u1K+KGTTQ==
X-Received: by 2002:a17:903:230a:b0:1e0:b75a:8f8b with SMTP id d10-20020a170903230a00b001e0b75a8f8bmr1607050plh.45.1711581727139;
        Wed, 27 Mar 2024 16:22:07 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.68])
        by smtp.gmail.com with ESMTPSA id n20-20020a170902d0d400b001d8aa88f59esm81649pln.110.2024.03.27.16.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 16:22:06 -0700 (PDT)
Date: Thu, 28 Mar 2024 04:52:01 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: fabio.maria.de.francesco@linux.intel.com, mic@digikod.net,
	florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	alison.schofield@intel.com
Cc: paul@paul-moore.com, outreachy@lists.linux.dev
Message-ID: <ZgSqGXDOg3CPZfaQ@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

linux-security-module@vger.kernel.org, ayushtiw0110@gmail.com 
Bcc: 
Subject: [PATCH] LANDLOCK: use kmem_cache for landlock_object
Reply-To: 

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

