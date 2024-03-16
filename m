Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0D71C684;
	Sat, 16 Mar 2024 18:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710613467; cv=none; b=X3+pT2VNvGSFQzvoLqI9xAZPJXKzSa8J1Iy4rLQR+NxQ58DlXEGYMHbwRzF309S9C1NmoQYotxt8tnnsLuwgYYtPmf7Hjigi90crmhDd3dkCBlqg1UOZ+5Jdgb8dzLVn8FZNr9H/r/Yd+eSwQe6IYUyU8HF9XRId317dP75NUiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710613467; c=relaxed/simple;
	bh=kdtt3NzZ9nYRAP0wHMvXECy1vS+6sTci7jlAi8PaMwE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HpMnWf4GtSiAe+v3rewI5VuwRV6YoIWO7SX7Eapd3x3G71BIhkOey07rZVW1fiXv+OoJ5912RlBXVepNkGYgiK+vQxcsgJUEfxDD6BebXYEGkNMxR2YImv60dxBKfnfs4VbOYLoP+fKSer0sDR26UMPCfkBUAyeri825Qbf/69o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hytZyJGB; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hytZyJGB"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-221a2d0c5dcso2052312fac.0;
        Sat, 16 Mar 2024 11:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710613465; x=1711218265; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E09IXxgUM16xdtFyL0dx+eMZf9QOFWFcDsMglhoVD7I=;
        b=hytZyJGBqHH4Z4/zZexhFpMK1oOBLpNViJc/dlLXCLh4hfqo7NBfJGhkYxa+oqUxiG
         JvvmV9gq34/MOTP2Ty7Ff0arHvo1PHT1zQIMCtVs2Qlm7mla/8OdqPCDx+QFeRwyvZWL
         NB2o/fT9wsAt6khCTLRgTF+b87q4qp2ATEI1Q7+xuVqDd0lB0HVOKX2C8C3H/cdxRGje
         ncX6aOvcKrTSBa0CSl8h8ybQ6FTTxgJQk/VfXIRp21iNFvj9HjnbfzKRn120nxueWcya
         A0Q2FQomLtq7EKwzzUWnZ3r3nhaXbwBCiRNT/tjSSCUtSs+Dix8MfnvCIi8FCwAZAOwP
         Y6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710613465; x=1711218265;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E09IXxgUM16xdtFyL0dx+eMZf9QOFWFcDsMglhoVD7I=;
        b=QqSjy3w1OaubUPVF2P9uPqma7VvoIVwUuzub64/qipksiKqfGGJWIwBrwzXe6JLctv
         vBtVWDkjDRjZjn55+YLGmUV/blni2t1zjYf856OMVAtcAx3OAwxDBgjlf7k1yxyTHs3i
         WBALn/uP6IxRn86KRCZW+V2drgH3KDbAIYZYwdqkazD5snAL7w4M403R2udaxVeO6G03
         SYy/fWDKjKfiGCuPKJoFq7Ozg1zIMjDnyn4v2IaWmJbwGFtAXijUlZW0wT1ERWZCyd40
         dz26vvzcMvyLULAyTRK7Tik9z7ff6FSY5XJgO6XCYeB5vxyyyv7VNOEbQOdi+f2hShS3
         5T6A==
X-Forwarded-Encrypted: i=1; AJvYcCXnjHaqaYgjI/WnlP5yc7zhQDO7DhYkNF9GjrD5EOnkoGXFbNYSHJePxd0oxDk8eDoIodzqO694BJQwON5kt2gPb9nu2aQuCsPAcjT3YQ==
X-Gm-Message-State: AOJu0YzX2rkobEQOIITwFvWWxiq7xaqe52gHJqP/lgXQd92wsFKfsY8u
	wbr7DqyRfHGi5WS0EwFwHhvDTNiwyAxT/30DhDF+rjlwJHyEe+NMIFs29lxqEFo=
X-Google-Smtp-Source: AGHT+IF9I4AUP4qpAcKv2jcUOn6honDrtJrtCTWJyd3xHrUyfO+pv4YrLF7XdBNdWs4pLEOEir8TEQ==
X-Received: by 2002:a05:6870:2046:b0:21e:7156:a69f with SMTP id l6-20020a056870204600b0021e7156a69fmr8218616oad.42.1710613464644;
        Sat, 16 Mar 2024 11:24:24 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.67])
        by smtp.gmail.com with ESMTPSA id y71-20020a62ce4a000000b006e6b989514bsm5451616pfg.60.2024.03.16.11.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Mar 2024 11:24:24 -0700 (PDT)
Date: Sat, 16 Mar 2024 23:54:21 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH v5] staging: greybus: Constify gb_audio_module_type
Message-ID: <ZfXj1WkJ3nrYh3qL@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Constify static struct kobj_type gb_audio_module_type to prevent
modification of data shared across many instances(instances here
refer to multiple kobject instances being created, since this same
gb_audio_module_type structure is used as a template for all audio
manager module kobjs, it is effectively 'shared' across all these
instances), ensuring that the structure's usage is consistent and
predictable throughout the driver and allowing the compiler to place
it in read-only memory. The gb_audio_module_type structure is used
when initializing and adding kobj instances to the kernel's object
hierarchy. After adding const, any attempt to alter
gb_audio_module_type in the code would raise a compile-time error.
This enforcement ensures that the sysfs interface and operations for
audio modules remain stable.

Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>

---
Changes in v5: added more details as per feedback.

Changes in v4: added more details verifying the change.

Changes in v3: added the message that verifies the change,
as suggested by Julia

Changes in v2: incorporated changes in commit message
as suggested by Alison
---
 drivers/staging/greybus/audio_manager_module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index 5f9dcbdbc191..4a4dfb42f50f 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -144,7 +144,7 @@ static struct attribute *gb_audio_module_default_attrs[] = {
 };
 ATTRIBUTE_GROUPS(gb_audio_module_default);
 
-static struct kobj_type gb_audio_module_type = {
+static const struct kobj_type gb_audio_module_type = {
 	.sysfs_ops = &gb_audio_module_sysfs_ops,
 	.release = gb_audio_module_release,
 	.default_groups = gb_audio_module_default_groups,
-- 
2.40.1

