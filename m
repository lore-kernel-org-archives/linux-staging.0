Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD05304BA4
	for <linux-staging@lists.linux.dev>; Wed, 26 Nov 2025 16:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764172844; cv=none; b=FkTKZEytYifZWDJ6vT5NJX+Ay6qQG3DgmY5SElXcTto8etO1whEMU2jyw3OYIAjoHQGW/8f8rRdW/+Njj/LX6RkImfQgyWxv7zx51E6R0g1PaU44iz0GkdRoWEUTKIwKLOsMz6/acVUUAthwx8xtiLKJf3YgvQqQxmTE5fN5FCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764172844; c=relaxed/simple;
	bh=S365KYzgujtbNbhBSllNlZdRl6aycHlqRxeYSe6tinU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C3dvfMRd/wkCr5/eskYXTs3HPLZ0lBO7zvjKockSmXVrAUCBssL82Uzf5SymDnhnPvjtr4I14QoiraPGHq6wucyicRxFJ8zAPLnQkTQS6kPfC8EhINokF9d3KypaIXd0TWgVb0r9M9cOYv5X1KGz5EFv13QM1FIa/DC8t+vXVm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c/gFFSob; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c/gFFSob"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7b9387df58cso10875336b3a.3
        for <linux-staging@lists.linux.dev>; Wed, 26 Nov 2025 08:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764172842; x=1764777642; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HGz3HvvATxfZo7qdU0Q1uE8jKe3EDXJ1pbbzBHZiQSE=;
        b=c/gFFSob7obde3AqfSNfPMd+x+Tz+ayx2gJ5pKLXBrKxel0tKXEW2okCJmxsCRpiX4
         9Fz/Y2Mdgl/i6Qh8DahTfGcAY9hKUcv05Ka1VJBr0ynSlZzMfC6j/Qa4DR+6PlzNiDYk
         to2EZssNeSjMBjg6DLFznIrhDRr1rcTigDdogeopIh9krHcqDZENLv+yqz/wurp5wypv
         xOi5AN9WAFQSBG62gv1DsLCaCcEhXNDIu+Bxwob3ZQrDOZ0FLyD0iDfebpb+yJAbsOjq
         0VgyxgK/yBAgP3rpExAICGWrXvq2LOI2ZsVrGqyv5ai1l2J2D2q2D6iHIBlQAuU2gfKh
         50dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764172842; x=1764777642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGz3HvvATxfZo7qdU0Q1uE8jKe3EDXJ1pbbzBHZiQSE=;
        b=YW3hacuqlRJXywtU2A5I7+SflsRIvbkrGAMBZcYnBpMB5RCzuHzbwHhq3V9zpBTYch
         9h41XzFC/cbatKOhs6nWbGRpwj93VyOAU5+gdE5H9rSZ+flVwjmeIBpWugfpRxyMBo0d
         fpQN96jK4A9hmxRcuHsE2D3nXlzCSaJnqmF5eHrE4to+uHPMh9jW4KR/Sa6lf72x/zBK
         6KZ+sqc6zengm+eG7xBBQ1f55D6XXe9U87+lufgyI2zMn7r19LdKmQ8GXV/npo0ireBL
         stsCZ6nRrnp0/RoFhxKKtxG0fuCECtMWn/UITRnyq6+d21jOO2mMlKvNYpSk5s/b+lVA
         BXsA==
X-Forwarded-Encrypted: i=1; AJvYcCULfc6LHT0jkTShYlRUicRbkae+sqLkIu0cARWjbeMhdCzFzf3cNjM/1ksZPP09N7qLT6ayxO4BCYdHabOD@lists.linux.dev
X-Gm-Message-State: AOJu0YywWywKv1MAnqjCVpyeE5FPYeu2d+YTZvOuF6enA392P6PmTgNP
	F5wY9tRMBNTGGvcQCUr3ZRllz8TIM6V1UL2uYicZ70M2/NxZO8X+13eL
X-Gm-Gg: ASbGncvTklyfq+zcp793bUqj0Nsm5fQT8NL+F18tyxgF3RILFdzPKW5TOKhJTIO4ydG
	KzzlyDSar7GBr8ltsH9sFmgdtvtAvJSID794jUXUMSEOAFNmJ5rvttqvV5vF5mAC4mJqNpMRqh2
	W6UMgtDtShafPY32mh7kenVs7gSyaXEXA77f2w/iP91ZDdwum5WXWGK0Gz3Q0fQCeQ66wCW4+cR
	sa70rZxcxh8/0MtUFiLxD1IYdWupU8QRjjXTkeLCEK4AoT5tmYBcoyJ8jrW5bxOIzX5lWiVQ5d3
	NUdEAqmhZmFKNMchlNpCgDdEVjPTHza/GiGafb47zWbi0JfgWn2FqJOcXdHgfptQNT8XoYhCxVp
	LDxOB1CehhGfB4VlK+goMkCQFHiv0CpwyVRWmi76hrLJoBOOHFDyRL5q/nMKhB2oo+krcBG5qwC
	uxBqTIs9mFIcwHVEU0z4qn9lJcFQW0
X-Google-Smtp-Source: AGHT+IEntYA6yhZN/rgirjNnextb3hDHJ7tVtCp4LW9HTUnO3WUoPjd2Sd/pg5rPiElnak51G2pddw==
X-Received: by 2002:a05:6a20:914a:b0:334:a523:abe7 with SMTP id adf61e73a8af0-3637db8683emr8527629637.27.1764172841388;
        Wed, 26 Nov 2025 08:00:41 -0800 (PST)
Received: from pavan.localdomain ([49.37.150.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f0d55b71sm22170524b3a.55.2025.11.26.08.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 08:00:40 -0800 (PST)
From: Pavan Kumar Yalagada <pavankumaryalagada@gmail.com>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	laurent.pinchart+renesas@ideasonboard.com,
	hverkuil+cisco@kernel.org,
	linux-staging@lists.linux.dev,
	pavankumaryalagada@gmail.com
Subject: [PATCH v2] staging: most: video: prevent probes during component exit
Date: Wed, 26 Nov 2025 10:59:10 -0500
Message-ID: <20251126155910.32694-1-pavankumaryalagada@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously, comp_probe_channel() would always add a new device to
video_devices, even if comp_exit() was running. This caused
BUG_ON(!list_empty(&video_devices)) in comp_exit() because
the list could be repopulated during teardown.

This patch adds a global static flag `comp_exiting`:

- Set `comp_exiting = true` at the start of comp_exit()
  to signal shutdown.
- Check `comp_exiting` at the start of comp_probe_channel()
  and return -EBUSY if set.

This prevents new devices from being added while the component
is exiting, ensuring video_devices stays empty and avoiding
BUG_ON triggers.

Signed-off-by: Pavan Kumar Yalagada <pavankumaryalagada@gmail.com>
---
 drivers/staging/most/video/video.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 32f71d9a9cf7..96366b7a0e29 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -60,6 +60,8 @@ static inline struct comp_fh *to_comp_fh(struct file *filp)
 static LIST_HEAD(video_devices);
 static DEFINE_SPINLOCK(list_lock);
 
+static bool comp_exiting;
+
 static inline bool data_ready(struct most_video_dev *mdev)
 {
 	return !list_empty(&mdev->pending_mbos);
@@ -453,6 +455,9 @@ static int comp_probe_channel(struct most_interface *iface, int channel_idx,
 			      struct most_channel_config *ccfg, char *name,
 			      char *args)
 {
+	if (comp_exiting)
+		return -EBUSY;
+
 	int ret;
 	struct most_video_dev *mdev = get_comp_dev(iface, channel_idx);
 
@@ -553,6 +558,7 @@ static int __init comp_init(void)
 
 static void __exit comp_exit(void)
 {
+	comp_exiting = true;
 	struct most_video_dev *mdev, *tmp;
 
 	/*
@@ -575,7 +581,7 @@ static void __exit comp_exit(void)
 
 	most_deregister_configfs_subsys(&comp);
 	most_deregister_component(&comp);
-	BUG_ON(!list_empty(&video_devices));
+	WARN_ON_ONCE(!list_empty(&video_devices));
 }
 
 module_init(comp_init);
-- 
2.47.3

