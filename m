Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6735153D9C9
	for <linux-staging@lists.linux.dev>; Thu, 15 Oct 2026 21:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792100232; cv=none; b=q2Eq9vXbpXMuvfvcYsWcYORhhIOjZdTPsCsR156vdjuq3jvxkPWWWulYfCyadmqHnV1h0EmmRQCgbUdahbkKh3qv2Ur6JbUdpeQ6TPXifRQwTEbn50PRBGCVISN6J5TPCDOyXmaL8MsVLYz9CR08sA+i6ur3UvbTigRlvC1EBdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792100232; c=relaxed/simple;
	bh=UlbqX9WXSoK354kqo1a8NtdRc0VTqh95EAURqNFg/L0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uRFGnox66QE+SskcmsF7Fkf5MalwfffGqIJozlACIXKlV7Y2o1saptHEj8XO0SmdM21YOWhDcwFGMfU2o90mE3yxdrQY2kwDPhgh/JOwqtnRc7OsxCf2U6tBdPWbPgBTsCb+rDyHANqXgjlEH5HfJAtqgjQ74PbVw6rCfaYRu28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IE1mq2bw; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IE1mq2bw"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a01933b584so49392145e9.0
        for <linux-staging@lists.linux.dev>; Thu, 15 Oct 2026 14:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792100219; x=1792705019; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=khX/kyg1Fdhhactu6tDSNm+0C0qyulKzKWkAhiCcNiY=;
        b=IE1mq2bwbZnHNdf+LoJVulnFh3W5rjsA8SoO/VbTd0ccAVXBdvo1R6SEDbo1AxfdQn
         Jpu30a+rKFdYN8c7kBOPBgjLNdPX41MS05AXAS6T00/LDeD9Ibx1xPO5tQdRFEA+up1D
         /uthfE28hxwOeuZ/UDpCuSqvxqAvVLcLaUvQoPCiMjDOgOfWI9nF4loG4vd0rKrsT00i
         kpNg/AHQIDk+poPektx4R8Bg4i7XXV+at9wkxJfyDdvVMYlyJUtEaHCe6qd2iP6Tw/xY
         bBGcJ1tKWZs/4uOzCxxIk54zT3Nz2gPoWI1Kr7fpqIfK3Efu2lhjfa+F1dDwEiLMiR45
         NU1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792100219; x=1792705019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khX/kyg1Fdhhactu6tDSNm+0C0qyulKzKWkAhiCcNiY=;
        b=lfSD74hatzkdzGyREis4S/LjLbQz+NNZcRj+JiKLyERFsP55IkWMH4fVtgJTqx8m3m
         1JBnvZ+CYRWq4U697Ll2EtLkMK/EaVqXw2XrCyQPewWmd8WiKDDY06AChCReHNgyxA6d
         /hjcQQfzQfilLvYmSxTjH6UToWy57M2YI0jThjnWpA9Qv1FTlCMYX6MMqxM8xtUWNtao
         evGB+USzJxa+qscX7mFnlTZyI9mt1B/0R4/VjhGov58145uoKjGl9C03pbI5mwbcV+Ht
         VLLhJ1tPRw1/VHVdyXYr38m3kbS0TA5dZfocHCV+5g85zTBjUVmwRDa3KnkuuYv3hPtC
         qM3Q==
X-Forwarded-Encrypted: i=1; AKwUvBz5GwiRDcEVABRKS8a6XQiVYGK82Z/iOifDfYKec9FVyAFC6ILBbTHuP43Iti4bYaP7YLknM5T6mpiZiuC0@lists.linux.dev
X-Gm-Message-State: AFq9FYJWTGeVr6r+FZC+xfMqK2VL57IFlWhr1pfWZbeVJjpQvQ8viBbZ
	B2S+FxHylxE1gtSgCl3YoerOwCTkU6QyxBzULkn37zhLZfeD9huldIJ3
X-Gm-Gg: AYBFou3TyUSkHzYwJ/G5Ve17K8xWAj6ax2Qhyl2fw2zbjE9jgya2feTd+ASOoqEjLfv
	wrG7hZNrSaKV8sL4tOkLrzMh79h09cG64Xjz2z0TZLlZBgK2FfghqoclrMLnHd828woRCa8ssQp
	RoMpPg+nYqO0LHQN/99WuicFJwiYWqyHG7oBMvC7k1Wh03hDsH4kE+fmquCpJhNXRpooa5IuMlw
	/x4D52joW3zjcc/g08cc0AtfGTM3sq9tDvx5U5oISDEQV52cTrmfm5FiAJujmxPAAgy4tdZhNhZ
	Yr7VUm33qb+ijk3LSZ7BQoz93SUhyu0EugkhR5MB0EUpL7a+VhaaKavkkioNZuFJnURsKLzo92E
	rCtVyYnp3c8uexv0sWv+qnVpccnInzIWPNhQHmw4feanoFkcsctZfKcbHPRFXGm/QkqZ2Im3H9Z
	Rg4XRd4Sz32VxvqZAml01vl153imlOAH3lG+J/1ElAHXo/urNi+QdJ34gRDAaFgU989YNYAEPpy
	eTpitvJlTpofXEucdY/+KhJncmdbFygR84Q/2NUYbr8wXIPEc9hSk+Eat+s0vdi6s0bongqe7YZ
	HfQ3ujm9abUyScBmI6/J+ovQof7/y1+kESnRmv2s06XMPELD2+RgfQo/AEfxjI+/vd/C+uYmmrw
	=
X-Received: by 2002:a05:600c:4e55:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-4a18e49c008mr371304445e9.12.1792100219249;
        Thu, 15 Oct 2026 14:36:59 -0700 (PDT)
Received: from localhost.localdomain ([102.88.167.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f8d1esm650746f8f.39.2026.10.15.14.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 14:36:58 -0700 (PDT)
From: Okhuomon Ajayi <okhuomonajayi54@gmail.com>
To: outreachy@lists.linux.dev
Cc: David Lin <dtwlin@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Okhuomon Ajayi <okhuomonajayi54@gmail.com>
Subject: [PATCH] staging: greybus: uart: fix argument alignment
Date: Thu, 15 Oct 2026 22:35:42 +0100
Message-ID: <20261015213542.68994-1-okhuomonajayi54@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align the msecs_to_jiffies() argument with the opening
parenthesis of wait_for_completion_timeout() to address
the checkpatch alignment warning.

Signed-off-by: Okhuomon Ajayi <okhuomonajayi54@gmail.com>
---
 drivers/staging/greybus/uart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index d47f00751e7a..2448fc9098d6 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -317,7 +317,7 @@ static int gb_uart_wait_for_all_credits(struct gb_tty *gb_tty)
 		return 0;
 
 	ret = wait_for_completion_timeout(&gb_tty->credits_complete,
-			msecs_to_jiffies(GB_UART_CREDIT_WAIT_TIMEOUT_MSEC));
+					  msecs_to_jiffies(GB_UART_CREDIT_WAIT_TIMEOUT_MSEC));
 	if (!ret) {
 		dev_err(&gb_tty->gbphy_dev->dev,
 			"time out waiting for credits\n");
-- 
2.43.0

