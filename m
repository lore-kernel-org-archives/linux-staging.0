Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792651529;
	b=mwFOeGrpAk7r766cGR5jpP5diNtF0N3fFmZDXOr+m9+xDoaQ3NUdcQk2yU9RgQzi4dy0
	 Zv+q8/ROW8kk+8pbwtRnrRs0uvepCISxEMS1JpR9zeoezU4uxWL8Cc6ebsMKZ8QMDl6el
	 EYtjv7l3tM3nIYP1u9+sBr9MevnCO7RBp+kl8xxGyam59XqUOJqnvVlHLMfwZH0iSKzP4
	 tCF8I8wc+y7NA/e++rQFRO6t0QnNJ0B2NVkGPSoPOM3LxXIi9u6mmoVXKAR9YQJodApre
	 1r8YwqjGaE00zqGjRvqTPCFeNUBP5aWfxPFEWuh747UEhffb9P74qJFPOI5dDKcG1KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792651529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=H4Ir+S1HIvgiCnIswFhbd70oXGozU9IYDaLeZqUpSfc=;
	b=erFYGnOpJ4jHyRL+uFFp7wRt0gxuMjEp8N5XOLlGkfF+lRu5LPsC04HKIc1bw8ZUib6+
	 jKH/wCuHaQKLEOJ3abiSn4eXaXqUSPf1NgqbIv35cfldmZRFDFzkFA/ziQtHcTU/i55sv
	 BJig/wj0kfP4io33p729dHbj3w0KN3AF8JyFQIPc7cMrttG5+xRY8vaZyS6qmN6NukZkW
	 33ntuBwMwGIY5PFEHZK8I26KRQHAOpogEFliZIsI7mgzpRJHCoQs9xf321o8ckDhswk8n
	 9zNMELeK7KaPnWiTe6qzAmaSNqe4zJ+/ML1v16O7TOR9u8blTgr9yKQGnt7z2ojCaKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Q2W/XuxO";
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E43A606A31A
	for <linux-staging@lists.linux.dev>; Thu, 22 Oct 2026 06:45:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E43A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Q2W/XuxO
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-185fd3a4ca3so683867c88.0
        for <linux-staging@lists.linux.dev>; Wed, 21 Oct 2026 23:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792651528; x=1793256328; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H4Ir+S1HIvgiCnIswFhbd70oXGozU9IYDaLeZqUpSfc=;
        b=Q2W/XuxOXWP4NYLPPGvTD0ukle0v7GFdgNSf1iO0ut4YVRgAkLJ0AbLGTN/qsTLffB
         mMYwbQ6+1w2xj83W8GjKU9Ldra2jbCNRJQX0KGke/T0I1kuIDmI+wKyEwKYMHK8QVg9y
         7TV8FXm0QD0tDfeDaOfEzBnMF6vbQyhzHUoF6f3mbAjkIK2KpsZUXhvuGzJKcckywwKj
         FqREfnaRx7H7E1QblkiYcJMEf34Ul4+WBWoW7YcFNeStTuyMUgyWohaj/MXthcIhELyy
         VZWaYnQ6HujxwIHbqLBCJOWKdERHkUuOxANJrVhKJkDz/2opkvKi3d21BfnZLBrXmT1Q
         1u7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792651528; x=1793256328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H4Ir+S1HIvgiCnIswFhbd70oXGozU9IYDaLeZqUpSfc=;
        b=GBsza1y7lAzY1JLTy0QwULIt6HM40h+o2bvI9zPMqfNMsAysB1bKua+CEhyeM6cvXp
         keSgAA8Os7oZ9251EfNE7PBcLOgxogSFrNbTeEpyNkq4elgPgszi117+zGNbfQDMTpeP
         oCsrDFqk0/Oi3rIM2BxjX+veiMMNQVMdqj1ZI/uaFiSw633NSbvoY2AVbZKkVGtjmXXB
         rVBr4dYfTmLQTBCYu/y2RbBoawIKh098IoFhiuIq8xJtTCObXvaRH1oPU6gZdDVzQ7UD
         Tm2O0cqsDoA1gBJ++ErMPzBwM43Yx8kTRs7EHrCEncXT9xzvewmWZ/FwIIN4Sl4GfIZl
         pRqA==
X-Forwarded-Encrypted: i=1; AKwUvByJBdznPh/JI2HQksgFI1Jw1wFePKkiPXieVispS6fWRPGmWPWIQ48P0T+l7KFCoXqVb/ZP4JqFbbV8Mb8o@lists.linux.dev
X-Gm-Message-State: AFq9FYKYtCIP7JMxgY9op4KDuqpf10rqc6m1ZgOlFmnhw4j0dhgE5zll
	24CRJgHYR1QRw+BTUMVn2wtvurJa2h154DptAbxEaiNeGx6auGWotj4g
X-Gm-Gg: AYBFou0BZX2Cx3ig1leQuZszY8Pq9bCzzPgfgZN8ykEkvduKZR/PBh2/tRK4bsguLFY
	DJc1ECAhe+mliE+2yiYfhvOjnZY8V2RNxGWTPotZS93+9Z+ik8ojJKemg0xzgnd59u7/Sp5ChJr
	mUyApIrAf7VyLBs1EfqCIGb4XJRymekEJLWuXBAY/bFwExHUPdkxbzTpnyicRepCsGX/HTy0e9l
	XSF27kbquaPEMDacAHh+G/6ZE19lIsWw6BmRug5s5WVr3GfoSj8xX5soQbHWFowyJec4DFKRPuz
	b+BZUQxlP1yQDGTdlfpVJfQKYW5QmTpB1N7hZJEcGyhGhaNg3+afapA/gAu/3QoMx+0Echl0Rfc
	25cPNgPZSt/pr/4tHWJshIcTNjY19a/sZZEd7io9fy1iK0Y6Sry/Uth/jf6FWHP0N4KiMWRqnb7
	8DWaiRVR9Eh2Md3SIKEgPFKsyKaG3+UPOE5R5ib2VHGDKtCIWklcFS5VAr4gOw/vjqO7ze+hbGo
	4uQ9lf7eq0pbcplmPkt8RCSuZfyeh6XtGm8yWBkDN7KywZisv/RGh+cTRHFkDmbCvZB2QuIdH/n
	24CngFmQ4bk+7xGbn2gat5fPcv5xbvE=
X-Received: by 2002:a05:701b:290b:b0:14a:8df8:56b1 with SMTP id a92af1059eb24-1933bb42675mr1646687c88.22.1792651528119;
        Wed, 21 Oct 2026 23:45:28 -0700 (PDT)
Received: from LAPTOP-LJ15R92N.localdomain ([152.58.25.80])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a180b9esm18403478c88.4.2026.10.21.23.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 23:45:27 -0700 (PDT)
From: Akshat Rawat <akshatrawat095@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Akshat Rawat <akshatrawat095@gmail.com>
Subject: [PATCH] staging: greybus: add missing newlines to sysfs_emit()
Date: Thu, 22 Oct 2026 06:45:35 +0000
Message-ID: <20261022064535.13466-1-akshatrawat095@gmail.com>
X-Mailer: git-send-email 2.53.0
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

According to Documentation/filesystems/sysfs.rst, sysfs attribute show()
callbacks should include a terminating newline. Add the missing newlines
to the sysfs_emit() format strings in gb_audio_module_*_show().

Signed-off-by: Akshat Rawat <akshatrawat095@gmail.com>
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
2.56.0.windows.2

