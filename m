Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795444864;
	b=SM/iAbIRVr1MY2cY2LZV03zySoZ9EcNWBaJx0jR0KnIp59je7BPcRsg6ljoX77QmZ8xJ
	 YvUhqPBswEeMRUon+nzolIoE10q58Gm3XLebrngy8Bjfh1GvwEJuk5wFzGwYBzPxNPbyK
	 jHb7u88Z5Oiy8wqGFW1yrWRDIZbmA3/bL7FA5EmDkf4FJUY7XAMMsNbiZI5m1gjH/6/73
	 k1yFGxiBZT+l2NH8HtlAOdi/LZ9fMHZ26X+Ina8llu3tOXWpcL1bVWYnvBrOULsFmilmq
	 OzUT7FUL8x5R7llZZSvds76WWgV1zTM7P2LiWtXUoZWqNKxCFp7xmJqfO1XKPDY5dtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795444864;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vHYFS/XA42NItihDfLyNk8KqlgIS2lvi89C3pwr65eA=;
	b=CP1+QtHXn+lha0s66yD7d9Gg2fRIAjotPxL7mDv5xCINg8+8/Yw9gA73/xsaerfm1VQC
	 zRrHsquGM21K1qWAvhMgig2zgKoodsrMiL5scsNPQ46UioNGshBv/h2y3XjJGq/O043Mk
	 o+BePYhjAooVY8iQb63pw+2wawrJWAIHEywo9Si4cYUP3orrV2CqA1tQ/WfgvJt0FbCzi
	 RpCb9GAyKw3+2vThB/ZZhk+btej1wwrHSHVRcwV3uY6UF8Yu98kmywWS6MAVj2VC5/LQA
	 fgk9nOR2Uv+T+dvSWr+rp6hmVJZHIABx5jBvwrEOpkT6rT6MOswpNDjsC8BJjkovRFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z3Tuv2qO;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6872A606A31E
	for <linux-staging@lists.linux.dev>; Mon, 23 Nov 2026 14:41:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6872A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z3Tuv2qO
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso3029505f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 23 Nov 2026 06:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795444863; x=1796049663; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vHYFS/XA42NItihDfLyNk8KqlgIS2lvi89C3pwr65eA=;
        b=Z3Tuv2qOBOrlzc5H+JRIGnyLFCLSE0rfI2uY/822mW6J8IEyBk7kbhywuqHBDjrh3N
         YGnIo2+McBRnkuB4AOEny9xh3vWYVE2l5tBnGnP4tzYfrKAIYTVdcUZTNSH3obtqLwNI
         uVeiF5QPb2oCfSzVJSa+i6ajz+fQ/+GQ3S5RZm/gDy68a5kMTb0Kzxct+XsnEVVEV3A+
         xeNzI5P9+fNMYuEIcTagzkYEzjKUgNbiaDvTZd62/aBzwcAf6eFxDnuUPUiR2S7e+sZO
         4ajFqw5rsSYW6ihh8wFtbudSq7fU9jy76jVlrU+IAyvKK1pSDCb74SwNSSxDQLjGrVLv
         Jtig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795444863; x=1796049663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vHYFS/XA42NItihDfLyNk8KqlgIS2lvi89C3pwr65eA=;
        b=o5sa7klNafIARYBn77J+KO+0BF39VZBoEfs2oPWmgWadgK4bWYNTW4T4yOOx2gB4vV
         WbLrVgxIgP2VOAtwXP9kTPdtHTq4H6p1IytgYReeSYSPhUhzRqydzgEGW7L64LNTmov1
         2DAwreSJQajiHfRVhVL4Qsuv50lg/G844TImhbqO0F07xZZGiD1RzY1MVPM4FyoA1zmS
         ETIqwFnaI+rCC+S17k4WNUZNqXiJHry8xV9204NNWF9pBSA0v7JxhF0G4qBd2Mxlh/uz
         E3QkBUE9j1iDTjBD6EKQU3vCXRw9iFkF5W3+BBoM52T+YqK5QjcdYTjLbNG87vsyfFkh
         QH3g==
X-Forwarded-Encrypted: i=1; AL+hErG4n6y4gfdbuXkFiJIH8bLm+y0IhGopTW+nNeSBGDu3YynMqu/kAbY30o8PGuZaAMmHscueB60FNq/RUBs4@lists.linux.dev
X-Gm-Message-State: APuU4Z+cIv7Ms0umo+D2+TP9VnLWrRNX7n7dL2KNEFnRpLzUxPjxAhwH
	DekcZ2P+eQJx36Yl6hAKU7sJ9d2ibvXrOwFMk9W+Rwnj+ajNNrVUtaXHIS6nkDrN
X-Gm-Gg: AZFdTZcKUe9e/iJA4b6HdjvHJj7R0i/HPA8v3Fr5uUfDqQj/MwfIf1aERNpH7Y738k5
	HM5kZjUrSWjsMdLjMnlH7jck2eeOukFZU/XkelEE6rnawJJRYM5p8rozwrza8OemVigoPOABL5m
	HCv5ILsetOjb5bbodidLdbQqw5XRJVhLrikJxFlmTNcPKEBHW+KoIc1axRwHcud5KtmfgHMfMEz
	rHs/iH7GSXWE1uxzjhhIoGuhvMMhFOtYWzdH1wj47JkCR0kCChxVtB9gRkTrweKxIjB7v0iMcMb
	+YSiruFFBKEoS5Vj2gtZWzK23s4olhhLI7kIqc5+Xdwo46vx6fhWWIu9eSnaewvlayl/Wjo3q6t
	uhSBs+9T9IT09L7cwTWgLykY+q2hCdSnupRcoSBNbDDdQ4iCqWGAAYa9u+AswPfSDKE1KzrMPj3
	bIIl690a/uisfNKFDdJA5L6129xuuTN8Fc0pNYdIjxbjH/2N68fpBVjvpcdr9VsbaQmlaHM/NbU
	Hc178gZkmCD2/rtfXvIk7U+WcSwXXr76jm4fYv37RmPJ2yCkEaazZ5dVxR+pWUDrH/XcIZezqWf
	dSGLv1DOyu59YXYsWbIfZOniHe26HZrFdUHUJ+wPXUpWQeHCzbiLHQZ238F6UG2sHvw1Dr0p1qa
	IAVUQOYn0SSU7txcYbguYFnMBSOyzWZ4A
X-Received: by 2002:a5d:5f4c:0:b0:48e:5d33:da5c with SMTP id ffacd0b85a97d-4abad5aca65mr22742777f8f.1.1795444862527;
        Mon, 23 Nov 2026 06:41:02 -0800 (PST)
Received: from Alone ([2407:1400:aa0f:8050:aae2:91ff:fe57:5e15])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm25598524f8f.24.2026.11.23.06.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:41:02 -0800 (PST)
From: Chhabilal Dangal <yogeshdangal66@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>
Cc: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chhabilal Dangal <yogeshdangal66@gmail.com>
Subject: [PATCH v2] staging: greybus: audio_manager_module: add terminating newlines to sysfs output
Date: Mon, 23 Nov 2026 20:25:42 +0545
Message-ID: <20261123144042.60090-1-yogeshdangal66@gmail.com>
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

The sysfs show callbacks for name, vid, pid, intf_id, ip_devices and
op_devices print their value without a trailing newline, so a read
from userspace runs into the next line.  Other sysfs attributes end
with a newline.

Line-oriented readers treat an unterminated final line as incomplete:
read(1) returns failure while still filling the variable, and wc -l
reports zero lines for the file.

These attributes have no Documentation/ABI entry and no in-tree
readers.  Adding the newline does change the user-visible output, so
it is an ABI change for any out-of-tree consumer that reads the raw
value.  Please drop the patch if that is not acceptable.

Signed-off-by: Chhabilal Dangal <yogeshdangal66@gmail.com>
---
v2: State that the output change is user-visible and may affect
    out-of-tree readers, as pointed out by Dan Carpenter. No code
    change from v1.

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
2.56.1

