Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773B139FD9
	for <linux-staging@lists.linux.dev>; Tue,  7 Oct 2025 11:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759838308; cv=none; b=T+RRPtQSKmNikFxgV1wO1e/3LLF2VOY67fmyE+jmLgEv2THRYQ2pKi6mcaPEst+UCNRVs2/BQod5ZpuXNZWDttpOMjDcievcdtYvedhvqltTGVPejWGm66hyQKcD/7nB0EeLp2eYACtkzkb4jws25DxCbL4jxNa2KXVDRCD0IX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759838308; c=relaxed/simple;
	bh=KkJzx5iseDOMBqov/lks7E3Iw2pm9GsyzW9W4JlqAqs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=chaQfYx4EaetgOQ+phFJXcIXKNzf37MN2E8KoPWziL99sRpDtkmJyBHoWob8W/YrLttrDfD7UNgn7GulRaPkiIK4iZifiHsY9pUFZVUleuv0CVjPDYvbuZrXWMd/UIlc4CTklFmh6qk7U+vrUAPASWHfyUCeNk1sdzJBx0tqpKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QhMeNz/2; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QhMeNz/2"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-63bcfcb800aso3381459d50.0
        for <linux-staging@lists.linux.dev>; Tue, 07 Oct 2025 04:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759838305; x=1760443105; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/LCefJSJB1+ypX3Sb+h7MPQdpzfzCeRiHx/LBHLwVq4=;
        b=QhMeNz/2B8w0JpTkBX5/oLI1nzOguvDoMXAqAaDjEu7wNjPcongvMswUFPMHa31wHN
         SdcY/Ptia9hSm/WImTi965+gx5N4DIyjjceSkuCzk3tJXAS/Agw3Zs7Z9es/aVEy6e7k
         hvmOpeoMUaKx6+0Hpkf5RRdGU8SHRzFoLZIS8Jfi3qXLOq+bDa9Myueq4JWPhqsaLBPm
         g9EBDIYO0WiRtPl+RJ1HnplfCuyONC6XgD51CIvujbmiDGX4TongTMXk1aLMAA+8W40c
         tYwPlarIR/X0SO7JAZzblzsXuLkqy9u0Y7A+CEoF/NDrCpaOadfVevSYvOU9sAz27sLB
         Zbgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759838305; x=1760443105;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/LCefJSJB1+ypX3Sb+h7MPQdpzfzCeRiHx/LBHLwVq4=;
        b=l8Xc484BVWVsQCRYtL1PYuYyPrJ7iXk5vCWVyAQf/UdVosw6J6NGEQH7DnfEOqLcZf
         vchgbCW9acgo+dOMCzUo3QmMsyN2MXlPBxw6le1OWkCPkFk/lNJU0oB22k9ur+IHspPh
         mcMZ2+SNQMaTSh5p9Ji3m/OAUs3nOyWIp3TDQHctfxMUPIHk5Tl6qjoMwfJAUjZ8HITx
         t4pIygkbKgiSMojG7ZuUqwKiNhwZUe9e1/3Bc/GSPdhwPcjDpI1DZkzz7BleSGoxTdNs
         633bAV3ATPcdM1zrcjuWPkqruDq+n/dsROt6wwZeE1BM+PeUrqlVMQCqbhLoIthZxzXt
         sjjw==
X-Gm-Message-State: AOJu0Ywzg6WbnUlEarR9iREKWPqz0PzaGgfvsMS6q+7ky1tWSZtBmMrn
	bMzIZUZoZQNf4twJSv7IaRH1egsCq+oMfekkgKaO9NrnZlNMr3QO6kW7BubBtneqnuuge2VnZr0
	rSmB5fZxs/AklL10ZDrCwd7GZPoP7+NQ=
X-Gm-Gg: ASbGncvKOsVX8xaiLDTUDKWjBRelf4WNuNg1MaLcMcDfKfIxGjOwCeasnKWPlyub7tE
	co10Zdc1ehzLuXDsPbKhogQBUWsqGJhwASuDUsKlJKmY0LxjD5dflqcRXbFde9Ys7flUAejvlJ7
	DMnpQUHeNLMeVGp2m0vHYJ2tM4qpc4X41QL0tXgFaCj4Md+KjfGDOk4GKZgDExMRXMhQdajCGLh
	r3lROuLmP92EYoxDjNdxoby1rZHW0+q7g==
X-Google-Smtp-Source: AGHT+IFwJYF3xD4zTcOOqIqOOaWTariNHri9p50BnxHJgjKQUTJP4D/lImwMzoitAXDMhFg9bpYSJ8/BH/27hwAa0xM=
X-Received: by 2002:a53:ef87:0:b0:636:dd7:ee49 with SMTP id
 956f58d0204a3-63b9a07b943mr13743424d50.13.1759838305201; Tue, 07 Oct 2025
 04:58:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Murad Sadigov <sdgvmrd@gmail.com>
Date: Tue, 7 Oct 2025 15:58:13 +0400
X-Gm-Features: AS18NWB_yyYRNWS9evJrxnGlrnIIeGU8nnCxFnRBDZKYWNyfd0MsSgaGiJMyL58
Message-ID: <CAEuvNs2b-_Q=dazKjhUwJoZ5XUpjRsf-FrCOTR_j24T+EG-f=g@mail.gmail.com>
Subject: [PATCH] staging: axis-fifo: fix integer overflow in write()
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Fix integer overflow in axis_fifo_write() that allows local users
to bypass buffer validation, potentially causing hardware FIFO
buffer overflow and system denial of service.

The axis_fifo_write() function converts user-controlled size_t 'len'
(64-bit) to unsigned int 'words_to_write' (32-bit) without overflow
checking at line 322:

    words_to_write = len / sizeof(u32);

On 64-bit systems, when len equals 0x400000000 (16 GiB):
  - Division: 0x400000000 / 4 = 0x100000000 (requires 33 bits)
  - Truncation: Result stored in 32-bit variable = 0 (overflow)
  - Validation bypass: if (0 > fifo_depth) evaluates to false
  - Impact: Hardware FIFO overflow, system crash

This allows unprivileged local users with access to /dev/axis_fifo*
to trigger denial of service.

The fix adds overflow check before type conversion to ensure len
does not exceed the maximum safe value (UINT_MAX * sizeof(u32)).

Affected systems include embedded devices using Xilinx FPGA with
AXI-Stream FIFO IP cores.

Signed-off-by: Murad Sadigov <sdgvmrd@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c
b/drivers/staging/axis-fifo/axis-fifo.c
index 1234567890ab..abcdef123456 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -319,6 +319,13 @@ static ssize_t axis_fifo_write(struct file *f,
const char __user *buf,
  return -EINVAL;
  }

+ /* Prevent integer overflow in words calculation */
+ if (len > (size_t)UINT_MAX * sizeof(u32)) {
+ dev_err(fifo->dt_device,
+ "write length %zu exceeds maximum %zu bytes\n",
+ len, (size_t)UINT_MAX * sizeof(u32));
+ return -EINVAL;
+ }
+
  words_to_write = len / sizeof(u32);

  if (!words_to_write) {
-- 
2.34.1
