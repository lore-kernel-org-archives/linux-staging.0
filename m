Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199BC1D934C
	for <linux-staging@lists.linux.dev>; Thu, 17 Oct 2024 09:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729157183; cv=none; b=PZorc5E6p13ieHDHN9dmyTVOO6dRC8q1jFUCZysYdAlaEBhQ/8WIHmFGT9l9BhkFyBpfjcsiaB3SI+kSPZ/PQN20WTeAIszc1ftiH4oqXuE5cI9LqjT1W92bSxXZuu20yXle5hopsofnxkFYegBdWlx+tmYduYmrr+wQQAwtKuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729157183; c=relaxed/simple;
	bh=GVh5VyWkqC7o+XRonpLlh2qGC5xnezpcQmYSGJaGhac=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ObvzMf8OHsrlWFE0YYxttv2eFPmDqsBW+O0kxRIeafIw7/eUa2UYUfVTiYqwOoLPmmvnAi8ePw7tqKWqKewX7idZq72h6bqKJKN6SIiqI9MTpO0Q+74Rqx8Z7C/DAyiuAmdY2qoS4ycaYeO5TIWCDVpz4O4YK2xeqVJr9b97ETk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np; spf=pass smtp.mailfrom=everestkc.com.np; dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b=hoiq1dvG; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="hoiq1dvG"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7157c2aca3eso366009a34.0
        for <linux-staging@lists.linux.dev>; Thu, 17 Oct 2024 02:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1729157179; x=1729761979; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t3N3DRZ09rXq2ioh1KFz6sEVJ5OoOv5z6eEm+fY0xnA=;
        b=hoiq1dvGsf9TmbehI2xUxLEmfxs4zxtTC8PPwVYnUgOIZLnWj3NtAA5kdVgaBz9JXF
         BJBFlMNT95MoMM7EBiz2ZdNoBvXSuR0zo3ftK48cL754eJq01lws3BZiajaejjWN4qU9
         F+nLmzb6jvk0xKgIfiPsDP0yXUxPE9zu4ZkRtTQgDaNnmi8nbQNJ+uaNwYdJbSZonXcr
         lP4K8mUMYM8HowK78u1xvTMaEBmCrf9b+9F1IMBcfYGP9ZnWH5qt8mQqwBvHoTNjv2g/
         VprHLHH4BlERQVDSbUecBbp/mt5k4AF4CeM5ydFZTXNQCkTTSePvjbMFCCbbhexYEzHr
         TuGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729157179; x=1729761979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3N3DRZ09rXq2ioh1KFz6sEVJ5OoOv5z6eEm+fY0xnA=;
        b=dFAVMVnGh6Zhy+5j0xZxZ1g4jcXez3hVAtVNTAUsfp9Ygf0ubdlZp+efoRxxlIpfr+
         Q3lDnsZfltQ0HkZ80387fgPcFScaJ53gOYD/PWPa/oFE5veZKL8TGGj8QvKJO1A1351A
         NFDzBJJG/Q1K5RBqIOKAnMQCmvYYBV639+U5tixvODagdCbns7w0wczb4s/bwparijsX
         MNk1sFuHHgDYMB9EN83G2JCUdMMIzcRryk09JCEhpEzU0KJ91n5Jh1kfNLOcBRFlGGdk
         jkC/P57eGdr+RpRoSgQ4BLRWDvpZzpr/Siph1tMUEgJz0LKttCy/6g8DtBpxDBCq6cJO
         hUnw==
X-Forwarded-Encrypted: i=1; AJvYcCUl6qPPQKblVa17zFN0otEJCOWEfuKWbHABbK91dST0kIvdAg9eNw9rxFZpjhHKxGxmW/c/BZKdbUR1+SNj@lists.linux.dev
X-Gm-Message-State: AOJu0YyOd8jnsXLAOSwjDdnWc6KZFLP+4BquQIA8ZRe66a83IIEJqhlY
	nt8oTsSTOvxXTrftVR1RuMweKxh43mC9+6G2UY2mTx0hZoIj9yu6gMWQTPbDJwY=
X-Google-Smtp-Source: AGHT+IHFu6aDuJwO13ZN7HBGLSpCzZMGYriSy/NfP+4SeQedmPA32TsM/6TK8yVv5BdGu20RNJa2DQ==
X-Received: by 2002:a05:6830:6186:b0:713:698d:928 with SMTP id 46e09a7af769-71803549c42mr6602549a34.31.1729157179059;
        Thu, 17 Oct 2024 02:26:19 -0700 (PDT)
Received: from localhost.localdomain ([132.178.238.28])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7ea9c70587asm4623972a12.72.2024.10.17.02.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 02:26:18 -0700 (PDT)
From: "Everest K.C." <everestkc@everestkc.com.np>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: "Everest K.C." <everestkc@everestkc.com.np>,
	skhan@linuxfoundation.org,
	dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2] staging: gpib: Change return type and error code of fluke_get_dma_residue
Date: Thu, 17 Oct 2024 03:25:10 -0600
Message-ID: <20241017092511.17621-1-everestkc@everestkc.com.np>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fluke_get_dma_residue() returns unsigned int with -1 as error code.
This error cannot be caught.
Fix this by changing the return type of the function to int and 
returning the error code, that was captured. Also, change the data 
type of variable residue to int in the function fluke_dma_read().

Fixes: 55936779f496 ("staging: gpib: Add Fluke cda based cards GPIB driver")
Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
---
V1 -> V2: - Fixed the caller
	  - Updated the changelog

 drivers/staging/gpib/eastwood/fluke_gpib.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
index f9f149db222d..378687eb619f 100644
--- a/drivers/staging/gpib/eastwood/fluke_gpib.c
+++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
@@ -536,7 +536,7 @@ static int fluke_accel_write(gpib_board_t *board, uint8_t *buffer, size_t length
 	return 0;
 }
 
-static unsigned int fluke_get_dma_residue(struct dma_chan *chan, dma_cookie_t cookie)
+static int fluke_get_dma_residue(struct dma_chan *chan, dma_cookie_t cookie)
 {
 	struct dma_tx_state state;
 	int result;
@@ -544,7 +544,7 @@ static unsigned int fluke_get_dma_residue(struct dma_chan *chan, dma_cookie_t co
 	result = dmaengine_pause(chan);
 	if (result < 0) {
 		pr_err("fluke_gpib: dma pause failed?\n");
-		return -1;
+		return result;
 	}
 	dmaengine_tx_status(chan, cookie, &state);
 	// hardware doesn't support resume, so dont call this
@@ -559,7 +559,7 @@ static int fluke_dma_read(gpib_board_t *board, uint8_t *buffer,
 	struct nec7210_priv *nec_priv = &e_priv->nec7210_priv;
 	int retval = 0;
 	unsigned long flags;
-	unsigned int residue;
+	int residue;
 	dma_addr_t bus_address;
 	struct dma_async_tx_descriptor *tx_desc;
 	dma_cookie_t dma_cookie;
-- 
2.43.0

