Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019284C6B;
	Thu, 14 Mar 2024 06:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710399169; cv=none; b=EQJNsFrxL+Ccb8SQLsOrGV5TR5nE66PcUTcOWfwanAzFOSdOxTpgyQRJ89MmDkQtNSw0kL9v5+Ut817Kbc5dvRlPJxCvcqyFY7y07/zNML4QdlMHj9gNvJeAATEmNqIhcoMRmuAYZUc3eNh85js63fKGM2bjp3QgdOGTODB1n24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710399169; c=relaxed/simple;
	bh=T0GxMwBwmySlOVbSj7gx2Xa77TGbUn8GftiSzlBmKtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sslN19qd5d2nWr0upHIIZKEjMzFe7rCfc3sSqMxCjbdnC25nQEaqf8kudKiF4jY3utTnRKE4pm3j9DtAQmgQZzwC++3kg0b+DBuDY9qXwtn7mkUlVGWrbW0gEqqSnyqVCbBTo814tgcXQ00zSFjH9J7EO2/zeqGUgVt9mvrSfZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YkWGOg3a; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YkWGOg3a"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-29be9c136a2so557997a91.0;
        Wed, 13 Mar 2024 23:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710399167; x=1711003967; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3LwgfnVSRb6bo5n7xp3n3DJcNJBHsfZFGHFZZEWHyXg=;
        b=YkWGOg3a2olIXIAGHdfdBFYqs446FU6OiRy4hGHwK0ooMXOcD22V8iq40xZGKZEDv3
         wGhx2pQ4CGlMfJNQWkGaNMv9JWP4DOg2+AbYHhNYOK9y2Pjs/GggZp/J9GUwmfsMHqAQ
         n1s2ObCC1zwk5dUbFpa8kBCK0mocqzAtURqxGXyDp89Cuq+TTZ/7fF6phg5zeJ7ionJX
         C1L0MxfJQYUKXOvvxMCp+MR6An0X5XDsl5VdPOIF1SxDYffnte82J8kOCQl9QYzl7MGi
         jQqxkl/H1BTSwOQACYn1SvkB2vAd/d6E8NrcQgbqLNqkaUo4veBmi7AB9NxFGQdLAx9Z
         FUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710399167; x=1711003967;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3LwgfnVSRb6bo5n7xp3n3DJcNJBHsfZFGHFZZEWHyXg=;
        b=H3K6CEuSfrCm4qw/ij1NPRaQ68u3uJeSOmS9xksO7+SbxDIMlqdwN2o62REHTTIUzt
         zvPCqvVIAe/hC6qk6iFMwo+h4aE3E60/F+Vk/KKH3GM6DdFpjzQ+Q/B4KKfWlzsVQxH5
         IaJC3SbIoE7ZuBXEzjVuFqcZEvqjafa3P/vRnd2bHFZcY0/1nGVzhCmMfcNrYkzO8UbX
         lLchSerAKxLaSzlLgXkgRsaudb0UwXRk7sd4NxSuI3o4yRW1vV929ADvFVaLUc9xNKEh
         RkiQ0BsgAW6tv6vE6M/jMwLpfJ8m0AndllYFXWenI2tlIsqJblVFjX6HMB30rbmRZzRE
         kvzA==
X-Forwarded-Encrypted: i=1; AJvYcCWH/x6G1rTlIii7HFAJvIEFu/ImlAQBcoHGqUedAsEgjZRhQU2+eYinS9sKqGCyE+FOnOHT4OTP7Ae3HOQFmpFSAmETL1xWYwsRkdPs6Q==
X-Gm-Message-State: AOJu0YzIJiFblSlbhqhjKVik45s30O8MGpM8OsVwHBmeKBV75nEB1+HM
	ugaZiFjWToIyUbAR4IJC7AJnupt8OTLM0mI+K0twoX5ZrXk1DbmJBdEgey57MNE=
X-Google-Smtp-Source: AGHT+IF1yL1y9JAi64OSd93uOJ530JOSBG3XsJb9SJ1Lq9etWeAeWmllsYTSaHKMWopChno69w23/w==
X-Received: by 2002:a17:90a:ab12:b0:29b:95a:baaa with SMTP id m18-20020a17090aab1200b0029b095abaaamr750755pjq.47.1710399166989;
        Wed, 13 Mar 2024 23:52:46 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.66])
        by smtp.gmail.com with ESMTPSA id ns5-20020a17090b250500b0029dd92da150sm85107pjb.19.2024.03.13.23.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 23:52:46 -0700 (PDT)
Date: Thu, 14 Mar 2024 12:22:44 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH v2] staging: greybus: Constify static struct kobj_type
 gb_audio_module_type
Message-ID: <ZfKevNRRNteRXZHT@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Constify static struct kobj_type gb_audio_module_type to prevent
modification of data shared across many instances, ensuring that the
structure's usage is consistent and predictable throughout the driver
and allows the compiler to place it in read-only memory.

Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>
---

Changes in v2: incorporated changes in commit message as suggested by
Alison

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

