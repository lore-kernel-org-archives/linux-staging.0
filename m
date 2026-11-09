Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794210827;
	b=ZMdmoSj43aKLk3IA2VP1eHEPHuTI8nMhtM4gcSrrWcRJcvdE1qDgYYLK+86gAfZPauzY
	 jC550Jbwf8lAmV3bcS96j/FOmIHQTLIEQvsv671IRIQ312QNR46+qZ3vzbCGAzZZ8RntL
	 qQUx/apXzPuhCiqyzkHJK3NueT6o0LV/t3ILzJB4hj92IsFwl8t1h+DlFuL5XKzQxqL71
	 ALQviPGYm41UTcYwmJtcTW5ztUMnnhu6agTpWgASTLK/idEcBLo9WwChFg2E6kWAU4q7p
	 cqqGsPdxffT9RD6CcsUVSRhsag35+6Q0rO9kckON8plzeXW1Hc/pcYsJAXs+2WLnTMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794210827;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+dCPB0qrqwrQPXGgiOT4r4vbb8Gcc9ntf0TxFNdjajY=;
	b=zhlZSK4ra1UwVV0ViWgf4MITasU2eky00/L7fuhkmRBKdmXVLowM5fjYqxYfWLo7bopO
	 mJ+fBa/LHkKKkNDta7m0sNCNW8CDBBKMQ5DwTG9uvkk91w+dYGVxeF5j83OFwGWU2xhRp
	 qud3FXyNKRWfVVQ92Dhc71+HyKjj4J/tdHRMsObJwLpE1AH2tThlDPdjViriGrKkSmbwf
	 PemjAcv+o7zxaRnJPIODueVNRC59cCParOWN2RbfVaWq9ZeUW0ocvRxCpE1mV79NCt11Y
	 H8+stwhIoJCzy0f2Lp1nrUv0lSnSquiSYz9ui23GB8BLDb3QC4QkMWYZq7TrIzWLEXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RoHoRRM7;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524F0606A337
	for <linux-staging@lists.linux.dev>; Mon,  9 Nov 2026 07:53:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 524F0606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RoHoRRM7
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36f8cdd30beso1373636eec.1
        for <linux-staging@lists.linux.dev>; Sun, 08 Nov 2026 23:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794210826; x=1794815626; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+dCPB0qrqwrQPXGgiOT4r4vbb8Gcc9ntf0TxFNdjajY=;
        b=RoHoRRM7c5MmV9bhBSUi1e3Ry/2DdYg8qvN1whIA31uw1nEQwBnz/8CdnBK0Vvntmc
         e/ULOrGXrxNK1qMI2TXsu9JsP1ivxIgnRQWvu/3cd9tLNDpf7eo1fm7f3l1sBII7zGDE
         qzK2xGC7GIKvu51+illbNU3Yi8ag55i5GgJVvQtGOWyuI9zdWQyRmLD/0nuw+3e/FvXM
         x3Qh06ad57jsRb8n5Xj5szvruPHJc7d4excl5+Yued9zvl7W/iCA8w4JHRgWWpdLSyNN
         tUY3SE9Bl+xgjrttp+zPteMbNEHjXTPA7gYDKPRf80HQyOp2nt3pSesf1wPSXF2JKFfK
         S4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794210826; x=1794815626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+dCPB0qrqwrQPXGgiOT4r4vbb8Gcc9ntf0TxFNdjajY=;
        b=U7qo9fCs7yAQRAY+lo7XKWWxGr/CCLZf9j5WpwDbcUT5agmF7XEuX7TKAdBTgESZ8m
         Z+swEDtzajLhJMGGXv/1ntx2MXmHl/UxpRWmErFkhGIi/Uws5wtf1NpaGy19HhfYQMZY
         ZnMOvu6gU8vEOYGO8cdvruqTp2wwvgok/TzyP1GnqAq1iMTti03oDT9qyCi3snV9UuI1
         i8doaI2EXU107h78D4JxbO4esL1v82WzcrgLMifIxwy2smdmGF9r07MSxfUnI3JvMx/u
         WiIhEjFsdT4W7//howwOlvMBnumRKm/hVPS3VEnaJsL1mkfFzkI4U4DBvoZrmgZzBu2F
         0zEw==
X-Forwarded-Encrypted: i=1; AL+hErGcHwadvv1syMXxGe7F9iatPILxTtVPZhCyP2Bu2Kj5pdAntio9B/kBIzwuFieHwipl16fL7v1WG+zHQNjZ@lists.linux.dev
X-Gm-Message-State: APuU4Z8eziyrbA4Hv1XCgN1x7nY3Jduafl1IQH7ITgGkXBKx7MW5DvEg
	MMhYVu6GZBQlij6ERux68KsO2gys4Fn7gdDb7hi4mMzLpTW66qWMCou28uysNc2T+S0=
X-Gm-Gg: AYBFou35VDG3DQJfB1ONOAR+Yve6ZMYXHuWniYk7jA+fqvtO8tshpLV8wGecu+hrrLL
	qkRpyPZAO7PQGHbMcxgwnBtbWbH/UpYmBEHXVYuzm6yF07v9Y2NMAgw0Q7qNTl/pFXnir3cD0Gx
	+6gT08V0YNuUwoxIbZK2yvAi9nKflxDeSjs/98zNb7ozr9vmD86O+reiLHn+efXG+a061/soeFg
	UN4fUtw0EREElbuRZOdRdIbu3TUeMKg4EREPfpQTalnHeaRVD6hMgwXl+P/5xVAdQ05MK3z8ohS
	JTQF2uvyLl35H1mWPLr7lkxweJdctDaXG3OZ4pkDrOdvOjmwrzxvZn+nEB2MLPYPYozhFPQRPz9
	JrcttD37yiUCK1EodOv9xIhIFnTr686jdp8aKqUFP42TmBbAZTiFcXPWuUFhX/3vskLf31ldEzv
	8kLgUUtTQ/1eZi5o0I5rLHDfZ8cES5eNDAHgJCzGjyyH6I697scWYS7qcyIFuZJM8AZZW240mAj
	UnnBFYbN0zSG0edLmsUy5WJMNeDY/KwhiSDBC90VY5j6YQRRqv2Vtw85GbfJevJOx1FIL/XgSae
	ZIV1xkvR8GZl7Jr8QO9C90b0eIh2ktL/WrMTiRcLroEbAEyVU3SHPLuJJng8QSqgyvKWNNDZfer
	5kxRt+uomhKdpemNmbCZ/XrHFxWo/xgpmabmxBI3DAATB
X-Received: by 2002:a05:7300:e9cc:20b0:36a:22c8:ac57 with SMTP id 5a478bee46e88-3725e91fc4cmr6696478eec.33.1794210826242;
        Sun, 08 Nov 2026 23:53:46 -0800 (PST)
Received: from localhost.localdomain ([203.92.58.30])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372667d6088sm12500047eec.25.2026.11.08.23.53.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 23:53:45 -0800 (PST)
From: Shivani Patel <patelshivani2283@gmail.com>
To: outreachy@lists.linux.dev
Cc: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	Shivani Patel <patelshivani2283@gmail.com>
Subject: [PATCH] staging: greybus: audio_manager_module: Add newline to sysfs output
Date: Mon,  9 Nov 2026 13:22:42 +0530
Message-ID: <20261109075242.62681-1-patelshivani2283@gmail.com>
X-Mailer: git-send-email 2.50.1
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

The sysfs_emit() calls in the show functions for audio manager module
attributes were missing terminating newlines. Add them to conform to
the kernel coding style requirement that sysfs output ends with a
newline character.

Signed-off-by: Shivani Patel <patelshivani2283@gmail.com>
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
2.50.1 (Apple Git-155)

