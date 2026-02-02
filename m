Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28FE369961
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 13:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770039271; cv=none; b=Xy/2rRuCtp+vCXmvoPq2iZfAMOkXVm8VQNCKYBGVjJ64W/WpayNU88nvkPzV5QV9rBSeW1JikUp36oZZ++H516zASfabwzwIibj0FS3taDV8QXrAFCh5kDrjJv76E5eYpKI86Nkn+N0ZOBbOAj5y+ZOQefYDGpWKZP+52/CXf1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770039271; c=relaxed/simple;
	bh=OI5/pPI9yZxR1PrG8KwNZ4ePisy8A7ceE6vffdCvYnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MU0Xyeb7QLnsQaJ/PP1ylNjFpRpKJYqcvrmdMwQ2PzVh9JqBoCyVMSWqm9HFe7S0gEjhsCDUWleEmBJEIMbw5h4kvr/+j+NQA1vvyonXyE4KsKUK64z8A6bsSWzPIdomg3MDOTWdNFrQ62ChymoPyCuM2woqxT9V1h4imhPT0Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xmi+3bk6; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xmi+3bk6"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1233c155a42so7304764c88.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 05:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770039269; x=1770644069; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mD35UFX846uck2E4P3muEsZfkii5RKJyvdmXwnceCr0=;
        b=Xmi+3bk6ejO9MtFlYb36ap69KEztUF1seOs3p2DN7/G9H5lCXWtOq1bS3vIYCFCDpG
         yLMGyInvGtFuh/6BdyIkW21HEL0viVxZr+EL8AoHLNfKQ30O8SleMSL+2DS+tfiJseGP
         hFWzzhgBp0k8Nj2ODyQtxoAppCSXz822w1h5UC7A0IEOOoNjAe8qz2qvtK1YtEOcMH3L
         beuTU5w54GB5FRnWgfZOwTYN06jp31mry9jUwbHo91m1IITuPNv2xMkx2n20Pq9X6T80
         O3TJsmiG+LXwsJot7jnx445Yq0LoijdTTrVHqbNdVC4fx4kexo8npBGhhPnX9oLysBAV
         62ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770039269; x=1770644069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mD35UFX846uck2E4P3muEsZfkii5RKJyvdmXwnceCr0=;
        b=vXtzD0A9xUgfh8fs/+Le+A/9OZuHrHej5nRNfj573zx2Sine2k4tWCYd1AUqqqQp+4
         /AcwEtzSV8jzXnQbSc7R6LrHo3lHcqYiAVQj3z3z1pMthu889SziyHYA3DOyg4Q5ocQ6
         facDATw6a+f/sDGm91Cg/pKclWqma4YtBCbObERaIJq6f5eJ20Cz82gvt322ODfnE9Ji
         UXmi2Liprb6CXdZXKtYe8HAt+khJkSNVgB3bI+O+Kot595jqzgzUW1dcQoL8Dn07GZ1C
         AenxpUnNm5OyqIxZYYCzXrNwNOfTKpIHem0m2IVT19+D98MvaDFZ43784nV7rktIGg31
         xVVg==
X-Forwarded-Encrypted: i=1; AJvYcCXW8rghMYUIWQNrE2t9d4vfKgjEJdInLAO92iCmpMLZFiVCFURrSm1b+z2PlsRpM1wdOQU08EFgf6ecPGVC@lists.linux.dev
X-Gm-Message-State: AOJu0Yy71jByily6lXPzxUcf1YbWK6OXwk5skm+9ZCwbV1PrLqT/THeK
	7Xm/Qc8/A6ibVU1rjmQ1+MLl07EXaDxVte6pGD+Ih2qxcshMT3d9f+Mz
X-Gm-Gg: AZuq6aKQWEf0zb9XDrQjcg4ZxBkK0sSMXMb351TfO/m545a2ceCM8xuHy7/Y4uPpLTx
	oxw8u8jQRw3KuoHuPwvvIlHtU8wi4jTirM1RtJcwAZL2AQALpSZyf1V7XsMtfr6pnFBx5z78Jz2
	r6X3ddU7jQq0okuem5Ilrkcapa1LC0bxb4ZhtyzXxQDkgf6JKT5DMPui63UK5LU0dLiNuucc3kp
	TA3oNgg3t9uOIZwppsidvFpz7Cd3BUS2FDGrxKFS1GDRxibF45nX5H1QTQFt+RTxo7CrC2LVG+T
	fCKOo/K0AnzAShTHvTYnSeoyJCo/eXf2rUocFOlznLSbjl9alrMyx/bTPpP45LzgVzElxke67vp
	BX0PmutoTr6USLuuuGo2pRjnd2tuOsmUAaf3ew1odf4u9nm7JAEk+8eIdiAB0oMUiemiYt/hVeG
	WQotX2lKZ0HvTgcTdA+uphLvJQ9d9MIUNB
X-Received: by 2002:a05:7022:7a6:b0:123:2d38:928d with SMTP id a92af1059eb24-125c0ffcc20mr4725431c88.36.1770039268738;
        Mon, 02 Feb 2026 05:34:28 -0800 (PST)
Received: from gustavo-arch ([2804:14c:f25a:845f:5b8d:2e7c:d238:2d28])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1af8a7bsm20097282eec.34.2026.02.02.05.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 05:34:28 -0800 (PST)
From: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
To: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org
Cc: ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
Subject: [PATCH v5 1/2] staging: axis-fifo: align fifo depth types with OF API
Date: Mon,  2 Feb 2026 10:34:18 -0300
Message-ID: <20260202133419.20112-2-gustavopiazdasilva2102@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202133419.20112-1-gustavopiazdasilva2102@gmail.com>
References: <20260202133419.20112-1-gustavopiazdasilva2102@gmail.com>
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

