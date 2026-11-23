Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795461543;
	b=rvNsxa64oEkYxSerfeIw60fwghOc/6t0VtQ53Ai6v5U6NUgc+ANRdbrlTjzk/3iwumf9
	 9I/Z0WM49Mm09NSYly89UDQTKRBhXuAcFP/2mk1A5k8CjAkZOfW26wNQ5wvIkvg9spAil
	 MWVsgKLsbuB1whUdBaK8ADnvgflyma0J+hjXD05HhDnn3u2DaijnHhnlQTKKqpwZHuzgM
	 /1nbTaT9ZYnooseoi/q8OuhocaaHNZrN8YJChAmUi8M9vk9hckZ8RJLO6J3y25o83ud6O
	 33rpD+XDnGemU4AYEnMsjmiuSydOcZ2EWVpG4la2OnSomiyTB0S68m0ZuriptSzFO2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461543;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=l0qv643AwWVG9cOQkUVDoDNhVW4tHk/WuiVyVtFsmf0=;
	b=WOQWIdt6yWAZ1b/3ggh74GBessdjT8Gd/bPQ21GvOz8Q3/IezxCzUdLDEUWieVU2qAZV
	 SCB41DEsI1etKc0NEKg8L5qQ18BQceBwns1KASOL/eu8hT0GyAhffiZm9ftJGCeHsRL34
	 JbCyaYVnwY9fpTG4gAMVBbv9Mkjmriq/lU6GQZQ4BSyDAWUh9S3EMlptElKDzelhQ6DG1
	 M/U8O+zY5GvtDV/QXmZL5G7BL+NX9TQG5vB5+8+PtcYj45XOLunCrbW9Q+NJ2wMWu5HNX
	 2PxYDmCf0IEcZO7u8vcqGmrTbZP779rQLaqsiz7T2nCd1Wd8uGHX4ktOiFLWj+Vdp1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="W/TRqLCE";
	arc=none smtp.remote-ip=74.125.231.128
Received: from mail-oo2-f0.google.com (mail-oo2-f0.google.com [74.125.231.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE76606A31E
	for <linux-staging@lists.linux.dev>; Mon, 23 Nov 2026 19:19:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AE76606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W/TRqLCE
Received: by mail-oo2-f0.google.com with SMTP id 006d021491bc7-71b2566b798so340255eaf.1
        for <linux-staging@lists.linux.dev>; Mon, 23 Nov 2026 11:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795461541; x=1796066341; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l0qv643AwWVG9cOQkUVDoDNhVW4tHk/WuiVyVtFsmf0=;
        b=W/TRqLCEpGOLm7WWS1hh/tMemt8ivDsnDBMVwNXf14Ng0qu4qTIWPyRaj0SnqtE+2G
         9stI9hAuMfwU6bScmlLhgXTXZlfjkKQeqgYIMqPdUWimu2cz8DfQc6trQ3UCr4nzYlw0
         SNb+A9R0rutEFs7JBZCGqdpWyLyEQrEptqc6llJqXFgBhaICW2aIVMKChiSmOz4aDoQY
         pe7dZWcqzw45/Tm7RRyx8yELFZKs0Lh9RO77PRvOQfCIpYOZWchx7ed76pcXv/kaPEVR
         82kLg6Lz25E9YY6m5LjfSYMJn8BMh+whuCOxoOtPlX2sMPpEBctLL7eUzNwVArfb8PbW
         1QVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461541; x=1796066341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l0qv643AwWVG9cOQkUVDoDNhVW4tHk/WuiVyVtFsmf0=;
        b=zicQPszvgvzOwpKxc0VWaBUxhIQcqcu05DYjxGGxZYLAmTgchtpxPtbvIDeAdIPvY7
         Nk8FWc9kpMlZA8xvw1RyWULDtpC4TBPTkt5+x9ALE+wr6+cqDp/92KyshDKGUbs+c22Z
         3AJy6EixkZY8Vfspp/5byZ9GWkZPup1JkSJkYsMFhSpSd6UX89iR1CmC9ijSpJEEt67I
         iMP+mO0VEmsnaNJiX4mgoPqpr/GONkM1US8bP9tjqPzZ7ymJWiFFmm6soCp7fL4ddIQS
         HjA6A48CV/5ObdWl5smdD0fRGp40U8kuPkd52p9jz75NBFHM4HmhbYTEvXDDgz3eRXgY
         bKeQ==
X-Forwarded-Encrypted: i=1; AL+hErEvbZVEoW2+vi4DMT6pO8boA+L9lhfBKRKyGrd5OTPJGmj+0lMOmDbJc+PmjtWVMKlKYEWDIXx2coFDWQVI@lists.linux.dev
X-Gm-Message-State: APuU4Z8hcvZw9IY10NbbfXp+/ehRuE2kSw6YqGT5IJc1xToI3OqppFy4
	YHXMEN06iq4Gpw0IroA5oCBA+buKqEPSaZICGr5wtDXIPUm9Vgo+pqDO
X-Gm-Gg: AZFdTZd0x5osgaYJVJ7OigAN1paxpQPL7ZqGckEodZCdS5645HnyorldYiLtqI1xw3z
	KFWqFUa9kxQQTiFNWjynYIf9zqPhbzGtKG+KraydyYCDqbWAf3y/YeTnFn4vNwIbpyNfLwFaqO+
	HtpSWUnOtMKYRsI7O2BJwUMLYwJZXpFfd8/cthrqmggUlO7VW1PvRtWPU0BRHra+cEgPIDDr/s9
	2RWpDlr/X4FdmFDsWtOp8jJ67ppjCXNVm1SxXmw8zA7nCzyC7tsuzZdwmN5gonXUrfxfPbs0xwz
	d6qUrhj88A8/UVEn4WxwA60bw5JD7FRoRq18SAQloFUrNSPTE6+ca26qOM44r1f+xEFK6pok5bg
	EVlZyEXxhUDj8gMzj9URc0Uj6TNPC8A1+1twDTh/4JYCzKRWU9mqulzg+WBStMDsqrtWAbdcmWc
	bTTD8b88aLcsaQjFvAnf+wtIFR6LUULb9RfpIP6Wbt1Mqh9EPQeYrlWT6MvnJJ6Hs0YUbNlHku8
	SPsqh35gvPq2oT1eb/QHnoBW8XyfOZEvNOr6/f+wSWWegqhEwft3xqw6lNUxmZBEYBGn+7AJTRR
	PIgAxEKXTIsx/uuELv2D6InC0Dfjc/hyKD1ib1/E03+A2hB77/lyZj8USjdjog==
X-Received: by 2002:a05:6820:c451:20b0:71a:e82c:1eb5 with SMTP id 006d021491bc7-71b3920d96fmr6475933eaf.9.1795461541463;
        Mon, 23 Nov 2026 11:19:01 -0800 (PST)
Received: from fedora (c-76-142-242-58.hsd1.tx.comcast.net. [76.142.242.58])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168f3964sm9117818a34.14.2026.11.23.11.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:19:01 -0800 (PST)
From: Hezekiah Mogere Joseph Mayaka <hmjm081106@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hezekiah Mogere Joseph Mayaka <hmjm081106@gmail.com>
Subject: [PATCH] staging: greybus: audio: Add trailing newline to sysfs show output
Date: Mon, 23 Nov 2026 13:18:49 -0600
Message-ID: <20261123191849.232589-1-hmjm081106@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The show() functions for the name, vid, pid, intf_id, ip_devices and
op_devices attributes do not end their output with a newline, so
reading them with cat leaves the shell prompt on the same line.
checkpatch.pl warns about this:

  WARNING: return sysfs_emit(...) formats should include a terminating newline

Add the missing newline, matching the other greybus sysfs attributes.

Signed-off-by: Hezekiah Mogere Joseph Mayaka <hmjm081106@gmail.com>
---
 drivers/staging/greybus/audio_manager_module.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index 8a9f7e7d1766..2ec56f19b8ec 100644
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
2.56.1

