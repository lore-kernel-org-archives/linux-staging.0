Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358BB5D480;
	Thu, 14 Mar 2024 08:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710404007; cv=none; b=joBDEk0dxiHcxIVvfa2aPvXAWqaSe8AnxC3G6sJdD8P2BvUOUVz9aVw6aGfWSV29q8h9kvGV8KL+Qc/qsBaNNASyL5PhW4tKbKoh5FxbOWXuBElL0M3ZmWEc7fxXWNKANhutR2l7OJiTxZutIb2J5GY5e28YgSeJF/S344W03I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710404007; c=relaxed/simple;
	bh=mWC2hgkMgCMjiK8Q156Dzzx9hdHJuOl5Qi5+yUsPPzo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WgG/M+K9kp2f/2DktF7TxE6dx4pTZWAvoycQ8wxJPSRFEH60kkHnjdj3nR4+wSYeDuPVH7zq9cAqMvjcXerUW3+A0oCIxK1BBZugBdlyrTduU3k0Xo5wv25+NyyInHSWLoPjuy6qDx5PdhTqC99U23vC5C5QGYLeR7HKSZoeyS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fbqUUO8c; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fbqUUO8c"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1dd9066b7c3so4927315ad.2;
        Thu, 14 Mar 2024 01:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710404005; x=1711008805; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qf2aeIWPzVWWa3DPEsJ5xpz9OQKvw7835GGNh+gdPhg=;
        b=fbqUUO8c+yf+tZ2PeLcq7+/rcgEApCoOKWEQsF2/sX+wxDcmrgvUMLmGcNyqs+JDM/
         3uR6BX6Vu0Wx3XgFU3K1TTe3ndaO451Vdyr1r/ZMjYC36TISV82G8ECcBq6N2u5Mad1j
         NGl0BI8FtR3pYBm9yJDUouhBn+rxS/tbJ4EnCrwUminu6w5MPjeeJI/s0WHiTjGaXUXx
         nWBrcfiRXHjAA/egO0NdgYrVo2fWK5zdciH7GM+CUPfyiQADbC2lh1Ue6j6QldnPQmJg
         UDnoMlsUYotWmptRpproRJm8dbMekB3vxU7wc3u0dLAd4SHCCa13TiWudYie+42O/aVD
         a3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710404005; x=1711008805;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qf2aeIWPzVWWa3DPEsJ5xpz9OQKvw7835GGNh+gdPhg=;
        b=Fia8oTYBiBieRdkD8wmzqW+vL2NhJJZjZuPkJ3QCSnYOkLW1HovpTmOklEj/4LH7w5
         tRdDzBhegwihquqpSqM2GM3LTf9OULLWQdb6XkNd2ZfSa7em6RIairRQw0l0zzTD9U3A
         xoHkrtBlIomPLgytxhPZu1kmVbqtT6O53fUujXSwJXkjGo0c44sJKpDSJ0TC27Ae8KTw
         lsC5ucJWCQkXIwdssoIfyCZ/ucg7vNB8AMOOF19kmuCkNXNGnCB+zpa7IOhow7IhyGOk
         XIgpTfwDFonpvIjDfog4GdEH4Bvir+qqWk9d4UUuwfpNGTQrT3bLzW/CfAvVdaG2QB0c
         uPvg==
X-Forwarded-Encrypted: i=1; AJvYcCX1ALJEyTeM1WxTToc3GWPXG7jrJIQmxTfBNeuvyQfqczQ2MqG7kKiN88NY8dRUfhXF65zj4qTMxBgaWJl9Sand08xKU3KB8XrO5kTIVQ==
X-Gm-Message-State: AOJu0YzKhfv/2kEhehw1336wxdQAMV2ulJlH2Z35YAjRJdjSRjh8CN+X
	7GLevAA94I59dlPeMCF8hcseodi253U1bjAmyV0W2XUK8tBmshnkdI05OC0SSf0=
X-Google-Smtp-Source: AGHT+IHCCStWnVtJ1wfplEcsTHexRRD3jpD6RyHZM76NJzaGiMXVfW4xTIg4p8HibsP6/RukAdfcwg==
X-Received: by 2002:a17:902:ea12:b0:1dd:a3f5:edce with SMTP id s18-20020a170902ea1200b001dda3f5edcemr1342937plg.11.1710404005220;
        Thu, 14 Mar 2024 01:13:25 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.66])
        by smtp.gmail.com with ESMTPSA id w15-20020a1709026f0f00b001d8f81ecebesm1019296plk.192.2024.03.14.01.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 01:13:24 -0700 (PDT)
Date: Thu, 14 Mar 2024 13:43:22 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH v3] staging: greybus: Constify static struct kobj_type
 gb_audio_module_type
Message-ID: <ZfKxooDH2ef6/1y3@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
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
The kernel builds successfully without errors or new warnings,
verifying the change.

Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>
---
Changes in v3: added the message that verifies the change,
as suggested by Julia

Changes in v2: incorporated changes in commit message
as suggested by Alison
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

