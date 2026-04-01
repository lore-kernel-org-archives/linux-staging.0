Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559723BD64E
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 10:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775038244; cv=none; b=FXG4lZcs/hDGClctTUM2dG1O8fAYAEC7MK3tZoJiDzbkPNH6I39vJZijUYL2zzjPHM2l9oX+ZVct0BuVqekOYhd5C7luQYRUBNYniUUNKy/2CqSE5aDdtZdvq+mbnoultPvoAc+/1kp79CwNGz1L1oqhyTwvu20bg7RHRlxGXrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775038244; c=relaxed/simple;
	bh=OxgRed5VGwAWLayyza9kbjGRjLkirUY+SqCVtIEKjHg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VCLSLEwJ2MKVGFLa9xcj7+b0sFt5FG9bSvGyqoZjQJMHVruOcM6kxjpf7qO93NleaCCU4j0J2Vo7LJnIgbjM2SfwN1ICQA85ZX63zNOS2cRNiKRyufna5HGRB1W6lzTqttF9lt4rjhZwaEx2EFIFuqwUpz/ky4d0prReVe+VGj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SujvjLpE; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SujvjLpE"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43cf8fe9c2aso1928657f8f.2
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 03:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775038242; x=1775643042; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AOibjlz3Yfd9V5K3zd5unxoZi+Ixpxgyr9p6TIdkJcw=;
        b=SujvjLpEsHAgyqf5ROjltp/QgnygWCgE71Augy0ZnPA/XlRUVTe5R3cjX2pT9DdBwc
         9b3SVqD6ubqiUhXDFEWpsIBaU093On+E9onAdy0RRIKu+9TgIDDHQX1uJAI1tJFllO++
         WN4GhY3IZPJOkbEXZ21+tz3HuXftRYeNSzAptOoRYrlX+dx9ZlAU1FPYJ10ZuMSRngOG
         52tQ68Rb4lUnRvUgu5dEAKNC94b8tGV7tFPo+VkpfzhGofoWvPDjxxwSqafyUjwulwoR
         AcKGJyU0zkByDl6sCe/+2iEByp7Yj0zk+rChLdVEPNjrteMhcRSBQRB8Z/nDyFgYsPSW
         qKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775038242; x=1775643042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AOibjlz3Yfd9V5K3zd5unxoZi+Ixpxgyr9p6TIdkJcw=;
        b=aEDyBw5153rID2hAE4uS/sLSIyBSwaQ4GxDZzP9KHl/yXgRjatta0xNKmIxiYxKijb
         PudqVJCc2lgsgqxfd3SYewqxcMzV4yBSh6basAdF8kjzCOhOSKXbtrVxLKDV2KBb7s+0
         +fuLNbnxO6TwTBQz+jvJg5deeib4MdOK9t0QWjFr7PvL46GKc/lcWvByoGEsDRTAge4V
         pe0KcitMnt3yTh/fQ8Hpir9IR8vLkiOa5hiozbdiPDecxeJbcxf3fh7zUrjkZ7i9Fhbr
         r9HU4qiVQ7dFGNJLmFcFiMljjoRZYCIXidnWWHiIZa3KDlFRC9yeUuCY8pCykEa3ygEc
         xkgg==
X-Forwarded-Encrypted: i=1; AJvYcCUKZPQ9dKs/qhVwJAVJ+ruj3zRqhYZnhYGt4aAnIbFrTt9PFvgZu4eWMZ+w688hmc5QdyZyWQgIswb5khbG@lists.linux.dev
X-Gm-Message-State: AOJu0YyPW3FngPN++xsfMxI1Te0p94OlQPj8HBcXHAMqlMPWtK75xqWB
	KGdBoYgacLcjg/liOCwM/lwF5lV0ePkVo1y6NjYYtUWtlZ3+5Rwlxu9K
X-Gm-Gg: ATEYQzwuVp6TcN5qm+7jeewrpeKQgURMv6ZvaTYNN7r4F9TYMeRNcEtiOdubD38hMHL
	dwhL+hCnI9me+/Ou+4NXhAMYajNLTKrEH/fBQWfW3soZRL7nkaIfNuWcCOiL1zEfdlL0Yn8WVxp
	Ah/3aoDwfxl10f8ckAjqPwg7P5OpmhpD8XnWe+mQZW9x5gW9rP7aSqXizF0za6h1rxuq1xrvLAg
	69s3ljSurni+eeJHvYxSgKxn56UneINH3d0Zuzv7rB+sQUcNed2Yv8P0ctlLbbTAnK6ZiJ/Df+F
	7QRBQoW5fUPn9NG6/k9sNJNgpgL4Hx1Oo6meOeuntE6S9GG+rdnUOxj6pwsYDDvsnJYfb7wolVP
	5CD9H9r7tzNC0b/6KL8xmH3R6WvPgGqc5IcQ9xOPv3PZi/BDTB0jpv0JRLQ6Uzgm94dvd+xRp/Y
	5fW9Cry2T7eJaZ+yPr6gUFz59TrpdL14eGV7jVivudD1y8bRloZNU0/hm8G4MjGrK9
X-Received: by 2002:a05:6000:250a:b0:43d:604:56d8 with SMTP id ffacd0b85a97d-43d150e00camr5254239f8f.49.1775038241490;
        Wed, 01 Apr 2026 03:10:41 -0700 (PDT)
Received: from MacBookPro.localdomain ([2001:8a0:6c9b:a000:2d1c:ca82:e123:e111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf24707f2sm36139165f8f.26.2026.04.01.03.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 03:10:40 -0700 (PDT)
From: grondon@gmail.com
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	christian.gromm@microchip.com,
	parthiban.veerasooran@microchip.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gabriel Rondon <grondon@gmail.com>
Subject: [PATCH] staging: most: dim2: remove unnecessary NULL check in try_start_dim_transfer()
Date: Wed,  1 Apr 2026 11:10:38 +0100
Message-Id: <20260401101038.24304-1-grondon@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gabriel Rondon <grondon@gmail.com>

Remove the !hdm_ch check. Although hdm_ch is a function parameter,
it is already dereferenced on the preceding line to initialize
head (head = &hdm_ch->pending_list), so a NULL check after that
point is dead code.

Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/all/acwjEHyEYg0V3OyC@stanley.mountain
Signed-off-by: Gabriel Rondon <grondon@gmail.com>
---
 drivers/staging/most/dim2/dim2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index f5bd7d44f..327790436 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -165,7 +165,7 @@ static int try_start_dim_transfer(struct hdm_channel *hdm_ch)
 	unsigned long flags;
 	struct dim_ch_state st;
 
-	if (!hdm_ch || !hdm_ch->is_initialized)
+	if (!hdm_ch->is_initialized)
 		return -EINVAL;
 
 	spin_lock_irqsave(&dim_lock, flags);
-- 
2.33.0

