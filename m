Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794575173;
	b=s4We7y/QhvjyNm65/u1si5VDtM5AxtARtzBHjTX1yts+i756kroEYJxmbrSckTieImpd
	 vWELYzE8NLBd2JZK9xDpG7OXnxqm8+5cn9wtbryebsOWBaZvZutnZkiZuABoKbvV3EWGd
	 rg6ff+3wtmp1LkcSkYrydB8dzlEQEYqItnPNKxxcbuJXxH5m1owh2DTStLhtCV7nwphp/
	 ya98a9m1PJ5hsFQ6l3+SrJe/Gr/Q/20buXW6itIPWuaL31El6qfBU4HuIvI/6efDYkBkb
	 FH7IWmhVJM0GndqlIdYpbV4+mDDMhiJIVfsWKIam39gIVTv887lbzw85qqReFRfDjFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794575173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xT6/02hBaUasCAGFwUh5CvkWepBMBoWWF+g72TdI+6U=;
	b=Zti2sBJxi2wZ/FGXcyHJoWIi3IVYBwg/lR3yarXp5WwK3YM4Wb2rluDsXHcTlSUpJbV7
	 t6u6E0SbfU2yvPetx3Ek5XsBdLJIge7WBMifIEZHBJdl2U5zZezf7yaPu6GJAIO4bOGuI
	 OtLGOrNy2NNEgaXaGwPqSJONzJkm7txVVWAkmIlElLsbf94PWiq0fwV9LxvtfnrldK6hF
	 He86Y+A3A/LsS77nT/uzAFcMRyAr5gqQGiMJkZBREy6iOYZCS+SyG/clEkPvQW+/xsmG6
	 XNdSsYx7gdHW+ST3ISI9ICb/kwErLM063ffRcnlLU8LYVutV8XLok1fmEm+BTm5PvtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xMkcnHx9;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2012C606A885
	for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 13:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2012C606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xMkcnHx9
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b3acec6677so1039262c88.1
        for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 05:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794575172; x=1795179972; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xT6/02hBaUasCAGFwUh5CvkWepBMBoWWF+g72TdI+6U=;
        b=xMkcnHx9p3/aSfC2VG1hJcjDROMP3XiccUbYmH+0xqJjkjC1HO2PHCFlAY/ZN6Q4GF
         DVXYik8RMtJRS1bc/q305TnDSbzw6oxOEhdTMHP8zKZ1Dm5kcpntmeqfXXFogIkRmp2A
         xmIc0oiTqjAjN3TrBRQICauEGcPuJ6gM+Sy53/DccZaqX8Oeaffdv4c+GDab/LO+VdRE
         rifdjseSxzQVljiAgBriBysPB27j3WDVxY28Ion05STpxmkhyapLtFfQ55czGY6bp8lZ
         yHl0jj7BzbWHijNop2q3LEzSWV+W02FoTd7CeftUpOkkHc9mlEwmr9RXMg0HbArlWIoJ
         1YXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794575172; x=1795179972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xT6/02hBaUasCAGFwUh5CvkWepBMBoWWF+g72TdI+6U=;
        b=0jMhdOS2ahNUKbTzGj3QQ9WDKvzygjUPZECyM8sg7VO5b7RhM3fK1xL8j7Y/U4YQAU
         +aoSABbJuTYL0KbHVn4o/m+TUO7WVajUSXGkNwfB/9Jb146t7kpNJ7L9/W1muvHxipZl
         W21pltQNgWmmshnssIylvx6mnYTOQP+3Fw6PAiKit1QwiquPzoNX+dW+f/diR+GnztPl
         wVTjUWRLd9QwRcwOaOkyjTn7cM2yJmOO5XprU7sac/CU+hb0/mcC5h/NSghmIG7WDpyY
         1Da+2Et+ULevICaXRgUf5J/ubVCpTF1Lz8Y3iZWBC+wwBqdE9mHzYmuGEtERFfkQ2Dds
         Yw4A==
X-Forwarded-Encrypted: i=1; AL+hErFQjy9BL3sX48ZwjEaiEVoC2fgyM7R0HBar0DLe4+6P2YeJwbrA4uqbK6dNnXWNoxpsRILWhspqjAd9bFGn@lists.linux.dev
X-Gm-Message-State: APuU4Z9dMhtR9yrLNY78iSLcvmOfGTegMEfMQi5A89ku17mtlToypkLO
	x1dF0xgprfTcaDCfu3hx8h4C0f/txnGtkVT5FDeeXRhTXNvxWgyivJ4Z
X-Gm-Gg: AYBFou0x2w+QGp1moZhCzT5ZU2aAk7uvLUkWqHPIM+9GAASXQkXPZYnNvVU/7SKOJMO
	h4hvsCF3+ArOtH5M25VoCOG0d9DXnVn0mSVot8310R5vEdd2zil/ybKb5riwiYpFyXRa/jYnhmV
	MtPkzc0XtQ/EIms4v9rjjK5c49WLWize8Ky7b/iOY0Hj7vbkgC+Y6C6HZsx20GYAAjuIg7BQYdq
	u2JLqtWxkfxmo0dXgmAsFTYBZAubhdg4CWCZAlrdERHNnmpCX/5LoTNvb5opsmsS1aVAkIVk4QF
	ADU8+6D5wDQCSE74ImpoMLnW85IfFZqZhEeogkszOBhD+4lbFbX7jaAYo5Pd+YMokdWyb2YoSFR
	N+zxGRuB9RJnkpfkt978lEiyzw7OcYD7iD8cscOpavQYOtag/PCKIroEqe3d3AMEKiaatJtY5ge
	gvQiZm471vjzqw0RwApFRWOJb/ZSl4/R4cG0X3s+a8vgk5RvnIMhz2XWQbNMYicTwkcY36ng3UO
	wIRCuxhmOXudSa6itQt5fStylhJO8MkWbYB3s+Sk4Msu7UZy8diAs1hecsBjpZ4sPVIik2vHLgq
	8sHpHn1FVxm24dHgxHFhBXu9eZWK
X-Received: by 2002:a05:693c:8310:b0:36e:3ebb:7ef3 with SMTP id 5a478bee46e88-37968d8a404mr2101819eec.39.1794575171781;
        Fri, 13 Nov 2026 05:06:11 -0800 (PST)
Received: from joyboy.. ([2405:201:1:3910:76e1:e2b5:93b5:6091])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm14704860eec.20.2026.11.13.05.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:06:11 -0800 (PST)
From: Rishiraj Rajgor <rishirajrajgor@gmail.com>
To: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rishiraj Rajgor <rishirajrajgor@gmail.com>
Subject: [PATCH] staging: greybus: audio_manager: add newline to sysfs_emit formats
Date: Fri, 13 Nov 2026 18:33:24 +0530
Message-Id: <20261113130324.34353-1-rishirajrajgor@gmail.com>
X-Mailer: git-send-email 2.34.1
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

According to sysfs guidelines and checkpatch SYSFS_EMIT rule, sysfs
show functions should terminate outputs with a newline. The show
functions in audio_manager_module.c omit the newline character from
their sysfs_emit() format strings.

Add a terminating newline to all sysfs_emit() format strings in
gb_audio_module_*_show() functions.

Signed-off-by: Rishiraj Rajgor <rishirajrajgor@gmail.com>
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
2.34.1

