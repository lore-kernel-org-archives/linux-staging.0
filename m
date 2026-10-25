Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792961682;
	b=xdazgWvGjGQNim/dsZTKOyzr27f97RkOvO4S1r4z3TkIZtypThp7H/Sicdq4lA78w3BO
	 Te9luirhubRk1Er8KiDHBO5t9ykEIowb42gLYNOcvrnUi3WvDiMRI9UHFw6npmC6gKypi
	 WWXzskJLqz+5ECtn3UzeMBazWlRdKf4/Acx6dcvmozZ8YcADzeIvOdj3JAk0yBT4YFu1n
	 /4oisHG0CMIq1mJnJIgzL0wi7QYWKxH6dUrklFwQnejWgSOqqC6uJfRpYKY5MUgAMmtyn
	 b7x6XQuQJGlUuE6i/OI0dledaBw9sLOwIvd3/6r8uTYnaywPoPKM/QU0T0AQqJu0cmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792961682;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=oqmITmW3pS9CdMzOKLzGqbkrmz9WFICJjMYvdVyMmdM=;
	b=YzDKl8rFNZegsSVX8JtVJiXI/9l0SXFam2udYpEehHRQPI2GwJDZyAJtVn0HY0bJe/NS
	 A0/K/cGWkfCWuHtY6YAvw0az3D6XpjN5DKzox+bGBjkhl5rRPpR6590+DKLp4B8vNL/bd
	 xABeSpXpjXia2fUaPZp6YAUNXy3ZPOqxTwYqq1B9rJSrblNZIYPmCqRlao90R58kEraiA
	 U3oR6TBCSdzvERoVyIYScDuF9v3iX0f+2TUTImuj+GtM4Ri9LwxPF7R26KQY6ARpPOVJH
	 X5jEkSn9SEyMcvwwr/viNFzs/UQQF2H+ubrkCHfVlTp9Ryi33jp5vT5FBkWRiKb2iqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ianghel.com;
	spf=pass smtp.mailfrom=ianghel.com;
	dkim=pass header.d=ianghel.com header.i=@ianghel.com header.a=rsa-sha256 header.s=protonmail header.b=DUudvizN;
	arc=none smtp.remote-ip=185.70.43.170
Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1931606A31F
	for <linux-staging@lists.linux.dev>; Sun, 25 Oct 2026 20:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1931606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ianghel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ianghel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ianghel.com header.i=@ianghel.com header.a=rsa-sha256 header.s=protonmail header.b=DUudvizN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ianghel.com;
	s=protonmail; t=1792961678; x=1793220878;
	bh=oqmITmW3pS9CdMzOKLzGqbkrmz9WFICJjMYvdVyMmdM=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=DUudvizNLC/8OaBOKmfMlEkgr9ix+ymSFs5JYBEjm17OGUPyZLePQxV2IQibd+Icu
	 PDKfRcb4NYZGu7OIOwxMBBDevnPcFSvFNrnCwuZifvfRecle/JDRyRCOrQNxQBJdOa
	 SuGd5mR9a8TWR/iVbTz+QSk5d8qKV4bw35UNbTw/2f3Ph/rBqKi9NE0QnRn4vXQaQ2
	 FFbGG48IpA4AbCJprbL3KotikmdQRFNKXNH+cSlXADM2NIvr3CMiBOvyeEzy7453KH
	 yO5s2HHawZwcSMJYzWk59FVqW8OeyNJD+x2UlD/EF4sbKI+XuRVX0IF3qp3RUV7e8q
	 ZG5NCJNsExBzg==
X-Pm-Submission-Id: 4jCTXB2kSrz1DF7W
From: Anghel Mihai-Alexandru <mih@ianghel.com>
To: mih@ianghel.com,
	Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>
Cc: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: greybus: audio_manager_module: add missing newline to sysfs_emit()
Date: Sun, 25 Oct 2026 22:54:27 +0200
Message-ID: <20261025205427.259512-1-mih@ianghel.com>
X-Mailer: git-send-email 2.54.0
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

Documentation/filesystems/sysfs.rst recommends that single-value sysfs
attributes end with a newline, consistent with other Greybus sysfs
show() callbacks (see e.g. loopback.c). The name/vid/pid/intf_id/
ip_devices/op_devices attributes were missing it.

No functional change.

AI-assisted, Claude Sonnet 5.

Signed-off-by: Anghel Mihai-Alexandru <mih@ianghel.com>
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
2.54.0

