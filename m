Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C193644D0
	for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 11:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771846942; cv=none; b=hzLuF8M4Vyw2ECzI15mcNVzoSNDU62iFjCGR7zFWod8ka1BfXKWNA0ZKd5/RC5M7KfIjw3UWxUcHUWXAuHShhZDBqMVOTN6dQ+Ad2NkRurlx+me2+bCYO9Pxjjj3lkioHccyMJ4VpNEwdO+aLMMtmkSj1m4ROJDBg6Fba5E6xPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771846942; c=relaxed/simple;
	bh=JRFf/ku1zQxpRQLAaqk+EWm9HFzXh0ZUu83u1dJQSBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VA0g+oG1Wqjb/66+lUhM906B6GIUmSfFzpz9jNs+E4Fjke6x0WboeGDnoFsmzKYGgJSmFK2ZonhoWFdzi4NQuql9giufy1/F1PpxlgAcdWSPG5J4SJ/wrUaocHVSqf0CCJuYXX5BuNQHhkE6xVE/UIkSbownyaAvXbxvO8Gf6+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VJu6pN/7; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VJu6pN/7"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-567530bc03fso3594686e0c.3
        for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 03:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771846940; x=1772451740; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ao6qYBLQDvSlAapxaJVsLBIInH8bgP428V3ceVekVzQ=;
        b=VJu6pN/7cgLiFcUJpXbz0LOCBQpWfIcFOgPoAYlTTsbrU4t+BUmK1xqgXlWo3SFItL
         l1Wsc+gMJT8K62DkdDq+dQOjCzgessS2gBK8uvyIZWAZPMWNvWrHiknuuJqIx+fe4WKc
         nPc3N4bnpXiwSQ2/nG98mbc8EG/MM8/gjH7HqmF4UMyH128qZZnIV/M6Sj1ol2WkCQWm
         5zJf7uN8gQ/iDnQqQe7DuGSoiXfp+PKjpTbRRFcm5uxgsCujIu62dpIT7qQ0MVZWsRt2
         rxZXhVqnhb4QUZkDHZtO2XtvVWt6xHt3DNzwWEnfoYwRUgogoFRMrBooSfpVkRTGm3Bi
         +bYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771846940; x=1772451740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ao6qYBLQDvSlAapxaJVsLBIInH8bgP428V3ceVekVzQ=;
        b=rtPX4G58MqVFdquhJKe89WvaQ1TFrEnhJdD2O0J5KWKXfq7hmTITg20E0biOGaW8as
         MA7uH+lwJeDZ+U8mEHZqGaY1QQZeCU+WkwLBJzQROLzT9Y2YwemyOA+bq4XSa9N3q9Tk
         ABcb+vp/gQFpRbXCLVwIqwbAQYwdTwTm/kIjcT0aeindFrVUYN0xsXQiGCxJFfCH8GdV
         +j2KZFmjDxFnTByFuer/g2Pk6GCiS1EN4zvTrVICWRTbaAlfxZeoqX8vXMfk0zIg3nzf
         1knEFTSW23qQoRshHzOhyV4U6iUdn1/FqAadtZCdiiEr4Z5lMFQ6g3UssYXMck7UkHxF
         HRLw==
X-Forwarded-Encrypted: i=1; AJvYcCWRACGKkH7UOlF5mqPEg7Qq8bRosiean4qe/ZyRo9SGMl9wNh87JK+WOIorjLhedcbAGDIFE1cdCjl6SsZh@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+/kRRgM962ms8ltBHeMiN8+i14GfnKuCGpRwzBOu2Naqo9uS5
	Urk7CEnL4jtHNzUAHulPHrTkvI0MfEeiK7YXsHpDh7jWzvJfMrx5dH0z
X-Gm-Gg: AZuq6aIbYcM5ZRac24yr5pc0BWFQYnpQUI3UaysWEXqg2Y+G/0QdIZuuHnDlm5he4l2
	xhoyHemHxoIlz0WDj2H2/wNRlkpEc/+AkjxDG1K15X5KOsMY5qNFAxeXJzIRZnUbm2g8Xm76BFo
	U8sfl5F02Sxna+T1lgq9NPb/JPnM2ghKAnMWG90WDWZn7+8qWDLQjBKEHVKUEAI9KHqA46KS4pi
	0EwScVcCgfyzkZ+zyrg2ZLYDY7dz0GzkB8mYCvXccLpaJtUdDPWu69hUg5jR6wqIy1boHq0EDMS
	CqUuTTidWvLubSbtuymMSINI8SnDN9D1SQA4D5JN9ieaEVe/ltgrmHS2EIAKPJ+NRAA6OHh1p1I
	R7/Jf+lD2GwjJsTwr9FzqS5F7oTYjcaFHNmyVy3FtOoNO5uMs6qAo/misLMNrFxV0yxkEY2vs7r
	W2QPUUCxNEkg+Jv/C+3UaatcTslDD7am6Wa3TfpFn33EoNGz/Vqlkq+CeI2YeUgIZxzT4zVkQLQ
	tu5
X-Received: by 2002:a05:6122:3112:b0:566:3685:6ed0 with SMTP id 71dfb90a1353d-568e4910fc6mr3924994e0c.19.1771846939656;
        Mon, 23 Feb 2026 03:42:19 -0800 (PST)
Received: from gustavo-arch ([2804:14c:f25a:845f:5b8d:2e7c:d238:2d28])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-568e593a666sm8285024e0c.17.2026.02.23.03.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 03:42:19 -0800 (PST)
From: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
To: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org
Cc: ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
Subject: [PATCH v9 1/2] staging: axis-fifo: use u32 for fifo depth flags
Date: Mon, 23 Feb 2026 08:42:06 -0300
Message-ID: <20260223114207.3639-2-gustavopiazdasilva2102@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260223114207.3639-1-gustavopiazdasilva2102@gmail.com>
References: <20260223114207.3639-1-gustavopiazdasilva2102@gmail.com>
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
Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Changes in v9:
 - Rebased on top of staging-next branch to resolve conflicts 
   with recent structure changes (pointed out by Ovidiu Panait).

Changes in v7:
 - Rewrote Patch 1 description for better clarity and acknowledged 
   that the original code works.

Changes in v5:
 - Added missing newline at the end of axis-fifo.c file.

 drivers/staging/axis-fifo/axis-fifo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index aa90b27197cf..e54bc4c1d40f 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -71,8 +71,8 @@ struct axis_fifo {
 
 	unsigned int rx_fifo_depth;
 	unsigned int tx_fifo_depth;
-	int has_rx_fifo;
-	int has_tx_fifo;
+	u32 has_rx_fifo;
+	u32 has_tx_fifo;
 
 	wait_queue_head_t read_queue;
 	struct mutex read_lock; /* lock for reading */
-- 
2.53.0

