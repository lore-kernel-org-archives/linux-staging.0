Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BFE22B588
	for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 20:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744835585; cv=none; b=aGSarbW2cIYzQxSMg3nIEzjJmazYdDGDFgpAluCwTzUrt7WBAvtqf85S+J2jENNFVEPyRxCzHZdXw98sJnoYsE5KH2cfVabA2+I0w7Wemxqs3ijFq8vbmtAZyC4qBO2V/u4e7FFdP2QXtl/fv1unFKUxzSHmm6u3oZInry3qOk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744835585; c=relaxed/simple;
	bh=gCn9wDu0xLD3oM32PN6Fuzizs59+OD/Pgihax6B632A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sZfZ21PE2tTTFKzex48pN9jRGQYkoo1+trIp9tKUexXXKZtnDawRZxz2EnfSbMRJTsQcYeziWvhPZMv/kUuLFbcs9MPhauCKrUdCxkiOaHGhEwQSSO6fLJEkqMK/sEx0WPW2/0Fh746xO6F0hN7SUL1Q52GQKDQ6SV2UqQV240w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=FXEBHGQL; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="FXEBHGQL"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22438c356c8so1124135ad.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 13:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744835583; x=1745440383; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1DXoGDvZGyLbH2+aIwdP9O6JxIXF+8VBI32a8Nw8pfU=;
        b=FXEBHGQLHe2BTGb59FxyYVI2+Lc5oO1w9LBMqAZ0yTshqBByOLE1iHW4znyTo7sHY6
         ePv/9R8QUfUrK1DuUfOakGDlbm7bYLmD5Tz+1vnCgKVhZtUp30uobS4ZEfXAxIcWOpob
         NNwhx1iY+ZCha7fq00BD/cfrbtFMCYHyuCS/LsdbteNs/qsJ1H5EYJNVXA3O0ecZU4C+
         aqtkWC0oqKJ6ebBqrw8Zh78GXhh9tfFVutIbModtLKIdtWPX9Dx0vLKTt+/TniOXCX4V
         pTslX//e612sBbuviQLe2m6QYuwIcLQUKpMCNunaMnKdUa8hY93E2jF6rJ1oXAeaEOgV
         8Zcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744835583; x=1745440383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1DXoGDvZGyLbH2+aIwdP9O6JxIXF+8VBI32a8Nw8pfU=;
        b=DnLkdFOXm/0MltIgONn0qKabbSFeSRtm38mazx/RgWTHDLXDRFSdDo69yCpZPOYKfQ
         ZfyBRUIOQOfujk21acKuEV0LuGL9WDZZ9+pxp/rbRGZDS8P3SHeXRvoBnerzcPX7wumj
         PHLhKqhAJBLXozovyA1FLkA8PjUpss0YcKxte/0fEe7yAFeYdE+mQKMNPaC0xmfS0dud
         noSfQQGiQMcwvpZw/+i6leaVJjhruprtFjw0C/9ZjI+zgeliAUvSyWR7Kp0C41MBAfK4
         cpXrfmjYHHHYJbtq24tcbNnsHcGeMHdRUH/9bIUJVVsDmK455xcNgSaYGzTFbEz/jajW
         7MRg==
X-Gm-Message-State: AOJu0YyMQZpXuzZX6U0P3MzIs2oU+QI1JcNF2KNKwNl2+GW81t+gmcqs
	A8iNZIwUQTLGuQe3gnO2Yboqmv4atPkvvozV9frmzasSU8p+QeZh0Vwtt1wALg==
X-Gm-Gg: ASbGncuqmZFJqafTiW3yQLEEfV9LiVm6Au9fCWhHYqfZYn/OcQ50LP3Y3ieOm5OvCY7
	fLzwW3oJcuxvTQXsnRdXBkt9Y7VZ6kCTu62UDMyuyfPE3bqsRRnXfDPQg6uLIh8tvgYgHp6cqHc
	QDyfRwi0d2OzBPUumwqz7FpZg/qhrg9JPqiJVjdVLXAH7wBStrgw6ZIpnEroH22Teejzg7gpY4P
	n042sURWxwFqkrE7tWr1k4pQcVmICn/yFwOBwFq4oAofiWjZHyClXMt908XBmurz5hZ8bMX0nn9
	Y1gI7Sl02hmQp6eqktm1QXKUwHaiXKcZp594aYQQBxWG5gPAMm/EzxhxucDUQn/seMx0uaOGTb2
	XStZ4Dw==
X-Google-Smtp-Source: AGHT+IF1rgbANcy3xraKnwKl/N0AbEb24Ewaky61VevbVWIUq2501P3ww4PGv4nFiekkm00UXVamvQ==
X-Received: by 2002:a17:902:f541:b0:223:fbc7:25f4 with SMTP id d9443c01a7336-22c358db642mr38322875ad.14.1744835583243;
        Wed, 16 Apr 2025 13:33:03 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33f1cd56sm18830875ad.83.2025.04.16.13.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:33:03 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 10/14 1/1] staging: gpib: uapi: Fix CamelCase and IBA Dup
Date: Wed, 16 Apr 2025 20:32:59 +0000
Message-ID: <20250416203259.7862-2-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416203259.7862-1-matchstick@neverthere.org>
References: <20250416203259.7862-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resolved duplicate entry for IbaSPollBit vs IbaSpollBit.
Correct CamelCase for IBA enums

Adhere to Linux kernel coding style.

Reported by checkpatch

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/uapi/gpib_user.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/uapi/gpib_user.h b/drivers/staging/gpib/uapi/gpib_user.h
index 301083f287ad..58b996a8bd7f 100644
--- a/drivers/staging/gpib/uapi/gpib_user.h
+++ b/drivers/staging/gpib/uapi/gpib_user.h
@@ -285,7 +285,7 @@ enum ibask_option {
 	IBA_RSV = 0x21,	/* board only */
 	IBA_BNA = 0x200,	/* device only */
 	/* linux-gpib extensions */
-	IBA_7BitEOS = 0x1000	/* board only. Returns 1 if board supports 7 bit eos compares*/
+	IBA_7_BIT_EOS = 0x1000	/* board only. Returns 1 if board supports 7 bit eos compares*/
 };
 
 enum ibconfig_option {
-- 
2.43.0

