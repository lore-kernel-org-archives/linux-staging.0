Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDDA3909B7
	for <linux-staging@lists.linux.dev>; Fri, 15 May 2026 22:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778884431; cv=none; b=ZwEL0D/SDxkWV5rBTUYdp1X8R5lvYFwpS/fvdFVlEy+bp70ZvAHCXJmF3ZCIVij/gGg4C3MKr7LX9/3wBa0BaRTC51JlbHNIijsYLeQUO4PTQwTem83AVN/cw/gIwv7StOFd1BJ3rWK9Smq6UeW6klY6fPq4se6Z7B1/G3Fedgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778884431; c=relaxed/simple;
	bh=T1iPHmWtNlQuAzHdbdnhCFtMqvQVUSecMJO6hlMkiB0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LobxnG4Zs9XH0l2ATNOWgyRKf9/vPD5WRXYHj9NQHI/ZNBLH+jr3PaPyJzBTZie+yzSMgwnsoOEAK4ts/W2s/0X/+t1rI5zeLIxbY+gbwv9eg7cclMmq931sfTBnfjmFSbhf97r6EtTIhxQqbx3woQuFfwoYIHKePslaORL6+OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TVPsJ5fr; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVPsJ5fr"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-44a5174670eso125144f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 15 May 2026 15:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778884428; x=1779489228; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kt/xoXGBinKdMkcDOAaFA2n5mMy6AJx5Gs0Z2Cs3kJw=;
        b=TVPsJ5fr5YYcp2cZiph8QHkPyyPFMAUGWRX/bDxZ3uXIw/JJ0XcLgH1o1fcAawEWwe
         B8wyfcoHarAIu/gyzhUnO+iQz1N7jl/+wBUUxOWMQ6f6M84Eoj+wnPiW1VssxDv6zsdi
         rGNLOnECsViXT2rbpIbeDH5EL5LjGXid4OpqaAFZZR/3DTFTIjWSa0/ozm8b02t+ElNx
         p9Il0MYJwSiK9o38IC5MqHEPhU9jDD83q+4k3LWQmKiOsPwGdbz1gBkELYcrkhMx/cM2
         idL4l0oaa/KLKUDW1me2W//z5Sr9FD80tUNVD2Zw1SryVM6D85DVIgcHHvQKYc0de81/
         Fe/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778884428; x=1779489228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kt/xoXGBinKdMkcDOAaFA2n5mMy6AJx5Gs0Z2Cs3kJw=;
        b=jCJQ1O7eGtuX8nG/HGc5dLAJkuEnl8xNb+HtR97koqvTSkpBzddkqwmwUSGF37+rC4
         qLkodj3X31PzqxYXRZCD2Cq8e08Zu8WDPojF90opqMoQZWc41JVoxhfedc/tK8NueBvi
         cdw86gxMmNGFeBjTWSpCdoD84Xd5nvjgTDXpPK7f7vaWGD18363UZ+ttIif1r0Lprbny
         PGzG7tVwD0Cy+Qjv3uKW41Jxti6RPeHm2ITOknA0qwP1/7+tM+32t1uVhHt5XvL/8if0
         RhKANxHIrtbr+pkW7XxXGj7SuDCyBAHaCi6Y9pui+YRgFXyEGT723Mzx9tqjPwDD/gtC
         HacA==
X-Forwarded-Encrypted: i=1; AFNElJ9MmthKLVj9HmqL7Io/b6wFRWmGw5bd7KP5PhqHh9jSRVXK+RfvZZw+f1wOezjJPd/8wpwQaIR/rrmxa8iB@lists.linux.dev
X-Gm-Message-State: AOJu0Yx88GVuTTUtETwIfsw3JsL3JGi+QUw4QdwsAR7Sqg6oiGv+XT13
	3RKeoOsijSczEJDSHFaBLaof9SEvH9eMnHbb2wH6k8j0EGFHXCgRy+xb
X-Gm-Gg: Acq92OHM49BbhI4D5dv9gH2r21KaqjbhJUtWHXWyk2A+yC5rmN5Yvt6jUB213VSipyx
	X6ukksZE6U6zODNmHK3kTnCatTW97wOXHGYe8M7PJNo09AO/GfYrdeVcDOTsHchGRfrRj4hY236
	CT0FOBfoQAy50Z9+E9JIGyHtFJg414pOCgZgHyQzpD3EQUyNbuNCisqRn7Rjy9JAMDaYRHiKE+F
	BRTyN4Bq5MDnEGP9Jw/iBsloaSJ5BcGZ2+rtjF6A+whEUbAcY649vaSGzku0TJBosY3c2DpZXU+
	YF6xxLX27bP6wLQEjG/mxTfb4kjbidBj60FO0TeQR13fl5j0bmAn8At8QHbdTLdSpGfAitHbgpt
	r+0Q4f5OImh7MIsPKolmCXTnS4pw5deKoumcBv0TwpyN0CEbiJ29j+Bix9paSEXj9W5wtewaOMz
	YItWPqOa1F7zjuVXfUmR1MFlELXwG/TuUiyssR
X-Received: by 2002:a5d:5f45:0:b0:45d:4a00:b927 with SMTP id ffacd0b85a97d-45e5c5dd627mr8378359f8f.31.1778884427892;
        Fri, 15 May 2026 15:33:47 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm17849288f8f.23.2026.05.15.15.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 15:33:47 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] staging: greybus: add missing newlines to sysfs_emit() output
Date: Sat, 16 May 2026 00:33:42 +0200
Message-ID: <20260515223342.40869-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sysfs show() callbacks should emit a trailing newline for text output.
Several Greybus audio manager module attributes currently omit the
newline, which triggers checkpatch warnings and makes the attributes less
convenient to read from userspace.

Append missing newlines to the affected sysfs_emit() format strings.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
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

