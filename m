Received: from mta.al2klimov.de (mta.al2klimov.de [162.55.223.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A75C128395
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 18:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.55.223.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778439151; cv=none; b=ryatMBxEUDq1eFy9GBSnkc+gKfONry/6ocExEJz1SHBrptVcQVaHJRIdAQA7GzN7IcSTqv2zTq9oDJc37EA7CUGqO3q9+NsyMZI5bIq0SsMw9ZOG+SYzFJjRoNLrCtWGK/A23ZeYQ7ExFYzRlGfz+ee6ZVK9HsoW9KvkhuMZfko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778439151; c=relaxed/simple;
	bh=E+LvuqhsUOWkbAbXhvOHJZ84gYGPIsXIDDBt9UfHKKc=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=co6lOi+b2v6X1qztfafN/SwJhaBCbgVrkBVRvd9gSVBxtYkwaaDdWzWQ1lDXl7TMBNG18wd2RN0/UEKn/RdCpeoj2eHouXC6sVsB6P3RrlGTVBF3mT2csA1pYggQ7XtI/XCJYlQMUzmOYQ3+Cac4P3o64YQpau9A2pwVZS7ZByI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de; spf=pass smtp.mailfrom=al2klimov.de; dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b=VW0gCoVw; arc=none smtp.client-ip=162.55.223.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b="VW0gCoVw"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=default; bh=E+LvuqhsUOWk
	bAbXhvOHJZ84gYGPIsXIDDBt9UfHKKc=; h=subject:from:cc:to:date;
	d=al2klimov.de; b=VW0gCoVwq8wxbYZrKw5dXELlG/+CYTSg6xrN9lhASd4syiGGbHg6
	QIaqPEbpcp7zMPcvLuYJaiwHFAf75CRDlyhZrZvCqt5tm2Eg47M7NhcWGdII3EvTeQxcsN
	Zvss2GZBsmOb/d7KOFd5iOHUeDTQYJoOuGB7LOeY7Tp6XEJ9LNNeIDd9gT/FGPRvVit5lk
	KFoJZHX6BSAqxtXpWV9cwtDA/4j0cLl6FxkQDUp7BYHwzY6STQgghMUxObxEuQtZT/kVob
	58DvA2y1qMsMj6s9Nu6h0W5B9JhYwqBPWTxPgpNGL7Zw1VIqHBy+qkHmWqZnfDpctvJjTH
	ODg9cTl1YQ==
Received: from [IPV6:2a02:2455:18e9:e011:4d8a:aad2:c25c:50e5] (2a02-2455-18e9-e011-4d8a-aad2-c25c-50e5.dyn6.pyur.net [2a02:2455:18e9:e011:4d8a:aad2:c25c:50e5])
	by mta.al2klimov.de (OpenSMTPD) with ESMTPSA id b9ad055c (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO);
	Sun, 10 May 2026 18:52:14 +0000 (UTC)
Message-ID: <c758029d-186f-4a9f-b953-90121f43d8d8@al2klimov.de>
Date: Sun, 10 May 2026 20:41:43 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
 Mark Greer <mgreer@animalcreek.com>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH] Greybus audio protocols drivers: correct sscanf() return
 value check
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

manager_sysfs_add_store() passes 6 pointers to sscanf(),
but required latter to return 7 which always failed the operation.
I corrected it to 6.

Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
  drivers/staging/greybus/audio_manager_sysfs.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_manager_sysfs.c b/drivers/staging/greybus/audio_manager_sysfs.c
index fcd518f954..ff323ca815 100644
--- a/drivers/staging/greybus/audio_manager_sysfs.c
+++ b/drivers/staging/greybus/audio_manager_sysfs.c
@@ -23,7 +23,7 @@ static ssize_t manager_sysfs_add_store(struct kobject *kobj,
  			desc.name, &desc.vid, &desc.pid, &desc.intf_id,
  			&desc.ip_devices, &desc.op_devices);

-	if (num != 7)
+	if (num != 6)
  		return -EINVAL;

  	num = gb_audio_manager_add(&desc);
-- 
2.54.0

