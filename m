Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035CD2BE034
	for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 16:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769532513; cv=none; b=Rocdi7bKKcgQYQKEZjhi9pxlQju3K+CNv2Wc6dbS92jSnS0Guf8RMdT04syI+ZNMmmFIHsvtGHjt+0VJb5xzeVfNR4qw8EVqqZ6Ya/BYxpEl/SiXNauf24Ue6ItW77QKUVszr/FjHotXvpN6xNYoImBpePfVg2AcL7Rn+2Qt9fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769532513; c=relaxed/simple;
	bh=aFDX34ybk/Kqa5bE8bFWwCkyvn6Pr2LS21JJKYV7n2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Er+4aaiEnkDt6dNAlXhRPPQovdEV/eR7VnZRhvnUKeAnS/YMQijyHIGKu/SRtuoUNNrm0rB4smsOdbHVJW7N9k/locbUp1fruYNlu1C2lcp6EjlF8fSDGXI3wm0whspkatYsoSOXHtTZAs/QdrwDZ0NMA7wemCQMUW5dcsCDoKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BVCpUbwN; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BVCpUbwN"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4801c2fae63so47149285e9.2
        for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 08:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769532510; x=1770137310; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxdGKRED/GezH50A93RC3QHz4tAJqHqw5Wvg3bxqlKY=;
        b=BVCpUbwNl0P/jFHQOzqC+19YSWrACqt7Ag28du/gew6ll6/J291Dlp3VT7JcyGUJ83
         mknXpPKG6G+C35TsTsNdrSmdk4i5K61dMJBnJ0XrRpeaWe+ahT0IYZl8SZfYN0miLjmG
         QwDlT6PYYCYd8Tj+yrvp4f+pUKzRKrFj3apOiFdbxhiKlOziLfMlYnabjNU8IGPXSn9o
         FXra344hjxA0IUTbz0IoSN96ISzLblcWxSlM/9WiOCJxYrNFGjdQkdwenxgxmAuOYPau
         UMb0bptvIJKSLnBpDHe5rHjizQgVyCWKY+rpWTcXPx7q+AcBRoPKUSSzXJ+HHrmUVUx/
         KdGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769532510; x=1770137310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vxdGKRED/GezH50A93RC3QHz4tAJqHqw5Wvg3bxqlKY=;
        b=rW/Xa8lYG40EQRyd6iPumwnYX7amfthsLx63dv5ddkNoUqRPtWpEaDXZ8yFZOsGDvO
         bbneg7DL6IYao01ZRHTPARXLZtkKk/zZxc9SZceq0qe98eL/c0nhW68UFJCOxuHGxom+
         PE4LLIpzPeUoYGAcsWOE6aCs4lYk5Ol5n65LVZ/KYIUnQ9PghGl9QEh92kZewUDChL2i
         Gly24cDBaGndxtFjL9eC3mAsyEibapBS1xiuVuwTXHyvQ/UTOhOMxQtWtXg20SrJN4bm
         HlwWP3wTaw6GDE+8tY1l8ienu07klercz6o7NIMpORCsmlMBJGMWJ/boWjbs0oRiOKVN
         16oQ==
X-Gm-Message-State: AOJu0Yw7sKai2a/cE8yCgH7f0GY1isWyxb3AKUofMO1Eiru3vQ5UrcII
	CJg+13vJBwMuaccO1oSRePIhJSDmrvNSEnf/9rVtvbFpcaFfCF1twrFs
X-Gm-Gg: AZuq6aL2YiZj+u9BFvfdQuLqbAU02rkOFy7bcREj2VmOrvRY5M9K9sNMZX3TEoJgjxO
	zn7WLFy4y8jmtdx72DG6zACzLe/5h+UCEey8TgP7MxO6xAYEXovQ914R7O+SzmKsSgmObboSgAb
	kUWz1HV6RZSzZ6NK1mFL+VCXhgXYytILoN05MiVoW2OctYzSIcbWjeK78IX9IXXJ1A/bDBrpYv4
	C//LgYwninwS0x4MmhpxeNHnx6w8cPjgTgpje0yI2GQrsflhVsI/K2xRFhJD23id9qCkIOFTSED
	zKVCrXNAucexx4JEEP6Z3AcSRH83OenSAoW/O8iYySFsthNS1jEazxVR+elu2vPziZJadg+GFVr
	iZ/RAZNKVlI51N6sKuEarq/nH7rNuTn+tOls00dKjEcFVKVxjl22HDjKjzKkdwR+kJbMImszeOp
	WpFFNq7i6TMRHW0mUjRC4=
X-Received: by 2002:a05:600c:474d:b0:480:1d0b:2d15 with SMTP id 5b1f17b1804b1-48069c53fdbmr29083465e9.27.1769532510148;
        Tue, 27 Jan 2026 08:48:30 -0800 (PST)
Received: from Madhu.broadband ([83.106.123.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cdebf86sm3887455e9.8.2026.01.27.08.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 08:48:29 -0800 (PST)
From: Madhumitha Sundar <madhuananda18@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Madhumitha Sundar <madhuananda18@gmail.com>
Subject: [PATCH v2] staging: sm750fb: replace magic number with jiffies timeout
Date: Tue, 27 Jan 2026 16:48:16 +0000
Message-ID: <20260127164816.91481-2-madhuananda18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260127164816.91481-1-madhuananda18@gmail.com>
References: <20260127164816.91481-1-madhuananda18@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hardware wait loop in hw_sm750_de_wait used a hardcoded loop
counter (0x10000000), which depends on CPU speed and is unreliable.

Replace the loop counter with a jiffies-based timeout (1 second)
using time_before(). This ensures consistent delays across architectures.

Signed-off-by: Madhumitha Sundar <madhuananda18@gmail.com>
---
Changes in v2:
 - Switched from loop counter to jiffies + cpu_relax() as requested by Greg KH.
---
 drivers/staging/sm750fb/sm750_hw.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index ce46f240c..b24d27a77 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -523,19 +523,32 @@ int hw_sm750le_de_wait(void)
 
 int hw_sm750_de_wait(void)
 {
-	int i = 0x10000000;
+	/* Wait for 1 second (HZ) */
+	unsigned long timeout = jiffies + HZ;
 	unsigned int mask = SYSTEM_CTRL_DE_STATUS_BUSY |
 			    SYSTEM_CTRL_DE_FIFO_EMPTY |
 			    SYSTEM_CTRL_DE_MEM_FIFO_EMPTY;
+	unsigned int val;
 
-	while (i--) {
-		unsigned int val = peek32(SYSTEM_CTRL);
+	/* Run while Current Time is BEFORE the Deadline */
+	while (time_before(jiffies, timeout)) {
+		val = peek32(SYSTEM_CTRL);
 
+		/* If Not Busy (0) AND Buffers Empty (1), we are good */
 		if ((val & mask) ==
 		    (SYSTEM_CTRL_DE_FIFO_EMPTY | SYSTEM_CTRL_DE_MEM_FIFO_EMPTY))
 			return 0;
+
+		/* Polite pause to save power */
+		cpu_relax();
 	}
-	/* timeout error */
+
+	/* Final check in case we succeeded at the last millisecond */
+	val = peek32(SYSTEM_CTRL);
+	if ((val & mask) ==
+	    (SYSTEM_CTRL_DE_FIFO_EMPTY | SYSTEM_CTRL_DE_MEM_FIFO_EMPTY))
+		return 0;
+
 	return -1;
 }
 
-- 
2.43.0

