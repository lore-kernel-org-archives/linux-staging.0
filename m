Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5105332917
	for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 08:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775897960; cv=none; b=qiTDBZ89QTiVifs8aDg6CTpkW+dIaOuefvGv4pg5OC+l6IOrFzStZcWa2Xk4hvmJ6kWk+Z+8UHJnNo+/OPkES3rJKGze5J5Wp0bdLXiGB2WwJiUjjaNDhV0cbdJZwjXMZVNVrePFbkSSSBvZDnp+tEIIKRPB0O0W8GDHZpY6pJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775897960; c=relaxed/simple;
	bh=jglBWZpM6gb6r4jnk+50+pDuOMLGeUPfxSTArYCfDN0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DwmxBE2xDe1yX1OvgCtP3tJaS2XHpIE6qjquhSfTlyQP9o1vmnh52aentmoIAZGtQwnrCt+Jrk480GjxGkjCb10dS+UBVKUpxO4CqMGMqT4Uq8ITRe3soqJg4uh5BanccEVx11LFf3GPCt6zDSPauujHZToD4jWO/Xzj5JZ4TwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sT7H8lNR; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sT7H8lNR"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43cfd96354aso1697933f8f.1
        for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 01:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775897957; x=1776502757; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZqmzVUPIgrnm/cJHXSiJKFWklEbsgCfd4TNnk6J9pOM=;
        b=sT7H8lNRO3O3n/qTg5FiMX1G6bejQmXFDuyU0I7CGiOlwKxcOuhvVt3kdgddSXed8K
         qhlIBJ9IR+j45BwSwy+MmQ1lE49LjLxm4dU+5wQpLQsthyAeXX00YV2kNl5JYEsUlWqJ
         RKqHFXUE9NehRgPJRP6eN2CKVzqK65+6LRQj62T12dbvPTLyzWyVWMrcFCgyq7TjnbF7
         h4Ha2PY3wdA0Kztd9bRfo4KWsn4IUSG+L2jlIrGShhy7kZXWriF6cLmz383QrkKeP9x3
         g1hjLKHV8gmRDliSci1zCT0DR4XuGnH6pkpIRf0Mq6eYjYGKK14megFDeZBTJcGKTJNT
         WYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775897957; x=1776502757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZqmzVUPIgrnm/cJHXSiJKFWklEbsgCfd4TNnk6J9pOM=;
        b=qaLpOOQPlWEIhFPkPfl6Hoa7PGtb3QSdObsss3uMcDdQI0kU24ju6SxvVv8HeqE4du
         e2nMYK84+dWXsI1rBHtip2+hQzZvutxvMyXraDfEkJVC8/fTqmeWciP0MkPOfBCk6Pj7
         App6oYd254xJ6+kZqyuBrplQLFaHh/w5rlwMAfRn0dfXqkt043kgElUiLyk1RiWfa4rY
         rYzzVY57wpmgN6qCOAwvbYkX4JAx9DHRgQLiDMwXRPUg9RFQ+87EPc+ahy6J62MMevum
         3UW6bhz5TarJc9ThRyHNe7Y6zuQ8LL/hyjZeq4wYGkbS/RYeIQL+2CEHeQr9fj4lqZLt
         pjqw==
X-Forwarded-Encrypted: i=1; AJvYcCXQd1oZlOat2jBVuGu9Uun/U2AXokLrsJ/T6ydAbHOCV07fGWHyDXzmUm7MkbabhJ+S3to5E18dtnTa/Amh@lists.linux.dev
X-Gm-Message-State: AOJu0YyHE6OyGSqXW7KSXi2TzYZ8r9YJp65tCxuF62sOI6q992VcXhcD
	biJJzJavR5r7KpG8MllStHa/2pbm/2dVk/NlJ8up/8Ld6Mw47xM+tIaFNO21fBsTA+A=
X-Gm-Gg: AeBDiesjusteTPVpyQ6yb/Is/twVcnG+vRG9RDO4oGkci88b+Brk3qZlOCajiNa2gdR
	uzRr5CxRxxGxgXe3ALSA9GXhjGgSelR5DLwAOAFoDHl51vXXrR2dU7TkW2iDEOPeqCTigg7RgWx
	2W4R/mhWhhrYO5MNYKD6xpYMtMHEZT7eLl33GplmBCdaf1ai1a9F8Fa+jKNQdchkDwaToEFW21e
	0lv9ss36XVT2wL4MvulwKyrOHlzAuDrtF5ipfUff4bQrPp8EQr0u0D/2Yj0GM4POmxtQQU/dj+m
	rpQpHnkNjZF0WsQluC8HJuHjB+z03f+RZK92jQivcRgJMjDjmi/tieT1QON9Be3nM+e+cC4HMDH
	0uB/oCUs0m2O1uirm5MLijMrCHpc6iVzPWaUpbUtU4j/mJIWb/z9TnYqR+VWojJ7iUbol5IbCGG
	ZypWWcfNzW0/f/synVa2diEy6nj3cUIm82/iw5/eM0G7WFkOO4UrOzKsSPNveEcdQrFZ9CcB8P/
	qwh4PxDzhNftxr3ZrcEUBGudHsh5u7CPVp593OSWIBd0mKfAJbYIRQv3ysFj+FBm+98+9GT8k4G
	CYtwwwHEhlusWhS1xKxn3G0/NEI4ew==
X-Received: by 2002:a5d:5f53:0:b0:43d:242:b9bb with SMTP id ffacd0b85a97d-43d642711ffmr9663810f8f.18.1775897957264;
        Sat, 11 Apr 2026 01:59:17 -0700 (PDT)
Received: from localhost.localdomain (ip-86-49-246-182.bb.vodafone.cz. [86.49.246.182])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de2a69sm14483593f8f.4.2026.04.11.01.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 01:59:17 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [RESEND PATCH v2 1/2] iio: frequency: ad9832: remove kernel.h proxy header.
Date: Sat, 11 Apr 2026 10:58:47 +0200
Message-Id: <20260411085848.75381-2-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260411085848.75381-1-joshua.crofts1@gmail.com>
References: <20260411085848.75381-1-joshua.crofts1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove kernel.h proxy header and add bitops.h for
better dependency control and code clarity.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
v2:
 - removed redundant bits.h header

 drivers/staging/iio/frequency/ad9832.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index b87ea1781b..8873a6d11e 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -8,11 +8,10 @@
 #include <asm/div64.h>
 
 #include <linux/bitfield.h>
-#include <linux/bits.h>
+#include <linux/bitops.h>
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/err.h>
-#include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
-- 
2.34.1

