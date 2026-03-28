Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2830912B94
	for <linux-staging@lists.linux.dev>; Sat, 28 Mar 2026 04:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774673198; cv=none; b=X/s/WbWFtstGXmhKaZDObpbv8bFg2+/aS4xD9Dd+F8cJFPnEQgmBAZ2im6AOOjm5gf873pnuayiqg0VwI/RnBJHfbCvQMDxsi/ga4au9AsoqN2AwEJiMOWv9VMVKb7e/BMMI0HKpBP8XyAyUruq98MgS119A0PfMNLAo7or9gi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774673198; c=relaxed/simple;
	bh=nr93tEnrmBhvLiTiQMJBqbSKaB+q8gP6luPdCLfmm7A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HKs++qfzDiNSD4nFYfK2QBBlG5zL02Af1G2mxdMqoJAzhmQvprQ/jR48JMUwXI41P3b4xcaZ5BqSG5dPySE+b5ujUhZ/rRxNw1hNXvvCI3H6nDqZ483wdhqfiNuN/pW1Gmb+585uJRE6KxFRCl983aOMQCz4WGaFbLSPe0lzgpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QBy7YL3D; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QBy7YL3D"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-354a18c48b5so2674507a91.1
        for <linux-staging@lists.linux.dev>; Fri, 27 Mar 2026 21:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774673195; x=1775277995; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tOQAY0QWafhJn0A51VpLeI70Zu09L6OxF6cr3nxplhc=;
        b=QBy7YL3DYm4BCoTS1YOF3xTQyySZvWbkCE45ijVq5Wq3h82kuJUYa+27eLrs2h7dUv
         keXJhx/iDmrneahZrlaDiZkfSwIqWrofunjR6FA9H1cieXkg9Pl0Pftdc/ZaT8Ff9r0c
         7fD1W3w4bUG0wh7Hx+RBBYE1F3toq2SiNOKxD7gac10HHs4/7O+25wX4Ls5zlpZOUvfi
         cpgZoUVKPOY6sNcBLwQ2xw0LMkD8L5eCVA9JNjyHGaGY9yDscfr6E7pkNCDanswO3zNC
         5SgGDakEhtKej+tO2zvlmgiiJObJZE4aqXNHxhDd66GTN30QYpXmhPXjK4rgu/WOfckJ
         2dgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774673195; x=1775277995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tOQAY0QWafhJn0A51VpLeI70Zu09L6OxF6cr3nxplhc=;
        b=Fz/GRwgzR0xNdRdvjIMSaYiTym4m36fShFyGb4FYQ/7Xzfm8rmGxQaledTKjqwrczH
         rOeU6PrarxK8CtdUbUjKrelaTuVB55595X5XYSiLewQ9mSe8ynH8qS9q0si/xIT9vbhd
         wlwNNTBbDRSthjKznYqxUTRIIScx6Lg1IVbgCTQf0x6RjmkXWELPovREFLtcaISfqJwp
         NRfdhujOhxtPRgSbo7Otb4cb6Eqvnq6H5sHHidcdjTktD3DuWE+ZDfv3948hUAJmNA6h
         C18y/5vdn/csulpJWOifzYgzH41HdXZNTEA7yLokN9Ce/d7aeK7deVoh+qbkc4FuVrrn
         fKAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiBAP6dDepw8/UtkdLQPKSfbbGuIN0nlj/KKI7dIQA8r8JgD3v1VoQ87aEEJxQeL+rWwu0XLebbEdNMLJS@lists.linux.dev
X-Gm-Message-State: AOJu0YzSrrEPx9HBI/+PVrzpdg+zP0Jr4Sm8dsyz8pGVKwxSJuNW5i0b
	asIitKV4hJo5ZzraGXEcGUc3DWWq2XP9QZK72nwJ3FwI1aMLjUcjO4Nd
X-Gm-Gg: ATEYQzwKmhPXg88QXcKJRlY20TPnnDon6iEbpPLqrzXQVj8hMRHzF1c9PuH1jdvCTR7
	9hXT7wbSCo42kFKDiwGgHaAdPgPsWXxyLUPvqkys9GZdh4LYWlK5igilD/DONe1rmTOLided/4k
	BIVxfasZuhWvwl0sSBk6GolgNMLG3xlKCKgaA5G6aX+tMeIJaZIqnY6PuwF3algUNIvBcOIR0Qf
	V/CC23Sy/EuqgiNdLs9YxqwW1GcONTi5cH+/CrwhCmD1HXxcahHNumXWCVNfISEJSVWr4qRcoNO
	ZIz7iX8JWnE2AbQS7m4hrt/mfQ8CCwXMu9wWsFpuI7wbua/hVXp2F3kPNsYN1XdplzjtNhl7gbo
	snFQ1ZJyWHCYA1FwHwsxzOrGqiyVQ5sQCyQFN32xB8iqCQBMWjcfO7Al6uz6ujC4zVvSmCs5U0k
	Z4M5mLRb9Dc3sbLnY0vdaOA7AUT8L6OTFxEe07JvZr5qtNOjoAAGMBv5foaya4462E6Z0VgQ+Nd
	UwfXb0HKaBBXWqR9EzGpoebhRO+I7/uvg==
X-Received: by 2002:a17:90b:3144:b0:35b:e4f8:78e1 with SMTP id 98e67ed59e1d1-35c30008d96mr5000359a91.11.1774673195291;
        Fri, 27 Mar 2026 21:46:35 -0700 (PDT)
Received: from localhost.localdomain ([103.240.235.134])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d9507d739sm745108a91.11.2026.03.27.21.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 21:46:34 -0700 (PDT)
From: Shivam Gupta <shivgupta751157@gmail.com>
To: gregkh@linuxfoundation.org,
	johan@kernel.org,
	elder@kernel.org
Cc: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shivam Gupta <shivgupta751157@gmail.com>
Subject: [PATCH] staging: greybus: audio_manager: Add missing newline to sysfs_emit outputs
Date: Sat, 28 Mar 2026 10:15:27 +0530
Message-Id: <20260328044527.10489-1-shivgupta751157@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sysfs_emit outputs in audio_manager_module.c do not include a terminating
newline, which is required for proper sysfs formatting.

Add newline characters to all sysfs_emit format strings.

Signed-off-by: Shivam Gupta <shivgupta751157@gmail.com>
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
2.34.1

