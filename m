Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B914E381AE7
	for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 17:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777484340; cv=none; b=X3mMGJeE01f8yPCPdOBcX9/0XMH+QNHVZbBG1+/bMx+BILa5qzsHBxeeBzAg0CM1cXuNFfjZiHPyDaR/sUbbIX9AuJaulS1UAmeYLLiWysQ6AhahiCJRzgvFOQJMSUEGtMcS80jRoXbygXThHIQGo0A4gdAsS/Qg5nfuYbqWONE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777484340; c=relaxed/simple;
	bh=+RHczMbau3YZaYC4C3eBiw9Hxw43m0gaCVWwXVrxD7Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HAz8RcbyX9lUfoldfQ4OQPcqRN2PCLPZnvYre1qADYb/4SqxLK4FbE2bB3VyozBzA/5eCLc43BcMJOPYjk0WpmZ9xG13U2bv5Rnsl1sM+gQdcaPeNmUJCLtTaYJ4+crVXN0aEsGtZ7sqtxu9rSvwUmWTDeXrZprMu6x/vaWkjwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F+xXgRuG; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+xXgRuG"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8f83efb5729so3505185a.1
        for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 10:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777484338; x=1778089138; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VCbHRKenl4D0eRTjm9YWlCwewdI+4NreRZ/eNUmkeGw=;
        b=F+xXgRuGWQt9qcEy3aJeV3YlDtXlVxERqtT6Sd+5mmIhXt0x7hpvRnvbAwoQgtwi2Y
         sOErXwjstbYtVGdAyF5FhABPdJ3EbfvNiThUhap/dHNX8Bcc7sozv9DV8JDF9nFOBB/U
         yijOlwy2Ix9PMWHbvtBD5nI+D06+gnzIFbO6krRyY+Jg5E/kte4YtCdZMPVjqfx/tqQN
         jrbkr4iiyFUAfC6kerH35aaS0Mv3zW3Oyo0a2AX6p2UdPw0uJ5m8QeINUSfr4P6TMSoy
         1aXG8szbBJd48PM8RGuFpWUTcGJziQIjIlkFJ6k4mMIii1FPAtI5GOR4RqR3tXQEYvJb
         eN3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777484338; x=1778089138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VCbHRKenl4D0eRTjm9YWlCwewdI+4NreRZ/eNUmkeGw=;
        b=B5YIcQPbntLFyLo1clsIrVYCxs4bz4+n9bALOyJkJzxbedAo0uj+vkgBUcB8Xe6O9f
         8rJJIucXSDSxDdoOnUHvAfwadd2/6SURC6x15GHZEdenDOAlVSFzHxmLmIM0Du0MVt7L
         jC6EskucIXm/kJU+L4UHXQObgxseLghjrzUKCx+nu5W8y7kvO4QoYqYc7hZy/xr3rYrQ
         wixxEbqsQhtQWc7/XbZay+ajg/ykiZwN2u+/pIeowIBhqn219zQX0c5eFhDVd31W0hMa
         YHZa5Oh7N4T7S+v65fksQ9sV7FxWwKKuQazL4+OydPQgM2HZWb4XagfHTMIOxlwa6Frz
         b1Hg==
X-Forwarded-Encrypted: i=1; AFNElJ+/VHmw3rbeOJpCBugcjFbR0F3d0/fU4fBcArc/rNtcFW/1U0VcfEg5tsruPWpXTRB1PIJPdRhBShSgdobC@lists.linux.dev
X-Gm-Message-State: AOJu0Yx86OZltnCjtarng3y+bJRC5qYZpGXRKzPkkZ2zTE5POenWwEhb
	c+eXVh32SUdDG24naxKf4kt8XEKGCPoRpU+TpLVu4aQTMH/sgtzgDLxx
X-Gm-Gg: AeBDietWZIIk5YLLwyMH3js6afmw1R+DLoV6lSXeSVz0m73rgPf5bNDApLD5rbh7nr/
	e8bL/cWql1NWrv/Vg3qKTDlpP02c25dsmicqGpd/CEmWge0BOAgbJWoqRfq6+bOF/GZRPagrnIV
	vsXtoi1CBq4vCA7nEN7COpmE6VIPTM/Th9RurwtZjRa6K8SKJZGPjMFRtKvCTooVpzElqhtbztj
	LxS0B7D5d1HzpT1E42Icn2fLQaWimufC3oJRMq/iiW5X/PAmiT/QqMIwcviqTNmGSAUfPL2+LFj
	BXfztUl5jwMWMHLZoy7xoEgvuyMXZpOBokkXHAXAZdYO/ikcyfD8UnS3qDN/6LY/+J3RhfkWBCA
	713lN03H5wOkMtaAd7ZKUhzkX/vQAodNs4adZoQ5c6BsWcnH7iUdc7vBw8FEmQzAWvulztAOyVE
	yPU7rrzFTsgUOhXUVH4kWplKsM5yKcwcWQ/wbp/KFJgeuHC3masI2cS7Nk6AW6xarHnLOoPBG7Z
	+escJ8=
X-Received: by 2002:a05:620a:370e:b0:8eb:6f04:f97f with SMTP id af79cd13be357-8f7d97fe8e8mr1320209885a.44.1777484337683;
        Wed, 29 Apr 2026 10:38:57 -0700 (PDT)
Received: from House.mynetworksettings.com ([2600:4040:2afb:6400:cdc9:3f29:858c:a856])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f93d0f6eccsm231658185a.20.2026.04.29.10.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 10:38:57 -0700 (PDT)
From: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
To: mchehab@kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
Subject: [PATCH] staging: media: av7110: fix typo in av7110.c
Date: Wed, 29 Apr 2026 13:37:51 -0400
Message-Id: <20260429173751.5611-1-mahamaryamjavaid@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling mistake: connectd -> connected

Signed-off-by: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
---
 drivers/staging/media/av7110/av7110.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index 014d0c6f0a8b..8b5cd6c842f8 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -2272,7 +2272,7 @@ static int frontend_init(struct av7110 *av7110)
  * original Roberto Deza's hardware:
  *
  * rps1 code for budgetpatch will copy internal HS event to GPIO3 pin.
- * GPIO3 is in budget-patch hardware connectd to port B VSYNC
+ * GPIO3 is in budget-patch hardware connected to port B VSYNC
  * HS is an internal event of 7146, accessible with RPS
  * and temporarily raised high every n lines
  * (n in defined in the RPS_THRESH1 counter threshold)
-- 
2.34.1

