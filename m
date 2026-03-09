Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED43331A4B
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 05:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773035084; cv=none; b=fARy4+Wy1xr/a/4QvlwFL6SQDHetV1B/C/bNH3czcuM1QmW4g9uzGduO4nhhkunf6845zsypkvRSPwFvpCgDjVgFC0Cp2bBEY144NihwW29J4sppR1UScgyaLABqYLxygsYiV6m3TOT74q0EOJQJ4XXb8ZIIuQpVSnrx3tb2zok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773035084; c=relaxed/simple;
	bh=QQwnL4sMMeyKaHBV0XLsYVrEFOjcYI0lZX04Xek3WoU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mwu4rqxtf3qWEzaUbQmCBfStr7KfSjIefVLIM6q7KIRnLDU2m1X76JIJdwLPPH43DY4qsCa9vfHJKcAPzTDRLW0ZXYW8aRPEfEBuYI2cNqofNJxMfO5M8tZ+cfi2iRSy3qfrSIqr8fYeCDSZ3UjfoyYom3UTzVrxPGF4k0QKO6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kv7vjZ93; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kv7vjZ93"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439b873a54bso881428f8f.2
        for <linux-staging@lists.linux.dev>; Sun, 08 Mar 2026 22:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773035081; x=1773639881; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DPOD5J44ep9crihrAXhxkAtkBHXqZ0WyeEwzu4soDlU=;
        b=Kv7vjZ93DPPn6PVs8U5T5cReCsbTxcV+EpnN3R2epiXS+fLhHcy2+Q5zw8Qr2qdq5s
         4nym3mWGToORCxkB+q6drvqT2fRuAYRWtSKdxfD3KtMOOWDzILp/4N/72NzqS7u/f9uL
         m8gRcTc2w5v9HpEK5QEebeN8XJOahuzlpwKz86soegl62qq0kY+darSlr2F4cTpB7yI3
         FY3XfoAsXu7GPM2v7FPY9P2XMsYYTMm6+G9TsUmHBEgy7oBvISVSffSMF9hcATOQ2bIO
         jhuo0vXdkltBKliOBLlOCmTCPhAvAZK4G810h94i6EJ394vQ/ePdh5modwHazuPn0zR0
         qmBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773035081; x=1773639881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DPOD5J44ep9crihrAXhxkAtkBHXqZ0WyeEwzu4soDlU=;
        b=Vjwpwnh/saoR6Kgn77NtJp9PetqsxE/Il2njIGJT+LPnNm+7u8bZL36QdFryV3DMTu
         YzolJpXlEIkMVnjIIHzVqxAwLDI3ZZubYnKwEfB//VBMboaD+ZTUl9dQIGrxPS8gFm2A
         Rpd36C5o29UnLfxtPfF4/iwiiYEistbOGkcdWYLVM/yi7yP8zhwfIJ1FJzOnAZ629PVY
         fGQX115w+VJamOC3XRZcQ3XGKE9UBliwG//Dd2Di/m+F67+d4EbWCZJULeZphFh+nLJE
         CF53uGqlU5xjAqsnUeg4FU3JRLd/VMUqSeu/19E3EhXKwf5WS4O/p2f/ZviTRr5lWpnU
         3Mfg==
X-Gm-Message-State: AOJu0YwyanFV+OeV7U1e4HOAJDXThqhEqXr+IqpazZKEMV5nuLlzZZkX
	zsf6f1bDQ5ngIXvy/rFPRKGbTVeMxPPXKhVlcJfRS7NHHPIXh/4QP4O6
X-Gm-Gg: ATEYQzzLrQdL0AoSXMhBKLxS+/0PPAzrWts0a7Ptsp+3mWjaOmMHgA5SL/xGviy3yIT
	FfUFfWatIYb7/PK09904dEyFvvKYBc3OhsZhmiS14pdL7JmEXQZSGocAeyWWeJ+I5zqiTUXfsnC
	0BsE3oSyFwqGPyBsqmrCYH51+jTgZ0B8UnHpn+NNgclrj3Z4WwHHHBrmYhuXRDHGqTNa7wkXCcA
	K+F38J4ScBsBAT9ZpgHaOzE2opqzWzJGAY5ilYiJnRp/Z3sLiDg1lmpNyBnnwGdJpQDiogJVEXm
	9AUFJsEnhoi6Cfnvj4EGKGlid/MFsce05dYAyyVyKk4+NWqZ4ilhSWsf+5YfddosavMG02Ubcs0
	OPP4botC4R173I0jYkEpU4Mae7kBKaNhing4k83UP0dUoF1IK+QaWIn6s4phzrmsjp2eoV5D+zo
	ubSo73X3FKj1YXSxWXDQRtmPYBer5TGNYX47X1MDHmWPU/prlVep2X9dThwhylPawq0kd5ObMXg
	33mjKr2DeXvIU7TIpNVX8ewXww3/LmPNT1NiSw6x0Sed4fSmdt2
X-Received: by 2002:a05:600c:3b17:b0:47d:6f12:de57 with SMTP id 5b1f17b1804b1-4852695884cmr94253805e9.4.1773035081322;
        Sun, 08 Mar 2026 22:44:41 -0700 (PDT)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4853c784813sm32451285e9.5.2026.03.08.22.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 22:44:40 -0700 (PDT)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH v2] staging: media: atomisp: circbuf: Fix function argument indentation
Date: Mon,  9 Mar 2026 09:44:11 +0400
Message-ID: <20260309054410.10107-2-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Format ia_css_circbuf_increase_size() arguments according to kernel
coding style and keep the line length under 100 columns.

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
v2:
 - Format arguments according to Dan Carpenter's suggestion
 - Keep line length under 100 columns
   
.../staging/media/atomisp/pci/base/circbuf/src/circbuf.c    | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c b/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
index cb34d0b5abb5..be59ebe332c4 100644
--- a/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
+++ b/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
@@ -191,10 +191,8 @@ uint32_t ia_css_circbuf_peek_from_start(ia_css_circbuf_t *cb, int offset)
  * support / fix issue with increasing size for tagger only
  * Please refer to "ia_css_circbuf.h" for details.
  */
-bool ia_css_circbuf_increase_size(
-    ia_css_circbuf_t *cb,
-    unsigned int sz_delta,
-    ia_css_circbuf_elem_t *elems)
+bool ia_css_circbuf_increase_size(ia_css_circbuf_t *cb, unsigned int sz_delta,
+				  ia_css_circbuf_elem_t *elems)
 {
 	u8 curr_size;
 	u8 curr_end;
-- 
2.52.0

