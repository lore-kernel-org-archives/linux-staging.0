Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B051E365A02
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 07:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778398185; cv=none; b=LYmfW1fQP7med9LU6m5lFaVKdOWH4YTb//MKUWb+YsHelR+95poeOgImBhKsT8CX8uDyXq9tR0FYSRccXHcoxVDRqVUh7LGrp6wkq5Eo4QIzPx8weEDxfDdxdI89EEFe0KrjGcurIrgXAo9LbWL8R8k49LqIblaaQE/3Hr9xAjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778398185; c=relaxed/simple;
	bh=qWCmPhOrDnUxqUKogWTLDFIt9grLd2AwEu1Rc3nJqfw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Phox0TSJ6ZSvjSyKjEWnG+2Gt6Sd/M7vAxfjZeEco1j9FV71LK+YarG/aqHCDB+Ymp6hvkSH/8EvR08sJ+iOSjg2sWlypZX2fpWHyR32UglavfM1KGak2Ad15mp039Ko/R2Do3PaKx5RBa+9XwSY78yEng7Cbt8SQO2R7+oEfAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FrLSGZ5k; arc=none smtp.client-ip=74.125.82.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FrLSGZ5k"
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-12c1a170a50so4482019c88.0
        for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 00:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778398182; x=1779002982; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hAJj9gR9YqXW3Aa8yL22LCa/R0RncrwiTc1yi2jGMAM=;
        b=FrLSGZ5kTMFWo82n3hZ0PwHKJOSqiqOh95WIyJPVNZnS+y2coXuikCsoVp4d3GpCtR
         kENCyWzG3rHaRrZ/i/XQ0nkj6zYhEVHIdlFl8pleuDEqcvkIfXakaWdWj6Lb28VJ+May
         JmmhvAg2o6f4RZu5aL+BpPMpqdWqQ1LkD7mm6wXavljoo6ZoohfDE6cwCSdOeFEWupds
         ZAIkEc7EFUprtGTxQ20ECbzzLS5kZKywn61oVGqIDerLFl9vK+BzlA7564+iD342ol90
         2S/xzU3+Hj5A4RT68BUJtSWoNZJ67j113k32g/S3ITQ0hExqmoLaSm00jkjhZk8PeqsX
         CDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778398182; x=1779002982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hAJj9gR9YqXW3Aa8yL22LCa/R0RncrwiTc1yi2jGMAM=;
        b=sEXM1trVf9ljYuAdKuzboOmDBq4j9qS2WmtPaqW8Ya3fDPf00nb6SaWJSFl8RicGDk
         cGipuVdHY2naUZixnqk6i0hSSEmFfqZrROrVpvlzTr0KvxvOi9INbVKGHQcIC7+B5r8o
         MsLTeu6aNGZ4mOifsnclHI8Bc+ImTHq62Wry2EgwWhl5jwfPvumA90UMPc4kq0my6yxd
         fsx9yS7OZ7Munp6KUHYXDAktNky/4Keh6A+7ZAZ+d+1FQivnno6oaPBfW09fncow5ZAk
         ptVFjaNLGRGkXA++/isvXHk4E+yiz54JcMa6aBq06I9s9aGms4dfJ3Zt/KOsf5Hed8rt
         gyLg==
X-Forwarded-Encrypted: i=1; AFNElJ/XuAavShV/Pz4Ux9yL8bGFwWk7kSJPC75N9uleFP3glTpgREov26xsVI5JlCjyWmKZL4xV/40GcO0j78lb@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8G6Ks0LM7il6LWiuP1Bq1ERl7fPY8v2Ns2yHwArSyktdwQvDR
	pOkd/1M+eZDpq7gcwH/AuDRHjcSp8HsYJcBWToQzAQqVVUfiujTi1OMu
X-Gm-Gg: Acq92OGWr816Myc9YooC5mi+QX9wfDwdTxB5YQUybMnHd0TgH1nQDugf2/nzBN3CDZT
	Q6MhpOx3I3Qcfan4XxikaP7ujUFzG1xLf1G7J4m5EvVP7Iwdz+jALNJnTtIA6V2qy8MU9+dEjqe
	okBa52tG4dTNm0j1FYb7+REy01nd1hEzTKdibU1yY3e4R7rwWB7ZwBRuRFK5OCA+J/3HDqRPrcJ
	1f5MDaOXLHvhdoVDCwOBkqo/licSrCj/hqY9J3zNxklK/wlQF99qVuyvWs9Jrk66CuMlGTSGIJE
	TYGT1yfFG6v6FNcrv8QEoHzVEaPpr+ZSHg1I/PMWDBPiwyYXxJcwNOEqJIkO1T4IDsnEWy6P2Oi
	p2chWRyXeR3Vn0/M+KVGrhkB44Ega7UbYQF/qp6csEBsPrdZmho9TbYtBHaqQnjEO9G0yhdcFXF
	iWr+u+GeGp7qZKdrjpJPUU7oUaxoImifdtqznTNU1xt2oFyfIP/KoT3kc=
X-Received: by 2002:a05:7022:688c:b0:130:c9dc:bc55 with SMTP id a92af1059eb24-1319cf5d736mr10234387c88.28.1778398181601;
        Sun, 10 May 2026 00:29:41 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13277bb2b14sm11920107c88.0.2026.05.10.00.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 00:29:41 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
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
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] staging: iio: addac: adt7316: document SPI interface switching sequence
Date: Sun, 10 May 2026 07:29:18 +0000
Message-Id: <20260510072918.85734-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The device powers up in I2C mode. Switching to SPI mode
requires sending a sequence of SPI writes as described in
the datasheet.

During this sequence, the device may still be in I2C mode,
so SPI transactions may not be recognized and can fail.
Such errors are expected and are ignored.

Add a comment to clarify this behavior.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/iio/addac/adt7316-spi.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/iio/addac/adt7316-spi.c b/drivers/staging/iio/addac/adt7316-spi.c
index f91325d11394..6d710e1d4aaa 100644
--- a/drivers/staging/iio/addac/adt7316-spi.c
+++ b/drivers/staging/iio/addac/adt7316-spi.c
@@ -106,7 +106,15 @@ static int adt7316_spi_probe(struct spi_device *spi_dev)
 		return -EINVAL;
 	}
 
-	/* switch from default I2C protocol to SPI protocol */
+	/*
+	 * The device powers up in I2C mode. Switching to SPI mode
+	 * requires sending a sequence of SPI writes as described in
+	 * the datasheet.
+	 *
+	 * During this sequence, the device may still be in I2C mode,
+	 * so SPI transactions may not be recognized and can fail.
+	 * Such errors are expected and are ignored.
+	 */
 	adt7316_spi_write(spi_dev, 0, 0);
 	adt7316_spi_write(spi_dev, 0, 0);
 	adt7316_spi_write(spi_dev, 0, 0);
-- 
2.34.1

