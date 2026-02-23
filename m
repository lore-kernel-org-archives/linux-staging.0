Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F1E2BEC5F
	for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 14:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771857067; cv=none; b=EntGkFJxGLWB9Pwdjv0Lio0SNWHcsO+cgEJiKO0r6/idAk6JT6gpJFUkil/isFaF2CQn2YPuoU6WfXE+VPPu4/enYH7vEr3dytqorV6TKsm9YnD/phIA2OIbfvRa7KFfWxpXXWG/OeIxa7mwGqQ8jyUgYbObqe/N+6xbxnO3EoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771857067; c=relaxed/simple;
	bh=jUrP7110BWfdloZ3xp4KmzT4buLG+ogvO8ingw6MefU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oMc952JIyzSSReSMHDQbhMnBa2yOuZf73Bn+iPj6j/Okxjyr3v9FzNfNRHpTFNukcRkGKwF6LnmuitWVDqXG0CXT80kRrW8wjIN0A8WEMXuBqLDfJUtbjhUWD+fJzXHCbxfkqozKmhyb6bY3lF1R2gWZnEMwCcSv0OSAY9DjqfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mucz85JT; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mucz85JT"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-354a2d107bfso1769057a91.0
        for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 06:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771857065; x=1772461865; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tewb8NzmWsDI5uhYbFk/DkoKdu/IJv57YUJy8Fupdsg=;
        b=Mucz85JTQ7Du/jN7fDmEm4tYTVTeHCb0V90rFF7z0MBYYQ5ZxwxzgijWeBW5g5lsrX
         7ToL14+SpfcnfY3QhOiiLrhdHXq6EVx8M8dzJ4pk0nz44lhklJDbmhf9ZMn+KJyQzeGb
         j0bkNZPC4JO10aQxNoqj+ADoBqKrSZbmu4nOC83uppwegCXVeegRVifJNo3qilmHRica
         syz0pwxpvWyNXojZacgVzmS964akjAY+h/sf4H9E05YWL1xYV6JiGE3f0mb+SDKmFmr7
         fXGj26ZI1Fqjmhn+SUqZhMlivv6xkWHw9QrgExDRYpyqpWPycIjrfkkvC989piqhnwhk
         E3fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771857065; x=1772461865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tewb8NzmWsDI5uhYbFk/DkoKdu/IJv57YUJy8Fupdsg=;
        b=TWQ0wj7E17M2kObIIklFgJOE5m/MvHd+/2CvjE6MBrFjrl0hhxJweSpSP7LZnyuk0O
         3Auq8bJDsqltQQa5Z+bMji2eBDZ9Y4W/82IeDtmSVXymuYlY3u7WiU7r66jZN5wOWuVH
         /9uZ2gC/WcfEIm0ZndGNjscAQIicFo7NWHyxaS6J7c7Qzyj+vqrr0QBIHneLvfoVc2vs
         10WPyqXf+AqqtOByNPdvsdi7J9GdvKP/h8Sol7UIw0iihh3reAxf0jC2WtTP9LkGICpQ
         j9xFDSCLK9cwDishKznwBd+NxXo9g/Zqndv7VZJNsX4Wu7BK3PG05henQ4gnC5zVkmmM
         G1qQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWrnH/kNejoh3/nH3EvVKt88bfJB4JFgDZi88Q6d4dwrzUeV53H+/xpNoc9QMVvEx/ccRRxcbkp4tIswgZ@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7ZvzGzKfwynFkdE3MM57lE7U5gsG9GK7XydgdwJ3AIA+NIAOY
	UNXjcqUlJGGFpNRHmsnBiKiiDlJC7ELay2jHIUYffq7wcUfNRx0UnzGh
X-Gm-Gg: ATEYQzyCmQ6OBZEh+/HNeKEnIl/uZmBPwIn8ZEiIntoT5YQXhquQ81tvznIQ5wpDYdy
	U8PY9RtThFAfEIfbvg1g2pgNfyoxFuovY6w7XV8/bg4j8x5n6qOrKKhG9MhV0/bNOBsu/gCWr4p
	WIJ7dAn3k/7kRd3sGF4nogMVaVRu9g0dB8MqBggVhIwk1zq9Re+zEAArIp/RbAVd52XZnfOlSko
	5+3ezK2bl1fbO+1vgcWZdGDBDOgQL2eONg+q6Cl+LnG0yjoMzK0QW2wKqLZzP79+We4v/AgTKd/
	MElnA6YhYvMmpn8Oz5+yTtbND1aVd29FlcnYUA2aUpUsouJDm3h37nZ8z5aRicoCyxpk3BU+tRE
	5CWHRK25nL0lHtbtkKw31hTP7dXx5R5F9/lX8acQq4L/qVEHcQloJS8j2poAeXpXwSWT7qYkqU3
	Jz019Z2YbwlaFjqJ3hWBjX6Kn4nB0nTb92RM6PB8X6A6P3qlgxLeVNVRbRmw==
X-Received: by 2002:a17:90b:58e7:b0:356:ab60:e90e with SMTP id 98e67ed59e1d1-358ae8ce4acmr6891608a91.25.1771857065176;
        Mon, 23 Feb 2026 06:31:05 -0800 (PST)
Received: from localhost.localdomain ([183.96.230.140])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-358af93b9d1sm6784146a91.15.2026.02.23.06.31.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Feb 2026 06:31:04 -0800 (PST)
From: yykkibbb <psykibaek@gmail.com>
To: marvin24@gmx.de,
	gregkh@linuxfoundation.org
Cc: ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	yykkibbb <psykibaek@gmail.com>
Subject: [PATCH] staging: nvec: fix block comment style in nvec_interrupt()
Date: Mon, 23 Feb 2026 23:31:01 +0900
Message-ID: <20260223143101.76552-1-psykibaek@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix multi-line block comment to use the preferred kernel comment style
with leading asterisks on each line and a trailing */ on a separate
line, as reported by checkpatch.pl.

Signed-off-by: yykkibbb <psykibaek@gmail.com>
---
 drivers/staging/nvec/nvec.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e9af66a08..62013019a 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -659,8 +659,10 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 			nvec_tx_set(nvec);
 			to_send = nvec->tx->data[0];
 			nvec->tx->pos = 1;
-			/* delay ACK due to AP20 HW Bug
-			   do not replace by usleep_range */
+			/*
+			 * delay ACK due to AP20 HW Bug
+			 * do not replace by usleep_range
+			 */
 			udelay(33);
 		} else if (status == (I2C_SL_IRQ)) {
 			nvec->rx->data[1] = received;
-- 
2.50.1 (Apple Git-155)

