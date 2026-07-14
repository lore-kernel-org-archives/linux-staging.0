Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474034D90D6
	for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 19:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784056291; cv=none; b=Mb6jPCvtULL2QMFvBclblq8gdR3gsY7ynO1E8tSN8zEwfW177cVTnFviCbjg8qW+fBO8QdayadOC1ZXNitLT1twOvOZcdhF4wu04YZHxasS06BoBYHFkNyFkrdTadwlMTohWhVe1kulyPc4gO81hMCo2HSPQwXdFEOjtNRAt7WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784056291; c=relaxed/simple;
	bh=LAYO4eoXWCrre271g744oTgjBTY5ZzqOUJH42pVwkbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cTIOQw5b2fxPsuucmDhaK8LcRfEYg8RXxB4jKcjS2sRt+wRi0A5xzUOMKI85iBDKj+F6FejHMkKbueA0jIfxM68+j8XVak/jW5tUXNLg77FKahEoxMT7c3LzM7f7rXfUzljHGs4RHp8SkQJFPDKu11sIem16QXS0QzAcnEgQItk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HLiOE1av; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HLiOE1av"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493b1710405so24900075e9.2
        for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 12:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784056285; x=1784661085; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bOMU8cZKzzQg02swhcvJoLmSoAF1bo7hqLkWzLq/6T8=;
        b=HLiOE1avkMsAmPXOolAu7TqAbrdU34o0WD6FQ9cnsZvCeBKLSESYk52htVKgxchFyl
         aXwFCGjytSjYpz0Ujo+tAo7KrEX19kRlp5rWHR7+0ncLYaJAgCPBunQNmTEOioyYAEO5
         UFgZoTJbNQ0ouMHjS5vO6u1jJGbzR1WZ7qFJ3teoFEfyht4XFCYAdoPhEfQ/22BjFHfq
         cV4RGWnj9cekZo+1jfSd/GH88A8D1C4vnu95/sGsdkK3kw+fbzaOByoj3raEp5ZNc3SJ
         hbotcmnC8GF1STYlDAcyz24bP5ABEshqG/JPYqnVEHxUZIr1EJq/sSD/KrILsPFOAyI8
         9dFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784056285; x=1784661085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bOMU8cZKzzQg02swhcvJoLmSoAF1bo7hqLkWzLq/6T8=;
        b=Q4skmb0r3k3frLRWA6nTTSsD0gLrZA7+R/gJwAGTxGwXqMgVreVKsHa0remHmrK3kN
         2Hro8KFY82q+J7/gF06UdDSjOLLcFP5hiZ/adLKJ2nJ3dEoo6RjfviBbf6S3lYZDb188
         B2R64qr3bdAcavhoSMn1e/chKVwrJb+0GMaH43KsVPobaJNb1HCaxGZWzuZ2geuBo2vE
         29xuCjRcO0CBh1kGx5BoxePzbi7DwE5pupYIWSYYt7fXraQPMoBAZ6qPDC4qTp+HXzT9
         HnVNKPfKdI7JEagZcw5JP5KCJd98iUd9eL7/uGcZUHBhl4ISZcHxDlbgn2gVH4UJhOar
         U+aA==
X-Forwarded-Encrypted: i=1; AHgh+Rr/JjQIsQ/Y/cGnAJC/6lc+z4VWr/7111i6O4yx8Vb7IDP7SU+0YnYF7NJpFXhUSxL/PqBYItihjzKceKj/@lists.linux.dev
X-Gm-Message-State: AOJu0YxX3t2IAIDu8lEKy6ZHRpCRaSrA8/3GktvnHYtYGxjXdMFcUB3r
	Ym8KC8IqWwMPmzha9bHTYp5VbGj3sTADrzocV4VweksRRJlbfVLnQ+aYknaFuF0qoic=
X-Gm-Gg: AfdE7cnE0neZgLJ37sT0zlcmMzN1770AjbYAmeZLbovml9Q3AGp2Kjgk1rDtSwMcPb+
	dY7k7Dq1kRWRfvVnHY8P2iSXKk7jGLQxQMsTzIU2RkZiMDx4zbGIbpU36ScNuOj/D4yTbBuU29Y
	/6qzLwjY3F06N+b4w9jN3nLY/QU/XUxG/XO4FvO+3c+Bn1DUAdvhff3PKLiljZcDzplUKqEw4jG
	ZoSJ2W2YBNEHYXVaFVaeAKhbl3wU8+3qpidcFBZ0pD9cmTcIVZafV5+9F+6mEUG560gQCkZJC/v
	8U1+TtPI9cXshrs5YqdwOQw9noHsQv0rNeF5ABSsFpBZRCNguGxjeCCzVe7mDA6v1tka4MSFAU0
	mZg6GjS3JC19qu7iBGP9lCI5bI2y9Jh8AyrZrA1QxfzDNKwEy1rNsCXMbIE4xTpnMxa4ugLviDI
	IX7ZWWShJyhznuvvW0nymg0xbmCxwjzk8RL7OG+IqjED85h3epfJ4uWrj4bcEXVYYUZlvwlkQ3n
	fYKaoYPAELjuzihtf3S7A==
X-Received: by 2002:a05:600c:468f:b0:493:cbdc:7cd6 with SMTP id 5b1f17b1804b1-495158c6a71mr56346085e9.7.1784056285501;
        Tue, 14 Jul 2026 12:11:25 -0700 (PDT)
Received: from evil-archie.tail5479a9.ts.net ([2a02:1388:23c0:16c0:aa41:f4ff:fec6:26e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a2f951asm100677815e9.14.2026.07.14.12.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:11:25 -0700 (PDT)
From: Panagiotis Gravias <graviaspanagiotis1@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: namcao@linutronix.de,
	tomasz.unger@yahoo.pl,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Panagiotis Gravias <graviaspanagiotis1@gmail.com>
Subject: [PATCH 2/3] staging/fbtft: Align arguments to match open parenthesis
Date: Tue, 14 Jul 2026 22:09:41 +0300
Message-ID: <20260714190958.219437-5-graviaspanagiotis1@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260714190958.219437-2-graviaspanagiotis1@gmail.com>
References: <20260714190958.219437-2-graviaspanagiotis1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch warning for alignment in write_reg() call to match
the open parenthesis, improving code readability.

Signed-off-by: Panagiotis Gravias <graviaspanagiotis1@gmail.com>
---
 drivers/staging/fbtft/fb_tinylcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fb_tinylcd.c b/drivers/staging/fbtft/fb_tinylcd.c
index afa8f1c740c5..d58b1247262b 100644
--- a/drivers/staging/fbtft/fb_tinylcd.c
+++ b/drivers/staging/fbtft/fb_tinylcd.c
@@ -38,7 +38,7 @@ static int init_display(struct fbtft_par *par)
 	write_reg(par, 0xE5, 0x00);
 	write_reg(par, 0xF0, 0x36, 0xA5, 0x53);
 	write_reg(par, 0xE0, 0x00, 0x35, 0x33, 0x00, 0x00, 0x00,
-		       0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
+		  0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
 	write_reg(par, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
 	write_reg(par, MIPI_DCS_EXIT_SLEEP_MODE);
 	fsleep(250);
-- 
2.55.0

