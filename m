Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDC03093BC
	for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 16:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771863398; cv=none; b=TLTkGRRxq+lDvU81vRlh2/NyyQ5ep6E7ThKn0crFbplVYBY47PvivF0OhUSGuthMg3pqVU2Ov8C1inx9amrFouCYKGONHs3kI0nzpzHk8geoP4xND7m/vEelsb7q/7to8ihloh2U4PHHLtRjsG/bbelKhM+ZxGI8U2SdZv259I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771863398; c=relaxed/simple;
	bh=z+2dHg9Qs0pfGWaWonIY+4WKMbnuU9UhcdPvSsbbaSo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SDXmCAHP1cWDCf5PrLw3zIRfcuThkl7qSzRZQYWHbKZrkUUVuAnc1BMJT1uq1GUUaL83/pYMX39yzGzXqf8XyI4kpTpPxtHAqJh2tFW60dhLEo3riOPBxMEm6B990GGrN+nJLy6QSUG7CSHKgcotaZ6XUtLePRaE1AWA+yG0GYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=asQL/uQC; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="asQL/uQC"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a8a7269547so42417365ad.0
        for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 08:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771863396; x=1772468196; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9h/B+Ic9Vm3Lym35kv4S0L3Iob6GiyUZC8duzFM8IG4=;
        b=asQL/uQC2+/1TUAoi9CBGcjdFF4Sjayo4gU1llMfa+weYBT8d1qhQagX2WrIUlBSgy
         SIBD1SCsCEiSZk6Z8DIJR8LjQVwu5lcIUhF23kME7yt5eH2g8t0xFTO7mRaQM4vu4C58
         SwuyCWxlrTyrOZfCAzeSXJZboPA0YKX9hVkno8I4AUmXQlGc8zjT5ilBTXPOpbItue1X
         mH0VdzQQbGOg3ZXhF1hUxh2Ayahz4tnlcTr1yL3DgbmUPNCiyeD8FdRDJ44Ldb+XxsWJ
         UVQGgFn6VZr+Fd87kUIY2ICFK27A81ZtEPkbty2tdTeA0lohrHouB8wx6gIsofSrHKQE
         lqnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771863396; x=1772468196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9h/B+Ic9Vm3Lym35kv4S0L3Iob6GiyUZC8duzFM8IG4=;
        b=W7h8Q/AetU7ZwQ/lKHolvaJBbIoRc6H1ws6VQL3mY8AOucoU0jeqbnUtxL2iJqoXEA
         dLLS32DA8FTwRgAplqrp7+KXRM46VvNmwg+U0bk6Cf2ofsgP/8mbiBtXYWzRpyLrjKpO
         L0LW5hFo2UunIUtIsaEmY6U12dH2/RRUAbNDVqrbMFm4ndNQjLUOSSiiMphE6oqvpjQg
         GT+RMo7Uw7YI6W+GRCWglMplsByueOfTI7VDO8XIU+sjGo6F/7eFND2yKLMOaxiES6f0
         shGTw3uPdXOPLZedlOd8I3+H/HwD0zyz4gDIH5lRc+GxjZWob8Ox7FO3Qb7gL/W6lQ5l
         CH3w==
X-Forwarded-Encrypted: i=1; AJvYcCXNzXNp3RuLtfZBeuq8xqMCk9pJXdOj0PG70mt5msB7HplWyefwP9cojj68i1OC4qg16FHPcF/lPw9Xsy4n@lists.linux.dev
X-Gm-Message-State: AOJu0YzlA5twj6KZi91rt/7FGlXYs145v8+8FBB7ElDzGON7WbpMkuWd
	hdAjusuiG1ipzuAnReeOjGwtNuT/14lB5Ua8OEhAfcVohVCpSIgAdNc/
X-Gm-Gg: ATEYQzzJLEYGuI548cJ76O3pQt8wPmHjcDeU/qO+4nGpukk5k1xUd6X5vBdBChfIvzW
	GOgiUby3ue674C5otJgPJ+8UbkL5sL0BJ9WrTxAb0XiytKz4O0r1H0/jyOIJlTb8uLcRGp2zUXc
	3qlDozOSPvlP+eysvtsZ/bXpqyIC8ryyiTGflhGc3W3ZjbEnJ4LhUl8XvFoApNE1hBikMASOS8l
	awlpBS1DFbW9m7lsnY7OXGpInF2ugYmbI7tF6C4LidVjQLJPmhcixwjG/RlcSxFh96dioymZ1rP
	s9XngeZZwB6WNmYJZPIQRNedCpzg9OYgK2lfReOieVGUPGupb37zrgLkxeRGLPyvdPi7m3PU8Re
	4rt3nrCNVtqFKIqd5UbW5/pej6Gyhm9Mk1DLoov9raGTpUffnvDyIDVX/7odNj0XnkdcVurONtW
	5tCd/3YReO15RO6jtDR1b9FVqUfoYpwJfEzls=
X-Received: by 2002:a17:903:b90:b0:2a9:411a:c5c6 with SMTP id d9443c01a7336-2ad74511698mr74043325ad.39.1771863396259;
        Mon, 23 Feb 2026 08:16:36 -0800 (PST)
Received: from fedora ([2409:40e5:11e3:f079:b796:44c2:7e10:cd23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7503fdc9sm82095665ad.80.2026.02.23.08.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 08:16:35 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: [PATCH] staging: greybus: audio: Use sysfs_emit in show functions
Date: Mon, 23 Feb 2026 21:46:10 +0530
Message-ID: <20260223161610.8596-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor sprintf to sysfs_emit in all show functions of the greybus audio manager module. This follows the standard kernel practice of using sysfs_emit for sysfs attributes, ensuring consistent output formatting and newline handling.
---
 drivers/staging/greybus/audio_manager_module.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index e87b82ca6..f22ee73eb 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -76,7 +76,7 @@ static void gb_audio_module_release(struct kobject *kobj)
 static ssize_t gb_audio_module_name_show(struct gb_audio_manager_module *module,
 					 struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sprintf(buf, "%s", module->desc.name);
+	return sysfs_emit(buf, "%s\n", module->desc.name);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
@@ -85,7 +85,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
 static ssize_t gb_audio_module_vid_show(struct gb_audio_manager_module *module,
 					struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sprintf(buf, "%d", module->desc.vid);
+	return sysfs_emit(buf, "%d\n", module->desc.vid);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
@@ -94,7 +94,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
 static ssize_t gb_audio_module_pid_show(struct gb_audio_manager_module *module,
 					struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sprintf(buf, "%d", module->desc.pid);
+	return sysfs_emit(buf, "%d\n", module->desc.pid);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_pid_attribute =
@@ -104,7 +104,7 @@ static ssize_t gb_audio_module_intf_id_show(struct gb_audio_manager_module *modu
 					    struct gb_audio_manager_module_attribute *attr,
 					    char *buf)
 {
-	return sprintf(buf, "%d", module->desc.intf_id);
+	return sysfs_emit(buf, "%d\n", module->desc.intf_id);
 }
 
 static struct gb_audio_manager_module_attribute
@@ -115,7 +115,7 @@ static ssize_t gb_audio_module_ip_devices_show(struct gb_audio_manager_module *m
 					       struct gb_audio_manager_module_attribute *attr,
 					       char *buf)
 {
-	return sprintf(buf, "0x%X", module->desc.ip_devices);
+	return sysfs_emit(buf, "0x%X\n", module->desc.ip_devices);
 }
 
 static struct gb_audio_manager_module_attribute
@@ -126,7 +126,7 @@ static ssize_t gb_audio_module_op_devices_show(struct gb_audio_manager_module *m
 					       struct gb_audio_manager_module_attribute *attr,
 					       char *buf)
 {
-	return sprintf(buf, "0x%X", module->desc.op_devices);
+	return sysfs_emit(buf, "0x%X\n", module->desc.op_devices);
 }
 
 static struct gb_audio_manager_module_attribute
-- 
2.53.0

