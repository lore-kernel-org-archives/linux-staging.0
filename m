Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48446399011
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 08:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777277951; cv=none; b=fxG+BqQAtcOgA4JqgSJYkkszz79Ga/j6LC7j/hyw5oahdXHc2oeC58gLtqKg/Wnrq2c8gqsgktUhh0xdorNC0KcFAzz7tjoOT96bS89RDDoZIqyYQp6TlRY7TIuDt366Ddcp2Mndml3cwDjVk1iN74G+G49ooNSe5BLMGbZqg3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777277951; c=relaxed/simple;
	bh=UbK58Vzg9w7sWB5SY0szpeu7+MJi5WYw4Hn1wlYoJG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F4pyj5goJCCmLMJeOpqwpp3KPiLKVbEb1Hkyhe5YZLJFD0E7DVPqelVkKjThvuFjaTD+MEUTmRYl4mqpZ5jOrvLZbXDaUZvSvyQq1GmpzUPuoPscr2I4Vvy2bSHpxcBowm5+Jit2q2EovC97uALMr8reXGscoC33agpd7sD85S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AEYm+SuW; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AEYm+SuW"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d70b3e159so5221560f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 01:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777277949; x=1777882749; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gcNAF/r3YODfVeip91vVmIe5J4y4IySQb1pjlKeU7P0=;
        b=AEYm+SuWZ2Wj59dk0fY29zf29EppzyfapYrQY7cQYi6miPz/pA4HLe0Edv3V1Zuy8W
         F3YppkKDcZG6sTVr7gG8fEHlr/nJoEgZMVBm8T/RkrhBmVUfziajqajyKdqyTtg/m+z8
         2mFQyD9Y7QW/iP7eLaAM6vUxXrAruwO568VvI6kQ9Y6ckalWnz89Fk+YrVq6c3LSh1EK
         zS31F4twKy6I5DGOew3SD/vHimQmemjyXv1JExWW6lMOlPgdsP7IfEXxt1yoJF2YCiN6
         6XTzFXHnB5JjVwW2jW7oWHaf7xvSIDKrXC7kUvywVcbqoiz/9v2mibSsw5USDWrvVTkc
         zRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777277949; x=1777882749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gcNAF/r3YODfVeip91vVmIe5J4y4IySQb1pjlKeU7P0=;
        b=nzp+1u8uLaFXVQc9VwD9ViuYbGo3WwPQ18DINqcoUmsmhZ6U3tgRP8JVJyIoWNgAiv
         xl/Got3CZNGubMqZLGPQw6sHIlvbkB+DCzqr75Ve+Eiks7mWuqJOao+gChlZk21Go34k
         lQo1IxNSYri4RDKSKSmz+rYo/kyp/KhTZFpUKcwprgT+90VXxT3QCvaJm+nj06YqVI6O
         CX1djrjRJzX4FZkt6h2/yQmv6h3kBX+qEFAFTWcgYLVQrilEIB2XEJo2cmtO7DQ9PBl3
         u388m0vFkEmhwWX7htJO5AXNjYjK5xCxPIaIL990jdgPzIIwGXTH33iS9IWzbVxozCSG
         A3ww==
X-Forwarded-Encrypted: i=1; AFNElJ98nMZsGOjiIBF7TUPDFYbEEehIOKXIq5VIoHeZ41/q/yR0Z9b2BSdrGr0xKIJaDIGWd7ELyuAMb/FElSgx@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+vnwzkwglYofWwZPWi9SlFcnWUurv5QxZjzYzjEngbyrkIGC8
	xe37FgC1wnGSkO1SsvqvD3vPu0UqciOaigCMNAxJWjWcm/t8+XHpGV5zPNJyeX0n
X-Gm-Gg: AeBDietSEOwXEboBbGq0lXA8EKYUCWrFvax7b+3yLvWSNwNz6hmwJwgKUAcJ+QtoY4K
	27K2aE7spJVoWj1u7kFtBmer82vJ3xSOMXpEKiBjGdOuu+7LlflHXgCdoI38KzTU5/VKrvDGbYI
	k7t84B37ekNSredGzzAZ6jqLoXOHAp3mHHt9t7CZD+nunAezYpl6cRhrMXrI8i4WpY3rUypu24F
	nXtKzJC+U2VtANcQn4lWnHkBKqfMR29yue6bhC8ZRXYXxJ7bjxlgO+ZT5xIY0fXD0+F8n4nv2IS
	ZjMfdm0vudZzA3udsbns33/SVfmM3rRYqKUXht4RCYOZU5iUVPKE/2UirAvwB3Z12BKJ1G+/95k
	eCIjaUHGjB2uGbNGBxjjeaRcSmFuCFWhz8mHMqQr6lLvhEQAYoszIwQ8d5dycbbw1892PNOwu6d
	MwgdjPYDb7zb6SA/LWkO//thcHqnOKixKZOWDLxGyuJpd3+COJ59AocfaHEHXTJdVpP4jgmUYWl
	A6fqFQpDPqS5cakjiKgfi6XDDDjFgA2tBxa3NwqLW2XvFIWlFgAAAtwtk34I+QVkEoTyQE=
X-Received: by 2002:a05:6000:2dc2:b0:441:2473:c30a with SMTP id ffacd0b85a97d-4412473c325mr35101080f8f.31.1777277948556;
        Mon, 27 Apr 2026 01:19:08 -0700 (PDT)
Received: from ahossu.localdomain ([82.78.232.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cc375dsm69920019f8f.14.2026.04.27.01.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 01:19:08 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Cc: marvin24@gmx.de,
	error27@gmail.com,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH v4 1/2] staging: nvec: fix use-after-free in nvec_rx_completed()
Date: Mon, 27 Apr 2026 10:17:12 +0200
Message-ID: <20260427081713.3401874-2-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260427081713.3401874-1-hossu.alexandru@gmail.com>
References: <20260427081713.3401874-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In nvec_rx_completed(), when an incomplete RX transfer is detected,
nvec_msg_free() is called to return the message back to the pool by
clearing its 'used' atomic flag. Immediately after this, the code
accesses nvec->rx->data[0] to check the message type.

Since nvec_msg_free() marks the pool slot as available via atomic_set(),
any concurrent or subsequent call to nvec_msg_alloc() could claim that
same slot and overwrite its data[] array. Reading nvec->rx->data[0] after
freeing the message is therefore a use-after-free.

Fix this by saving the message type byte before calling nvec_msg_free(),
then using the saved value for the battery quirk check.

Fixes: d6bdcf2e1019 ("staging: nvec: Add battery quirk to ignore incomplete responses")
Reviewed-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/nvec/nvec.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 952c5a849a56..2a3499dd4d63 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -494,6 +494,8 @@ static void nvec_tx_completed(struct nvec_chip *nvec)
 static void nvec_rx_completed(struct nvec_chip *nvec)
 {
 	if (nvec->rx->pos != nvec_msg_size(nvec->rx)) {
+		unsigned char msg_type = nvec->rx->data[0];
+
 		dev_err(nvec->dev, "RX incomplete: Expected %u bytes, got %u\n",
 			(uint)nvec_msg_size(nvec->rx),
 			(uint)nvec->rx->pos);
@@ -502,7 +504,7 @@ static void nvec_rx_completed(struct nvec_chip *nvec)
 		nvec->state = 0;
 
 		/* Battery quirk - Often incomplete, and likes to crash */
-		if (nvec->rx->data[0] == NVEC_BAT)
+		if (msg_type == NVEC_BAT)
 			complete(&nvec->ec_transfer);
 
 		return;
-- 
2.53.0

