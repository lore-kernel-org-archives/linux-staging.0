Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7B93019A4
	for <linux-staging@lists.linux.dev>; Mon,  9 Feb 2026 11:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770636760; cv=none; b=ENQwaJt/l2meX3rY3U9acY/ZqTlMEbg9H4VuZ30eA7WkiarZ8J3USJPlZ90HZS/OAMaSM5Sl+CC4XoXVMmEMJTwlOjOk/ph1whv0lQ+P+JXAUEJg3MTmaKC/7JA8Cxr+knp+hO/uYC9M3ijnPeXeebQgi1OkJtQS1vLBjz1+Wak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770636760; c=relaxed/simple;
	bh=YoL7tWWD9hM8JvYTQqVqKPauZCq3EBwI/5/6qFCykKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j1sJEek7nMDCIUrGbC1Q/67h3cHEu6Pd32gwlYl+47Q7iDQ9V7louL9eat99DVoo2ER/ljJdY9+sYTxy/IvPn4QNmroeeq9P8eH7OnhVfq/FAW8wqGMVZyYuU/Ex/PoZaI32I2aoh8ZKdWjfX04VvOPHZ+IMAirnEMve1KIUBig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jNKJFaUn; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jNKJFaUn"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64acd19e1dfso2425948d50.0
        for <linux-staging@lists.linux.dev>; Mon, 09 Feb 2026 03:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770636759; x=1771241559; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QbPO9nIZ4i5VxBBYhH1maQUyGQTqHiBofrn28jm5w+A=;
        b=jNKJFaUnkSxVjHT/175HMybdOd+/WQHx6K1QkuZHlCi1+EqD44lyUc6NSPo3bzgf0A
         Y+w/B2pHdraP4gl7Q4BlDum+MwCNOUwNbt/tf1K5HKZFGixj8fKW9gFEFAXFb2tHHW8L
         wJT07W3ElHUlu7j4LOFmxR/QCd8VHS/kwdb0ty0bC0RVk63mho7fz0m91DHhFiKoQdwP
         r4uXkMs8Ch7DY9vlT1xwKMQDh6srp2qPBME7UznhQrxu3pqPkf5UIxg1C1nn00fuk3Km
         BLEUwOFA02eWkw1VnYIDU6G7Q074gjePaB7mxZXFMvRdr95i84YPzc/X2FnrbZ1XW7nx
         EuZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770636759; x=1771241559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QbPO9nIZ4i5VxBBYhH1maQUyGQTqHiBofrn28jm5w+A=;
        b=vfibZp032ZEtXLcGso/vTS+iFIjZU1gNLXOe/msoFyqiJKqXI4K5BocRjLUjXZhacb
         vBleB6ECnRc63lpaAP7y9k6yR/cseNmXVbRrF6ifnUuyEvROksMe3pvK5M3x8XXbd6jv
         AsW2OcjJC+POExIY1SirM78bS/zBQ03NjhJkYk7gPTKlKeJkqCGFKqjeB1Fa3WkVjPpc
         8tvN2SKutgKZBsvjX54+Ohet7Koh3jWNBeo3qAIEU7V0Hus7aO7/LBWLYmxqywJStI8S
         vtKSSNTdK3eE0V1hBBidKSZXW+5CCdbJ2cLc3oVfbJqEeS2sCwxtQsr8zEjrb8KZUzM8
         W+Lw==
X-Forwarded-Encrypted: i=1; AJvYcCWPQFpX6uxnyy9q5qLJYEaEtl35Foc+V0QIAGqoCywsYu4PyEToZhXNyLxqUNZgoggFQ6eAyrDf1AQhrn+U@lists.linux.dev
X-Gm-Message-State: AOJu0Ywr5MryKqvvjC1E5k3SEXyVKhk1LGD7NPaoB0IR7KYSK3L2wGBN
	9g1S4wQU6pnrZQVMb7zL6hrUJ5SnB747qF7hTUNJZUnyI2xgPiYKLG+2suVVhQ==
X-Gm-Gg: AZuq6aLwRSZhHMsD3t1kNdzZJSP5xySLb4I+wzWdc0JEzzml6XKJEgNT+qVF6huocQe
	z32ONT0X3MpLQJaVz11Td8sbdfbW6l1Z8QMR0hFM5CGCjt1evL2ID20Hn+OOl9bJjGuRIqPA9y1
	/PlE1Ff1kyh2crZWelbfUE7bBSJvWy30RNXnKtRrlr4KBnKtQCZwWaDGzwdVwt9CrXn9w+kI3x8
	kZY1j8z3mA1KMMtujo12TuqeE4LX5SrI5i+Rtv1t+gQD9smIa7DyjJXz+JhDvwOiFJsCXX89L1A
	aiqoO1Jb11XnEgCNDBiKx72VSRO5xtLYgJ6FQX6GiczIfyK2tKSMKg1R/MXZoeqIYLJUqJv0GSE
	VgJlFNTVEVUNs7h52OIo5DycoWX5Oay3jptwBcbpAR5VxwLjgh19A4oEmvSNxlvUJaSWvl5uM78
	j6bpjRYT3YIFI8BkQ45QUt/9OVxjvLNIk1eXeUEjSG7a+e+cUD4wyNE220GGVwywYI
X-Received: by 2002:a05:690e:1918:b0:64a:ea40:b7bf with SMTP id 956f58d0204a3-64aea40b9a3mr648363d50.93.1770636759256;
        Mon, 09 Feb 2026 03:32:39 -0800 (PST)
Received: from gustavo-arch ([2804:14c:f25a:845f:5b8d:2e7c:d238:2d28])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64acd247ee5sm8765595d50.6.2026.02.09.03.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 03:32:38 -0800 (PST)
From: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
To: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org
Cc: ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
Subject: [PATCH v8 1/2] staging: axis-fifo: use u32 for fifo depth flags
Date: Mon,  9 Feb 2026 08:32:28 -0300
Message-ID: <20260209113229.7871-2-gustavopiazdasilva2102@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260209113229.7871-1-gustavopiazdasilva2102@gmail.com>
References: <20260209113229.7871-1-gustavopiazdasilva2102@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update has_rx_fifo and has_tx_fifo types from int to u32 in struct
axis_fifo.

The of_property_read_u32() function expects a pointer to u32. Although
the current code works correctly with int, using u32 aligns the data
structure with the Device Tree API and prevents potential
type-mismatch issues.

Signed-off-by: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 509d620d6ce7..7bc7bf191250 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -121,8 +121,8 @@ struct axis_fifo {
 
 	unsigned int rx_fifo_depth; /* max words in the receive fifo */
 	unsigned int tx_fifo_depth; /* max words in the transmit fifo */
-	int has_rx_fifo; /* whether the IP has the rx fifo enabled */
-	int has_tx_fifo; /* whether the IP has the tx fifo enabled */
+	u32 has_rx_fifo; /* whether the IP has the rx fifo enabled */
+	u32 has_tx_fifo; /* whether the IP has the tx fifo enabled */
 
 	wait_queue_head_t read_queue; /* wait queue for asynchronos read */
 	struct mutex read_lock; /* lock for reading */
-- 
2.52.0

