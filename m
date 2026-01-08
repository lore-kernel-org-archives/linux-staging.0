Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBC7421A19
	for <linux-staging@lists.linux.dev>; Thu,  8 Jan 2026 10:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767869410; cv=none; b=lITwle79BwQ36bdvjSJ6fOpB/DhaoYABW4xqt9q4B13K2itXfvHhVpVlQFEu8XjyiawVTdPD17+H5o7OBbQMiUV1EVcOAGREzWPOt+jmVNEtrHjbaZ9NczxREvX80KYp2BolbgOiW8gl+ucf8py/KZ8sBfvE+GI35HXyPyY3Gec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767869410; c=relaxed/simple;
	bh=jT9R8bu7GP8nj1D0asBMoFKBtBgk7PmQ/JQfCIlQENk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b8XfqaB7lFzQKJ7Xk07c+HNoZukY9J4xNfUgmg4KSl39FP8/yI1CrZ/au6IaLitV6MB+FYkNofShBiGiB9jYMz6c23O8ZUTEV+aEYhDduquzy5Plb7fsoaCW6b11nO5EDzGeC98fmKkmjhlp5rYYDD6IPV/ILkVXdhJ3ChZuV4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WdatV32z; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WdatV32z"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-bd1ce1b35e7so1942127a12.0
        for <linux-staging@lists.linux.dev>; Thu, 08 Jan 2026 02:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767869399; x=1768474199; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EjN6KRy96rZIFzVOVO0pR3xnbF0qB/QSbEh6qKIJyEw=;
        b=WdatV32z+XHo+KjzcryH8pWF9N/BYikE2BLVHRk5flmKAkCutf8b/HPl6FO4c4IvKk
         Xl8rRXKz5YmBq0Iso/XSGrK5amXM3w8OcVE6izhMsM35SDWtVMAf4dg94QiWjDVbKpXh
         GORZGMemGp/xdJhspekGMYsE8+hzUcUIk1sY0yoYHNvUePXEXwujTljRA2eNjKB7tjAE
         28scbiegFcya6Jb5+RQHE4uZnUvhCj4xeSSbxoP01b/9OY3JSxJMt3qJR3n6FQyqhi2C
         lc/19yl3DMVE8kKcKbDux/VoBfxU2/exnYbI2MBLEqJOpT+QWh16UmDOyblG/Zt89eoc
         AIRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767869399; x=1768474199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EjN6KRy96rZIFzVOVO0pR3xnbF0qB/QSbEh6qKIJyEw=;
        b=EH5PWAVPTfrKYFReysUuRGe/hupPoAIl8+81Z2fuWne0UZSGQ/juT3kLZrqwc63WJC
         9r0VuUvz9+xzSAHRujsnWv3HI85lw6WHwT9wTc/io/1srGAnFCclkx2BVVbXzinLflw9
         LrKY4OYqoiD1bfzaDiWo7V1qzRAjkEsCVn5mLjgvv8MXpdXs5b9IYhK7GBXmgDb1VZMu
         aWVZCi3+ediRSLvDyEXuVN5vCzYVECY3i0f5JAR6MagOuhGU0iyaP6qTd17X5vOeg83r
         NQ2Uqymy4aCPjg0/XoFQsOZb6olLKIbPvGL8TNV7oXtKpVgGE7ubsyY3kuoX3iAcTIBN
         4Knw==
X-Forwarded-Encrypted: i=1; AJvYcCXyamDiOb4zZbVLpdANizAeqa7olswYpDXUo/UHHVv4C0ZfwYVLmqhkh0pwPsgFKgPg2OvTF6WdJCb0ewbZ@lists.linux.dev
X-Gm-Message-State: AOJu0YyBJq5TMIYLEKi8VQJetHKhNhbhl9vO9E8CAr6F8ZHYrjXvCCmB
	lVAt67UCrpbPB5STMtyQS9fY8nFEWPjbE6uN32H3vUgBau4OmDDXd45B
X-Gm-Gg: AY/fxX4tDfIF9o/yIDuhx2Xw+hqRoIAcB1wPNODpsSzvRMbxMFv9l7AEweF/FTR9oiv
	z0t7YCFUSslEZpcyAsFS59hu+NV4twzF8ASuy1t7fWdrAlFN3j+1sfaPkRrvUdFuNKkJ5P5SgzZ
	gAVCCFaTlcHDkXjxvU4wTluEY/T/1RwEARXR/kantdeD7MD/E2r/H1ATaIpI2qtp75MuiVFatSA
	CJTCgNsQpx1FdnYkZhttm4eZJ0d2IidPTgKgywSscC/jp9NZDuOaNL85XZ/AR45JC6dEmv+YRE5
	HUi4p9vo5U7XuuqM8RqY7r//x1sDQfA0+Sk/ArpemOf/FmX4NABcPYDmlB39MimIWH7jaNr3FuW
	PqS8YhKr/VwnjtsiukfQhIlNEtn6TweYKxV0O9Hmf4jS11XGbJ+nz1tbB77HQrGFjJrqQB/hdoe
	SkTqJcKVQg9DSxw52nD3tnhsIWGQPtAwYwS0SE1J606BH0dyLAuoV0dOIPbKScgcFFGVjGDg==
X-Google-Smtp-Source: AGHT+IEJg51776qmQRAec7r8Q56/vKAE9mkMRebfFBTyZn5YX2SzdAZ6YmZhM3qPZ58Jcn4GN6R1tg==
X-Received: by 2002:a17:90b:5211:b0:34a:b8e0:dd59 with SMTP id 98e67ed59e1d1-34f68b9a218mr5550827a91.15.1767869399399;
        Thu, 08 Jan 2026 02:49:59 -0800 (PST)
Received: from localhost.localdomain ([2409:40e3:44:c9c0:8d34:cc3d:a8c9:1a48])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819baa192b3sm7391855b3a.11.2026.01.08.02.49.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Jan 2026 02:49:59 -0800 (PST)
From: Chaitanya Mishra <chaitanyamishra.ai@gmail.com>
To: rmfrfs@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chaitanyamishra.ai@gmail.com
Subject: [PATCH v2] staging: greybus: lights: avoid NULL deref
Date: Thu,  8 Jan 2026 16:19:47 +0530
Message-ID: <20260108104947.23767-1-chaitanyamishra.ai@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260108103700.15384-1-chaitanyamishra.ai@gmail.com>
References: <20260108103700.15384-1-chaitanyamishra.ai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gb_lights_light_config() stores channel_count before allocating the
channels array. If kcalloc() fails, gb_lights_release() iterates the
non-zero count and dereferences light->channels, which is NULL.

Allocate channels first and only then publish channels_count so the
cleanup path can't walk a NULL pointer.

Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
Signed-off-by: Chaitanya Mishra <chaitanyamishra.ai@gmail.com>
---
 drivers/staging/greybus/light.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index e509fdc715db..38c233a706c4 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -1008,14 +1008,18 @@ static int gb_lights_light_config(struct gb_lights *glights, u8 id)
 	if (!strlen(conf.name))
 		return -EINVAL;
 
-	light->channels_count = conf.channel_count;
 	light->name = kstrndup(conf.name, NAMES_MAX, GFP_KERNEL);
 	if (!light->name)
 		return -ENOMEM;
-	light->channels = kcalloc(light->channels_count,
+	light->channels = kcalloc(conf.channel_count,
 				  sizeof(struct gb_channel), GFP_KERNEL);
 	if (!light->channels)
 		return -ENOMEM;
+	/*
+	 * Publish channels_count only after channels allocation so cleanup
+	 * doesn't walk a NULL channels pointer on allocation failure.
+	 */
+	light->channels_count = conf.channel_count;
 
 	/* First we collect all the configurations for all channels */
 	for (i = 0; i < light->channels_count; i++) {
-- 
2.50.1 (Apple Git-155)

