Received: from mta.al2klimov.de (mta.al2klimov.de [162.55.223.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495951F419A
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 18:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.55.223.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779387872; cv=none; b=h8cpYxsDkiWWAKuk8Q6kq0CCGCK2WTRpMbbwmmfKwwiAWgRyidd+bXlZlEibtcsggqg0znjx4vrjQLtpeHFH+3xfEG37kqZRwfPkywesVfJUoJi6+93mDUpT3lLrgShEU8F+NNSYqGAFHEEiRV5SP486G3kVe4JD5iRlUxz+NaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779387872; c=relaxed/simple;
	bh=+Nd6ZLTQcww3JB/AwzYyGZx3hmDFvcqbIMoVq4gakGM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FI/MoaQz6odveJGthKuFe2anJzwxobRbmxqB5OLwyx2tRC57uIPA2Q0d1zqkoEUqS3lZWMY1EXhKSEKKMqWr3LFjhqKCDbwNKLSnOMyReVzd26pqsHIj/T1UsUzH+fMvBvs2BwvXGfmH3rvrZgLVrBHDmVwI40Kkqhheuc8jq7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de; spf=pass smtp.mailfrom=al2klimov.de; dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b=fmjB48nD; arc=none smtp.client-ip=162.55.223.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b="fmjB48nD"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=default; bh=+Nd6ZLTQcww3
	JB/AwzYyGZx3hmDFvcqbIMoVq4gakGM=; h=date:subject:cc:to:from;
	d=al2klimov.de; b=fmjB48nDOj5PmL6VO9Yzq+aUFENa+ffCkaC1faosTnLGDT4EbJBQ
	d/YsbHchbi754U9o16hRiliIslJJrXWefF6K4uTdsyYUPydRqiiTYRO5srsjtIIt21Jmag
	bcaZ6O+Cw8NGEFtplrzc5fVCSgaT+FFz4l4FmmlN4cOm3nW2Vc1Yy/smkhE97KaohnqrJh
	SEw9hxlOEeFhtBO14YHFiU7Zzfs7v9zou52F/5RB6ARr3xZtFao5MfCk2wOU1944booL+s
	lfgbzGhfzyqJXczxHGB+5R/DqTk7X5e5yp44yFw205bRyFdLeSwMbNvXEGCmoBnSSLxrk4
	qjbuCkKPuQ==
Received: from cachy-ak (2a02-2455-18e9-e011-4d8a-aad2-c25c-50e5.dyn6.pyur.net [2a02:2455:18e9:e011:4d8a:aad2:c25c:50e5])
	by mta.al2klimov.de (OpenSMTPD) with ESMTPSA id 8b893f2b (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO);
	Thu, 21 May 2026 18:24:22 +0000 (UTC)
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pankaj Bharadiya <pankaj.bharadiya@gmail.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	greybus-dev@lists.linaro.org (moderated list:GREYBUS SUBSYSTEM),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH v4] staging: greybus: audio: correct sscanf() return value check
Date: Thu, 21 May 2026 20:23:30 +0200
Message-ID: <20260521182331.22685-1-grandmaster@al2klimov.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

manager_sysfs_add_store() passes 6 pointers to sscanf(),
but required latter to return 7 which always failed the operation.
I corrected it to 6.

Fixes: 49b9137a6002 ("staging: greybus: audio: remove redundant slot field")
Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
  v2: added "Fixes:" to commit message
  v3: added all these v2/v3 lines here as requested by Greg KH
  v3: while on it, replaced title
  v4: switched my mail client, so that the diff should apply now (fucking Thunderbird fucking trims fucking whitespace from my fucking patches so I had to fucking switch to fucking git-send-email(1))

 drivers/staging/greybus/audio_manager_sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_manager_sysfs.c b/drivers/staging/greybus/audio_manager_sysfs.c
index 581791d566e3..3358d0c34f57 100644
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

