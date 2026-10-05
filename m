Received: from mail-wm2-f9.google.com (mail-wm2-f9.google.com [74.125.225.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E31481FD6
	for <linux-staging@lists.linux.dev>; Mon,  5 Oct 2026 13:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791205319; cv=none; b=HYdjvre9sUBob/ZD5vqOXQosKGnAi2GyPKw+wX3AO2TGA+tzOA5Lfx5sPFNoijImXVcV7ABDdWM0N/eZznyuAZpkcuzLvBxKlDyNfeiKQFYUZPGYQpSfuQhV5jliaLB6c6lj/VKM5yvpJMe6E3ttUxuZhhkOeDacMJYu09zTF0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791205319; c=relaxed/simple;
	bh=VvilBy3XcUhF0XYjdlJZyZ52j6ao/IKk5T8hVx2QVuw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rW9cFwSGnTr2qj+4oOBLarY3Pj3awuy+mSCjAAFXHw+7rvpic+nvRUc9TF178k/j964gOSPbpOtqspRm4kZZTPHT790WJk5oXWFuMdrCRjW9+1yuJK6ADfdjjiBp8aWpu2SZeIY+Dlq76qcXEA51PCa8wU3gAuRSVCZ2PMnAePA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=STR3zHyH; arc=none smtp.client-ip=74.125.225.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STR3zHyH"
Received: by mail-wm2-f9.google.com with SMTP id 5b1f17b1804b1-49e7361175bso1166635e9.0
        for <linux-staging@lists.linux.dev>; Mon, 05 Oct 2026 06:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791205316; x=1791810116; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rl1OZheCBCPMjKUjI2TjxKZoMfCFhn7MxZPI1BYjjA4=;
        b=STR3zHyHGiFWLI6PVqJjdWM0jWlJACriz9ZsHZmazXaCmnKpSwUha8CUsSe6JcNUM9
         XntyimNJzexfF4Qcu5UJ9ejFQORShNCmWAhH/YX/m2rD6wRbQSTcPTz7Ogp9mb7wJCMB
         a/Ol9iwScedNnyHSy6L/v6hG/02LFwuYFKI3W9MM233IG4c6IBVn+xYtN3VzTYxXYmBz
         W/FpiZvx1Bi3jFOlorz2bnIPG5IaTnVvQvL1cRX2LoZowcX3hkDhz9OMjXvNv8YYFHo5
         WftU4wzIcQuQfkaPvVZWrxRmSVoM0bhha0MVRSOEWJubURcqDb/Vh0cO7ta/bwpBdRsS
         A3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791205316; x=1791810116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rl1OZheCBCPMjKUjI2TjxKZoMfCFhn7MxZPI1BYjjA4=;
        b=wvqnBSvrPXaZ5RJ7699EXBsXu/KD4PgeVDifNQt2xmYxIZiFi8aUd1/JSlY/KocZaQ
         PVjKdQdgTqHDO5FKVIo3UUkzEUD5qP61xyie+RBPSwuycMGFQ/K/luYxkyd6byVo4pqv
         aLjE+Vb8+ePg3riApvjbrMtCB4xyRtrhE+xCUE6uf1/1QbzhtVNC0X8rRokLV6bsNH/m
         UyQL/imq6vVTqBP4li0b0TNPDIpzg0USfLOFSfrLxTzPV7DaddwjiLNtgM/QIy5LL0d8
         qEcGncKw76tfD6v+yZtejJNX0RiQsVCZKrXLBXSGy+edKdhHS8lE209xgFGZOC7jfgYj
         FPMA==
X-Forwarded-Encrypted: i=1; AKwUvBzCygdibhnFeZ5QfPkLEpoXpc0doFjBT4UKxIB2+rPnaCxQsOOFt4wiYq275SmPeCxicmx2ufYcZ583fSsr@lists.linux.dev
X-Gm-Message-State: AFuF++nD+npJk7TPQDqFN9xVWfHyk6E5Uqq41l9psSD1pZ/K2I56pLQq
	g6Y1HCGTRCS9+eD1ae+pPsQsMJOYBplR4KO8tvZUFepPlvQiULJiYBeT
X-Gm-Gg: AYBFou2lFgjiwg41nG3SIxhBHGfaVoMykA0JfEuByvy2yI+E0HCVLHwEC/kSmsuBQPB
	3J3wJRIdSWCu+OnXzSSJ2H43dL2cMc1j7L6Wgt2Ij2BJcnJ9PrML29Ddv8hgFHHFWRKOoX7JPaw
	7suDct9+VemiLnINC6maEtumN/beafeCThCEdYNl3OWE0A1mKEwm0aiRXfZ47l7mSy+uUeKFmWR
	arubU1pPRqhKhCX69HthNdtPRBtOqTCJV41zLjSGvDnqGnwl/BUo2erzxzi5JPXeUubOv/yoNas
	5amiMkW1LqZ//6Me+1eEhvH3AVlOtZw6SdzyBAfhZz6kk97uk4QOiXiS8YLuV45gQLdbwQgw8mw
	CM/PjUrLAWociAokz0Tv0i2ntn+9s/bLBpwY6Gnq24ywrxFe/v0aKqHnV+CKPinU2WXQ8rIP2BK
	W3B2C/8G/uYGw8jyfWh68Mju+plCvv9H1cAzaXvCppH+l3U3ZsQIjXIM3HdT9s4wQBRtRGhYHsX
	+aNRTR0m/he9gz2
X-Received: by 2002:a05:600c:870f:b0:49f:fc4f:9efb with SMTP id 5b1f17b1804b1-4a02753fd01mr186622465e9.7.1791205316083;
        Mon, 05 Oct 2026 06:01:56 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03950375dsm137485215e9.1.2026.10.05.06.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 06:01:55 -0700 (PDT)
From: Roman Demidov <roman.demidov.nn@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Roman Demidov <roman.demidov.nn@gmail.com>,
	Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.10] staging: vchiq_arm: Avoid NULL ptr deref in vchiq_dump_platform_instances
Date: Mon,  5 Oct 2026 16:01:41 +0300
Message-ID: <20261005130143.138638-1-roman.demidov.nn@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Wahren <stefan.wahren@i2se.com>

commit aa899e686d442c63d50f4d369cc02dbbf0941cb0 upstream.

vchiq_get_state() can return a NULL pointer. So handle this cases and
avoid a NULL pointer derefence in vchiq_dump_platform_instances.

Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>
Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Link: https://lore.kernel.org/r/1642968143-19281-17-git-send-email-stefan.wahren@i2se.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
---
Backport fix for CVE-2022-49106

 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 178cf90fb3e5..adde80b56073 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -2063,6 +2063,9 @@ int vchiq_dump_platform_instances(void *dump_context)
 	int len;
 	int i;
 
+	if (!state)
+		return -ENOTCONN;
+
 	/* There is no list of instances, so instead scan all services,
 		marking those that have been dumped. */
 
-- 
2.53.0

