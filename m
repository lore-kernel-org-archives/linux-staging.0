Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792626015;
	b=WlwYqWgeZVaPfwfUoi19ydudlSUCPZFYOUYjQSXB5WvyMxWi16m//wwrh6KPKihD65V5
	 3dc/rLIZw6f/rHCLTeZf3nxtzVPfAfXYooREOZ7NdrAsIO9J491R8x14cM8dkFmXjTZtM
	 KjgLQNirBcEKW0n/IHVBfPBSOIXcht61JinamozzKrLdlNgo8DAZGqi6bqaBKt9Ut3IC1
	 TUlK80hyk6MW+C3s4WaUEcdDfyQJDOrEvHlZSoxSb5buRVgNZlILtUZb3SddstALv9Tht
	 tx6ri8S0rvUBwEPKaKK5Y7P8je7ulFYkCXAC2hZah7LwNsECdc+5cQY9uEn7xVzQDHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792626015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1C2y4om8UpFxtjwdgCkugcPQMS+rCYwcCuBwVT+Sbvo=;
	b=gphlsYlSU8xjWBtn88T8YaAfd0+vmj3AHQl5jY2l7HvVFb0otiadiQ8yqMkXiWTdE5EX
	 BzMB3+iqWs6jfK7mFrev8JfqSfVnxyl/ne9zb8xgwyKoZYqqCEFcRa/gU2ZjW+ecUUkAc
	 cJlxjDbtL4ODAKzQTt5g9kqSU9pSbk5CV/Lm5LuXV5O0zm6KwvOugLd1I6LtkGLEuYJ7z
	 uuc/nE/jkjbVh5s2djgt1zZD+bJwBqmDZU9yZUIBD9G+B/gpkpj/86q+n8IER33/KGW3F
	 FARELgCCcsTPI3S5XYoUtZ03DREp41XCyfqzgF3gXqwFtqLZMREnR4mdfpnzayxpkLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BsJ6Jbir;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A68606A320
	for <linux-staging@lists.linux.dev>; Wed, 21 Oct 2026 23:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08A68606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BsJ6Jbir
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso245573f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 21 Oct 2026 16:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792626013; x=1793230813; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1C2y4om8UpFxtjwdgCkugcPQMS+rCYwcCuBwVT+Sbvo=;
        b=BsJ6JbirjzizYSK/9jM9q5nJDQMSu97/9xZyJGuiCktxvJesE5H2/Pu+ZT26v+o59Z
         1Z+c/cvsxtBiEHshayHEnFtva10uFiBBbKnOGa4geGH142EklutAntehHONRNXuQkAUN
         Vpvq2TCnUBsWdWd2NDXS1Od1ug0g22oEuUkUrcvC8btAMnAzPMk220bYKaEZTvGQMk3g
         rU/Z5Dmp19jLZM5p2TmB34BqD8xqmj3Ygm5bFpkkNAHtiZK+og/UX9apUHk/cXvWF8No
         P8IB5OuRss0N0qFbcECvliRltjOoXgCgw4h6n8jjS5KhdH6BNC/E1td6OLv4adlo6plc
         aJsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792626013; x=1793230813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1C2y4om8UpFxtjwdgCkugcPQMS+rCYwcCuBwVT+Sbvo=;
        b=FNQxwzNZVe2ym6sswXJ1F2a3gEc+0hgRVquGE0KF4WTeJmTClqAd8NWuW3rrt9LHnh
         taKlBKeixJ6Lb2gtJERuA9WyWH1mBvK2VV1YnV3DeYsz7EnwXDxVny2FcTtnThXZRMbY
         tQuCyox/yjpjJZReACYXTbA0lEeeJNEpqGgp0s0nzdt9YsEO1LoYZrN0jIPaMfpdasiF
         yblA/5qB+tYyvyy/DDu/MBBDpltQOXNHFSFnW/VTldQns3X1SKJE1Rl9GODw6PS5scEX
         II+4adfdrUCJ0un4a9ao2+p56JBQeanV/IASjxmG9ts170WlmYqg+aiy7eMZSZlj5kpL
         ueMg==
X-Forwarded-Encrypted: i=1; AKwUvBz1Zno6J24KOh2d56/YB/gtzPlgo8Pu1apRLXto+WJtzELIV0P0NXx35dOZ0CvnnzmKE+K3S1LVgyPBGeg1@lists.linux.dev
X-Gm-Message-State: AFq9FYKFzI69/UC9NtiHFrOmrQOhtG786q2lmlM5cDD29PgiMlM2Ffeh
	TtV+5493h8orY6d7kFfHQ2xvrxaXUvGp6fjDWFgdXVEfJhkEQ4a4mP68
X-Gm-Gg: AYBFou01TUcVkdDAHMXoQBIXK4emNKICKTLqSrxEYDv+XDw2vSg/hpoYb6vQ3l5eI2J
	QsoSOoAish7XF2q7KjFuvHYUMLreii/qCMCCMe8l91ejc3syr8WDJ5X25lKcaU5SE0lly0Zy40V
	wMGN12nLmtBKemsQZDQxtiPEQfivxAcVt16TY7NzrDuK9GQxbWVm/hCCI2lErQHvUYVUgDB8pkv
	iyTZzbtmtUELvkXLO5DTkXur2WP6x7CzAhqya7dM3JX0B+uWOxPNS23lCg6iCuPEiKDOatIhFwC
	XJjQ29kdcEo8wljdyEhcjtYLnkuD4dkMJFLYLWaxU7aFedDyzslVV3Z3GvUCJeiHc75/6ihs3tw
	j33gocPacSkYkD3H66+oWK9qEEgilM+UE4Y5IsN1B+1PFDaDM+hqCRrcLGoIwsp539qgCAH1DUP
	SKVhl5BTCoe5YEIrCQkw7liHEhHNvFO0l1tg+GpfR4LVRp61xevxI6/9GQ1gtDzNSEOroUgbby8
	fwhJ07L/UR5SRilDVPJTtFXFcMpUlNxMpYJkP8lBgNOmRzDOh5gAgw39diF1pwI2bgjTuGxJXyS
	1lDng9c=
X-Received: by 2002:a05:6000:2f8a:b0:48d:f160:efad with SMTP id ffacd0b85a97d-48e2d27f5ffmr1860341f8f.30.1792626013218;
        Wed, 21 Oct 2026 16:40:13 -0700 (PDT)
Received: from DESKTOP-0KSTGNI.localdomain ([197.52.179.68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828e2esm8167370f8f.30.2026.10.21.16.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 16:40:12 -0700 (PDT)
From: Temitope obabi <obabitemitope765@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Temitope obabi <obabitemitope765@gmail.com>
Subject: [PATCH] staging: greybus: audio_manager_module: add newline to sysfs output
Date: Thu, 22 Oct 2026 02:38:42 +0300
Message-ID: <20261021233845.15295-1-obabitemitope765@gmail.com>
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

sysfs attribute output is expected to end with a newline. The show
functions in this file return values without a trailing newline,
which checkpatch reports as a warning.

Add the missing "\n" to the sysfs_emit() format strings of the
name, vid, pid, intf_id, ip_devices and op_devices attributes.

Compile-tested only.

Signed-off-by: Temitope obabi <obabitemitope765@gmail.com>
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
2.53.0

