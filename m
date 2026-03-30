Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61833DEACF
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 18:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774894986; cv=none; b=XgwFMroIT8V0+C0Lc/a7JiRMLpMBrbykvHvSxGZ4SAlrXD95sPlu8OddlQN3rb2RgWOebh6FzeicdZulxICZVDsT0k0zeJlXtGY5Xqr9qnRW3h82qNauQyKKd3p0hVjT4hrpDFCS+3xh1Ym1Ed1Xohtv0t3lYm0Pg2gWO0FNxWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774894986; c=relaxed/simple;
	bh=7v6hWVMphHmp1fk2Axl/HTUNGWtaCf74TNaGvVarMjc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RQQHAWMVL2+y/lLJefJxLbPvFX+bMisjkO2QpleLP0wnRVwstQe9hnyK9ktsm0gAu/VyMKs0pnX+qxZfcYn+Cm+01qr9xqyZLsnBOjXudRE6FHmx7/tB31eyc0ScS2dGNvlhuxIcosU1e5CWbHzI6+z8qnLXgBED3EgKBswx7WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XBHA7Lpl; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XBHA7Lpl"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48538c5956bso47855405e9.0
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 11:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774894983; x=1775499783; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zxKeE3nFIhdamqdbJMN8NtBpVsh6P3ltxH0ua/ul5Bw=;
        b=XBHA7LploO/Ei9eI69AMvLHRWid1zrgWvswrrg9GDu2YKG+vVyFhYWO3bc6LXRGx7H
         HWzsvGy5Ej0WzobSnNs8dqLuO3X4GXyqSIuciX6Ox5K4pWhvmXKi5p/LBPMbd1Joffgg
         AggxMnp/dTLX+BMB1NwcwDjMetcGPHRq/cNaVn8q98TySPNag96pPdK+dcuZLAw8LwQA
         ItRwBCmp3JRRm/Grr46R2ryyzUlpSTzOUk5vDRKamwcSdafD6sFLnD24DGVEcRp4OwqH
         XoLppxD+4mUVRkXI/hK8Ix74L6vQcmTcX74oi2mbIJWVbgXcdUwIFq5m+uYzMM2/FRzt
         fCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774894983; x=1775499783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zxKeE3nFIhdamqdbJMN8NtBpVsh6P3ltxH0ua/ul5Bw=;
        b=Af6V7wGtzehjnKyUO9j2qOzImMP6qE+VlnQMvqBMvDqULzF7UjbQ7mrXLANuNSZyWu
         c2bL2KuW/ycG0B1bnIahog8fw1J9EHA25Y87aeuOyuODXjAgzf9BFd3i+sLPK/Q6WhWe
         rzlMZ2IddFM+VT7rbO/3j/52W8V4xzjz6n9vJq6THB6hDMhbkUKjAEbjJryOnINYvxBc
         CMqn6gBrOT/JZSV7cXf4D7EdlU33DTXXjLk68boNRd7E2fbhdrwI57yxpcvCVbPPKspu
         8dyocbQZo9HiiECDbJLT2Edjp3jO+Igo/afG9I/a7pZF7O3FbtFhd/kbixAzrcE09/cm
         vPeg==
X-Gm-Message-State: AOJu0YyDQnmuWEhubOxI8HpM8vzz1XBhSSoyyKqkj4cIPTXRucxR9L1Z
	Od1XX4cnkJwRhAa7k+Np22kXZ55BACq8LePSAtARDshHfLuXu/SFXqe9
X-Gm-Gg: ATEYQzznqxNQvRvloWhs0492OKFTlU6DHIB1GIwYOD0DiEGc5vXq0C8z81+VlBqg+S6
	jYW9GRN6C2kaIgy+e8ZhJAspPd1zBl28fZ5U6Y1KJrQW3DW4g7mKIH9wjXF8cJ7TEbT04opZvP9
	/2a1vbYiWAGlkiqckr8mofScpIFNbrebsMMuccUbqzDKuxN13zb4OGGeXV6+I5zjqyMq6FfpnVz
	Hr43xi2Qzi/y0IdBsH/6OtImJHLEgyawjRjUZYp9CwfEgPgkk9Wp/Z7wNnGAmHlevAGlFjCo2Ya
	+xRLosr1hLot51TUJEdDvtigTp+nlsgK867KASCVNTx0W2J+qU9tGG9ONAPj4VfbFC2ddiz/MJu
	dq1UGf3A6j13+t4doVNCLNgPQbnKTIJiXdt1JpWQAMhInduz7G2d8DQVCN3KaAf6cM5mIN8kKQ6
	90XbgBm2zNEghCV6RWheZkwcXa8ILkXH4puntpemloMxrM7fwxWYT3
X-Received: by 2002:a05:600c:468b:b0:485:3989:b3e4 with SMTP id 5b1f17b1804b1-4887828a552mr10234925e9.6.1774894982765;
        Mon, 30 Mar 2026 11:23:02 -0700 (PDT)
Received: from localhost.localdomain ([2001:8a0:6c9b:a000:3437:41ca:45cc:e6f1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48733c095dbsm130198405e9.0.2026.03.30.11.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 11:23:02 -0700 (PDT)
From: grondon@gmail.com
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gabriel Rondon <grondon@gmail.com>
Subject: [PATCH v2 4/5] staging: most: dim2: replace BUG_ON() in enqueue()
Date: Mon, 30 Mar 2026 19:22:54 +0100
Message-Id: <20260330182255.75241-5-grondon@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260330182255.75241-1-grondon@gmail.com>
References: <20260330182255.75241-1-grondon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gabriel Rondon <grondon@gmail.com>

Replace BUG_ON() range check on ch_idx with a return of -EINVAL.

BUG_ON() is deprecated as it crashes the entire kernel on assertion
failure (see Documentation/process/deprecated.rst).

Signed-off-by: Gabriel Rondon <grondon@gmail.com>
---
 drivers/staging/most/dim2/dim2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index 0b80f313a..23230a32c 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -570,7 +570,8 @@ static int enqueue(struct most_interface *most_iface, int ch_idx,
 	struct hdm_channel *hdm_ch = dev->hch + ch_idx;
 	unsigned long flags;
 
-	BUG_ON(ch_idx < 0 || ch_idx >= DMA_CHANNELS);
+	if (ch_idx < 0 || ch_idx >= DMA_CHANNELS)
+		return -EINVAL;
 
 	if (!hdm_ch->is_initialized)
 		return -EPERM;
-- 
2.33.0

