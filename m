Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E22242D97
	for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 02:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775873118; cv=none; b=MQSrjtaaNrsnSmyDRp0tIlaSkYK7wM/pClbohp2hVnaj1DgGwjq6U74hjW93Od3OAXPOU2/16aejtjJVgZ3OUoxJr4zkX/BFDHeljOCVvHXJ6/Vn+N8TXaRNOAlCp8HHHRdofvQOD6y1A5pwkog8pmwUDueFtR7IbMIqX+2J+Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775873118; c=relaxed/simple;
	bh=yBnnEXyLDf9zRABFhab4LyFR5BsdmC25eiZS8LWBL20=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VMHZUwM+V1d1atOnrOdsfvs5V3jyvmSL5UAhdAXhICFAMfQaIiFPMWF15GHDa0OXEI2bbxSBF4jOdH1SA4Cqr/HDJEA75gBYR/VIE6us2/EtMpkSjF4ZdeXhi0qzmIf1k2yeznBvP2P+G6bDI/jdepUJ3T754NVlkhIbNoDzMXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TlRXMgiG; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TlRXMgiG"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8a05c388b27so41033386d6.3
        for <linux-staging@lists.linux.dev>; Fri, 10 Apr 2026 19:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775873115; x=1776477915; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=khglHL53RqCBwggPilAxqIQzOLWiQlMx2HBtaWUOEpE=;
        b=TlRXMgiGVpgus4BQ6UgXmXCP/rVbN9xhXy6bqcg+XUVCnYHPiV91Qsj+Bj0Pp+eWfP
         BCySmp5T1v6SZJbgFx6xpkZCeVo5Sch5CkmuJEWVqE9vCloNh3S9rv9Y8Iyt/C7OAFgy
         lAMcZ/wcW/f9wbYzvyXIY2ii73G5kgHEvZpa8eylly7SX7w7lkaNAll+D9smhiTREgMu
         bdrAxFwGL4KWrfYKKKu+YS7sBZjaiAXWzKFoJj3vV3VeEKQJRv7DCjMvPJOuo94jlZAk
         kWZSWIrBZwruN0I99F2RQ9bCWH9J0XbBSAOSZEXyxBYIArZGnkqGn9/Jw6SAw/u7+PFm
         W+iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775873115; x=1776477915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=khglHL53RqCBwggPilAxqIQzOLWiQlMx2HBtaWUOEpE=;
        b=b9uaolpb58fSlh6Wc9dbiaLpNjmCJX8zo7cOKFaewLpzzk1RvHk4ZmoGtIUegCm/D5
         w0WzGKkXruaxrJBWBEE74QIPcUa6Lrws1h+X/FOtmjInpAtucmNj4BODtFuWPa/3DF0P
         55244k5GFgLlbnC+F/lokjACQfFIFm/9AgKgDRR+QW9KFqJd3GbWkuLv2hB7XHYUC6ac
         JEDE0j09E280vSPi8Ctkpi+IbMDOGSQ/jFFGG3nNLZVYtK/CHJiorOZn18CVFerEjdpR
         DSZLqBVGFW0k8BRV0thTDPqptwrFBYJeTQfZbCmF8dvPyniCfO1hp++PGxSvklzQwRe9
         yx4A==
X-Forwarded-Encrypted: i=1; AJvYcCXa6UoHvI9yEiwDMUFbELzlRjqvoLdOle8isq4V0g9TpROF95vZrgOjrRU2d95Y7ILnT6fIVHJNRY5PUsEA@lists.linux.dev
X-Gm-Message-State: AOJu0YzTlW0H6LXKTjRglaciPfIOOG0eVGKeB0xf9ObNMGW4h4iBjI/3
	rEWzYb/n/fW2xnGiaCOaltygFNvAI7O/7uc3oT2zpGhe8BFyGMMbBsr8
X-Gm-Gg: AeBDiet1Yon1NriCHb1NsUZ7wXLXC8OeypbotBpDGOIhaviVkWyDqpEEUG3KUxLVOXd
	4CDQMmoKwxzOVee8joOrC1Kmdv/ZO9myLXsNl0Xji1RjeGDFQmZJj5RqenqWkdu62lEJhibfKiR
	kAwZJXIeGiU3v7DbuqcHIbE05s9b7Aiv+ZSFljuULbYQ59oOHMf7BUcJ4eR1iLDEarvGA98N1RW
	V7gEzgOuilRax3+4eWbuDZTVukeDinkpF73CuceNF1vYVO1UHxplCgZNO4eV/klFVRGuRC8IlNj
	EQH/XawIY+iI46tiudRg9/3idxZ9QGncF45NNhS4XUTO6DueoSeXAyA6Ta3v5xH7pi9aOuNWzH3
	h0VEwp5lsbrM8fDTzwuzxxw/u23B2uyj+wfON8gBp+LY0YMwIPAEx3Dn4YFSOniFyxCk3rj5cEZ
	3BK/ZYDZ6dF7PJHcg6lDSYnR0Xbhx4ebAgzgRwivaBtA8CCZ82xZ4XmG5IHcR2jrOAWmXs
X-Received: by 2002:a05:6214:2027:b0:89c:dfa2:b348 with SMTP id 6a1803df08f44-8ac862b80d9mr94640956d6.39.1775873114849;
        Fri, 10 Apr 2026 19:05:14 -0700 (PDT)
Received: from linuxescape.lan (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac84a47a0dsm38400556d6.22.2026.04.10.19.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 19:05:14 -0700 (PDT)
From: Maxwell Doose <m32285159@gmail.com>
To: gregkh@linuxfoundation.org,
	akhilesh@ee.iitb.ac.in
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: vme_user: vme_tsi148: added missing blank line
Date: Fri, 10 Apr 2026 21:05:13 -0500
Message-ID: <20260411020513.36108-1-m32285159@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This change resolves a "Missing a blank line after declarations" warning
raised by checkpatch.pl in vme_tsi148.h.

Signed-off-by: Maxwell Doose <m32285159@gmail.com>
---
 drivers/staging/vme_user/vme_tsi148.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/vme_user/vme_tsi148.h b/drivers/staging/vme_user/vme_tsi148.h
index f73ac92320bb..3102b94a0a86 100644
--- a/drivers/staging/vme_user/vme_tsi148.h
+++ b/drivers/staging/vme_user/vme_tsi148.h
@@ -34,6 +34,7 @@ struct tsi148_driver {
 	void __iomem *base;	/* Base Address of device registers */
 	wait_queue_head_t dma_queue[2];
 	wait_queue_head_t iack_queue;
+
 	void (*lm_callback[4])(void *);	/* Called in interrupt handler */
 	void *lm_data[4];
 	void *crcsr_kernel;
-- 
2.53.0

