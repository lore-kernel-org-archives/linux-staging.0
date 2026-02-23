Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BB933B94A
	for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 18:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771870337; cv=none; b=M+Mwl1NBgvu5sKDZMRvIcBmD2jNkGYSfbimXgPb9JTwN9HF48VbxOv+we73UytuqAHJVnUmT4urIo/39YEWL8zJSs9Ej2TKRRh/RZzJ63WtHkqaVBZMXqqe7eCd8Foeo6w3jE1SAS3Eav7qqRVhEPIIa/YcGPjtNH2CoBPoPK5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771870337; c=relaxed/simple;
	bh=7lxU2ovoA+4fB2qySe1ifIcLTUrS9z2SKlu6CZoVmNo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FkArJigrpH/SIqPsHqYlhb5OkZHXpFuM7cL4qh1cDrY4j7+uHkcKrFEVHooJ5CsSVjRUuiksP+bHEC/18Vp3p8P6c8bKPtNB4HfnOjpYT6llfOrSOML6KXvc3aDhLlYTX/VpPUiVSjpCbRIB/e8p9wxD4Z1aezVbH9IT03wOUQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b5w1maaM; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b5w1maaM"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-824b5f015bcso4422369b3a.1
        for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 10:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771870336; x=1772475136; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o4TM41/w36jwqUfkddQX+ubMbarW75gQJZVoupki1Gc=;
        b=b5w1maaMgbslQr0qwEznko5qy503WZxHB7tF2+Mrla/V4be9vA6Xow+hHIA5MzIM8X
         okdC2ch26rcJQy9WTi1xd11bM53W2pSUDfC3xHU4Dn7EidxGq7jCufGnw/EcHh0mCcpQ
         iVChr1+Jjg/rZXUHPwsm7L14nM8/F1xT6GqCd6dp41ncs64Ki2tJMJNM7efBVR4ftelI
         ZfNm2FPOM0Jv2IkLES/2fn0nThoyy8wIYgO9lYGtlXk5v/aXp5diDanZQzNI9ODRKvkZ
         HxYbzc/t8bnfPIGFF+FZbtuHLpVG/DvF/r7NN61Hl+xiGpW/OjP181vjcRgVN+zbBFFM
         6vCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771870336; x=1772475136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o4TM41/w36jwqUfkddQX+ubMbarW75gQJZVoupki1Gc=;
        b=ZMR1Vi62pQuII9nkKfuO7yhbczA9edVT3EyiCTTN8HWPt4B4PkOIf8UkQ96BHbDngH
         HoXbpJ87PgCg1eF+rY43luL2kq53As6XX4e3Yor3fnUe8Sxm2dZhsXord+hxoBiVE+bk
         /V0G/xYkDDDaw2bObeZVCPwL1aiVI8B2lXdCOQRT937SmnUagCpsM3/oRGMJ65FB3J9x
         4YoukBea0bGIg2YoTmA0xDGTOa4gEQTEZ+XayM3r1lbbEocUINuY4venMPz5SOYuWvpu
         4MdTw9ctJqYiv+3TuTIH75mqap8vdRcj2aXZxD8RsoM/1hGdrXRy7pGnkeOmi7jdzCh8
         KLKw==
X-Forwarded-Encrypted: i=1; AJvYcCWi/iiKRXEP/5RIGp2um3CGxngx3qUGUMDDN2Rgp61vmBpIOrWhCad0FYqVb+ZDnQC9L7uiJCwPSYy2S5Cw@lists.linux.dev
X-Gm-Message-State: AOJu0YzQ1JtXCAmjruoI3mBYjn9RurTF2sHfh85sGILAHT6errgQvMh5
	Q8VyYpFS24dcEMciQtX9aX+VbkvOuub35XINjQfg+wiaNtliqSmiJwEncpbD6uGf2lA=
X-Gm-Gg: AZuq6aI1DjvZHl5bepKTjZwZyJ9ShJxrhVmsM7hvwCFue6yO7DQCYsL0DrWoJUKqM4o
	KH+Rk0h+ut0X2Men7GQ/CRqkFIaUW1IWiph87lfeHvB1CEgkzZaZrPV/9ITgoATSOyr1VjCXJ3V
	wCy6P8/rV7Ri3XyvMy1bqgmGQxghqjikG5ZxURmhBqjFav3ClD6xwVbOSuxTwZ5yJP1Mbink7TV
	LQo5H/eaah5HIZqFEAk9UKalO3q7Ok363xctDU/TjydXSS2DvoC/XYNlHtfsRB9lZk8ImeuvMLd
	T//c1bAjQrxFMzt+IVPlfLVr64q9ngCurUxd6Fd26ObSTfUXDVe1PZhGQ26KpEZPDtw2kmiVTOa
	He/lH1wFPuyB0DdLoyb4WxcXgnO82rrYwKBCrEIpwo09ajSouKKbNeUZRZ4JPP39waEjXhhuJKB
	Q7LX1ugNdLS/8DaRJcACgCybJ/C8hr6YU+duw=
X-Received: by 2002:a05:6a00:ad04:b0:823:1c5f:1c43 with SMTP id d2e1a72fcca58-826da9ee9efmr8568432b3a.36.1771870336014;
        Mon, 23 Feb 2026 10:12:16 -0800 (PST)
Received: from fedora ([2409:40e5:11e3:f079:b796:44c2:7e10:cd23])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd86c5ccsm8261940b3a.35.2026.02.23.10.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 10:12:15 -0800 (PST)
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
Subject: [PATCH v3] staging: greybus: audio: Use sysfs_emit in show functions
Date: Mon, 23 Feb 2026 23:41:58 +0530
Message-ID: <20260223181158.13234-1-chakrabortyshubham66@gmail.com>
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

v3:
 - Add patch history below the --- line as requested by Greg KH.

v2:
 - Add missing Signed-off-by line.
 - Wrap commit message at 72 characters.

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
-       return sprintf(buf, "%s", module->desc.name);
+       return sysfs_emit(buf, "%s\n", module->desc.name);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
@@ -85,7 +85,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
 static ssize_t gb_audio_module_vid_show(struct gb_audio_manager_module *module,
                                        struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-       return sprintf(buf, "%d", module->desc.vid);
+       return sysfs_emit(buf, "%d\n", module->desc.vid);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
@@ -94,7 +94,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
 static ssize_t gb_audio_module_pid_show(struct gb_audio_manager_module *module,
                                        struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-       return sprintf(buf, "%d", module->desc.pid);
+       return sysfs_emit(buf, "%d\n", module->desc.pid);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_pid_attribute =
@@ -104,7 +104,7 @@ static ssize_t gb_audio_module_intf_id_show(struct gb_audio_manager_module *modu
                                            struct gb_audio_manager_module_attribute *attr,
                                            char *buf)
 {
-       return sprintf(buf, "%d", module->desc.intf_id);
+       return sysfs_emit(buf, "%d\n", module->desc.intf_id);
 }
 
 static struct gb_audio_manager_module_attribute
@@ -115,7 +115,7 @@ static ssize_t gb_audio_module_ip_devices_show(struct gb_audio_manager_module *m
                                               struct gb_audio_manager_module_attribute *attr,
                                               char *buf)
 {
-       return sprintf(buf, "0x%X", module->desc.ip_devices);
+       return sysfs_emit(buf, "0x%X\n", module->desc.ip_devices);
 }
 
 static struct gb_audio_manager_module_attribute
@@ -126,7 +126,7 @@ static ssize_t gb_audio_module_op_devices_show(struct gb_audio_manager_module *m
                                               struct gb_audio_manager_module_attribute *attr,
                                               char *buf)
 {
-       return sprintf(buf, "0x%X", module->desc.op_devices);
+       return sysfs_emit(buf, "0x%X\n", module->desc.op_devices);
 }
 
 static struct gb_audio_manager_module_attribute
-- 
2.53.0
