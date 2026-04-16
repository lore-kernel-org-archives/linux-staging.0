Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4941D37C927
	for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 06:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776322324; cv=none; b=LmhhC05g6UDJoVEFOVl/eul8X9h4MA7ITmxWJLKTafFZCgIVx8Urf3dGDA9bJLgmrainODzotOlVJLekBdazB8+0m7eCrM8p52xp3buvqQanWaqCQLxd3eFaGtYf01nIdKWM2AzT7w4dionfBnodRITPgX5PVG82ezgwkWGeDmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776322324; c=relaxed/simple;
	bh=iozzvJCB2xG9A07OQoUFW3jP0cPuyJDlaZfk/DDuFvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q0+HDqPPSbPbQ9nj0tBMz3QfsKmqE3YDpJrSq7rWhPhoze1ek83BGNm85ovZHtf0Mo/6HNSXE4loqOkIaJ6If3D24XKTxgLK2U1tEpYMGDmE5q3HJqLxBzDsDGsiWk9AVCdJ5H6haqL7OuTqWtQ6l+oxZYkViA7xwQ/UIFPl0Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+fQkrYH; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+fQkrYH"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-66f8f556f39so10296356a12.0
        for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 23:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776322322; x=1776927122; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8S3n19q846uz8sVg+/KoKXdBEBySJwoCqjluLQZul7E=;
        b=D+fQkrYH1CyiiSgXoVx4XYB24c1vIH3kl9HcpFPONTwwOVak3PViLCYQSOh44oZ/6U
         faivEg6Qswg8y77kJYztJh7db0v6GY+SNEsH7ZHULR5ASDU0zfT7xlI58+NyjAv4gwcP
         nOECZD/BNQuRPAT90bvaP3NXec51X1qhOjLV/mRzZ0zS4C5sDfjFR+8ol2lLcch2nmfI
         Tq6LBi7mVauz+XWWtBCYaXgjddCGEqF7EjDgmmG19dD0CbKQskXwbrFFWHRwq9gYYNNi
         9c5vxYhZUXI0YdfpO04diRT2hGspu5A3/Qa1UTt/4Gjoezr5Pd9H8TVzvWZqzO/gJFv6
         CmZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322322; x=1776927122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8S3n19q846uz8sVg+/KoKXdBEBySJwoCqjluLQZul7E=;
        b=XF6HI7qCsKpJ5aZCGbxc50iCJOGtFPqU2zSr5TcLqJgD1DQ5vd9T/BP1+OUhS2KMm6
         jqiRi1YciyV2EQGimrWSyBD8uzKxYVm/fxsCR7CHBBp+WtHXy7f+R5/pEAqfxK/gmTqJ
         xQbt4RPasXu3C0RlZ4zqmwZ2oC7nX+3BnEVvUMxhJOQ7Q6AiuR+5b5i7obW+zirPDfsV
         Hfd5gv8S6n1ClAS8btuqpxQ2A/jvKIqr81o8SbWEcsZgSFDnxVPuTpxaN3wqXF6hvSuO
         ft0r43LxkQxClx/lhZJZVlnZzyFR9MWP/7lSLgWxX5kGDMZMvk1h2QnaSsbTaJlOsME4
         OiYA==
X-Forwarded-Encrypted: i=1; AFNElJ9i/GmSl/UcA6LaYw9Zka0tH7zQJ4Qxy4lH+G23lVByqsrxDAXRTMJY3NDT4MKlL8CPyrfOIa8g9al5GBv7@lists.linux.dev
X-Gm-Message-State: AOJu0Yxh/JbWAFpMeBxYY1fwcXwmeZt6xE0rb58ogwkP7hG6/TCUbSwa
	8/8jQnua8rbdiQkXpMeQY9U63knzhshLz6WXg7JkPCSfdCp1wHQp1ZVq
X-Gm-Gg: AeBDieu58tzeGZLpgz/60EYwYLFL/uiVUwlcxZJx0AscwLz5NLFeykhGChE95kywlRf
	REcMkhUXkDAKmb89pb9tgENnfkY5G9JuC7+42BogqrRfQHOYy8imbHECmqV7BTFHRlbBKpibaWW
	SwD9Es9mIRSpWXaRalDnmyIh4BL1qRv9bvQUe2dQJnEPEJTY5zMt10DAcR6E2vKCjB9cZZ3VpSa
	I/Uej7+xFm3//N1u47JQLMwpLcNG9EjKyGbn4OtkOgDfOMrPvMbbYrxc6KHQMc/0xaDkWvj2Qmm
	01ZsKEnDZAuc9Xehfyiun270orcJukeMFju5wWx03u74oe6ertDUVmt4iIsFFqlsDp5oRjVcu4q
	7DhTyufwrpMkuuQD6L6V+ZDAdqgSVcWvsSwvbUusE6THgh4N87ZRrVufTeJkAP7ncsKfyh9qGk6
	hD7En5c5pdtzCrao4doNbApSfU0xR82xGo5grS/c8kXaIj8ZRyNaZBpo72XXHDjm8YSV41y/bGn
	XX6ljracncvjiNrlC191G+YMr6G1yexfYfsRXedZUogtGGJZKxegyyfJgvNsZq0G3DypglAK3FI
	BhMY429H3OWj20vU37AT0AAVxDnP0hzxIOKnJM2Y8p0jH+M9A9RqlvojesR7vVnJ6lKawzLWuTB
	ZJX9j1O0A0hXWt8n2dZBCZ73A0BojBuckmc+xzW6n7qZcPC+HQUsH0Gj1x9fMBqm+Vjzx5yL1zC
	ZC5GUj4Bo=
X-Received: by 2002:a17:907:3909:b0:b9d:3a9b:a836 with SMTP id a640c23a62f3a-b9d7297e220mr1270489666b.30.1776322321150;
        Wed, 15 Apr 2026 23:52:01 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-a.c.od237066db22328bb-tp.internal (119.230.32.34.bc.googleusercontent.com. [34.32.230.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba17341a8e3sm132530066b.6.2026.04.15.23.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:52:00 -0700 (PDT)
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
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v5 2/2] iio: frequency: ad9832: simplify bitwise math
Date: Thu, 16 Apr 2026 06:51:18 +0000
Message-ID: <20260416065118.1299-3-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260416065118.1299-1-joshua.crofts1@gmail.com>
References: <20260416065118.1299-1-joshua.crofts1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Refactor the ad9832_calc_freqreg by adding a BIT_ULL()
macro instead of manual bit shifting for better
readability.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
Reviewed-by: Nuno Sá <nuno.sa@analog.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/staging/iio/frequency/ad9832.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index fbcfdbd398..cd7c7727f7 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -111,8 +111,8 @@ struct ad9832_state {
 
 static unsigned long ad9832_calc_freqreg(unsigned long mclk, unsigned long fout)
 {
-	unsigned long long freqreg = (u64)fout *
-				     (u64)((u64)1L << AD9832_FREQ_BITS);
+	u64 freqreg = (u64)fout * BIT_ULL(AD9832_FREQ_BITS);
+
 	do_div(freqreg, mclk);
 	return freqreg;
 }
-- 
2.47.3

