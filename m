Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEAF36CDE2
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 14:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770042060; cv=none; b=N5EuaaCCB7JuKIi2WhApaxU9JiwRI8Yw3UkjYdkUZGGBdyltlSDPlWH22Te235mB1e6mTROfq+/t6nTqmLN7bWR1jfZfTXX9gl/JKjSHopiGkstRT10AzaKhDd0Vb8gzTElURmrtaVtpSkrmFzHGQCuZtkXgC+lqwnXplVFji3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770042060; c=relaxed/simple;
	bh=W2hxUyR+35Rw2olK3FN/5Jb/T0bLDoMDTHlXDnADF3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RZ2HDr8cpJjNmSYR7kzySGp/TfmZGKNEoPULezVxC976nusvv/Olc5Y3iONzKqg+jrWIyzEZcDlzeHR2pm0TaRJbmXDw91ins4wlVHxq6eNI3pcHrgCKc8XWnYZsC4fYytnYE6rQ4rJ6/sDInW5wjD4f/FwkWM/xUtfeK1nv/Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PFkD/hCP; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PFkD/hCP"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7927261a3acso45600947b3.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 06:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770042058; x=1770646858; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whJcqFN99SnIpMlyUzptiqrHlyZNnsZ70N0Oxvwa4w0=;
        b=PFkD/hCPTXt3ldC+g3z2cYpEVc4YBC/dpqBVRlyvbB5HGsewGcqH4/wHDSvjLhqTkB
         KTLCQd5Et45KqoeCQ99Qe9OiJvO90dirVGD/AHYz3A5ydlQutcDkKAwj2VJN5Gl9O5qd
         2ifTlf8cHEgUjqLk4UA69uB3npXuZVUHk9d6zQoQWEVGVfbt1BucXY2hutWToJPQ7IDU
         HDtFaYA3l08OrBBiyJQCrErdqoU/MgN/KslwsKj0BIaP3D6gGQEQrl8UCchbaqY+qEvG
         rcoI3A/gRLzCufkSgJAyU+bCHSkvxvele0q07uzuRoR4l08c5NK3UbCYl1PHbG08b+hk
         Ni9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770042058; x=1770646858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=whJcqFN99SnIpMlyUzptiqrHlyZNnsZ70N0Oxvwa4w0=;
        b=HLKg3xByb4bpd6JSwsNDCiXW5mxonP+sGXHGOlIW0Fb2k2eB0tnQeceLeFCbOnoUJS
         dU4WbttX/wmJ6UiHT9wmT5WD3lDy90Pk2dB9KjtB/vIVadnDWoOH9hykVLyYJor0xC22
         3hqpLY2xc2oYuB5pZNv7U/j8QE8hUFH2pUR/zYxNNkTDCQN3w+vvWz0z0OnKI9sFllOf
         BoVp13vyvvGZD1gcOcn9/fdNuVWKlf2TOSy3IBI7AL/B182GTA+5/z8vVhql1/gGnXdH
         9rzMQpM9D6ltr8joHCn/buJKv/lbAXYb5ew1EKAqie7oTPGBWAXnCSCeP5teUvNKkud2
         2AVg==
X-Forwarded-Encrypted: i=1; AJvYcCUIFkWr9tWCiUvWwHavgcXRxFb8k2UP36LHPvdbLwPxDvbkdXbp/55RvkWRa0wkE9r5bjttj1LdD9REDm23@lists.linux.dev
X-Gm-Message-State: AOJu0YxrvkKchuFtzUFlG79iqFmkVAIezsL+sEsKQvltyzpxSVsZWQWU
	fhja9mH3YZ1YE4+fApN52vov3KeZfJb/E7gqnvFLeiJiPVlf4BwjnnPU
X-Gm-Gg: AZuq6aJrVgS7XxUOVN+zAzfh5BXvgBarz1UxFoF6Pq2iBTH7dLbu291AYst7HWOc41g
	9Cvq8AeJ+bJ1/sWBGCHS/MbROFgUZvTGSGec2sxyGZloUET+zZDev3b6eAxuZX0Ust7jgEhOuLc
	L7IFbfggEjtsihdToQ50EdPxKIPvBuNC5KfnAv51NhDWO3pjm3HGjnUYwHlhxCnAulRgn31U6Bj
	VJCg1YfAiX1Jj2E5iH067G6BY3+hjU1LB0xosIQE3lgRVxhQ0zphH95Y4EVN5MINVSgFbc3F6D2
	77QONVj9NLvCU4fIH6x586c8yk+vutPQgtoavKfq4sSsCZJpmgNilI8jjeaq4dgMrQnxNqA7bmF
	/Ikx42tpFYXvT2bgPgqtWBnfJCj735aYKOlC6OlCpRY88L9pFxwA/kHHRgXdsBRzOOp53HMeJqz
	aRjENN6R0Hynkr+wGgZRzmGTTouFWqARTauxiwzYTeqP9mOD2FvJeYYM3C3gg8WOLO
X-Received: by 2002:a05:690e:d4c:b0:649:5c78:3158 with SMTP id 956f58d0204a3-649a83a438fmr9435542d50.8.1770042057852;
        Mon, 02 Feb 2026 06:20:57 -0800 (PST)
Received: from gustavo-arch ([2804:14c:f25a:845f:5b8d:2e7c:d238:2d28])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-794b2468901sm47292927b3.22.2026.02.02.06.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 06:20:57 -0800 (PST)
From: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
To: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org
Cc: ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
Subject: [PATCH v6 1/2] staging: axis-fifo: align fifo depth types with OF API
Date: Mon,  2 Feb 2026 11:20:46 -0300
Message-ID: <20260202142047.30704-2-gustavopiazdasilva2102@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202142047.30704-1-gustavopiazdasilva2102@gmail.com>
References: <20260202142047.30704-1-gustavopiazdasilva2102@gmail.com>
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
Changes in v6:
 - No changes.

Changes in v5:
 - No changes.

Changes in v4:
 - Removed extra blank lines in the commit message.

Changes in v3:
 - Split the original v2 patch into two separate patches.
 
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

