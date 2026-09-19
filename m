Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D0C43FD3F
	for <linux-staging@lists.linux.dev>; Sat, 19 Sep 2026 10:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789812646; cv=none; b=I0Gbbxo4Pnmmn6gEhpYx3psiDodkvgoQcV2FnwY8Un0GhVSD0tEArGruCkc0rUyWlZe5o0+Br7S9gn4l6VKl1jYyvIKkulkdj1enGGIiym2NdUS6PZl4K8T+rkNjYbgAQGYHeBliXuGLSCOEtQ643Srmttgb0y21XwJK6Wy54hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789812646; c=relaxed/simple;
	bh=AgeA2/0yaAie1oxugGl0NMqzpkSnjs2feCS1fA7m8Cs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TG7i9IzgZq/KAb/s2IYzkax70SnRhfXOCBS1f23kTxq5WohBC/LnnyYuBq6fOTheXlMNpAlQhgGC2VJ4htLGnVtkU/s6ZYZJBDqOXNx+b1PghzZK6tQoK6krGO1w1sm6AS7rmw6e3M8qSqYqeMQ22jxI6fkvhVcrSSooCs9PegE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=onl4sO4/; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="onl4sO4/"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso19901285e9.2
        for <linux-staging@lists.linux.dev>; Sat, 19 Sep 2026 03:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789812643; x=1790417443; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZbPnqDvacY/gcigjjJwdEfY3Aaa8wSWZwr6l1HMTaHM=;
        b=onl4sO4/nWfX9qfmzlshTACLbbK+Eyg+bctxw4rd4fPoOir1o6F3Y1Eqg5v9ImLHOM
         K79GBQwHb/ogGTfoOHgfIJFDBOrOE06EkpdZji6CawfgChcjJyrr4hYHrSkuvTv8VKvm
         mcD4v+irz1g0+EZheUUYmAzV5Hv3/5W7EMYHHhBv/49RMxvLIzlG7MeKuo0V95RmBYDt
         ssVpeD8p2Gxj2jfQR6aJ7pIgmfIlbUPx0Aghb+PKu4tiBIqy1MsmxOIZaSVrINQ/8W/j
         +y5kI9AaduzTC+CNzQ2UR6WnfpnyBTMGPXUwkgahMzKyddHFJyTuX6bDChiFh7KLRb9G
         Sbcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789812643; x=1790417443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZbPnqDvacY/gcigjjJwdEfY3Aaa8wSWZwr6l1HMTaHM=;
        b=H+tHT8p2yuo9bn8ShpiuvF3MBf+D+exh5rDdjQKu9PGJ4c0ZJwiA+cJIGZEyRqzYHY
         HrR39FMcszCosQDB1xcPG33f/oWxXVaE/mpqqvJS35NF1GMHXKjTYUd1X+38zjULHAts
         dwn2h9PMLukanYUCwJaVxmwqlLYX1Ym9LS6wc6cx6hRLabKFEFYuCe4coF4H2BSKb/cH
         I5q0+eYGbjDADNlrOsbLR8iV630o4E/2ewwOIUdVzfc6owMYZbYHhrRI3TpyZCrI3XBY
         XBDkWv0C6Wvp4AOlQ/OPlDbdw4fh3KD1sBiHdLyigO71f35/4YSPurOU1uBte++7fgzO
         gO1A==
X-Forwarded-Encrypted: i=1; AKwUvByefCY5jXDTAUJPddSbedqp/7zvKyk8RJwgaiuW5x1ERYlgS1GL46i7q+jmZM72Kma2iR84+mdzKHtnO7il@lists.linux.dev
X-Gm-Message-State: AFuF++kMFRs5ylqdjw6Gc4NNAMgI7QoV+2TlcEjcJZdjuxtQH47+0lbp
	YYorgJWHQP3PrLrZmeUI/YjADWbwe9rnmKQJ94tWxh1nLMNGfNYuWs1/
X-Gm-Gg: AYBFou0UW6n3NvjPxIrZvQ/MBzKMHp+oCP0RO/SDI+nwN43yHDglwj5pzJEM3A3759e
	vr8DIk7N0DzDO9plSNn2/KiNf04gM8YjXOUZrIgCDw13NXEsmi+JaTL2cv84HWLb7AcHh7WlRnb
	MzSt00AER1xNqCtcouc700fbq6LXZEE/MVQam6qfLO1VuKxEVD9LfUsBYCtejwLtkLZO0xY/dAO
	ZHlwto8vQ2b532BIp3XAnW/8GjZ+hWeDbZstk/Uy5nJD5kwqLSgwMLkWpLWD3ExY+1Krn8NJv8A
	ZseryhtGKB1PC9QmOj1Iqbh4Fwr5D0TtXu7RPeDM/VQMLa9tSY02+4kVgZWSJFeXFoDUGDjx0DY
	9qrKLd2llvUhr3XDBJSLT7jzqVTVYYMNQFhYPxvEOLir0wbnEaj5mQJV90hrtRlhkIDg0GLoeiF
	Zq1W3DLwJhemUzJ4wUWo4+D0Er7X+P0Iws6bHg+3N6DqcWC5XtjKW7R1FoTuCY37x2Qzi0H6xbG
	YV4USiPBIaQl6eitKS834tfmFrMSfV99F4gGXyGbPzP/eMzrrxNtL0I
X-Received: by 2002:a05:600c:138b:b0:49c:f89b:f82 with SMTP id 5b1f17b1804b1-49fc568f8dcmr63857195e9.12.1789812643037;
        Sat, 19 Sep 2026 03:10:43 -0700 (PDT)
Received: from julian.home (193-248-207-30.ftth.fr.orangecustomers.net. [193.248.207.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd2f7ef3sm58499105e9.0.2026.09.19.03.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 03:10:42 -0700 (PDT)
From: User <julianpoulainpro@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	User <julianpoulainpro@gmail.com>
Subject: [PATCH] staging: axis-fifo: validate tx_fifo_depth in axis_fifo_parse_dt()
Date: Sat, 19 Sep 2026 12:05:11 +0200
Message-ID: <20260919100511.16032-1-julianpoulainpro@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tx_fifo_depth is read from the device tree as an unsigned int and
later used in axis_fifo_write() as:

    words_to_write > (fifo->tx_fifo_depth - 4)

If tx_fifo_depth is <= 4, the unsigned subtraction wraps around to
a very large value, making the bounds check ineffective. This can
cause the calling process to block indefinitely waiting for a FIFO
vacancy that will never be reached.

Add a validation check in axis_fifo_parse_dt() to reject invalid
values at probe time with a clear error message.

Compile-tested with:
  make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- \
       drivers/staging/axis-fifo/axis-fifo.o

Signed-off-by: User <julianpoulainpro@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 3d358f919..bc8a380ae 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -413,6 +413,13 @@ static int axis_fifo_parse_dt(struct axis_fifo *fifo)
 	if (ret)
 		return ret;
 
+	if (fifo->tx_fifo_depth <= 4) {
+		dev_err(fifo->dt_device,
+			"invalid xlnx,tx-fifo-depth (%u), must be > 4\n",
+			fifo->tx_fifo_depth);
+		return -EINVAL;
+	}
+
 	ret = of_property_read_u32(node, "xlnx,use-rx-data",
 				   &fifo->has_rx_fifo);
 	if (ret)
-- 
2.53.0

