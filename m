Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF6D363C78
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 12:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770035011; cv=none; b=m/tMrH9dPVwpPpmS45ZoZHXnF+OIxh1derHLym4U7N8OxynXDG5QoqomZ0J9uZ0qqSTg82vWBGJF07UUuuHgxkiosiEfITAlUPs/lsSs4UlsdmOHH3vr18yMDryh4rqIj2Cw951QTmokEbJGsIL3P6dwl1QPmXYoPUDaLuWvc4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770035011; c=relaxed/simple;
	bh=OI5/pPI9yZxR1PrG8KwNZ4ePisy8A7ceE6vffdCvYnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tb9e7+1Zf1Vn6+nnssOGqunVBeeX1w4EFEjIwf4AbS5lnDV/enrpJx6RpJDUCV6al3SYF1br7TEiAgn9u/5FvlkcT3CEDwcSoQ8PYL8lX/w7HYWip4ibGmRPruHzeNBDjt088VigMS7ebhUkR0PY+Qm0cIElyfQP5I1n6ECHOPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WxblHjxY; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WxblHjxY"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-649b5f5570fso2166075d50.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 04:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770035009; x=1770639809; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mD35UFX846uck2E4P3muEsZfkii5RKJyvdmXwnceCr0=;
        b=WxblHjxYA15zjoOVuF5MnUT7lFaBXdXQhjrIRFfD8ScBbcaIWZW9xWrf1+6m1uZLRu
         6Q/tS+ib78OdV63iPBX+zMsnQnZWD/mc73orDrqOYQ8PDf4N/JGVYrCvw0460ueJpcfW
         O6YdP8FCLnEFoc43Z9VYu1kLZN/+/5gfPhm81TU/wEqQvT0IeANgffRVEpJk+3SH/XXT
         mhP9xxbR5XuAw+kbYlItAB2q19A77X6sqcndEfaEjXZgFXV75vvc5r9pnb34bS5NH6OR
         3f9twsUrLRGRYt6uoISihqAfmKTKrFfFDSTCiY4mJ6GWkRrKHC47RHtt8v1ganx1xrTX
         dfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770035009; x=1770639809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mD35UFX846uck2E4P3muEsZfkii5RKJyvdmXwnceCr0=;
        b=L8AS9JO8AWSio02seLzlsP1Bf33Cw+8az1mhJTc9AI4kaqzTnCIa9ywUrLTVPGDjMq
         O3nVvCi9qwiC6xeAJkTWOqg8JzOpwFImwV7efWkw3vSsbugF4S8LwHgcobzKv+jilxfF
         WnyB/br/CNIwIQQwkcEEd9YgFq4jpAR/gsxqtSNFdO+raeunc3ZiFDvw6CGOBiA9R2Mw
         lE3QqaaqoOj90D6qAB6FAsKPLDPt7xgYjvmUkCogpQhR/QLTuQ1K+ThQrdSpI+RUBsLg
         9NZAM465RUpBlwlKQgCStE3DD6B5EL9wTBB0lVTTFIJ4rioL4+cFoNzPNY5ULaUEEaOs
         aIcg==
X-Forwarded-Encrypted: i=1; AJvYcCUXUvCHNgKvYAlkqHMnHwWbO2mzPpKh8x9AwP/7e8rZlvwpJ8IV3CVTqUKhfdZAkRvM8rhchn4vyIh8o50x@lists.linux.dev
X-Gm-Message-State: AOJu0YzmaHFphrMM6YEtcYisZnFIS+iEHTitPl8/RPy5Kak+nD6KpCur
	eymAoWuZB+7TL0V2KYWdCyvApWPBWus2FTScL+Y7pG2aNA61o71GqeI5
X-Gm-Gg: AZuq6aLonfFF8RjW5zuaagLTfXl9NoIFZqWGYkmr6iOYI2F/ZDUFcRL4YK/NPE0vUMv
	LKL31kiu69XWwTqJqzXdSbgc58xxmzciDaHuX/+wfQiyjDAD9xfsDYcEtry7Og9+DYZjuUXbWpo
	BPe1Uf2N2CRTil5cp7TINNq9t9cfAAkLwJ0BqGWkeFasPMsl7Sck8JM0uf1OulBBIGM0AfpZayZ
	86jeotoxDiELjY0oO8eJvIJV/hLnTH5nS0ZtU3X9jAoHB6yg/PEHZp4lz+kpjnFCenQnm/M/bBK
	68TY556gEzbQzHhNg3Pld4BTVTNfqsgGn/dXxf/lV+Wf1RqORaBqUNltO6jqxeU9q/GnkBjBA7y
	xjEEFluvaWz1WoNVy9fWUjop9CBl8b2+cdRzdsRkDiMYxbT8Ekx8hEvrFbIuIWf5XaRQE2HrjYU
	oBdiPwVa5W9AhlA57zfgFd1cZQ7zW7ls8a
X-Received: by 2002:a05:690e:151a:b0:645:54a9:11d2 with SMTP id 956f58d0204a3-649a8d9c080mr7200836d50.14.1770035009207;
        Mon, 02 Feb 2026 04:23:29 -0800 (PST)
Received: from gustavo-arch ([2804:14c:f25a:845f:5b8d:2e7c:d238:2d28])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-649b30b5825sm4981931d50.24.2026.02.02.04.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 04:23:28 -0800 (PST)
From: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
To: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org
Cc: ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
Subject: [PATCH v4 1/2] staging: axis-fifo: align fifo depth types with OF API
Date: Mon,  2 Feb 2026 09:23:16 -0300
Message-ID: <20260202122317.13821-2-gustavopiazdasilva2102@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202122317.13821-1-gustavopiazdasilva2102@gmail.com>
References: <20260202122317.13821-1-gustavopiazdasilva2102@gmail.com>
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

