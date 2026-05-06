Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3047D2C0323
	for <linux-staging@lists.linux.dev>; Wed,  6 May 2026 19:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778095059; cv=none; b=DfoPP05SFjMqWcE6VssGSCgIJRbFqWY09urlpbihlJ9ot6x0s7FNLWIaTv4u/5Hz6ReOVGG1KQfnPjxyF7ylw4/7W0UJbuBIQl8hx17+vyLdgc7Vfv+hjX2B6+l9WQkYg4XvM4whK/m+L6TZ8hLxpHYYewRiPdzDBIGWm4GmGQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778095059; c=relaxed/simple;
	bh=8UAQj/f3Q+ncXROJtPhADDYBGKMGJ7s0QgQpnbS3m6U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EV6jrhvVixnL1DsHmOHzvMQUPiTVTHqnMIaK7zQmgxLFLQiqGYUwh+ROoHTAfLgej1SOVE1Gwu5HaOnbpETg70uJlSePi3l1pPN2QkmYcrTauNgDWPENBNve4umFGzSdoz9wMpneiJF65sbY8zqAPbbtNHiuhoS2XR37AfCNiQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nuHq1w3F; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nuHq1w3F"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-362e30526f8so13772a91.3
        for <linux-staging@lists.linux.dev>; Wed, 06 May 2026 12:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778095057; x=1778699857; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=anXElIfaQ5hZNXF4UbwKWtD/aeFWgX2f7zGp8d7W6Xo=;
        b=nuHq1w3Fclr05uPhj+zearsbuL8ljgvSVegm8PA7O81MTzrsV0WYKXqKYozA0kJ9ng
         D68lo4iHP7d48WheahpLYI29FoXbWqOTzkF2A16vGUUuS/+m9avF3HEr7freLtMO4pJr
         dL5HELI3zgHYvzuERS36w63iGs4J8dJgjzIV1JUpB1ZKDF+bWEljurif3Z4NO77HeTuu
         p9LUD5Km0lcRHZBd1miDgMlGC2foW6PTBqbS2ohCmcOO8K0i0muQv6y0rFJyL7nrA0pd
         GAdzJd3v0xVFJlg/SEGmhK5EuYX8pgpvS52J8SGedNw9RL1psT+Arc8TSDDAt7L9n9/s
         2I9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778095057; x=1778699857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=anXElIfaQ5hZNXF4UbwKWtD/aeFWgX2f7zGp8d7W6Xo=;
        b=TP5aQo9cUpEbtIIfJBmyVf2eNr2uqHZd3xPBvZQNL8OPZ0ABHFUtERoV35swasQEo3
         Dof9Y0Eel8F9kkCp6044pm3rA76u1ha5JHBw6prPL+PGKtjA35+vN9aQL/Sg4IA42DZa
         Kj2w3ml1ehO+9bUZZmcIY9icA4WAS40Vse7aSoNMgWh/1eT/a+ArcpLLJ8DxwgpVGuvW
         MO7ZpAtmvZ6QQcrOh3Z5C+/nIJU34D4t01EaHFmOUSBpAQw73Y4GxzGr41Scj2/DeOaj
         xlJAavQxU/wD4EsTOkuNEFahwBgKA9/bFQJsgLMjGmwZV7ZoN073It5lmqW5Ocfnp7zO
         jqhQ==
X-Forwarded-Encrypted: i=1; AFNElJ9zmXb4bpsntyrXnPRZN6ROwYtY0vGWCP+t0mFfu6pOpbQOXvB31d0Rg/icAt4/ssckfwNyE2RJtrJyLn1Y@lists.linux.dev
X-Gm-Message-State: AOJu0YzgFyGfE5jAy/dZBfAbryHJ/Oik2y25LEl/a2wFZ1/jmP8olK7X
	emQkongnglhFC57T24DDEARFiSrYlK3Xyk7osIcwr/SboLTurGfRCeli
X-Gm-Gg: AeBDievN5XQJyidJDDVwPDv9QgPJf1leT0CCsnY7gjObRXeFUdupb3vlkz+sCFqfEp8
	JOKlrahHIKkr2ZUuqPneWt9zYyhGT+YHykCMqQf4A8cCiXgQfdIjs/OGcWkovObmwZPPhjG3Own
	myGhvC9iZOG5LvVkO4sH7R3xpRV4RscqKUGA2MjXuc9xqpI++WEJyNfX24/G7KD8wo74+yfkolK
	/s9MyXWheM/khnKw3l9gtItPEjL+sGTQrTKQQhYevc569lqSClN8PLOcM40ems2G4RAru1E/mC+
	1MRijhCziCuGM/iqs94Klty2NBQkKtuDr7OVdSt2PuUywwFVGpt6Slk0HuWV7c4mMQQPTlKAW5H
	h4HomJCbIZmb3vHaxXiRZ0iFggsssutX2mruRlcarbJL54Uo6xrBur+vy8iUdbH9K4tM/Cl0+xy
	WAiu2RJiZ1iYF3/uqz0aNvltdQP2fXxeEFzFXUMJ+kUK/t2Btvt/O1cwWPpRNEowx5XSiS3+hAH
	TjYw6tVpUdGej7aCR3EtZOw+z8FOUmB
X-Received: by 2002:a17:90a:1210:b0:365:c025:779c with SMTP id 98e67ed59e1d1-365c0258d09mr2268793a91.11.1778095056970;
        Wed, 06 May 2026 12:17:36 -0700 (PDT)
Received: from shyam-VMware-Virtual-Platform.localdomain ([223.181.114.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b4c2f5fcsm4135160a91.7.2026.05.06.12.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 12:17:35 -0700 (PDT)
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Subject: [PATCH v2] staging: media: atomisp: mark pmic_name array as const
Date: Thu,  7 May 2026 00:46:58 +0530
Message-ID: <20260506191658.283328-1-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pmic_name array is not modified after initialization and is only used
for lookup. Mark it as 'static const char *const' to place it in read-only
memory and prevent accidental modification.

No functional change.

Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
---
Changes in v2:
- Fix redundant "used for" typo in the description.

 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 4026e98c5845..d32d98720455 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -109,7 +109,7 @@ static enum {
 	PMIC_CRYSTALCOVE
 } pmic_id;
 
-static const char *pmic_name[] = {
+static const char *const pmic_name[] = {
 	[PMIC_UNSET]		= "ACPI device PM",
 	[PMIC_REGULATOR]	= "regulator driver",
 	[PMIC_AXP]		= "XPower AXP288 PMIC",
-- 
2.43.0

