Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793140305;
	b=HBqvJ1GaFgi5FS67ODmwyu0LP+H+dPg8ZTsSxp9zAttGcGqJg6LgYpE+JHsdDbTF0s5e
	 bdISJtRUgK7z/wuLe1lMOgw2+h3jwzGLvSKttzk75LLXhKglcqaGNnLqJgptknV2wbdzW
	 ngMXwlWBBTPp3QyYQ+o2CQQeFjSswivPshKXB3hsfBf0AVqKw4FVOk0F8osXrSmayeBZX
	 ZoNmiev0F/0GuIYxgKvUEIFeuMQLTtJRhDjmUlDcFfMKyTRu3L9q79zQ1pliNKJIP1Qqk
	 ppfm+5mLj4Jshtc7ffhPpVrq1kfTFKwrOGaepiO9tI1X2lfdVgjzIwdimV76ZT4nSUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793140305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=GmMf6/Yc2+e4ZlwlsDHIJgahWCehJGXamjw2nPYFOeI=;
	b=GqNdqYzD/U8mDz4zOAh28DI1QImhOwJJoyO02e9/HkuE/brRWzPfcsLFLRldKl6mkHgD
	 PjySiKmj5mrhxoMgvAIdtsj5+t0peGibPgtCQBk/ZuuNVBzXlp+N+opyXNkSriqR7LaUo
	 we8qGMZkrCd5/HqB9NGWIe79ICrTJPAsQGnz4X99tTMQAvU05ONl3VyjR0GiHh0ty2BXb
	 a0JnnoirpDpTIoVS0ANVG7uXEQelmCLmfzF/dP2zTjcUz1Mv1M4Om4ftc45qpl7SC4yQ2
	 Gy0OaUaLB9WWRe7XFdZeXIj2Q9yU3CuPenFGg0I+zpv7ETbVMu1DG4o3J/bAtuB40YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ETJ8ZOnd;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B94606A326
	for <linux-staging@lists.linux.dev>; Tue, 27 Oct 2026 22:31:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01B94606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ETJ8ZOnd
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8ab395abf79so3301617b3.0
        for <linux-staging@lists.linux.dev>; Tue, 27 Oct 2026 15:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793140304; x=1793745104; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GmMf6/Yc2+e4ZlwlsDHIJgahWCehJGXamjw2nPYFOeI=;
        b=ETJ8ZOndR27T2PEh+3mo7RV/5n3Dmv+j1kekzUoY7IO/9cSkY5he++X5HrI581h2yP
         hFcPe4X9WTMaSpD/TxQRpU1j93UXfP/bkKEVCc1O0OKe2yfxCWwFtrVFmkbn7Lnz2r7E
         3FPoLJnWePpqjw7mYk9l+ndAd9BtXVDlcL8M0mcnDNvTHCKdDlpA4zk/uzMHhJLDOxdM
         osI+Pg9qCjfzLpzylVaHu8k8P0kHN2AKcuqXRLel5cm2pOX/D7s/Vpfs9jmAMSGP7Qfb
         j/PT1b7grY/9PR7To6JUJ6x9S7fV5Fk3OjAwmSYFpqXQX3tcNIURtbS5YPDKnfFYm2JP
         aX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793140304; x=1793745104;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GmMf6/Yc2+e4ZlwlsDHIJgahWCehJGXamjw2nPYFOeI=;
        b=Zi+EyPEUz0u2VIDc458dO9E6BhW1RVLK/TaoKCAdm+lJkuAUbMyx9g1I+Kwv9hUHL4
         +CmrW7rDFOFLJlFkXd8fkK76NDE1xJpRtEcj3YmmA0M/XbfPxptRvZdz/ks/cGLaMYE9
         mif8Fam+H8Ppfvn37D2cmfXJ6RV8twL2MMcuPCQp6ToTk9ic/uR3BCa+5v6lW6NHqUjd
         FLuH/2No0uUNTqPhnmMYT+tKj8YlxUdiP0iY1IfIk7wfaXiOmczCTLyBwf+RV64r/JNK
         ESsPzrEHXmKvD2zCiq+EBchecWYhMCvxfBIosAdTAwo8x+tonR8werUPLfGEnSAF9rcB
         J0mg==
X-Forwarded-Encrypted: i=1; AKwUvByMlcmNMacTeOQ3pYlbNvPigTKhvnYip9APetr9LU3XjnFijkA3cAWmM8zu0zkbxCAhI0K1FLO6XoIwnqQf@lists.linux.dev
X-Gm-Message-State: AFq9FYJcynVROzDaRLeQekHaQ9/obc+1dMSLWNcJ4vIEjfOXHntXy4Fa
	zPiZduKFs4JkmBsSOlgjR+lVaCckHXgTTdyjcwwdQO38gGOMbd6mRMmC
X-Gm-Gg: AYBFou1MsRcLar3Fg8Q9U6D77RR5BcKoLOSIoKQemWQQMWOU0Y2gdecSA3EzptRwg7W
	Esv+nSDGMliPfufU2QPbYFHfcWAtC83zzuwvmY56rc+x0AVSJcEn8anC+SW8SgCtbsaR+jiCrFi
	wrH/0GFkOOmKq5R+1+URiSndqZkspLdUkcMQZNS+BqeqRGvrVerDKPzCW5pammWJd0DHbkQkWcr
	4r3NjTcSV5gf97zb9H5B9e/+u13miXR/DIXyHq4MecZqHUV4Qi9TL5EgfIbn1WlGF7mPLSxbRar
	A2bR49XjaQ0oUD85soWZD3bu+sAKNjqxJoBRE1UNw2017f+K4jD4DIAXxaH+Ivyqi6bhLACprUK
	39nzEd4NYjOwO1Kt+vH7mrFR6gOHJva8ZoY7fBIQkFjYcryeTCvJyrrGUd2dRK8P+Zi5ncBN+pf
	pMVDYLiTRbwDEsc2b4HCVNDXBF/PBvVVcpNvzGn3hDRjkEq5NGi8FM6mazSuMxRsSAXrDo95C+e
	QKPJXmNlVNPfYvY2PVnjC2SZ7nMlrHNZd+4Nkvaqx4ok9lRCPxM7OvAHqaf3e54raIUpQ4QWpi9
	uguZc2TNEg==
X-Received: by 2002:a05:690c:e3cc:b0:8b0:a587:9447 with SMTP id 00721157ae682-8b1b5cb50c8mr3976187b3.38.1793140303920;
        Tue, 27 Oct 2026 15:31:43 -0700 (PDT)
Received: from daniel-HP-Stream-Laptop-14 ([172.56.72.116])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e61d044sm19252777b3.39.2026.10.27.15.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 15:31:43 -0700 (PDT)
Date: Tue, 27 Oct 2026 18:31:40 -0400
From: Daniel West <daniel.west.dev@gmail.com>
To: vaibhav.sr@gmail.com, mgreer@animalcreek.com
Cc: johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: greybus: Add newlines to sysfs output
Message-ID: <auEmTBqbAPvMLRcg@daniel-HP-Stream-Laptop-14>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From 6376e59cb4d0fa2d57ff7f4fb2ce6cdb8bb1d03a Mon Sep 17 00:00:00 2001
From: Daniel West <daniel.west.dev@gmail.com>
Date: Tue, 27 Oct 2026 15:53:19 -0400
Subject: [PATCH] staging: greybus: Add newlines to sysfs output

Add terminating newlines to the sysfs_emit attributes in the Greybus audio manager per warnings from checkpatch.

WARNING: return sysfs_emit(...) formats should include a terminating newline

Signed-off-by: Daniel West <daniel.west.dev@gmail.com>
---
 drivers/staging/greybus/audio_manager_module.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index dc90cc2d2308..5737f2a32f5a 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -75,7 +75,7 @@ static void gb_audio_module_release(struct kobject *kobj)
 static ssize_t gb_audio_module_name_show(struct gb_audio_manager_module *module,
 					 struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sysfs_emit(buf, "%s", module->desc.name);
+	return sysfs_emit(buf, "%s\n", module->desc.name);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
@@ -84,7 +84,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
 static ssize_t gb_audio_module_vid_show(struct gb_audio_manager_module *module,
 					struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sysfs_emit(buf, "%d", module->desc.vid);
+	return sysfs_emit(buf, "%d\n", module->desc.vid);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
@@ -93,7 +93,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
 static ssize_t gb_audio_module_pid_show(struct gb_audio_manager_module *module,
 					struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sysfs_emit(buf, "%d", module->desc.pid);
+	return sysfs_emit(buf, "%d\n", module->desc.pid);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_pid_attribute =
@@ -103,7 +103,7 @@ static ssize_t gb_audio_module_intf_id_show(struct gb_audio_manager_module *modu
 					    struct gb_audio_manager_module_attribute *attr,
 					    char *buf)
 {
-	return sysfs_emit(buf, "%d", module->desc.intf_id);
+	return sysfs_emit(buf, "%d\n", module->desc.intf_id);
 }
 
 static struct gb_audio_manager_module_attribute
@@ -114,7 +114,7 @@ static ssize_t gb_audio_module_ip_devices_show(struct gb_audio_manager_module *m
 					       struct gb_audio_manager_module_attribute *attr,
 					       char *buf)
 {
-	return sysfs_emit(buf, "0x%X", module->desc.ip_devices);
+	return sysfs_emit(buf, "0x%X\n", module->desc.ip_devices);
 }
 
 static struct gb_audio_manager_module_attribute
@@ -125,7 +125,7 @@ static ssize_t gb_audio_module_op_devices_show(struct gb_audio_manager_module *m
 					       struct gb_audio_manager_module_attribute *attr,
 					       char *buf)
 {
-	return sysfs_emit(buf, "0x%X", module->desc.op_devices);
+	return sysfs_emit(buf, "0x%X\n", module->desc.op_devices);
 }
 
 static struct gb_audio_manager_module_attribute
-- 
2.51.0

