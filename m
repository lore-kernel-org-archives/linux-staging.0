Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F473270EC5
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 18:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222696; cv=none; b=ZwFjhonHZ7rSdpwfse8mg8h+C/X/GTi6GvFOEWTgiEhEScehPo2bbnKhlW5YyOOq3nnjKB0tddaJifk28LejVuBP7vhMDW2vmQm3div0kIoUUgN1a6LnBD4r3tITL24CHHQay0Q+Z0g8qfBmJ9rA4qPXWf/50+oI0eniNhiTIHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222696; c=relaxed/simple;
	bh=4CmxrQz1pG2CKAvpdKstkQyARIpmzfZ1LOKGQOkWcYM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G/kJ2irJNAMF8+6WeM4QP+PyyPsz52oYc9c5zgitO0RgFmrOiIN9U7vpA2vHnUpbrsO4ex1+IQNRO4MQl8wr0k6z2LCV4ZiAYy7BPCtt11bQkSQl5dlTsPtKDnxqMfNcmq94us1mZCK5UvWI3++B0m8ouuAPumLFvBTyPRhjBmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=WblgXb6Q; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="WblgXb6Q"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-736b34a71a1so8298800b3a.0
        for <linux-staging@lists.linux.dev>; Wed, 09 Apr 2025 11:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744222693; x=1744827493; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fCFGfuy6JO8coiSlMwlp4uAr22QSVYGIY2uQAoexHHg=;
        b=WblgXb6QK2i0GR4sy3md/yHHv+DlT1UqnNt0pCmfc9mdRapSsz5yU1s/Cn4K6vuikR
         +tlu/R6tUCUvq6U1zvYXlWHnkPxfrLZY707Gl9i4+6OrIWXUEoWbaQU+LBGvnLX/sSCH
         yXuSLBeDV4PEm3s9LzmYL/T0O9agUzPhfD1t6wCUA6+NBdZnQt5idHUNUauhoJcb6jGB
         VQHSgzAbV0bE8X/RYRp6ZB4cHN4zKpE6vxwC2Gv/9bD4/Kx2jfMM4vhrEaVkDoxNt2+L
         18OqXotC8E4ZVHBglA9dUNDtP42I9y7TNYFp0lvIYBDdTM2TAqdyZkh3BjLx6G49qCH/
         3Rfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222693; x=1744827493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fCFGfuy6JO8coiSlMwlp4uAr22QSVYGIY2uQAoexHHg=;
        b=NWy6xPoKUFPoS0ZdsWUGYuL99iSqLon30NzTpDpn8VhX44ea2vAdLHJoDv+y199ViR
         pewloQtOy5SYn5eHyrmofAgFp5LCmuZu5O1MbvAK0WMmn3DHdX9xtY23eTE4tap+FkRM
         g5uqgyK7e3Zat++1xXydnu0uWlXgovnS9Hsig7fkMhXvfSQHoexi6E8FqqbMIaeyiPK8
         MKqb44qt4z5ZiML4qWtIhYaeh+8DnN18e5T8js056VmBlVc/gKhzo+kQjdwTM2sjmX+0
         Smm5mYrV+Tii04eCAP9KlytoMN8VHo7LrIiNtqH4cUTj5eNjLljYHCECcnhIv9s1uYop
         WnQQ==
X-Gm-Message-State: AOJu0YzsNBNckInmbRTMXmwQ5jG4fcDOZq547mQJmdwdqNaY89PdDgZw
	UpEEdyjL/OxWS4i4Q0gQEGZIqcMSTyHQkf04WX5vh8XLPsS42JAYPqmtBlOSWg==
X-Gm-Gg: ASbGncvOu+1ob95Ij4z/DRnSqCTMbtCwtXGVe5MxgrBx85i4rF+i1q7hzmYu3dxCVjO
	DPPXFoIGJRCwIL0l8Helq/oGcKo096rDnB/vdQ2khk1Lj99CEHZGmv+14VZz1xLBmq4BiYg95Ex
	UCJSXZXQCeW10WWkTRJC6iaiG7NtVoxlRCdcLPtspPrdfmyXE3NegQgFLPNvYuOQ1jSS2vd+GUL
	eSwPMs8hojpBslnuMHg0lEVJ0n4JyWQEFSm1ISPsLXu7xhvxKoOz1LINRGVbwiz4bdrlGXeJmVv
	qQFJIRWSsG6cH5MxiahvFweWvoCh00mKf2Dk1VkLeY0PT13Ml7ibRzt9esnTIE5bCj+WLWzjIqV
	zPG2YIg==
X-Google-Smtp-Source: AGHT+IE7sR5POVuJYVdqVa+AS4fS8UWyJ3iPy25M3/xq1EeIPiN0TAEy0j6sGsd7vhBWoEBUf8auow==
X-Received: by 2002:a05:6a00:18a6:b0:736:3d7c:236c with SMTP id d2e1a72fcca58-73bafc170a0mr3912696b3a.14.1744222692563;
        Wed, 09 Apr 2025 11:18:12 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e517a7sm1716316b3a.146.2025.04.09.11.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:18:12 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1] staging: gpib: Removing unused function CFGn
Date: Wed,  9 Apr 2025 18:18:09 +0000
Message-ID: <20250409181809.401724-1-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removing CFGn since it is not called by kernel code nor any of the gpib
drivers.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/uapi/gpib_user.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/gpib/uapi/gpib_user.h b/drivers/staging/gpib/uapi/gpib_user.h
index eaf7399a164a..1cb6b6219e67 100644
--- a/drivers/staging/gpib/uapi/gpib_user.h
+++ b/drivers/staging/gpib/uapi/gpib_user.h
@@ -192,11 +192,6 @@ static inline __u8 PPE_byte(unsigned int dio_line, int sense)
 	return cmd;
 }
 
-static inline __u8 CFGn(unsigned int meters)
-{
-	return 0x6 | (meters & 0xf);
-}
-
 /* mask of bits that actually matter in a command byte */
 enum {
 	gpib_command_mask = 0x7f,
-- 
2.43.0

