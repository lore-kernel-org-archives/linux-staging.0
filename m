Received: from mta.al2klimov.de (mta.al2klimov.de [162.55.223.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30723E95A4
	for <linux-staging@lists.linux.dev>; Wed, 20 May 2026 18:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.55.223.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779300297; cv=none; b=dXKXrQRo9MIlrfkr/Jih1uu7FhvJt5vrZf955ZLlCxY2ABvPCv9fdn7uZZKsb3CGbws1i98TFirrLBee46Xm/L4kJCgpMC4LU8e62IjB32pj2tfuA0U216ege0J0z0KEJaM6glDxpSE2us4vt3kCtP+UUcKQ0CUT+igavMUraQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779300297; c=relaxed/simple;
	bh=8nTXgFi473DPmbbpGjVnJYyCQukNXfsnoP1NypU7PFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gZ3Dhncv789L7hxl0Aw6QVbGYeJs7HcI2YaNID3HhWTRxZTfr4Xw8T5x4pClymc9kAOuAFW1/Y23PQLnx/2H7iDwPZgbjWxT7YBzcpm8j3mC5bXV40RMov8uEJXkBQxu5XPiYc9HtrVU4Yzx42Nd6g5tT1TkaYiob//f3YHCZ1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de; spf=pass smtp.mailfrom=al2klimov.de; dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b=RAIO6D+V; arc=none smtp.client-ip=162.55.223.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b="RAIO6D+V"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=default; bh=8nTXgFi473DP
	mbbpGjVnJYyCQukNXfsnoP1NypU7PFk=; h=references:in-reply-to:date:
	subject:cc:to:from; d=al2klimov.de; b=RAIO6D+Vjrj1md4IPQCRUxQPSnRx/22w
	lyLas5HCX/SEVvwXNvxV+/keQPi64XLef7o8VRFU+OxOjnEW/DG0GPtPqoWN93NOCPQmmo
	+bKaxK0Cuu3xSY4MRoKL0ZE/XDOEXMqL6Pfg7MEf1I7acoDuMj51Hu31csp42Zdq9n6gvw
	FcuzFy6Uh2wVSS/u+gAwbmgixnRuz1GOqLY4UB4SJCocnqBZQa4qvVBOXApUmCG/Sa+lBB
	XMX4eJBU5gVhR1GU+4zvCVSL3lmTBbpotmBwZ5fk47jK7XaWbMK560c4LyfUP0epHJc/mH
	LkBDBxBkcNOnhN5Pm20+fLG93/IL7A==
Received: from cachy-ak (2a02-2455-18e9-e011-4d8a-aad2-c25c-50e5.dyn6.pyur.net [2a02:2455:18e9:e011:4d8a:aad2:c25c:50e5])
	by mta.al2klimov.de (OpenSMTPD) with ESMTPSA id 85b20998 (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO);
	Wed, 20 May 2026 18:04:53 +0000 (UTC)
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Elise Lennion <elise.lennion@gmail.com>,
	greybus-dev@lists.linaro.org (moderated list:GREYBUS SUBSYSTEM),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH] staging: greybus: audio: expect 0 from kstrtoint(), not 1
Date: Wed, 20 May 2026 20:03:59 +0200
Message-ID: <20260520180401.539215-3-grandmaster@al2klimov.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520180401.539215-1-grandmaster@al2klimov.de>
References: <20260520180401.539215-1-grandmaster@al2klimov.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kstrtoint() returns "0 on success, -ERANGE on overflow
and -EINVAL on parsing error". In contrast,
manager_sysfs_remove_store() and manager_sysfs_dump_store()
checked for 1 which always failed the operation. I fixed this.

Fixes: f9a21a3f4919 ("staging: greybus: audio_manager_sysfs: Replace sscanf with kstrto* to single variable conversion.")
Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 drivers/staging/greybus/audio_manager_sysfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager_sysfs.c b/drivers/staging/greybus/audio_manager_sysfs.c
index fcd518f9540c..581791d566e3 100644
--- a/drivers/staging/greybus/audio_manager_sysfs.c
+++ b/drivers/staging/greybus/audio_manager_sysfs.c
@@ -44,7 +44,7 @@ static ssize_t manager_sysfs_remove_store(struct kobject *kobj,
 
 	int num = kstrtoint(buf, 10, &id);
 
-	if (num != 1)
+	if (num != 0)
 		return -EINVAL;
 
 	num = gb_audio_manager_remove(id);
@@ -65,7 +65,7 @@ static ssize_t manager_sysfs_dump_store(struct kobject *kobj,
 
 	int num = kstrtoint(buf, 10, &id);
 
-	if (num == 1) {
+	if (num == 0) {
 		num = gb_audio_manager_dump_module(id);
 		if (num)
 			return num;
-- 
2.54.0

