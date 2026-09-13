Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA52343889
	for <linux-staging@lists.linux.dev>; Sun, 13 Sep 2026 04:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789272121; cv=none; b=mFzTxi9fdKzasrFknW8M2CabeistKU9+SrUcWYHxrL4sHngEaPOYCcldFXkCzTrQywvJ9gnM1CwkVU5uW5O3z3Eq9tnUIvR4l73MyCWLvFKBygtQ5xiWqYSST+BrQ+igS0mwMtrCGtkaT7iI7kqtMT+k4HnZZBsq6aHVhq7ZrCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789272121; c=relaxed/simple;
	bh=qOU4mOdJZExzY66rPx/p4PHpUpxs+QTxG3UNNWTlklo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NGh8qswmvlqaLXpjM3OMa39wlMVtEzdhL2Wh4PYuIBQTaDKXqtqaLAvL6L1TZk3qK3JbkTyHET8oTDAafiK0Tm4REPLUirSuylF2INzouFkO2W/fmMqYq8K3xvkxVt/joTOppuPoyxdBFdSFk+CP5Qer0tH7ERZfG+AuZ06kwaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jS00sq2J; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jS00sq2J"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469e211a0so797446b3a.1
        for <linux-staging@lists.linux.dev>; Sat, 12 Sep 2026 21:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272120; x=1789876920; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IUaIWeESj5beJuigMXgXrhS+tGPcUhdzld8fSkS1OKQ=;
        b=jS00sq2J2l0c34tUa0ZYAVRKS1gJBAQOTG7h/0UKRoALrCPE52prQlch5eH/0RpeXt
         htoLUhyEt45mKd7z0nqe/4VzpVhq2j42rbojh+tW3m/3bP8XoTBFab+wUVeHIu5veens
         J55L0GWnvbhU1rbyxm/ygj50qye3rDx6vaISV2uhkyD6+CGUXcJkX3ss8RWiI1Cija7b
         wxaDvkMzBqbv9P/ng1fIrij/eCXkuLxxK3TpnVp7YRfv1DEfwTUYE53UQVgFSOA37l4/
         Q5ftLkaVi34sT6/DzJJogRfhxied5s6AYiZYphF/Tyi/docPW2z6pCqUzVrwRmka/G6t
         //mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272120; x=1789876920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IUaIWeESj5beJuigMXgXrhS+tGPcUhdzld8fSkS1OKQ=;
        b=X7Qex5JgZOqveuLpUpvT2Zs5MQnxlsne5Jgv3hUse8uhCGLfC33KM0S0qVub8uPUfE
         Fqy1I4UaMPHdBNCpSAZvJUcbtCRitrMXC68pjj82SuEsIohhk+I/I+Jm+A6pYXOT0Roh
         8240QON6V86WjlXj3Ludz75nboJYNj0nA7w8v8KTlrP6xByff0CkUFH1Z5/yplBqMUfu
         lUqs3rMY9sjJ2EyRDRMPSSUh3sG3IWJC7+mRe8wTWM+csbXOrxGmFjx4s5z2kSyQl5B3
         7O7/bzp5iaCHrpuiuxNCljy9jy8HeQjrqYEcJzjl69+PHtD/DBAp/vs9zqJ/WH8TphE0
         8Bxw==
X-Forwarded-Encrypted: i=1; AKwUvBxsnxqQFLpzgWD8iyn/mNp/7p/k2xHhX4z2+Bi/caFJF6XJtiyT3oY7YlfkFcuqSS4JjdX33kQiTdIwaD6G@lists.linux.dev
X-Gm-Message-State: AFuF++knVpbnYav0dGuUL0k/2wdVNj+hkeK//0pAEFc3tfjzHGQXzm+t
	0cwiMwty8rifeex5uQ0jEKmTbgg+UwF66GY4ap3Q0h26Sgg/ZzZ9fWFY
X-Gm-Gg: AYBFou3USWcCGGIE0GqZseD5rKWBVBm9N53RtzLE0poLqQnZ3kSvLvqTlgsOdfUJcYj
	5+wNXsuoI5Jr064jq6PakiTgTEOGgYmDE0hr/dtZNqY1Dvv9zF1fnr4PSknnHnZbrfy/j+azHgm
	N+1Sj4WKnMnJMljBaKrZJbbxaHZsN1NZsP0WtGCNXi7JzHq1xVM8uphJLSnjWQeeo3yA157gZwC
	WeazOnCCgM7++GwYv/JZjkdkwu29FhiG29zHl/0DnjyADouxrW2XUKRGPJclOwfd1PhWu8V8M9w
	L4BvGPqMPTjOfa+wOdoCOgqM6X8ggNaUfG6jW/TpdP05jemuyix/pTJe8bz1PESW3XqOlpwHV75
	H34NmU0StMobFK5uaOvbUE//0yjw/anHo2fbopjm6WXfUbjC2d+MZojnn9Y0fg0leS4l9ubd/qq
	sJDE0i/R90g2E01w2pJnhnhxDmVUKVaIg4yWWVZLkbVkHRSx9MCQ3IVQI6kzFeEa7Ea+i6gOlGw
	9b/KlbCA5v8iancxl9NoyxwV4krW2lrGsAgtFmHJmXSD4yRFtamj6GiEfBdOPDxPmxGwqJatWFr
	aCir5f9tKDnHsGqmbAS23ZGPaWOfpSRHg33OA9DNR/ZuEcvNiA==
X-Received: by 2002:a05:6a00:3d01:b0:85c:2d83:bbf1 with SMTP id d2e1a72fcca58-86ccb44e113mr8738679b3a.20.1789272119714;
        Sat, 12 Sep 2026 21:01:59 -0700 (PDT)
Received: from localhost.localdomain (c-67-170-60-64.hsd1.wa.comcast.net. [67.170.60.64])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c659b9a3sm2957890a12.29.2026.09.12.21.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:01:59 -0700 (PDT)
From: Gabriel Changamire <gaberashawn@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gabriel Changamire <gaberashawn@gmail.com>
Subject: [PATCH 1/2] staging: sm750fb: clean up sm750_hw_imageblit() kernel-doc comment
Date: Sun, 13 Sep 2026 04:01:39 +0000
Message-ID: <20260913040140.4517-1-gaberashawn@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The @start_bit description contains a stray ">-----" artifact -- a
literal copy of an editor tab marker -- that leaves the continuation
line "0 to 7" garbled. The @fg_color and @bg_color descriptions are
also missing their closing parentheses.

Replace the artifact with a plain indented continuation line and close
the parentheses. Comment change only; no functional change.

Signed-off-by: Gabriel Changamire <gaberashawn@gmail.com>
---
 drivers/staging/sm750fb/sm750_accel.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.h b/drivers/staging/sm750fb/sm750_accel.h
index 6db54c6526dc..a0fda56d955e 100644
--- a/drivers/staging/sm750fb/sm750_accel.h
+++ b/drivers/staging/sm750fb/sm750_accel.h
@@ -223,7 +223,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
  * @accel: Acceleration device data
  * @src_buf: pointer to start of source buffer in system memory
  * @start_bit: Mono data can start at any bit in a byte, this value should be
- *>-----      0 to 7
+ *             0 to 7
  * @dest_base: Address of destination: offset in frame buffer
  * @dest_pitch: Pitch value of destination surface in BYTE
  * @byte_per_pixel: Color depth of destination surface
@@ -231,8 +231,8 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
  * @dy: Starting y coordinate of destination surface
  * @width: width of rectangle in pixel value
  * @height: height of rectangle in pixel value
- * @fg_color: Foreground color (corresponding to a 1 in the monochrome data
- * @bg_color: Background color (corresponding to a 0 in the monochrome data
+ * @fg_color: Foreground color (corresponding to a 1 in the monochrome data)
+ * @bg_color: Background color (corresponding to a 0 in the monochrome data)
  * @rop2: ROP value
  */
 int sm750_hw_imageblit(struct lynx_accel *accel, const char *src_buf,
-- 
2.47.3

