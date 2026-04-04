Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDA92BF3F3
	for <linux-staging@lists.linux.dev>; Sat,  4 Apr 2026 06:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775284688; cv=none; b=AQ1V4N+IZWGCo1kjPS7J+gmSzrfRWfOP+HCBqqUB7oPl0o90xkvXa/0hoUypTTaqh7latL3w2R01lNaUuIgdyYQmyCMnNV91l9IX5k+wuN2tQjSp45LnUsurZpzApDVu+wzi2/g4aw8MLnxW7dHWTSc6KCtrBDqA0Vl0L5Ev1/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775284688; c=relaxed/simple;
	bh=/+lWkp7yecAL4/sXTyDMOcLFOTTPY6lO+V3B2v8b3o4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kFO9jeWtAEccDfQ8oY3ajt0OQqKcrxyS+47+wNciQcjkWOHxtpIjOiEeq4pgbjDCsh67v6OWFAIwx+V2FwELOeQaBLdFiygw/5J2Ie/ViCM7ZKRc5dPnr5uTkG4NgENVbUritTEt3a31XCBfYoMsf6v0yAtH0L+MVfftVujhFUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kLlcCVuO; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kLlcCVuO"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82a893d289bso1099239b3a.0
        for <linux-staging@lists.linux.dev>; Fri, 03 Apr 2026 23:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775284686; x=1775889486; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BVGzlXVQx5SVYG4bBEbahjoY/R94utZN8K4fZhyYB1w=;
        b=kLlcCVuO8y4nkoFibjNrhfA/x378VIT+U6lmgbnAFFYPu3Rea4f7NmyeF02nv1XBrx
         bevsBDz+mSq2EIz4RfrF0cWTdknCqQabkffUx/zA6NrfqriUQ7PGILEye6I/aDKpX61e
         km8kwRiLYIGgVpCjTfC0tCClv8T8Na3FPkXVCjVG0pdgsqr7tF1IbyUw71AeNyWmowuB
         191oIZ6tIqRKhenPyP36K298S53v2qhRjVa/3bctvv2HNtukcMHYf0AtoPw7jzu+2xbn
         nJrdtMpBvjPb+QD863vQ9ASomAA1HP6Sb6kO44EekpQqoFnCXdpOunKMVx7AWhhlrAeD
         k7Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775284686; x=1775889486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVGzlXVQx5SVYG4bBEbahjoY/R94utZN8K4fZhyYB1w=;
        b=JpQhvdGgP5kQfpWGWnZNgJqTgPzxSNXHIW3aZN77bUu5q+tOqtXmf7kS51uzeWijwH
         A3aZ1XR1bNtlGJltobFzTtyvI5Z1+UDlfYq+u3Mn5QFKFm7Jvu9qbRjs3yaMuO7Ky37m
         PtjItbJq808v/dguRfGk6mk4AmChJo3FWO+bCV9FjpEBmv0Xii7Ugu8AOnVD1XTjbc/d
         X2U17dAjbJeWcD/g5vAph/6zj7Z97Ti93o3foJ10cj0v+zaMI5RrseCSUXGRdUslpQWz
         KcrFz/D/6msyQLxz0AJqDVPr0oUv5I20Cs650xoQIF2uhBqMjHWUhtjH93esOVom/KTh
         KTVw==
X-Forwarded-Encrypted: i=1; AJvYcCVPREi0oXMCiDKJkI/pFabUJ2bOfbk3MoY+UcMwsJPPb2jV43Xj3LO4PDHui6kh5+Ht+HCXWYioVyqw9sRz@lists.linux.dev
X-Gm-Message-State: AOJu0YxHbnhQc/VKOUPKETwn/+D5JZvdWl8PQYS6CyIEovGQANtbr3Tq
	Sk0TkCLw1cREcP6OCQbNetZfh67vBESm7AqjVzfD8cPrKmoILRbk+TA8
X-Gm-Gg: AeBDietA8QADbcdM74F/KwELWIBTtPawD+09ouTfFiKNB8bH6valJsOUKnBb9juU8it
	HX5MntFDi2Mvl6nUgZHs/Zvj94euYh68dQ95/cg898P+DhUFQsNf9Tu+34XqdJ1W8MSPRT1f0Es
	UE06bP4+VlaxInOiQMp7NSOpaj3Uovks3orerTO0LmzA+yQo4ToWfwQGJkDwu374Cu+hhQ0IXuy
	/s69SOvS1EUFOtli8/iNzUYpK/Gt8+5jK4Qa1QoL6e/daDGtj+B0K1O8NIfnTRB915+twUhoD7+
	0cEVLigMhpihgQJfr4aaENDAbYdzegJC2ZkwND16CHFAUy3UE2kmS3UwNWLUj9L/xuJjXmIrC2f
	Hd8z1Xye5H/xdhEyDah2B5TXlhgi3ApqGA4+tDUAOjBilnVSczTGs+blPyik4e+XBxYtwJUJW6n
	WroJQ+DlboRk2weWdY7M/r78o=
X-Received: by 2002:a05:6a00:800d:b0:82c:d7c4:4c56 with SMTP id d2e1a72fcca58-82d0da838f3mr4876331b3a.15.1775284686283;
        Fri, 03 Apr 2026 23:38:06 -0700 (PDT)
Received: from fedora ([206.84.225.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c41b8dsm7174104b3a.34.2026.04.03.23.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 23:38:05 -0700 (PDT)
From: Paarth Mahadik <paarth.mahadik@gmail.com>
To: marvin24@gmx.de
Cc: gregkh@linuxfoundation.org,
	ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Paarth Mahadik <paarth.mahadik@gmail.com>
Subject: [PATCH] staging: nvec: fix block comment style
Date: Sat,  4 Apr 2026 12:07:47 +0530
Message-ID: <20260404063747.114039-1-paarth.mahadik@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Block comments should use * on subsequent lines and
have the closing */ on a separate line.

Signed-off-by: Paarth Mahadik <paarth.mahadik@gmail.com>
---
 drivers/staging/nvec/nvec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e9af66a08448..0e655f79ea4a 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -660,7 +660,8 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 			to_send = nvec->tx->data[0];
 			nvec->tx->pos = 1;
 			/* delay ACK due to AP20 HW Bug
-			   do not replace by usleep_range */
+			 * do not replace by usleep_range
+			 */
 			udelay(33);
 		} else if (status == (I2C_SL_IRQ)) {
 			nvec->rx->data[1] = received;
-- 
2.53.0

