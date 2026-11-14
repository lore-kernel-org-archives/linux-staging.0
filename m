Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637283;
	b=Awj8uPansvZGRwiifjh6ZhQWWCzuTe9Wi1wBQLQdPOG/P5qm6ezJBpn5gkpLLbSzRRw/
	 qbzcH8z0zvJ9PAiWp4i6P7/MEP+3ftcvNEMXWqf0cP2nlzaGwNAVhC1zUy0am2Jv2qCXb
	 QsInfW40R5wmthh4axniViNhWJySxujveGeU6gBL79nLlfnkSu7lZTaywNDyr6sSV2TiS
	 jehyAHEeLFnlgbpO7NAs3cuicneFlQ1eAXFd26kwfRMIT20aknyF82plYtobpGMVZsrIF
	 ByBb8nv3gFJKVeZk69LM4BlfUz2jzQNRQzxBLi2sfTxTwKk4jRWZsQpRKDd7ooKeYhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=abVHe5Yq8xpjvjNcf4nXdIo33DFUomEvkrSWJnINeGU=;
	b=sYxizOHIM0z+30Asgu3titvACIc45Pp3aFjRKdE75k/FHVUseaSoXMuEVO9+5O4i3C74
	 V78c70Qi4EpVrNemxuM0kLc3wUrlOPHkXhUF+rsBWkF84zGGyQCmH8nBwTQnOdmL6/gb6
	 tYBk23Puzv/4xL+YbrPmhQxQfM9XCLwbF4/5bcWcPyyiByicUOiLPb2SN/RoOPRswxt/m
	 5QnmNKyW9ADqVz/9aoMFkJzsJdr2yK9E5K43WYp4uidEplCOJH+BvjPyTs/43kwr9E6CJ
	 5bEfxXfH4sBxHGwr2ElmqS89blpuCyy8ZLcamlrFzwVvpXMRmtOaWQkcx/fzL+GJC6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dlh2rQBx;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34962606A32E
	for <linux-staging@lists.linux.dev>; Sat, 14 Nov 2026 06:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34962606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dlh2rQBx
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1aefd1bf74aso1269270c88.1
        for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 22:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794637282; x=1795242082; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=abVHe5Yq8xpjvjNcf4nXdIo33DFUomEvkrSWJnINeGU=;
        b=dlh2rQBxEGALwbvRT51lrVrWSdAM8UTZZ59vic9JyJt9m7oFB0XD+Pi08KN3mncD2R
         ESBA09dJgl5O2fdRu8mvW6pC9BYtPmkqcMtodOqv9A0WC9APhC/H+NtIs1pdLoG5HCId
         vLqNspa5QS6vdZOAtroMCfZGY2CSNQhqbYbF7p1K7lSAz+1B6UyttYvKGi0hzFImog3r
         lNPNbm9SfP85VE7Jmw5x9TIxjYjmS9A4HdVeukvi/7IP+GQHx6wL8XU7CWuIUVmpKN77
         wff1tP/T0Ipb0OCP2E+nl+VdGWMz4MYDzoxKfCFit8TjUjR3F8H/HA04lN3JAdJuhj68
         +uJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637282; x=1795242082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=abVHe5Yq8xpjvjNcf4nXdIo33DFUomEvkrSWJnINeGU=;
        b=dXrpjQz6X+cidlG8mXsEsIbsQKpMrEWQ/BTKCVPXTwEJYNG+6oyoB9iVZO6ZvDfjm7
         /gyXijWc3A45LRdFsy/2NZkNYv2Z35YLL7jI2PJED9tywDpwhyg0sfRplkPt3BW523Ob
         nMhcwhm0rshIf78bTUnAQKxOGZARgaNuv9QFoK14iVi4ErOd7X9t/1pSpFF1JuWw8yJh
         KbSPbt0ZFCX8SZ5vxCUnRYJHTI8wfUyO7CfwMRGI5v/XfJaVOOZ1Mp0rcpj2cCiEesbx
         OzHkVew+C4hdLhKNqX6bXzlFNJf/iFH78EzVuCon1VrNQJzsBl69uIEz8lGSIwkPp+W8
         THng==
X-Forwarded-Encrypted: i=1; AL+hErH9qEsZqsMGQ4VXV9s3ui+VyDazZPCM2Zsa/3ZPDZ+J7ZsZwQeaOPsysnnFAs0RaCPCHHBS7sW71IhYgWF7@lists.linux.dev
X-Gm-Message-State: APuU4Z9fpuWg7q5DFQSFEX26jkIkzzgQB9vZjDfemo3s6Mw2UVLmFGS6
	x/kpgTG9UdvopjNi4whJfaT4IamzX2d3P/NgDRjJeKXF839TXpNdRXSs
X-Gm-Gg: AYBFou1RlfBpM8GnjGhThgdOCiThBsMu+1NtX7cNG5pRC/7WaCZ8ZkVQVj6IKLKvf5R
	dxf7BtK3qf6GazveY+94pA7/TZrsMiWmSFPc3UhCE9uBsTVtKkIS7Q8yAK3zyvkD15uPZ6AItcx
	DgCUjTHDJSvRf+gloB59jceFxD2aEA2yMsSWnzIyXLwn4FBI/14YeaMeKgNdIKAcBBl0vqDmecs
	DR/YHYEBV2SLu/f3abRmVZjUexXfUUWEYX4w8Yh3TTgrUbCDoteS10+ma1seNLh9bOAmprEGSC/
	5Si+rBCwoFKgnKLsbscjHlJdMx2e8lnjQ5IVnDxz7Dop0YvzEwU2UfPZb467oND99vfeJqayE2/
	84xeilxXVXLp2cIxRg/T42spgwndjHr9j0Msm5Lb2SlGh7uVbOTjII47SW2gbOF2BW+6WIjP+rF
	IhwWkwBQIgL8Yp0nOzgSjw6ephXxPYwmm6a1Di2GwEvyV/6eahdbH6ZfGXDUUEP7cFDGdRBSOBm
	ql8isv/0M2bXdVNuKqph70thhVCZsUW5LmKtsg0bahCY3CWkKzMf9VAcHstvW+3XLPL7E+qy39I
	ib3u4xpwqYsVV4cuQSUPMziZDvPbNTRx5Arf/L0HFmDG6gZna8d+QE4LgXgGdf5unv3IVhc7+Xe
	1dEd+3A==
X-Received: by 2002:a05:7022:7e84:b0:1b2:6b17:28e6 with SMTP id a92af1059eb24-1b505b6c46fmr3635557c88.9.1794637282100;
        Fri, 13 Nov 2026 22:21:22 -0800 (PST)
Received: from kdev ([131.179.133.114])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50313d990sm15468809c88.4.2026.11.13.22.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:21:21 -0800 (PST)
From: Niloy Meharchandani <niloymeharchandani@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Niloy Meharchandani <niloymeharchandani@gmail.com>
Subject: [PATCH] staging: iio: frequency: ad9834: use devm_mutex_init()
Date: Fri, 13 Nov 2026 22:20:21 -0800
Message-ID: <20261114062021.142296-1-niloymeharchandani@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initialize st->lock via devm_mutex_init() instead of mutex_init() in
ad9834_probe() and propagate any initialization error. Since ad9834
already manages its remaining resources with devm_* helpers and defines
no remove() callback, using devm_mutex_init() ensures proper mutex
cleanup on probe failure or device removal when CONFIG_DEBUG_MUTEXES is
enabled.

No functional change intended. Compile-tested only.

Signed-off-by: Niloy Meharchandani <niloymeharchandani@gmail.com>
---
 drivers/staging/iio/frequency/ad9834.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/iio/frequency/ad9834.c b/drivers/staging/iio/frequency/ad9834.c
index 3d97502d5909..9cb1fcbcb1ba 100644
--- a/drivers/staging/iio/frequency/ad9834.c
+++ b/drivers/staging/iio/frequency/ad9834.c
@@ -412,7 +412,11 @@ static int ad9834_probe(struct spi_device *spi)
 	if (!indio_dev)
 		return -ENOMEM;
 	st = iio_priv(indio_dev);
-	mutex_init(&st->lock);
+
+	ret = devm_mutex_init(&spi->dev, &st->lock);
+	if (ret)
+		return ret;
+
 	st->mclk = devm_clk_get_enabled(&spi->dev, NULL);
 	if (IS_ERR(st->mclk))
 		return dev_err_probe(&spi->dev, PTR_ERR(st->mclk),
-- 
2.53.0

