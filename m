Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D083E5A0F2;
	Wed, 13 Mar 2024 19:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710356583; cv=none; b=qZYGBSfOWU+6sK0Cb/excP9ScFgEwCPcAuMYrnqzbUb8tCX4zRU316pxTUnI4N4UOXRTly8SoX/uUU8Cm0XvmGGdxeqWKPpIVWEbhfuXcKoedrWo4u/dtLMJA12l5MI6yZZ69slX/q+FYtgm7lHDIZRmOpVuKmQgV+b6t5VFYFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710356583; c=relaxed/simple;
	bh=jyHu3DD33SQw40vH0ZcmNDRW4P3d+298/8SBjo+jPWE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l6xeugOThX+vbDKx++pAZ++3mZrsn93wjFfJ69EeXJp9dAKaOav4a1jQaag9jrF99Dg6vKcEcQO0nbpTwq3aBSaDxbXF1mu7AxTFK6lwi0QZXtSTSbrvdi/Q0NhEL1mkawX9QO7PzRUBO9NcqzDVGvNbxANk439i0DvB3sGdCSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PxGQK12l; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PxGQK12l"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1dc29f1956cso1343505ad.0;
        Wed, 13 Mar 2024 12:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710356581; x=1710961381; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=19x1Ac15rLwOqUkCkkNDCNMXVAzg+BltQMzrd17CHPE=;
        b=PxGQK12la0nVlPke8WHerNwcxKFsX4qM4NOX3WGCXjEkH8/zpJLFc4Sm12YpQ/sCfP
         gOOswgRWJoxI5ZNSxWXbJoodq5T4NmBHlVf1O00+zkCkoKCvk4m+ZCl25Arq2D4o0R8A
         AOUgH4w60YRSzuAW48x4gA/QzXojqO6OBVkNyu5m+Sq8l+6JGu4n94SlasW0cCSjtkg3
         zj43MjewHDo7suc8Llh1vGyuwve+KS+YHO0x++SejjYylSaU2Jsd8N9AMkR5zg9tjyzc
         05lKUJ98Dm+su7zCmk3+1TlOxLAhf5BSmHT/EIxiigTA4rLXdwR+aQl3UPOpSsIYdtxO
         UrKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710356581; x=1710961381;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=19x1Ac15rLwOqUkCkkNDCNMXVAzg+BltQMzrd17CHPE=;
        b=QkLkqzRsLKdiznIfJZL4aZ7jxAAzieO7vRIX94cc0+bvem3gP8nWJceVA50PISOm6z
         2Z+ES7O7cP+jtjthTdHDYcgUWd5dU1DLQmpKRzVr1AXkAHb7JUZqBQhMXZZ8BqeQXq6R
         Yv+tDQEUkEUvDCDdeRBnyWq84ntnPP6aebiUvFM3ULqUC3PRmc/LqjanIc8O1ZJ6Lp1s
         6TRCuXhfed+/E/MAytvx6H0uY2HVacr0IM8QnfQNXp60G3Dahl94BgARR6nhoUcpC4j/
         CH4FqWgewjK8ySn6V33C4WdE7orzTXV1yfIjGu7RfOCbNzwPo6Uk75mvlxcfuMpQG88w
         p9jA==
X-Forwarded-Encrypted: i=1; AJvYcCWXnH1n8SQ8UfguTpvOT5oMf7WpI7KK6P0XHn0Gw+yD7MOCG594qVwHzqqZtp7+ZkV/SgiJSoxc/jtwfkBgmwXn6+jEK3DhyH2H45QDvg==
X-Gm-Message-State: AOJu0YwBQ5afIFpHVPPGmjXXdUX40ZDEWQcTjswXX3hyxwmaG4Gk/vHU
	OhjYysk65TzJLel9S6cZUCZJWF71DlIkqkSuw5OuJpQA0jO8bkmXqCbLywofBPk=
X-Google-Smtp-Source: AGHT+IE18sgOLbaW5DDx7QTLZxLjcsulic3sUQHOlLW/Qrfss+6U0Y8XhvyH1Tqv5XUVfxAjP3rZrw==
X-Received: by 2002:a17:902:eb88:b0:1dc:1c81:1b19 with SMTP id q8-20020a170902eb8800b001dc1c811b19mr17280391plg.3.1710356580702;
        Wed, 13 Mar 2024 12:03:00 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.67])
        by smtp.gmail.com with ESMTPSA id d8-20020a170902cec800b001dd91af1f03sm7142853plg.200.2024.03.13.12.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 12:03:00 -0700 (PDT)
Date: Thu, 14 Mar 2024 00:32:57 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH] staging: greybus: add const type to struct kobj_type
 gb_audio_module_type
Message-ID: <ZfH4YZ9qyK231T5l@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add type qualifier const in struct kobj_type gb_audio_module_type to
address checkpatch warning and conform to the kernel coding style.

Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>
---
 drivers/staging/greybus/audio_manager_module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index 5f9dcbdbc191..4a4dfb42f50f 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -144,7 +144,7 @@ static struct attribute *gb_audio_module_default_attrs[] = {
 };
 ATTRIBUTE_GROUPS(gb_audio_module_default);
 
-static struct kobj_type gb_audio_module_type = {
+static const struct kobj_type gb_audio_module_type = {
 	.sysfs_ops = &gb_audio_module_sysfs_ops,
 	.release = gb_audio_module_release,
 	.default_groups = gb_audio_module_default_groups,
-- 
2.40.1

