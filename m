Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CE9420483
	for <linux-staging@lists.linux.dev>; Tue, 18 Aug 2026 08:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787041074; cv=none; b=N3dvSmNnktHQVhvi+fLjKgkTKKMuoqhjRAXxHqDSJc0rJI0d9eiSuyGdhGtFumRrlNGefyPQzfilcgCD0/IugwtWt2FkapBNUeyi/uAni4SbSmBG4to4ruSzrTO/CjOYgLrWFCemGlFUoNvH+VgANnYAOEhLkdl5+yn0444fFmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787041074; c=relaxed/simple;
	bh=6vGRveDjqqZz9kH8MGa0ERTUYhWYYAcUWD9xPChXUNk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kUq6R884E2Z8h7cwMDeNQ91RXsUmfR/w9ltNKZSC12GIJSgOie1Xe3QxYaWf5bO62SlMOMfmx1aFq5CFqmW5xnHAglPBiofbIrPXydmjt+DjHZGe1rE0qYLT2JYLOImD2QSIbJcJ1Qg4I/sJ6oF5zpKIk7M8dpGzaZBR8MkuGRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=avhi.in; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=avhi.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d01548ac96so637205ad.3
        for <linux-staging@lists.linux.dev>; Tue, 18 Aug 2026 01:17:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787041073; x=1787645873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uTWSzWdJPrtc4O9x1pM/mYhX/CHlg8L01u8KqYA5dGw=;
        b=QlH9EDcrs8cFBO7hrS3K4HL1epjlXb8nYfmGgpDzkg9iu5hfQiHf2YlV8prou3mWPp
         nrCgz8gzWoA2eNeA68XySnjCTwzeDtxVs1+++d8nA4pUvCtn2LJwZE5WKDzJ54q1jHd1
         EwaHA9Tr3kKEo1M4t2HMO4Sh5naP7wMdyDekF5NrglN00jDlB0UTBwcJ1/cJ1QzZdouM
         28gZMB+xZ6TQ5xV0pxGyRvcKPMKeVofIZQ+M+Dh3b66L7Zuqqi8IcqJzYPtE9v2MAjJb
         gILuXgd795mHKXPjK+v0NdEjH8nlKX6ddTBUBaBe0+NtIxwnweocVzMdBosApEzJmlED
         5pwg==
X-Forwarded-Encrypted: i=1; AHgh+RrM1Y8Dg5UBcNm1h+3aMgaO3CHWdDlmB3vSEQZt/D5NLr0gFzFAwT3QmWVZuo9i0Kq8D1ExlBIFD2tGP2qT@lists.linux.dev
X-Gm-Message-State: AOJu0YxCvgyXcAfVa231OsqgWDGsrCwBgY/1i9QTzuFqLgU5uDe/e1eD
	BrghPUEHlK8TOJyDOGj0/ZNxXrADF0RxBLyG8OUqoLBd4QecxUH0JPlM
X-Gm-Gg: AR+sD12PGBYcSMr54lBAZoWuJcOYSJSeGSsWr0n3iJkogOspkxjocl6KzIqxFT2KS2p
	/3wO6ZWxDWdjVzoeAxnb/jx2nkt/JsP4T/n+VThnScVglRaDxktOWAFgX8T4WaMY5+0Z7GAysPy
	2wnh/GzFrQqnV6DUDuIwSVegnhxegUq0rDDeGIP+W2e4ozq8qAfkb9aQnNIWii95FwG1gO5E9tK
	ZtGefKOocfJX+ZB1SVty4k2deSetJ6qC+RlUAWF3yCvTlQPNuV4+sbI9K0RRVCm6JUvsITj5mt9
	IkUwzT18zliKTAVuqT/PSSdadfwbdVSfUigdpiZO5QkrXjhIif5D93M2Bj1LKXrAyxCEw1kIIgq
	VIqyd4+DouO56DKyExvuFrQ4jQ6VGV7jnAo3uE+BKQWvL6VXrA5JLleZB2d4XY7b8bIKYA8xjKb
	mh1Ig4J89iw9CGKspJFIsuq9neg1au0g/07DHPjSppj6N7+qSAKp9KnpXbtGtEDmwLjfoQmwiVi
	Qd6szBJyanKbs4GsgYj0schcsbsMMg8D6IZAy24mFCSNPFbo2qABemdyPFlb7skhp7tS6UY1rsb
	6UFkcc355xZW2mPNEYE4
X-Received: by 2002:a17:902:fd90:b0:2d3:71af:782a with SMTP id d9443c01a7336-2d3b080bfb7mr252771925ad.0.1787041072892;
        Tue, 18 Aug 2026 01:17:52 -0700 (PDT)
Received: from avhidotsol.tailb26c65.ts.net ([2401:4900:8946:484d:4c6a:322d:94c4:c64f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32678dd26a0sm17363653eec.2.2026.08.18.01.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:17:52 -0700 (PDT)
From: "Avhi M." <dev@avhi.in>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Mark Greer <mgreer@animalcreek.com>,
	Vaibhav Agarwal <vaibhav.sr@gmail.com>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Avhi M." <dev@avhi.in>
Subject: [PATCH] staging: greybus: audio_manager_module: add missing newlines to sysfs_emit() calls
Date: Tue, 18 Aug 2026 13:45:35 +0530
Message-ID: <20260818081535.68198-1-dev@avhi.in>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sysfs attributes are expected to be terminated with a newline.
Add the missing '\n' to the sysfs_emit() format strings in the
module attribute show functions, fixing the checkpatch --strict
warning:

WARNING: return sysfs_emit(...) formats should include a
terminating newline

Signed-off-by: Avhi M. <dev@avhi.in>
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
2.43.0

