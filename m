Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A933DB626
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 14:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779373708; cv=none; b=bCCzQ4gtMJ6rBV8eZU+RmxMQau/h88KuJiw8Mf1XM12+RspILrDmTo/oQI1S4WGtp8aB7HOP9c2cJgT+/XaFMglx7GKgGa8kCLMWFK9W6xytIZw6h2HkKxSggNtchUtoKxTl740DlEkOG3w6C9qH9h6t/JBWuhkarQ54TtebFrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779373708; c=relaxed/simple;
	bh=1uhEEK98nunvnkkFu5cl/S6f0C3ToIAbTXCG6iyCI+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ag6VgdXN0MZF654C68AfB9zXD+pmHRfJS4DGSDLt4vWmHcGKuQyal2ioNjeXlSxddzewyWtW/mC5+irveOucp1NoJ4bvzH5apSTHmJJUFAYQBGiC/bYAk8YpH6EZHemF5E8EnARTJKvQX8pVNM6iST4CzX0CuMRR/mNpVZS4hFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rJstowfw; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rJstowfw"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-479ef2b7979so4952389b6e.3
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 07:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779373706; x=1779978506; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LupQ9aUXS/2zk9VeUz06e4gA4DsWebDm6OAqQ1TQUKc=;
        b=rJstowfwA0Lgeq3xGSRrneP9nAqoMjxntTPyWcx5UK0L1eetL61PkqkQw0DkxjgcY1
         r19YSdIRh9ss6jlRWRWm3+5Tk7B39e68y8xqugpcrtYCf14UCjou6DUCLmLKp9r6c1AC
         zgiZxNU8eNtsleN5VTyh3qmnBdGSQ8/Ys2+3+KzC+Kk5JW/5zJ8GrGPfm94PpsrJ1YPN
         VRMiOpu9maXu95NpqGSy9bonz2gTuF8DB6By5XzdmHeJ8OVvILoToLCfrklryLFKso7l
         +HkM4/ILuuRlLasVluPBm4y+i498p39bN7nWUvXlpHxBVpVQe4LCJNk062Kl8WSnA27I
         ITMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779373706; x=1779978506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LupQ9aUXS/2zk9VeUz06e4gA4DsWebDm6OAqQ1TQUKc=;
        b=bOcc1+tHfuYuCyfC5z7HV+v/EJjTDaHHwAZcQEltnTFg+vqyoMUsUY49N/uMFZp6XH
         jGiuBv0X9bE9AznGSPV2G5lY6Bt57h0X12cTq2PH4kMgWQFmGxNMmT53Oi2p7TiHWGf0
         Wk1NwumTYKFBLZRfN3ueDxK8IZ3ld9CSkDi9vE10J2iMFmGRJTlxXiKScWarRpPbvKM3
         kctPYDrdajPGXsruDoDa5Qfr/+G/FuDNgwC0lMATsJXDoLNBMw9JZVKlJvFuJa0zga1U
         exqwmG23OoYmHja0vj+6+Z3ECT/EdWcJqQk/49LwsjWmqH1faz6EYNT8dAXGQ+7QGoWi
         awkg==
X-Gm-Message-State: AOJu0YxDGyhZG3OpCYaonQjaMcWJ84RSF4ABo0O8Gdtj+22YJWwykR0Y
	iUrAIszyF526Wa3bZLGP8ZlOUL+pJGT8WNVufOsYfMqC1dNKTZ4EM53k
X-Gm-Gg: Acq92OHaD2QTTd+Z+rmSfp+dNR82hb7dtZzhMoamNO29yptLfKLAKqgt9eaOK8Qgil9
	fsspsLoshjHJ6Rc7AGPYILsxQD+ca/RYydmne/AdXhhPryYKUGAaX7Td0y8RVoa91i4N/vrCWuG
	mHx+kFXxnr2bXj88/KMoAM2PuTL353fzJVrKE4uXG9J3SmqcQZnVISbv8Oe5w9uEiKy9HJ/9MjS
	omSJOh0MkWLQVreyZfIgV8UGzWNbWFEsokjLnhfAP/EKweylqdb3agWv6hUVaaiNfrN+G+Zhcsh
	ubHDUbk5cgKgltOOhbDoQzv0+UV+JCzJEW4d+NWuRHx4oSd9pEGbNnvRtkGKKP4Pk0clmpg/8fc
	MmKrIzUGJNxHW+s6vSRyAVztpQoHzKHAisP5TbbCtdn85C435yNpNEEKXCjHbqV60CKoyjo6wnG
	4WU7VlX7FLnqARK0zEjRi1e7si52pguok=
X-Received: by 2002:a05:6808:c29c:b0:47c:b38c:a19a with SMTP id 5614622812f47-4852ebcca42mr1788437b6e.14.1779373705726;
        Thu, 21 May 2026 07:28:25 -0700 (PDT)
Received: from pop-os.. ([2806:264:548c:885a:fb25:8a80:d99d:260b])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-485431776acsm297499b6e.13.2026.05.21.07.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:28:25 -0700 (PDT)
From: =?UTF-8?q?Diego=20Fernando=20Mancera=20G=C3=B3mez?= <diegomancera.dev@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	=?UTF-8?q?Diego=20Fernando=20Mancera=20G=C3=B3mez?= <diegomancera.dev@gmail.com>
Subject: [PATCH] staging: sm750fb: add const to g_fbmode array
Date: Thu, 21 May 2026 08:26:55 -0600
Message-ID: <20260521142655.24408-1-diegomancera.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Diego Fernando Mancera Gómez <diegomancera.dev@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 89c811e0806c..8f533f3b1b42 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -21,7 +21,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel __ro_after_init;
 static int g_nomtrr __ro_after_init;
-static const char *g_fbmode[] = {NULL, NULL};
+static const char * const g_fbmode[] = {NULL, NULL};
 static const char *g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview __ro_after_init;
-- 
2.43.0

