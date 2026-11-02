Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793628288;
	b=NLyHCgenUEfTj46qLomgcGVVCU2LULsERfR7mrean+FjvCwgFGfy9ENm52r6fc4cJnDg
	 LMy7C08PkpeBcZJmHk0Q6Xii80Vii0TwrDGWmSOob/jk/A3Tc8ZejetcM61WRyQVTF6ag
	 sEg0cGGi+tnJgy35uwDD1exM7BYSe3Kx8zET71ZrDacIUsC4KmHa+pjuLXX80Nvbk6V9g
	 2d+7nq7Kt2fqPvxhk9mEhLnaJGmKQsN8Sh1pUH7wFkOuD0c4uIoHiBjrpmmapZa5y0TAF
	 GY8U2roicpuuAnuZOnemtX7q1pJ5cnLsB6ft1zjFMmatg+Igy0/ZBX49LU3WrT7eVng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=D5tqyyVkof7RtlNlJ5JHbIBnf1yP7JcExQ+TmA9lfdU=;
	b=RzJPnbvHp2SEY879ymwwukwWotzL7KOkNxeRokoTGtvx98uMIc1aNhKo34uJwCIplVuB
	 7efdIjwKR3nxo34DYBl99aIpUVsrugtbe6VfA5IRpwfT0eUeOdJ4F1MYRL38YL0fIQjA+
	 49WlOuqQqbTuXHaTxE0SktFQik6McQWH+eLpKpZsHjhsRRi3StRCD3ceebFbB04EV39o0
	 uqAgjzEeNGHwNNkEC9fueuHrXXtrnFBn46fNJBMJ/wNpVDxdnl1WF8ID7C1qa7McVKOFo
	 YvD+d9n1mSgnP8ZFklpoepe+HMxowSS/1XQO/7bulLZ4tnkiMu1iGTXZY3Yq/H0Q+vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JRdkWeDP;
	arc=none smtp.remote-ip=74.125.229.138
Received: from mail-dl2-f10.google.com (mail-dl2-f10.google.com [74.125.229.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E0F606A331
	for <linux-staging@lists.linux.dev>; Mon,  2 Nov 2026 14:04:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1E0F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JRdkWeDP
Received: by mail-dl2-f10.google.com with SMTP id a92af1059eb24-143601f9f98so791268c88.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Nov 2026 06:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793628287; x=1794233087; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D5tqyyVkof7RtlNlJ5JHbIBnf1yP7JcExQ+TmA9lfdU=;
        b=JRdkWeDPe88LEwZcpUc57JBjp5+3Axq6y+o++gti0IgzCkcUp3yWF5Y0e/aepqiaZU
         INxr0UQw1r9YS0u/kDrn+5iCqw6BwPPW2ovROK967T3/C22fC9UQ2yfFXg/qvrbrzSf4
         JDAjWxdVPO7ePKnQBZC4dxqw7Nj0CTzu50MfeL7Foe6cJmiVo97Z58JYiU7HZlvbNfzv
         NpjuRBFKkrabUEfE9QH4Ok9NXm4W9WUSaelwAX6gWPlch/Qv44hk5jxsbsa3oA9ZQecn
         aLm0ISYoexyAdTe2ESSHRqmTyRt9XUHbGGok5ZzLDEoPxHFb4EbRRd0xhoGqe2G2WOq6
         +NkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793628287; x=1794233087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D5tqyyVkof7RtlNlJ5JHbIBnf1yP7JcExQ+TmA9lfdU=;
        b=Ioaauw/VDP6iMVYyOKZnKt/J6/b8SfUSwcT9Rodzee7hBq0PfD0uNOOvUVXFIoD0Vt
         GUBg72WV+4hamrdwgjogjqF8ukgrx4OCv7OZzz+XzzHFZoO0aalFIojcG7YSYBBqVctd
         1JTuxrtlgP/1Qr0zjDxfhXkINHVXaED+j8eTsyWOEGevnZUkZlnnGppqrBPUMpGMfIzF
         t6mTbejGzM+H5EGc6C9LiwhxTudoU/uFJUY1QPiMhfg9jblL8FuCqkS+0rFbXl1qE2Li
         02QDWYNBKuC2Vhv9BJz5X4gtL4ozBS8bVlmh9yb8PhBrDvIRobUPqWnIXkKUFddpu8eR
         UZ4g==
X-Forwarded-Encrypted: i=1; AKwUvByuPkRUUvEd2jS5LKVz/DOwiLjB4olKPeL2CiIzCNeZyEhS2b5oVkyUt9GE3hhF7WCZ6ivw9cV3rfJNpdLv@lists.linux.dev
X-Gm-Message-State: AFq9FYJGkoje5XsxvJRVkSKLHRrgkSDeHHH6vJiOvOfYARx2uViIQbh6
	SeN7/yemuI/hcL1V+iKJej1yEqPcqSeXraIx04aDChuCpz9LD22mEgN6
X-Gm-Gg: AYBFou3AcZ8v87hrA+YWnRbKBBfLSVi/30na4EgudCISGQc5P29LOK3+xtllBkyLd/S
	8anmL+NnS++BCEiFHR2B+Fp54AennModhLF+a7nHmdObgdjKl+wsTSIRBUcyvG79F2lSIW3yLoo
	xLXV/mU7IoSD9pQypCdq1MFDTTEd/Q0iwzgV8aUh0sy5Dx6683ohpoHOJGsbd4vcreR8i3f2qXi
	GnTsXKK+/at1ZvoVDGWt375Pmx84WeKgW96G5XAzgFW8xJzT9MdGYG//rGN4F7FgNi4Ejg9u4AI
	aT7iAzqN2MavvnxNPFyVOlwbz9hNUkBQPvm+Oms7MjNM2KvaTgacqV8YLXsL2Yb15rNuhl7H1j4
	KG+apPjZbYLx6pp3jVWOSMzKnkA30YARQB3r/ztQoBHWIqMxVZYUDOxjHermCsZz8tc7glnBjei
	XrdgF81mn+EIHbR1GKHq2PGKyjIlS7XNTKdDn1Yb3szfyIDKk/U9OOpSVmmk22AqjLE4abrm/8+
	JlVHY3Ick2IekS0jiKyrOQwvvwf7PZ0Q8HABMlHJCI8jJhdiKeK1Et9lBWMg+plPAnVsU+as6Bi
	B/Wmh3MeKZjpETUL2mQL3mpjvO0KFaXuVmNHz55ULyMF54T0CUZ2kDOCkdKR
X-Received: by 2002:a05:7022:120c:b0:164:8e14:4939 with SMTP id a92af1059eb24-1ac59dd190bmr13232652c88.10.1793628286706;
        Mon, 02 Nov 2026 06:04:46 -0800 (PST)
Received: from WannaCry ([2405:201:a418:c1d0:90a2:f39d:9eab:aa4d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1aed79b3dfcsm34153611c88.12.2026.11.02.06.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:04:46 -0800 (PST)
From: Adhyansh Verma <adhyanshverma2010@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Adhyansh Verma <adhyanshverma2010@gmail.com>
Subject: [PATCH] staging: greybus: audio: add newline to sysfs_emit() in show functions
Date: Mon,  2 Nov 2026 19:34:38 +0530
Message-ID: <20261102140438.103135-1-adhyanshverma2010@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Per Documentation/filesystems/sysfs.rst and kernel conventions, sysfs
show functions should terminate formatted attribute outputs with a
newline character.

Commit 14c91651df34 ("staging: greybus: audio: Use sysfs_emit in show
functions") converted sprintf() to sysfs_emit(), but left out the
trailing newlines. As a result, reading these attributes in userspace
outputs values without a line break and checkpatch warns that
sysfs_emit() formats should include a terminating newline.

Add the terminating newline to each sysfs_emit() format string in
audio_manager_module.c show callbacks.

Fixes: 14c91651df34 ("staging: greybus: audio: Use sysfs_emit in show functions")
Signed-off-by: Adhyansh Verma <adhyanshverma2010@gmail.com>
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
2.56.0

