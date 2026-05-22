Received: from mta.al2klimov.de (mta.al2klimov.de [162.55.223.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF033A6B64
	for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 05:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.55.223.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779429285; cv=none; b=MlX+jr5RiSUW6fnuBtkGkU40CH+lBGpibPlCsVLFKlUeQWRW/5nfB9HKU/aIJ0PQgnQaYlOaF//qdrH3lI08L8VLTVAUfs2k/35VHT49V04Kg22d8n36+BJ7UXArCUVC4n9xVBBj3/Vaw9iYVF+DkPwhgkK+HZ+lLK9bIEIFhQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779429285; c=relaxed/simple;
	bh=RyGYgIbRaf+8AAtkWZQb9c0/PbJfOf9/YKYDtDcY/ME=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=srEoRC2RtpYTk+ZpmII+QuFoB4Bd7Tnz249Zn7tUA7GoCwbgLORUTJq57g1AKnIYJCzzjaNXQdrFDwwtkHf1lSTmtrESjcENVGZdKTcUEH8cicz+95ATGEAMblEphp4WtaW0RfiaUgIjPJQmHQ+Grlc9vwE8ApqvzA7TVngqanc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de; spf=pass smtp.mailfrom=al2klimov.de; dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b=FYwA+n/R; arc=none smtp.client-ip=162.55.223.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b="FYwA+n/R"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=default; bh=RyGYgIbRaf+8
	AAtkWZQb9c0/PbJfOf9/YKYDtDcY/ME=; h=date:subject:cc:to:from;
	d=al2klimov.de; b=FYwA+n/RfiLXt4cgGp32n+yj31T9t8ixKwLyz7/M370vliQFpNGh
	rijVv0fN9QNN69Ni4LgL1o9C4XMPOyuq/I5V2B/eVjwM7odoOAGPXjM9GF1/966UGxqjj9
	kddg7fcxgdTIwdpgwwEcdjnoZStoAZX2txsW8kJpINUXCyRYlY3/cXK77M/maHRbPbOx6W
	R+mFkDNcB3qxMj8TgRFDnVM+KXddn2ac0Y9BQ0Gz5CEyMHPeNyTPgq5YB0g37zLYJj6TuR
	8lPLXSXBy1c/IN9FVNo1CmMwcfjAT1xELXvX+qhqdnY0MkJ7/zwLpBYd1E4NCYhU5QX8er
	NilAlvK0Mg==
Received: from cachy-ak (2a02-2455-18e9-e011-4d8a-aad2-c25c-50e5.dyn6.pyur.net [2a02:2455:18e9:e011:4d8a:aad2:c25c:50e5])
	by mta.al2klimov.de (OpenSMTPD) with ESMTPSA id 5341b239 (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO);
	Fri, 22 May 2026 05:54:37 +0000 (UTC)
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
Subject: [PATCH v2] staging: greybus: audio: expect 0 from kstrtoint(), not 1
Date: Fri, 22 May 2026 07:53:43 +0200
Message-ID: <20260522055344.38733-1-grandmaster@al2klimov.de>
X-Mailer: git-send-email 2.54.0
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
 v2: style (X,!X instead of X!=0,X==0)

 drivers/staging/greybus/audio_manager_sysfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager_sysfs.c b/drivers/staging/greybus/audio_manager_sysfs.c
index fcd518f9540c..581791d566e3 100644
--- a/drivers/staging/greybus/audio_manager_sysfs.c
+++ b/drivers/staging/greybus/audio_manager_sysfs.c
@@ -44,7 +44,7 @@ static ssize_t manager_sysfs_remove_store(struct kobject *kobj,
 
 	int num = kstrtoint(buf, 10, &id);
 
-	if (num != 1)
+	if (num)
 		return -EINVAL;
 
 	num = gb_audio_manager_remove(id);
@@ -65,7 +65,7 @@ static ssize_t manager_sysfs_dump_store(struct kobject *kobj,
 
 	int num = kstrtoint(buf, 10, &id);
 
-	if (num == 1) {
+	if (!num) {
 		num = gb_audio_manager_dump_module(id);
 		if (num)
 			return num;
-- 
2.54.0

