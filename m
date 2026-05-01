Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B511A367F21
	for <linux-staging@lists.linux.dev>; Fri,  1 May 2026 14:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777645027; cv=none; b=H2Tnxb8DZPyZf5qRntbcuBOycGJfn2kVagHlVBuC9J091hSxuW/890hRXNXVVHtxtxoNcPeMuCtzSFesrkiVffCvnZNWvzBT7y7IGdVkj0XMQDLFeWalJ53E5JgIqclSJ0XlL71BahwKx3tWPRzJzWaEcxAucFALkRFER7u1ywY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777645027; c=relaxed/simple;
	bh=Je8A1JMAIx/JqcPYGzJKsOaZh8ZNsgWDlpuE+XhhojU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TbY+48s+6nZqjqeINbCtvVrvjCEFvGh8hTv+OTEr076nYE6443LnDSmpy3as0x8/4vBPSM+Xn5s4/dOQI8RZWzlX7QCEMDVG7lzdeIwulfuMjgzaFlq2e9jDg7Fas5shbPQED+BtQZXuhd4eBi6O5csAeDm0PM5zuwdjGedaJXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a80xZDX/; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a80xZDX/"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3650a4eb605so44193a91.0
        for <linux-staging@lists.linux.dev>; Fri, 01 May 2026 07:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777645026; x=1778249826; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BpWu2F1fF1FptrmyDGMQb5fmzeBhfU0DO5L7Hlee5Z8=;
        b=a80xZDX/tsMQD/WbPPe3U7zwsjIf4DcyiOP3+dKUUgKKRYoHO97+sqYJrvRDhrg5kg
         5rO+DR3kbyaRmYfu6NmSPGf6NSOndXyoEUJmUPkJGRcBhFZ7xtCYWv3Oo0Vinkc6wH9V
         n3yCHhAVIfDeV2/BFSVCFG4kOu7894Sd4eM9b6tpGnu900G6v7/IltwaR/SBqoU0zXmf
         jyRkZzps29JAU3HEPfJFLCzKRRrr5nh7nhYFzSBL5TUIeiF2erNSpXXCEDea68UZRHSK
         YQsYACHzdY6+VGAT3WzRs/Cu+bOLe7X9ueMQRBLaH+eOw0652qunybFqK33dbAPQjUsz
         WnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777645026; x=1778249826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BpWu2F1fF1FptrmyDGMQb5fmzeBhfU0DO5L7Hlee5Z8=;
        b=RgmgNiAuDsGcwES+qP1dMOh+s6O4dg+bzwCt1lRnnBHrpwNACZYygOxWipzhFZa2Lg
         EZfRmQg9pIX1WoQMe5GgvQSjlpJyRyu/43iY59cl/Yk2/heYEgydgcRbF0YPfIia1ZOa
         9idx1Hx8KyyLwFa+raWLndiV9fSpnS1iMQoo72SUEAj6R7gePsXJJe63Nf52zr7wMMyC
         wSK/FneGo6St9df49uMBIV0Ud1kmFkht/MmVxJnbcSlJPT0aEGB9N4wo616bNVlGbxl7
         ATnbH78tobSnF6d89VO0zebyD+JoJ9zWkAgQ3s1iSnq57edHF+F4GzTNNK9I0OC1CAmd
         zLdA==
X-Forwarded-Encrypted: i=1; AFNElJ94MdgHxExYLhPaWBBB+/fiHhuD0ZxrZom2BAiaix1O7KGv8vLHjy92Ht1xpBwAAewNiq3Ct5U1gcB6a0zA@lists.linux.dev
X-Gm-Message-State: AOJu0YzLDNAxqkwEfw2pRwisTWkgc1ygRRxxQB1zBRTHPj5aHH6Zpzkp
	dRPiU/PHmnnr6PL2sPbKz6O/OpojYataclZiXYv42xQcX9pvPvofhrcc
X-Gm-Gg: AeBDiev46ogVxMyE5ya9GQXzwrxeri4K/A22PPpWzlINGRY9BmkJfbjQjDzdMn6X19U
	mXItIFOBXNh7nqe7HjQ+UWIofC8jN0HhuBqGyrGEqUWl5S/01KQ0ksqhFg2KpppJ/XngobAqfrR
	H3B4sXD7ziVGMf1Y6VsQI6X5cZrlzZ42fVlW+IaMCFziYGgnJzX/K/7GIZMIjrafJX0bekJonsL
	lJMyUvm665Tm/C8XAgdg55+NB7979kbsg+btgMVZYdNRFhSwmau6rY0ySR+SpnF9PPn//d2fyzE
	vsz6exBrRgM/15hWOM2LPoZotWY3fFuKlugQ+F84SHA++NWl73XMZq5wT45WrUMzx6aV4blwcmp
	kLEUZgAR6avGzKrabRx2hV7/a91slxfPGKVuvmdaUFRm6WP78f2Sbfem9uy7gMxumc5sZrzymyX
	py/hmUcSQIdUbbT6tBjhCUzpsyHTvDrvb+VivSGqdQ3vLNw1BP5WUvbUO5pTySs1R9Wrl0/CdXJ
	I1EBag7RsRJ39xFBidVq843ZARhxYe6+Q==
X-Received: by 2002:a17:90b:1b4f:b0:35e:5aa5:ae38 with SMTP id 98e67ed59e1d1-364ef3a6e12mr3415480a91.9.1777645025909;
        Fri, 01 May 2026 07:17:05 -0700 (PDT)
Received: from shyam-VMware-Virtual-Platform.localdomain ([223.181.115.140])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364f4558e0dsm1025415a91.2.2026.05.01.07.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 07:17:05 -0700 (PDT)
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
To: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Subject: [PATCH] staging: greybus:add missing newline in sysfs show() output
Date: Fri,  1 May 2026 19:46:17 +0530
Message-ID: <20260501141620.24411-1-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sysfs show() functions should return newline-terminated
strings.Add missing newline to sysfs_emit() format string.

No functional changes.

Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
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
2.43.0

