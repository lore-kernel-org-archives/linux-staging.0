Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6034F0524
	for <linux-staging@lists.linux.dev>; Fri, 25 Sep 2026 20:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790369666; cv=none; b=fs0czNnHJoOnutycsthAEbuTc7eq5XJhv0SUNioyLzL0UKE6XM+3yfxZ9SZ21AFPtDR8+LSsoUTLIT1Y73gcCiXSMNqUcvVm6G2EzmSgldestK6s+nsNNJe/On6yHuoAZFvDHX6AO+Ef6CEMDf8mPXQsNEKfTJ6i/CQzfTnu/Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790369666; c=relaxed/simple;
	bh=wMUkMpvxRdSIcgthlqnHNGgTyW2QNMNAXejshKH+PfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fEELyWEoAEzKfaVrjqM21Hd2oMJyOHEp4AMkcgJUu6aTer9Rbla5apfBFpEmCJvjRQc9P1KrGYMCpRTXECAkc8AMb5QTqKV8/AsclrJ5E70hPhqZcaAjdZvnIfsFB+nL5orMuD2ZkNonN/AWIUsVwN7GuYB3PWrbzO7AOsqoZIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ll2XZ2rS; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ll2XZ2rS"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e46a15703so1129890eec.0
        for <linux-staging@lists.linux.dev>; Fri, 25 Sep 2026 13:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790369664; x=1790974464; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZW1dj8PuZjyHIWZ7P5gBwoFvQLqjKYglx97PDSrLr/w=;
        b=ll2XZ2rSDHoR/Vs5JsDVCoZpBDwiJ7rkyVcvMLMV2GstfirJtiyldv54oUy7xzIKzP
         iJKe4+oDENSS8+4rzzbXPHNfsvNbQNhhbacv2bQ0COVTnvDAiCo/w7y9RDoElPrZrb6t
         TPL9yUr7/wpxLF8gzh8O7WUiVnmeDSJanOyJ7PyqKDkOQD7XmgkEQwvn+tG6snFKQdHG
         n8BR9nOezUKjLVuSweSEpZwxXV1f3qGpdgffCElVOWDFJAanRtAd6ybnkNFYnwvorXld
         znoMuWjeOD6c50gq6YQWwv8G5km1GFoXjmvPDJoDMsfZml3UyNuGifT4ipdfcRFNhFBO
         birw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790369664; x=1790974464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZW1dj8PuZjyHIWZ7P5gBwoFvQLqjKYglx97PDSrLr/w=;
        b=kK4bpxywX5EWfqdXwGBdsH7GLXQ44zuJ3TCOA97fd42xPz9AcvIjyNNcwK+1CwTIF7
         3lc8e6eChNwH2PjMwq9c0jcrQgvHBuyq8MTkNP+WiqK/M+fJDHuVcgSRcW6NvTggfipd
         9SHLhgcmb+b1K6nMH63V6Oe56zPmgJpCYMfpzY4BZnQDOZc66iw6Xpne+LrPQ36GmIMi
         Kds9RjDWp4dkVHcpmc0YQWq9+gf3mE9eBx3atXSx9FRDB8aHxj4NU3FI9QVE0O5VHgZE
         oUoZUdqnkZDCGTQr5L0WIsxIEbWHk+BvyWwbQm4YiPdVuczF5FywcYZwnRvHMkDfO5cN
         iuFQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2Kh3YH0jr21NFbLjLbH30/+A4HlM7yY1BMdJdRsET3/zEOcBSXtr9mFQQmnaAhQ0iJsVwQkWxO4LOIbPW@lists.linux.dev
X-Gm-Message-State: AFuF++kkWGEWuSAoe0pXKgPRouPB6YNFVlyy3h7V9c2tgnkuZr1DMqC/
	bJhq3kKm1t4cfPFrMyPAWAJUR5SUiAbl3zlsSbCGm/mvACj8GQj8/CMB
X-Gm-Gg: AYBFou3V8E7LHkShSEbxVnY2VIdQ6KNB/NM9GzQXfumgGhjZhIdb2Irg29UT0PbQOuG
	ax4KlCIiILrM5+dEgioQgMwuhzY9Py9xK/2XFq7tFoB7r+6W9XG7g5XMCTmrvgUV4ZcbbeVk1sq
	kQJx4ipGWkDZjxX+55K+D0azo3CUPYH2DzQKTbCr61oTEXNb2TYjBr2mT4Jcrd/ClfJw7QcD+6o
	Qki6f0EEJT2LjiDOk++v44ynimpN5FQ7ECUpwyUrdUBqfUUrYPf9k6HJO6VD+CixLNQGfV865y2
	Ck9fLmwNY8TsBFUSsdiqhiaU7C6mepFU3myTnClhjEC5qU+/VRsEPizPyWmNtkwCNm+qD0SNtLz
	77lIY7bIZyoyqQfMECDpzpkEBmAtB2NGBFUb+u+Z4ePqJR+UlQtEJ5FMjx8Dz6hFojqolbF8PN+
	KC2mx9xGWiihE11UArXzxM8FDUWGNxRbvtCWDxKs//lbGPOn/Ofo3lfh6JHgu7MfpvCJCktwtzj
	A==
X-Received: by 2002:a05:7300:7313:b0:342:39f5:f9c5 with SMTP id 5a478bee46e88-34270ac9464mr1657179eec.18.1790369663811;
        Fri, 25 Sep 2026 13:54:23 -0700 (PDT)
Received: from operator.. ([203.192.238.51])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144757747sm9437703eec.13.2026.09.25.13.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 13:54:23 -0700 (PDT)
From: Ashutosh Yadav <yadavxashutosh@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ashutosh Yadav <yadavxashutosh@gmail.com>
Subject: [PATCH] staging: greybus: add missing newlines in sysfs_emit formats
Date: Sat, 26 Sep 2026 02:23:28 +0530
Message-ID: <20260925205328.59183-1-yadavxashutosh@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to Documentation/filesystems/sysfs.rst, sysfs attribute show
functions should output a single value and terminate with a newline.

Currently, gb_audio_module_name_show(), gb_audio_module_vid_show(),
gb_audio_module_pid_show(), gb_audio_module_intf_id_show(),
gb_audio_module_ip_devices_show(), and gb_audio_module_op_devices_show()
call sysfs_emit() without a trailing newline in their format strings.

Add the missing newline character to each sysfs_emit() format string to
comply with the sysfs documentation and silence checkpatch warnings.

Signed-off-by: Ashutosh Yadav <yadavxashutosh@gmail.com>
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
2.43.0

