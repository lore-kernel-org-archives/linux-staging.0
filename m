Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E016237713
	for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 18:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769884071; cv=none; b=BSt3GHi9hO96wfdl2pka3TdVifF1mlbcfdMJN2IYt57D/xlNg2qwCwwCdLlUHjjCD7+IXY4ca0RwyEXktvAyQ+2C5D2qORlRAwyn2gK2L+yms5AX5gmTuxxYdGamGD6G4MfnSGS9qlQqnR+pT/vyD4LGj2dgNhXzI2EMRVOFlrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769884071; c=relaxed/simple;
	bh=G/l1qVaPB9PH0mwjXTMwCd5miG5Zzh2E0U4F38Mj1H4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XcfxkTlz/Q8ZIjYGD5k3Z+h2MyFBf+l5OwRL3yRbzHigBmYibbTaYPnt+UYQXUcvPJQAlGwKDzEBkLbwqhNfoJG39ccOoCmweegh45vsCjRIAs7ZD2Sd3zX6yLYCqy7drZrs6Vq1J+hLjnDYUk1SW5288Jz0MvFGxX+UmRoHRtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TcVV+bFj; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TcVV+bFj"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1248d27f293so5193864c88.0
        for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 10:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769884070; x=1770488870; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iDTlMQj/DwQTuTQO9uc/u4JOBo6a2QwSb4FO4/nmPDk=;
        b=TcVV+bFjsu2YmbvZR0E6wYLrkf5CKcuBPMuHvFmWoxx5IAwjdXbX7Y66CXW5bBsDKh
         4A5WUT3OzbkuBWdm+y0dDwDVyubSN81wbXzPri73XcHL1rQgLB3frYn2aC5W45xFQQ4V
         iJPEMdJWqFDpIrNeBCgjUPuKfFBtqIpVu+bemcIrgyGuNOn29BFQxrvJMgM1Syrrw0xm
         WB3KrmWo8IRF+Exkfaljmh7LEfo/5NEns4RTCWRt7yw2FzgF2bWwwSQ13JsU04nwfYi4
         5rLeqBOG3MYk+zr42TkN5n0klQFvPKj8M4261Fs61tgwNWFVVSUU0C14Zurad7Tg70uz
         oV2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769884070; x=1770488870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iDTlMQj/DwQTuTQO9uc/u4JOBo6a2QwSb4FO4/nmPDk=;
        b=CL+1yWvuuivdSN2bGsOfDpHKN31lQgB53THP99K7fgUrB9NScx3MfWPFhUsyberFfn
         QwXgsoHl67nE+815IIJT2zbBnU1VTqrkqJSsWjSCYedoKXwkgDBX89IsDuKMTbV7aMQs
         m1NOF/LqM20P+zdjJf9iOxXi78Q+AV2cEXm8LDycg2me/GqmjKKuwyy2PNe4SXj9mnOR
         NseYrTCcr3m5j9nCmQkfFDmu9CfVtR8369N665uZRX3OUW4ZvT7Ka3RAxfvxWKU9kzuT
         LnG6LRWuNKldavBrZ1vw345oohj6x3HvhwMNqFRTsWYPE6a7Bpu06atFZ85GZLB8+9v9
         8McA==
X-Forwarded-Encrypted: i=1; AJvYcCVZoDBqquxbEKmSndgQYUvCXEvgd3VPDhW6gHVXu49d2/RB4rHf9TlVVR6y3OsBMIf01EzyoYpP5KtsOjWJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yxh9EObfZYdjwKCxXZ6+8NxoYUUsiPD5BRgGmmwbyIrSIj7R1hS
	V++3QXKI2GSP76yJ3PTpQ8+FF9UI94k4bQKPsbgYx1FnoTeXk/QPeVYK
X-Gm-Gg: AZuq6aJt80EjakDF7U9P7JXuZahsP41ZTMIRbN/BcjfkrvP8navwcEaMf8ZJBhdFn5p
	9AKLAEpQKlEDxpuZ76jCybqkioX1GOnzLncfVWcKcgQHkwLvmMku3LRBjiwCTI2E+9+iwTMV3Pe
	MgJWkYrFXDeJlSenz9TIQyrkbRKERNXfWNai39/zrYwzJySwfeRvbOi6T3a6wvZ8lSpWKunruyk
	Q5vBcAlIJAWbM5fFwBRaB5bFl33owbFZy88rCFV4mytSoNNQXeYV00JtyzDKsxVPP6XhLrrEvhD
	bHEhGGQwJbV8unJfxn/5AglFtYlTSCvjt783ttN0Twq1pZW++m1GmC3+KdAhdclV8q8BVohlNfD
	flWrtjVWJxP43EiEbMCfGJNy8pfgF0Govi4AgUFGcdfIHljZjSL7GKfEscYbhKnQSLP9ELxMh2w
	SHGrwYj7xfvjegTpJMtFWSejyfmuhQxrSt
X-Received: by 2002:a05:7022:2392:b0:119:e56b:c75a with SMTP id a92af1059eb24-125c0ff8c26mr3113183c88.31.1769884069621;
        Sat, 31 Jan 2026 10:27:49 -0800 (PST)
Received: from gustavo-arch ([2804:14c:f25a:845f:5b8d:2e7c:d238:2d28])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16ef3b3sm16105513eec.12.2026.01.31.10.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 10:27:49 -0800 (PST)
From: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
To: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org
Cc: ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
Subject: [PATCH v3 1/2] staging: axis-fifo: align fifo depth types with OF API
Date: Sat, 31 Jan 2026 15:27:31 -0300
Message-ID: <20260131182732.62857-2-gustavopiazdasilva2102@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131182732.62857-1-gustavopiazdasilva2102@gmail.com>
References: <20260131182732.62857-1-gustavopiazdasilva2102@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change has_rx_fifo and has_tx_fifo types from int to u32 in struct

axis_fifo.

The of_property_read_u32() function expects a u32 pointer. While the

current code might work, aligning the types avoids potential mixed-type

issues and clarifies the data structure.

Signed-off-by: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 509d620d6ce7..7bc7bf191250 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -121,8 +121,8 @@ struct axis_fifo {
 
 	unsigned int rx_fifo_depth; /* max words in the receive fifo */
 	unsigned int tx_fifo_depth; /* max words in the transmit fifo */
-	int has_rx_fifo; /* whether the IP has the rx fifo enabled */
-	int has_tx_fifo; /* whether the IP has the tx fifo enabled */
+	u32 has_rx_fifo; /* whether the IP has the rx fifo enabled */
+	u32 has_tx_fifo; /* whether the IP has the tx fifo enabled */
 
 	wait_queue_head_t read_queue; /* wait queue for asynchronos read */
 	struct mutex read_lock; /* lock for reading */
-- 
2.52.0

