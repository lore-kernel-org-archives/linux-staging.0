Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2AF32936F
	for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 17:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771866553; cv=none; b=Y6Xd7HZisrCQVHuv5afMVmoaqtrJDPqTNmlZDOErdmOdgIUuicLH5tOcvIibSBvBPHiyumh1UGu9dMQJ7F1Saz9zgn3hwo2edzb7llGNAXAnvoK6KAnZFx447cz22YHtWITPOPkC+xxZimP+L9ZL//O0du1czLCnoqOE0fk1Zw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771866553; c=relaxed/simple;
	bh=O6ciyKG1NCqGjaNaOL4MAqj+aFDu/Opcft+r/R/vEY8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N55VwEqlJBMeMcScZdsDTXx2IZDLDx3gfQ/J+Kj8AVH6nLzPE9KdxV7+/yeZEB45ADKr2Ghz7nUwTUys2dpAos4KxBD8QcgUlvyQeCwaf9CSHSNDuIJQbuPhbuoepE3uNlevM5PxI6pzebCmsSbFr2Aa8R0NYX51pbsZET7q4gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GU208eiZ; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GU208eiZ"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-35691a231a7so2793658a91.3
        for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 09:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771866548; x=1772471348; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JgrmP6awDtMCnbJPdJhA9HCzopCsaUstELIvxLFFieM=;
        b=GU208eiZw/JvFdUkjCcA718gHGn9vlz16WWGmCyykJ2ljoRm2kYZkc1/8Bj8vOSooW
         vid+XrrBqFU7C+hsq3Ih+LSaOWMn6bmlJN/T/S6n1lAFmf3c+68NwuyHM2aaeVCzAQlx
         CglBpoQE6iN9rGxBjrU9vAPnXpkiM/O21LGubMw9XfHuFk51K5RavWqwpgs1JTlBreXC
         ozc2RGd+fjtg+ZuIX1z6+06Afd8J5h9nGt8M4G5fZn2XgZAjhbt5k9mqDQwRkirbTIMx
         BKY2kn8MV5EedOtqHfpwNq8Q//vIYFmsvhXYd28AzTC50r16IQeCCU2TEKuYpwshppdw
         0bjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771866548; x=1772471348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JgrmP6awDtMCnbJPdJhA9HCzopCsaUstELIvxLFFieM=;
        b=mmP8cJyXWB2uwiG2ITfuw5Tq/S9S0IzFnLgAGzu8OL6+9Ya5hUGnFATrkKht+B7qDm
         cHQCIoi94gUaQAHQE1wAItbHlCYKNr+gMFo6+Sf8j1V7bjMW81YA/yo7oW7bCLIe6Jzb
         CREg/x0gjAMib9BIvCKwqoiUHvaYlXV8rmugAbZD3DkSrXCJn2GCkgiS0EQlxkn5eH9h
         S3nST+Jwe7DxE9UEUo9eRP8InxKxFyAppJChhcncXFODNhkhV8UGm8AgqTB8lW8NC/Ra
         CqISdYzus1lAsnn8WrkCS/05aMe2UBUi/CflZK/8afsgBZ7KazY0dBYB8Ml2Kc+ZgpUq
         3fVw==
X-Forwarded-Encrypted: i=1; AJvYcCWrDfJyz8ou3AOYqVaRQPwumMQgWwnboj+C9IblQO8wt19/80T3ehWN/IIuaT5RX2g4lXxS6+C28yMiNFBK@lists.linux.dev
X-Gm-Message-State: AOJu0YyEZs+/UBqhLE0JnIla2E3s317nY2y95DYC1bwryONGXhTk4n2Y
	HhYlCNlgZBui0Z+6lDf20/QcfR4aV93wIYGLRb1cbWDIo5bji7+A+njO
X-Gm-Gg: ATEYQzzVN2VFyD2Cb36Mwxr/DNIeObljjIdBBFhj1hJ1Qa++a5V3ipGLP9qWnPuf5z5
	vHJnQ0LllRVDMnoxG1+xULM0XPOOTlzPYH1gdNzYelC3CszTypZ/G6CY3KpbQRgE5Ed4ygh9sno
	fK2cDu1nEGw0B39rXwBgDADh2zg5z2ED7vIR4Xtm4+V9XHWdbn+QvJqW7giun6gv8BI2ALVcbZe
	M2biHHooag7dHBLyCHJlXggeLbtCIPujzcipem3jJZFyT01xFWDyNHlZBixXgRnTHMbif5cBrqQ
	f4tA/ZF1lriQ2m7OH8+2oB/fGvWt8AzC1a+lIBVHhtvANpJOAVwZZLuQLu+vQxWKLpBPUXwY+8I
	xH3sePeq1JXONEeP5+XOUwuHueXEzHstxy5acoa91IMEqdgzCX/6cif8F3E+sYzy/FcMDt9tGK8
	zHdNvX918+PTf9uNjSVcc5J2+jXfvPF6+h838=
X-Received: by 2002:a17:90b:2e0f:b0:32e:3829:a71c with SMTP id 98e67ed59e1d1-358ae8b23damr8902568a91.16.1771866547542;
        Mon, 23 Feb 2026 09:09:07 -0800 (PST)
Received: from fedora ([2409:40e5:11e3:f079:b796:44c2:7e10:cd23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-358d79bf6d8sm22522a91.2.2026.02.23.09.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 09:09:07 -0800 (PST)
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
Subject: [PATCH v2] staging: greybus: audio: Use sysfs_emit in show functions
Date: Mon, 23 Feb 2026 22:38:49 +0530
Message-ID: <20260223170849.10912-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor sprintf to sysfs_emit in all show functions of the greybus
audio manager module. This follows the standard kernel practice of
using sysfs_emit for sysfs attributes, ensuring consistent output
formatting and newline handling.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
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

