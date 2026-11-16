Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812270;
	b=a2IrwC2Uo9HCZsfQ4kP9vW9Pm82q3nhjsiB0uZ2l382F6vxGhKvKotJzIFKABOoK0Hmp
	 krU9V5Hw8gcJN+Rr0SLHSHWyueqnYfTXrV3ZRI8EpXbjOIG2I2ue8O4FCDffGgyUUumrC
	 2Y1O/tKErzCX67a9+W8zl1T3imIorLVCzUdPmfh89k5NvjB34umG+UOW0mWxSIaO6bwUq
	 vWnp2Je6qiiY/4Q/3eMY9rBXwS3ZX5Spo2c53CbNgfaG48LI92zBr4aTjHnQnGfeeegNo
	 7oNTlJwS3Vw9gReULc29cPduKSWyhzF2MbcMUkrOLMFQ4efzfF/uQYQihEmUSy8ynQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Xi77D0DVU5EqgHzkXh9cbyHVlos1O2la4EdJ9QT/wME=;
	b=SPdEZHdyvOenlnmhwPlqL3XSVlAu7QxSvADuAIHMbjQe42Ab8ncay7prx/jt9q44hmdV
	 FOEjfviXYNnJpLqYJyhTYOnRxJcf7xDeD11HR2fGDupFIVglTHbctuJnvQyRNQ5VOFVQ4
	 ekOOMKX14MjYTrXvvZQcAwK2q7pIKUR5p3eYAKBDJ7M8h+anbN+xYYcSeIxDD41oeyrMV
	 bCIWD/EmniZErvN1mSxQ3LavzS3OfICTzzSAXzxBwvESWOWJdpCNBZU7QE4DKTuIUZqmh
	 5W/Mx0MMryA1k0dzz8LEpYKqHdLKrV/f5MD5Zk5uoAqDZCTdCm8ymaNZEgvvDetZRHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZJTtWGV9;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B17C606A31C
	for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 06:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B17C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZJTtWGV9
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso1619887a12.0
        for <linux-staging@lists.linux.dev>; Sun, 15 Nov 2026 22:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794812269; x=1795417069; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xi77D0DVU5EqgHzkXh9cbyHVlos1O2la4EdJ9QT/wME=;
        b=ZJTtWGV99dsfs7U4etzgOZtZnTAepMYIfAGl8I7bB+hgz1qHAWC3EDUjbHm1rypLwR
         eoClnrV8P3EhqzOG+AVnw7BPF+mk9fVZO9Bye6s1crEM3urNB+QnKqXqF44+NpSQZcmC
         sh7JcJqX5mHV499jnkzTPnEvMxvwrroH1R46p4ap2XgaePRH60vKczO4LsBihhQ9zarW
         vge5iiz4VN5B/FJWYMi8ejmQ7pIxEkQNUy+COcbIBfqt0VjSYeYdC2ZLuLxwlx9mKZnD
         ZA5lJooKhNzUlWmanvOcJuKLTbflRXoraqrRIRF8Eb6Dyvp1fbwbZAWYmYZvN0Q2fMkm
         0zNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794812269; x=1795417069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xi77D0DVU5EqgHzkXh9cbyHVlos1O2la4EdJ9QT/wME=;
        b=rUbbL9nhRGpkRa18Q9qFQTudJ/ykCScGQH4xWMoopkSGutCu6H2TcFEdi6wpQlQseY
         zeS9ffQmVCRjBPLEwjiDGctqWzWNn7wcJKYgNRcw5x15vrRzj4u6joOyrQ5VpmzJKQll
         S6HdutAnZ8CN0NqtHWUdgCd7MKePN02UXdTQyoSC9cwweusNSFgoihgvYQeYK6BuRRtS
         X74lq2G/4t6mdPTYYu9Qc3h82aOmAis9m7KNeB+nAgj1vFx+ViKe9Hj2YhzpFggVxLeQ
         t2dSpd+kuQ0bdjodOc/TD5XVVULDadUTfQaCEF+7jWPVabTjrl5D/ft9lwV1r9Dv/Qzx
         bl4Q==
X-Forwarded-Encrypted: i=1; AL+hErFHaoC7rztluFGXgMzpDtO/aCS878C4BViRmj4xKehf1/e/TVY5u20MfgjtfLhUCiXW9Sf/qFaJBytblI7b@lists.linux.dev
X-Gm-Message-State: APuU4Z9cSb6IDSYFKHwtjKk4Zb+AbI+tOaxqMpcDSXbMzE7hUiIYXUPg
	XLjTwheCvhAx3icDzLY6XawhePmk/0CDxTEfDT7HyWz8N2z5kZZbd01L
X-Gm-Gg: AZFdTZflWBXMvznIKVeFxqKcsUjPJUMm723SUpxlwLlZiKambGJ6+xC8g0m655FAjCq
	HU+TPTHl7YFYqR5obnOxiOZGZoAQW2pWNp5x+vLfuhkOsu61ehBozEuv6ivl/GUn8sUpiPwREMn
	a5FmL9KEzkpZeLMjA7awvBo9ElUTd4h0v6bnGavpxFeYWH7M8t3fNKQ8uNjyx9I6TQogL0R2IDJ
	Tx9JX+EOR80lxRqGxqAkVpKLApdkLVU6HjSK8QSqL0vtixCL6zQbg1JsJKIFgDu/d9b+ne+Awd/
	HLrIM96Tdhdr0tVFlz7U8PR5cLLs80U2Ceih+WjhIMHQr60+D3fOqfSiVcOGiAL9FZZ5GE4xzeg
	3KRBSIMPwDB2qmtsQ+qAQKU9hivtsfB1Zv91bxGd164VV2FEKHoBirM0EvS1eeYwew/zxe4hqVT
	WAsordrWmvemmqBOy1aCE3emWi3K8vdhCHQFadVub29GmLK4Kx4/+uc3EzaIuY2D0b9gZQIx5YF
	JvZdfs/bROlPjlblW6kCSrB8jfJkxB0VsiYcOje6rp0OYiTmIEEDUnN6qPfnzxvPPn7Ub5oquh8
	08C5ofiPh+MIY6QhCha1QsOuCevXW0zRwKEAsn/OF9i3jMXZxf66FlKlwhLoS68tRl8WUg==
X-Received: by 2002:a17:90b:4ec5:b0:3ad:b86d:dbad with SMTP id 98e67ed59e1d1-3b1b0a0dd02mr8290448a91.30.1794812269453;
        Sun, 15 Nov 2026 22:57:49 -0800 (PST)
Received: from lenoq.localdomain ([49.43.112.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec66f4csm15684846a91.14.2026.11.15.22.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:57:48 -0800 (PST)
From: Priyanshu Singh <singhpriyanshu9838@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	=?UTF-8?q?Oscar=20Alejandro=20S=C3=A1nchez=20Lucero?= <aleszlucero@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Priyanshu Singh <singhpriyanshu9838@gmail.com>
Subject: [PATCH v3] staging: octeon: fix asymmetric output buffer pool accounting
Date: Mon, 16 Nov 2026 06:57:30 +0000
Message-ID: <20261116065730.472784-1-singhpriyanshu9838@gmail.com>
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

In cvm_oct_configure_common_hw(), when CVMX_FPA_OUTPUT_BUFFER_POOL differs
from CVMX_FPA_PACKET_POOL, 1024 output buffers are allocated and added to
the hardware Free Pool Allocator (FPA) pool. However, in cvm_oct_probe()
(err_tx:) and in cvm_oct_remove(), cvm_oct_mem_empty_fpa() is called with
128 instead of 1024 as the expected buffer count.

This asymmetric accounting causes cvm_oct_free_hw_memory() to report a
false warning ("Freeing of pool 2 had too many buffers (-896)") upon
draining the pool.

Define CVM_OCT_NUM_OUTPUT_BUFFERS in ethernet-defines.h and use this
constant across cvm_oct_configure_common_hw(),
cvm_oct_probe(), and cvm_oct_remove() to ensure symmetric allocation
and deallocation.

This was found via manual code inspection and is compile-tested only.

Fixes: d5f9bc7360fc ("STAGING: Octeon: Increase output command buffers")
Fixes: 4bcc688a11da ("staging: octeon: handle rx/tx initialization failures in probe")
Signed-off-by: Priyanshu Singh <singhpriyanshu9838@gmail.com>
---
v2 -> v3:
- Add Fixes tag.

v1 -> v2:
- Make it clear in commit message that this was found via code inspection
  and is compile-tested only.
- Fix missing space typo in commit message.

 drivers/staging/octeon/ethernet-defines.h | 2 ++
 drivers/staging/octeon/ethernet.c         | 9 ++++++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-defines.h b/drivers/staging/octeon/ethernet-defines.h
index c060374a3da2..3ce7c125ccfd 100644
--- a/drivers/staging/octeon/ethernet-defines.h
+++ b/drivers/staging/octeon/ethernet-defines.h
@@ -37,4 +37,6 @@
 
 #define TOTAL_NUMBER_OF_PORTS		(CVMX_PIP_NUM_INPUT_PORTS + 1)
 
+#define CVM_OCT_NUM_OUTPUT_BUFFERS	1024
+
 #endif /* __ETHERNET_DEFINES_H__ */
diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index dea5696a6642..e0e6d40602f0 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -162,7 +162,8 @@ static void cvm_oct_configure_common_hw(struct platform_device *pdev)
 			     num_packet_buffers);
 	if (CVMX_FPA_OUTPUT_BUFFER_POOL != CVMX_FPA_PACKET_POOL)
 		cvm_oct_mem_fill_fpa(pdev, CVMX_FPA_OUTPUT_BUFFER_POOL,
-				     CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE, 1024);
+				     CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE,
+				     CVM_OCT_NUM_OUTPUT_BUFFERS);
 
 #ifdef __LITTLE_ENDIAN
 	{
@@ -974,7 +975,8 @@ static int cvm_oct_probe(struct platform_device *pdev)
 			      num_packet_buffers);
 	if (CVMX_FPA_OUTPUT_BUFFER_POOL != CVMX_FPA_PACKET_POOL)
 		cvm_oct_mem_empty_fpa(pdev, CVMX_FPA_OUTPUT_BUFFER_POOL,
-				      CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE, 128);
+				      CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE,
+				      CVM_OCT_NUM_OUTPUT_BUFFERS);
 
 	return ret;
 }
@@ -1009,7 +1011,8 @@ static void cvm_oct_remove(struct platform_device *pdev)
 			      num_packet_buffers);
 	if (CVMX_FPA_OUTPUT_BUFFER_POOL != CVMX_FPA_PACKET_POOL)
 		cvm_oct_mem_empty_fpa(pdev, CVMX_FPA_OUTPUT_BUFFER_POOL,
-				      CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE, 128);
+				      CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE,
+				      CVM_OCT_NUM_OUTPUT_BUFFERS);
 }
 
 static const struct of_device_id cvm_oct_match[] = {
-- 
2.53.0

