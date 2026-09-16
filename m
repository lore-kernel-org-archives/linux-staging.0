Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15794B405D
	for <linux-staging@lists.linux.dev>; Wed, 16 Sep 2026 15:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789574360; cv=none; b=sqFtbgjLMfB5XdlcMAkApv6diFBX/ZDiCcAr938Nrr4baQqqEqma+DttgZwGfAftl6LokmO5RomMPVx2OrCU3RhENW4pIVtntPc2O4GwFo/zeEq+WxClZuhyp8QnkZ95+OL0dcqfMep9znd/hjGnCvQ5buabzZU11MVUqewtViw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789574360; c=relaxed/simple;
	bh=kMWns+AkkV19g2ntJ9Bt4GZvg34B01WvXfsnBIlnUys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i8GF9XUPFZc/jQU3md/slmZJGmEP1Y7zkp4deWGtYSByaxipyQFjAlzv3+YCTzSMJyLmN4QAf/skj+MdESUxKmioFQne+hQ9Y5r+ZdSAhAlm2YF/U1wxEsVtQaFSW3KhsUSvXmRNq+A6bUv0URe2g3MmFom7rqMeZiTkCPPGqgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AC60oOOq; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AC60oOOq"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so8640795e9.2
        for <linux-staging@lists.linux.dev>; Wed, 16 Sep 2026 08:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789574346; x=1790179146; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=50E3YuEZXofIUoMxdIwnwVu3+9GJoeNTgmZl7PziNLU=;
        b=AC60oOOq04qcv/yeNBjli58s/LFCP7WycdubCl7Yu2xkJFo6W5WXdpbqL2zoIfJJp9
         eNkgGyJZBlA4HT46QhJptSDXurzso2fx5T5Qsybz8dtutVtvAdRU3BsH3gU4ys3yMX9K
         NB+IlfofE3iYmKHlgioYRu5h6qiYmaA8ZwzUhiZySXns+gXE4Rt90DGUADkfAAaxrLue
         pRWSjkhB3YcsBnfdn+D+sunqdQZSS6bzRqzDrZ8r7sYbI8M755mTP6jM9GEIwNaigNEw
         f/oU5ccGOBGfpJZUoWjyWtBMNPlemZ6jRsU1u9GU/gV25DbX6FrK3Cqq3j6cDMMeUR9j
         Q0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789574346; x=1790179146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=50E3YuEZXofIUoMxdIwnwVu3+9GJoeNTgmZl7PziNLU=;
        b=QEpqhGuopulh8/SZjLa6jGPR08gKkDLlutGpo/nA77tWkaT6PEqiwbQZvNKVnNjPIF
         WLOLl3TgZtitjIAUESbed8YdgxnoXycYcJ6YLwBYMw6oCfKlO4rxtifcTPFdLaxM1oZ6
         MEYV9kc6CzoI662cDv73MDykU+L5MU9jo+RBeFygB79g9nkmFpu6/QEKEQuBbpNuCIlF
         ZMUYT2wbYxXbrlZ1SvDe0w8gbjIjWMKXw3mdxcyj/+dbYHeRRPINsUT3I+gVmhKTj45s
         /X2Nl0+Rd+4ehfEYyVxi5eF1quu3yEAeDnGdXctd5DEDUrFkO8iuP4WdysTodDzRqdvG
         0h1w==
X-Forwarded-Encrypted: i=1; AKwUvBxS9xaMgbtObmDlOA113L8ZR2L1pinoGeJeKh5WKeGeB61p0UUxeovxWlkbv4oOCaXdX2v4EkkGQQECUjiX@lists.linux.dev
X-Gm-Message-State: AFuF++mM7sMzyFttRRpj8/eupqxX0SF75N+29E0UdfGtDyIcL8dRsgKy
	vOhRbZpHG3McRaMtTdW9Z7XKGXLOln9sWKXi/h3ZfsK8+B9UE3exVWon
X-Gm-Gg: AYBFou3XOlfOrhU+C6FneKSWgg/QtspxxMFQYE0+n3jw0wWAfYAKb7wTgKAFH9ujv7m
	hnQvR8xgzv98YGCpawlRm1UGvFkM9uFhfB3UFkHP4IMbGyssMx0EIPvIq+xhq7rHNFOb/PE5/EX
	OhzGWvwYRorlGEQJepiV/VcZu3VhVgH2PGcaXDkb3zhKVaPsL1qBPoThsfTfa0lTR7lsyTngmvn
	7lTeI2uW2WXhurokjqvKCmBRdenWUfXD1qt9IDcefC7+/guWoqULshQ9UPANs5oJDwUHUX78AgC
	zW9lxxfXFr58s52tijPvlxtUhTMroBU+TN8phSxhgB49pYhNCksTf4B+PT5UunvsCnF3z53uIWi
	5s7vK0zJUrVdeCVsqrobbLh3B6/KfZyxCW3HmMfameRoandfmF48Y5xlKIY4KUIihKqdgG5b36+
	im8A3bCsCoHrtlrYlFnZq77W/N9rf90hrCImnRNBEjSqa+rBaQODP3PJajG/mg5is8ZFec
X-Received: by 2002:a05:600c:4e48:b0:49e:663c:c67e with SMTP id 5b1f17b1804b1-49ebe991792mr42095035e9.25.1789574345830;
        Wed, 16 Sep 2026 08:59:05 -0700 (PDT)
Received: from omermac ([82.222.238.173])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd256105sm461075e9.14.2026.09.16.08.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:59:05 -0700 (PDT)
From: Omer PALA <palaomer100@gmail.com>
To: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: greybus: add newline to sysfs_emit return
Date: Wed, 16 Sep 2026 18:58:55 +0300
Message-ID: <20260916155855.9022-1-palaomer100@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a terminating newline character to sysfs_emit() format strings in
audio_manager_module.c.

Without a trailing newline, reading sysfs attributes directly from user
space (e.g., using `cat`) appends the command prompt to the output string,
leading to broken formatting. Including '\n' ensures compliance with
sysfs single-value formatting standards and prevents parsing issues in
user space tools and scripts.

Signed-off-by: Omer PALA <palaomer100@gmail.com>
---
 drivers/staging/greybus/audio_manager_module.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index dc90cc2d2..5737f2a32 100644
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
2.55.0

