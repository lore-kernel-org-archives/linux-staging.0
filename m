Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E37071742
	for <linux-staging@lists.linux.dev>; Mon, 25 Mar 2024 22:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711404968; cv=none; b=EEuiyi+cB0d4FWEYbOKP+iwl+z9XaTh/UoQrmBdXVJyPRg8g6bMXIHvjJMV+1E7/Vob2tApLMzRqb8Jyzv5xAOctLGJEeloQ1tN1dTPGvM9RmQpEGStde1vnO21NSlD/mDNnVecxPsZUGlXtePklF8xMXCMYpmnKyZplWoELSxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711404968; c=relaxed/simple;
	bh=/IYhu1O9vp5YJVIx7L9AA3mBL+DjrLYjas3+GXPAbMY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HSWrtdvRKlBYl+NC3aHf3tO+JLTPZ9q64alwaUKpMtKxUM/6QViAM2UebAOEyMmsGg4KrY7HAsIYuIZn34FoAK6ZEV3XobxbkXkxNClGIWwjB02VecGjaIZ+eu/rdJEfeI8+L2GOjnGpTwQV+kiGmQMNOI8pHJhmicbNhzzVo8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GDidabaX; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GDidabaX"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-33ed7ba1a42so3285804f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 25 Mar 2024 15:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711404965; x=1712009765; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2JL31owuATMRfQL/MmwYmGoho7jdRbWpt53ZxEjx8hk=;
        b=GDidabaXlfQsUMMBuZD+OIO4kzybJfsxo21AZ6+7MBWc1ZdZ/sz2/91KFaXpC1VNgq
         YR7fsEDeE2WU4BTaBWOK6TmUcPUEbhetVuI5BXJVIWK4Oz5fUiaTooTPOIL8s4AlJEAQ
         EPabD2EzWgPn0mnyXlsSygB0tXB2boxNsC5WF/L7CjBGx2som095VRjv26XTLkFJRNqp
         inwKEg7FR6nSWGiVSWwRrNl940/zggfAhE9jZikOflZJbcfZa66WuxmTScy7voHSr0J1
         MSa0XK2IAwq2v292tc2NKi6qFcmHVJg8CoJyKS8Rsij7k/0UjSeMT2+LpN+8NKfl3tsv
         ElgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711404965; x=1712009765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2JL31owuATMRfQL/MmwYmGoho7jdRbWpt53ZxEjx8hk=;
        b=dcXZHNOABYnYvJEzGJLXpd0apTxwotw7tIvUUaJJDXtyFx/9OcgCZuPNjwt1Z3JldQ
         7YIAqzjPYI6x7IwBRsjgpeCnPw4xtpMIF5km/j80VQD3CiYNEbcaGX53VVZXDf/5FxeP
         vfOT7ZNMFLqXxjsPxNVnYKt6cH8Pg1SDBFSIojoYTPPqaYRDPgdgnrh5DKASExFButEw
         mEVCQyEVuTXRbT1vh4J0V1AMFKbJL6AgkAU4b6PtopxlcyTnv0Jk8FvWGEPGcj8hPnHe
         PsnkKJLDnFmFfSQbmnblFKj660FpHPdOMGE/9n6YqR3OVzgRkpsYOdfFS18IXcoPL652
         wNjg==
X-Forwarded-Encrypted: i=1; AJvYcCV1MBxoDbRLY0K+D9UpqbEmHxXKVek6MIEGFoEwdHbJyW66XhtwRp9jpZKbjC/kmOImpidGy2HaVV6xm61oIEEadyDvvRzHoeNXDp2tDQ==
X-Gm-Message-State: AOJu0Yz4b/R+xjx2wrgfIdLrLM4SNvdr/j9PgzpG0ZI7LPse/flWahGW
	Zb4RySFcG/CziX/3956bNg8cKC9NwElZYPgBhA3lVQuYY4FHHz2e
X-Google-Smtp-Source: AGHT+IHl4+DIZuskRlIkJYs/YJYY0Wmyi4bl7/wsiQ6fKQh4yPx4UW3w5Y41v4PgFtYQ7SadRYsfDw==
X-Received: by 2002:a05:6000:e52:b0:33e:d229:35a1 with SMTP id dy18-20020a0560000e5200b0033ed22935a1mr5570072wrb.65.1711404964314;
        Mon, 25 Mar 2024 15:16:04 -0700 (PDT)
Received: from arch-thunder.local (a109-49-32-45.cpe.netcabo.pt. [109.49.32.45])
        by smtp.gmail.com with ESMTPSA id i5-20020a5d5585000000b0033ed7181fd1sm10507076wrv.62.2024.03.25.15.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 15:16:03 -0700 (PDT)
From: Rui Miguel Silva <rmfrfs@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org
Cc: Mikhail Lobanov <m.lobanov@rosalinux.ru>,
	linux-staging@lists.linux.dev,
	Alex Elder <elder@ieee.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH v2] greybus: lights: check return of get_channel_from_mode
Date: Mon, 25 Mar 2024 22:09:55 +0000
Message-ID: <20240325221549.2185265-1-rmfrfs@gmail.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If channel for the given node is not found we return null from
get_channel_from_mode. Make sure we validate the return pointer
before using it in two of the missing places.

This was originally reported in [0]:
Found by Linux Verification Center (linuxtesting.org) with SVACE.

[0] https://lore.kernel.org/all/20240301190425.120605-1-m.lobanov@rosalinux.ru

Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
Reported-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>
Suggested-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>
Suggested-by: Alex Elder <elder@ieee.org>
Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
v1[1] -> v2:
GregKh:
    - remove overkill WARN_ON and replace it for a dev_err

[1]: https://lore.kernel.org/all/20240307094838.688281-1-rmfrfs@gmail.com/

 drivers/staging/greybus/light.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index c6bd86a5335a..9999f8401699 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -147,6 +147,9 @@ static int __gb_lights_flash_brightness_set(struct gb_channel *channel)
 		channel = get_channel_from_mode(channel->light,
 						GB_CHANNEL_MODE_TORCH);
 
+	if (!channel)
+		return -EINVAL;
+
 	/* For not flash we need to convert brightness to intensity */
 	intensity = channel->intensity_uA.min +
 			(channel->intensity_uA.step * channel->led->brightness);
@@ -549,7 +552,10 @@ static int gb_lights_light_v4l2_register(struct gb_light *light)
 	}
 
 	channel_flash = get_channel_from_mode(light, GB_CHANNEL_MODE_FLASH);
-	WARN_ON(!channel_flash);
+	if (!channel_flash) {
+		dev_err(dev, "failed to get flash channel from mode\n");
+		return -EINVAL;
+	}
 
 	fled = &channel_flash->fled;
 
-- 
2.44.0

