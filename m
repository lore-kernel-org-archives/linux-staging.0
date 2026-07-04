Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E7C39FCD2
	for <linux-staging@lists.linux.dev>; Sat,  4 Jul 2026 08:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783153887; cv=none; b=tOZV4DYNN4KFt5+qgmIYRLCPQLQxaa+jC6Q4HKP7tZo/g2Ajr03rDXgyM9z+bplI0M1UgXt/gfEZaD+jM+7js48ZvOBVuiK0NDdeGrmmmxYhFyiJQ352LaE4ZdQ9XGwoxC78x1QZNG3+SlSr0GiWxg8MpMJl5qTQTc89/BXAPDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783153887; c=relaxed/simple;
	bh=MVU2FpDXvrbWaYS3WXF545Nn+twYVu34kFeqKxYSacI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z+lkC0Lwdkq4utRVIHYIimgVAyaU6IcwhmJuZlHywvlJodV6y3kHnnmaRYLwdMXM55JHusWdMaxUMR2J/Cj0lDElfZphwsGDAT096sBcZu+1qVvVZD2nR6xdl2aQ3OEEsGXoJqGzszcSFuMrJJ6UltAgXOs97VEUX08u9tWZpig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dXSJe4u4; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dXSJe4u4"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38426d04bb4so104299a91.1
        for <linux-staging@lists.linux.dev>; Sat, 04 Jul 2026 01:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783153874; x=1783758674; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0bnTIg4b+qm3LWW9BhIg3L3anyHB6Z01GNepnsagvpI=;
        b=dXSJe4u4P/D0ly6VZL0CKOBWd40C8pJIwbGNKuvPDy6IHucIA45Jxp6Lss12gDjSU+
         3cNAvXpFrvsgr1TU8TsnaFPjtzmGhMS/3rxLj+KnZIcdeiRxiXlDiGfBc38aKv4rctXj
         shr98uTuL/aTggA/Jrw37cUJ5UJ4FjfpI6tRJQLEfKPTUneQPgx4N8T71rpVfFVXqwZi
         VcfsEor1fhPYgwnovghPMs3EecAuvCB8rkFb+/Qa81Q73QOLyOvJa5dqFFwaAuzF0web
         Elww6qmPkTwfM9Fmh2gpDMsvLrSlBofzCsyE551OS4nJdUcejE81YinluyWAJm9BDycL
         bNDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783153874; x=1783758674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0bnTIg4b+qm3LWW9BhIg3L3anyHB6Z01GNepnsagvpI=;
        b=lQjGHOx0Rjsm3PtMd20wVnOJnV1tiQdYeBPCW6S47Tp8QQsNS5g5t9NQEN1ok5mfig
         b9t6BhjLoTe++ZuFbuiFRXRQAYBiuhG4V4FdWqmNV/t82HADYTygZeR5M2XdpMFaefaX
         lvxqtYf8w8fjGxTkGMyIDR2kr1A3WYVcoAiLWXpIvogBYvM3jEwNjGETKGovL2KNPyR4
         63/hzhIs/L3ryQENzifuOFwQ60IWOqYQ7NIjUM5DBIZ/ZXXRRlYtCxqzLtJGKJHrHSpv
         ULVhmGYA/d9OepnojakQzBHzUcmlFOE6A/+v8Vu67GPJC1uLNAc4WTuAn5a+QbRFPsgN
         LNWg==
X-Forwarded-Encrypted: i=1; AHgh+RqPTq2qCOnRHc1XbOzhDTD/PEqgMRqI4IhUqIyW5x9TGpjR7a79I47ocPAxBol3Xg87cqjlmwR5f4LYD4lh@lists.linux.dev
X-Gm-Message-State: AOJu0YwpaWQHEBv1JQf+BH8Rq3H7chIhfoYGcmPfXi0abf3vuBv/rnuu
	4W5W5n5+QaBmHV3LiM9eKm+LpIo3NuZr5E/n4zHkfJNXPdxxukNC5k/S
X-Gm-Gg: AfdE7ckodDjV422vqz25zlMCCU243Vl6uXT3A+5qwLYFMUl1GE1JyDppQS3qsPdSyEI
	4TmBYZS4JLioxgMIH6B6/PvrI3iFKVcN2qZpuo8wAq3Pes919AnKEwjlGljRl+72SI4yMhGIIHZ
	B+k6+dXqwsppgxBcuOvCHAFkedxlS+SgjpKdcxlxG1WaJ8tBndg+NARrjX9lUl7jT9RDaKBXw0j
	pWV3HRl/RgolekIbotVQ6o7I2extTVYOKOR2YQl21lGcNuIZBoUUul/cCPf50zDm9BA+M8Us9j7
	bodi+8IGC3cciFiwM31ft1A26iQCXNwrEJQS2CeUi3vveUcsd5PpqVfUwGB6O9sE/Ags4k06bB1
	+dbiCSPq7La9yuJ8TvjkrO7yqZ+wmAotSXJrgcNX2D2ZAfTbTOO31bh+3Xvbi8gdlnocU4WT5HJ
	GNSVrgGCSjX1dafEcSj/6QYTKOWOeWmod9di0rxd75vg==
X-Received: by 2002:a17:90b:394e:b0:37f:a913:1554 with SMTP id 98e67ed59e1d1-3811236e007mr8531640a91.16.1783153874574;
        Sat, 04 Jul 2026 01:31:14 -0700 (PDT)
Received: from primary ([223.181.23.202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f376bf710sm10074745eec.6.2026.07.04.01.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 01:31:14 -0700 (PDT)
From: Vidhu Sarwal <vidhu.linux@gmail.com>
To: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org
Cc: bingbu.cao@intel.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	kernel-mentees@lists.linuxfoundation.org,
	Vidhu Sarwal <vidhu.linux@gmail.com>
Subject: [PATCH 0/2] staging: media: ipu7: fix pm_runtime refcount leaks
Date: Sat,  4 Jul 2026 14:00:29 +0530
Message-ID: <20260704083031.8524-1-vidhu.linux@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_get_sync() is used in two places in the ipu7 driver before
accessing the device. If runtime PM resume fails, the usage count
remains incremented, but both error paths return without dropping the
reference.

Use pm_runtime_resume_and_get() instead, which balances the usage count
on failure and avoids the leaked runtime PM references. This matches the
equivalent code in the ipu6 driver.

Vidhu Sarwal (2):
  staging: media: ipu7: fix pm_runtime refcount leak in
    ipu7_init_fw_code_region_by_sys()
  staging: media: ipu7: fix pm_runtime refcount leak in ipu7_resume()

 drivers/staging/media/ipu7/ipu7.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.53.0

