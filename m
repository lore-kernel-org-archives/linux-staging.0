Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54DF2620DE
	for <linux-staging@lists.linux.dev>; Sat, 28 Feb 2026 20:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772310021; cv=none; b=Jpab+SgSBf4qC+yxe4I9us2tfMLERH2z0naurU2CzKGcEt1aA2bkI4wqw2Db0F8NTM1tYneTDi4lOpk3c+OymwV85ULgozsHj/zewUOB1z5p7x14vAWhf5O1AmWPJwqfrtcxxalL/RHdQpTqKXE2RcpmStQoefNIGQC0mZUsL54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772310021; c=relaxed/simple;
	bh=9DspbaeTdsFF+yDLB+2+iwzjjkL6dh10LFUGIq+AQJw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UkC3zj6OE9oQgbPTfLIrMCYiJKQ5TWb4lYbCAMs7TBZyUv0wyEf+38w/4PVniDzZv+siu8fQxCn2IvxGLMmc+aVJ1XLXZGLoA5HmNBjeCVzlvg3wrnYYvKTyRA90UvxgQqP/Y/4Px4d0OThhGVEhDmoCrjHCW62yRLWb6CKQong=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HOj2VZoG; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HOj2VZoG"
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-3598661fe57so6656a91.1
        for <linux-staging@lists.linux.dev>; Sat, 28 Feb 2026 12:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772310017; x=1772914817; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jkJv43NJSF2MCPVDTNMcORvT8LoE/dCFArhJg80QedY=;
        b=HOj2VZoGXbXUZVSRf712jowWqzjDNLObDxY0HbHovaNWFfSs3C4hpKe+reRAp+5meZ
         qa+W8Nwocds8c6+Bty16wan1bEG19BRMP7vPgRYKphwrpGXqbJG4zyofEnQvxqoDa0Lh
         B937+fOK5kWl6GT3M5c+u7Q4fiI2j7a1+bWzGHWW1BaEOp4J02NJU3sGuISY3TA4wLI5
         y+C7KYiYUUOiPg+mXOd54YFnpAvhduRLZE71u/C0HRaKoCi3+JuFj7FRILvglQGdMSCQ
         ig/H50zpNULkaxR63CPTVK3yuOiizEgxbMEJjaKy++qPKaNkzIC1sZTR9hJOq0rAR/TM
         3fRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772310017; x=1772914817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jkJv43NJSF2MCPVDTNMcORvT8LoE/dCFArhJg80QedY=;
        b=cnqyptT1kIr84sdmNvJfQJ2ahSDrDb6IfcC5w9D2mrcn7r2MPZ90WYyuXFSckEq/1K
         3ve9TE9oa0FtxHvtopHNfrO8WXoXjq/TcBzAYSpNBLVHqyHx2riAhAbFM19aOQhpslWg
         bmav2P+9B9MrNGXinR6PGTeGV9EymsfKGVDvN6YLzw/GDrN2ezKpXpuirjjKT5MWi9CV
         tEsaGdZBJei3SPvYv28fgGTRwcRhEq5xgeMUVY+R9eaOKkblF0SKCDbRrXU74tPieYgN
         q28iKDHn0ErZdaLi+OPgPFVPW1shRU3zq0B0PTjoM9hp+Mi1qnqZsawdwdp+sxuLOC38
         Wn2w==
X-Forwarded-Encrypted: i=1; AJvYcCUbN1qRqQNdTy5ZAyZHDQlChcthkWzhEXrFd8V6fkDSeW3QevymenjgGupRMXSHqj4cTCI70KXkKHZTJE99@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1SXRABWmApWUP87fRXu53fUPcAiMUwwh648ZNteEKXjV7EscE
	kJOUITE9L7HQsjyeBb9igsB9jwP7jpRGWWGv2WHk1NxBpEPOhFVAN/p6
X-Gm-Gg: ATEYQzx+fBiTOYY5tZCO3RVUcnX0MfqGmOTSJZZtxYf20upTFO7yV7QA1tQ1Iu0lYRA
	DRkOm3LoYKWOCv3DwjJVKnbheat9CtnYSAzqSxFV4KrOJHQAvpyNEg67iDu0lZONqGqmtg5F2jR
	n6ZfYODJR2Ozl/CB3QcgkgyQZhva3nA8YVu983Kphg2IATAjQX9hvfTBrzg5eUvZ95E+R/+WNiv
	sgXLYRG2A6ax8tHusRzpQt/Rqtxc0Wz3gqBhIBid1rgZkZTqCCu+D4iP+qr0Sk50iSh7dWlVuwB
	0bRo5z+lKuOWwt9Xp+QW1HMqnxR9bhAdSDAe5TcX0FupKSfyXKJBf3yXmaPVeXxm4q/DCy0wZyW
	pZ/xRaE72B3ixSMEFVH9rztgons/DkPOJmCq7uA4p5x1wdpk6VAM1XD/0mJTOCz9FDuzgmsPkHC
	xUhRuo9QjFbRjJJN84RRZjNblV+BQCOOrMD+OOyLiBO0jE7QZYdwq8D6GN2V4ApcVwFL1UTovK0
	xuM4NJ6siS/HD0=
X-Received: by 2002:a17:903:32c5:b0:2ad:f7a4:afaa with SMTP id d9443c01a7336-2ae2e3ede74mr59503405ad.2.1772310016999;
        Sat, 28 Feb 2026 12:20:16 -0800 (PST)
Received: from cute.. ([2405:201:31:d01f:37d3:368b:370c:c273])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5c1fa8sm94994545ad.26.2026.02.28.12.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 12:20:16 -0800 (PST)
From: Soham Kute <officialsohamkute@gmail.com>
To: marvin24@gmx.de,
	gregkh@linuxfoundation.org
Cc: ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Soham Kute <officialsohamkute@gmail.com>
Subject: [PATCH] staging: nvec: kbd: use -EINVAL instead of -1
Date: Sun,  1 Mar 2026 01:50:08 +0530
Message-Id: <20260228202008.40063-1-officialsohamkute@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Return proper error code -EINVAL instead of -1 when
the event type or code is not supported.

Signed-off-by: Soham Kute <officialsohamkute@gmail.com>
---
 drivers/staging/nvec/nvec_kbd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec_kbd.c b/drivers/staging/nvec/nvec_kbd.c
index d2b91318f151..5f742c8b32cc 100644
--- a/drivers/staging/nvec/nvec_kbd.c
+++ b/drivers/staging/nvec/nvec_kbd.c
@@ -92,10 +92,10 @@ static int nvec_kbd_event(struct input_dev *dev, unsigned int type,
 		return 0;
 
 	if (type != EV_LED)
-		return -1;
+		return -EINVAL;
 
 	if (code != LED_CAPSL)
-		return -1;
+		return -EINVAL;
 
 	buf[2] = !!value;
 	nvec_write_async(nvec, buf, sizeof(buf));
-- 
2.34.1

