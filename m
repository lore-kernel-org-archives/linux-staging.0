Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE9E430BB5
	for <linux-staging@lists.linux.dev>; Sun,  1 Mar 2026 15:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772380402; cv=none; b=I3Z/ZEWQEH4+FEFHQdIrI1im61Si9WZTt1ayQN6/Kn5b+NkCm5b6m8dGnQLmN2fFdmuIU3F1aaYIjUOkyLr5/YEgK4eXxzzzdQWOjbEi6yxgwrLdawOz0rfVMfZ1d6hbSroprOlKbVOVAW9QLooimaqBgDyqIjLei1FRX09/nWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772380402; c=relaxed/simple;
	bh=CEHM1HCCSw3bJR2+/AIr8+PAYB7wfOj6XpK/ZyaCV4M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p2MPdyAEflLirsqfDHcsM7DQrX5o4pnNqrhRgOF6DdcHQnE5FunhkL5RuWR0D8mpU4fasY7J6tw730I32Oz/wpafoa1RD05ZQSxf7NFbVuLTjdtcCkgbq7zi9tF/jN0vFYpmyHL8QSYguFiWi+wqDjIYUst4JRwomi7fKnueHJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=buu7juhP; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="buu7juhP"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8954c9daaeaso45494976d6.1
        for <linux-staging@lists.linux.dev>; Sun, 01 Mar 2026 07:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772380400; x=1772985200; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h6tizmf64Uf/j3KxnjH3Kk6OH85LMsXWLyWkxC3zoH8=;
        b=buu7juhP7epX0eUdZj3Wzv/3+yYoTaXFG9z5dS2GofKaJC1OiFb5Uik61GrrOk74TF
         fIzwZMK62Pt73MBvfJUAaoKjw/0SZRIIliplgaFUidSR1CPV/6vHAXD+WVuCH6zdMZr+
         0ENJCC6dcdm7xPOACvyMl+0Q5A2bf7R33O+j+hWHXx2DX+urWFayxazf7rZMwExchaFA
         42u3w0B3P13mdJRdhhPE/ZKpuscvJcYdSTwt1m8gkyAap6pzTy5pAO8d8ywovd/TguLf
         KVEQ9sc/I6HWApeSWBTWhp8PGXx44c7uiBfBLsxlsJdSVUGPJJwyXoB8c+EsCcxOMH6g
         3Y3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772380400; x=1772985200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6tizmf64Uf/j3KxnjH3Kk6OH85LMsXWLyWkxC3zoH8=;
        b=fxA3//nEE7QQ26VuWxKrEGGI9tN0zheZ9OTBykhQmRtGK8gAHo8Fn35HjdZSc76brt
         L+Qa0gvt4ayodEJCTnd08ymXYjrZuJGDTbq6JXjdoncAq9vIps7aJ6MVvI8gQ14ozt9U
         wJhOji68X/oS5ujOIj6cesVAMvDGouVQpnkRj3gld3zKPBFEgqs2mF7cXcV2JWV+RPn2
         146fapZx/IGmXV6QYt+mu/9J3xWXkJ48gGIm8kGFO2VmkDNO8E9iiLzJaajen1NCE52x
         A9AJrpfobjgWcW1Vwi20Up0gBi3YtB/viqhfo5PLW7FLx86rBUn5iy4Up9609Adz+ivL
         As1w==
X-Forwarded-Encrypted: i=1; AJvYcCWsdKO6o78GNTbNMIT42jr30tUKz+ScReAF4O2Iu8oMs/IoGQdXwsD4/iG70Dat7vdUqdr1hcu6yOgjYQDb@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/Vf9WDSBYZZ+4joie9UqfbLgLgUTjszIwyJdfsJQ87akpoUPI
	smmHQNSsZ44l6UjmbHFKKt5Uv1ZU1XwUc7GdyngNO29fAIdb5k28MDKJ
X-Gm-Gg: ATEYQzx5LRI4HpFZBZXcNiGn7SiQUk4x4SoQv8ftkZBwbOjsA9hbS6lBRf+z5bUfzHs
	HwN2J61cSys3qT8KFmqawMXyw+wLCTu13qua3IDfhF0Ltrc3lfPsb7fmFWPcUrquOhz+G+wlnKL
	UdJYQZda5Rer4ncw4d3roldtVuEloSRmXwa/oEwRoqqYmL2+4JbnPYldwXaI7aFYdQ2wEfvg3UR
	3ys/JKaBAQKxJYn4CaNfxihdS0+L7j8DASzvhc9MxZClW9A4A8ErWdwKqRM6SO9XAPj/EFXZxe6
	+cFa1DSiNO3/U7ErCpBbEyBYL9VRARYXUB4LMYi/QGTCZMSeC7PMIJ6YWrJ75j9RG1Vbh8SK4By
	M3g1ej5NHrnltTjtHks4WRJddhwHlsQZrxoJpFlFv5F16CxUPMkg8EbrZJjJWAJIP1IcwhJCkkD
	gtmqoZn8oIDX96IbKl0mTRNePxNh2YtyiJitJS2DG5ABg33jrpzLhiHQBafKDT20CQBeqqEiH74
	1jp
X-Received: by 2002:a05:6214:1d02:b0:899:f929:d838 with SMTP id 6a1803df08f44-899f929dc67mr14754606d6.1.1772380399898;
        Sun, 01 Mar 2026 07:53:19 -0800 (PST)
Received: from instance-20260207-1316.vcn12250046.oraclevcn.com ([150.136.248.187])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899efc810e6sm21128516d6.5.2026.03.01.07.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 07:53:19 -0800 (PST)
From: Josh Law <hlcj1234567@gmail.com>
X-Google-Original-From: Josh Law <objecting@objecting.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH 1/4] staging: axis-fifo: fix grammar in Kconfig help text
Date: Sun,  1 Mar 2026 15:53:15 +0000
Message-ID: <20260301155318.2596519-1-objecting@objecting.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use 'an' instead of 'a' before 'AXI' since it begins with a vowel sound.

Signed-off-by: Josh Law <objecting@objecting.org>
---
 drivers/staging/axis-fifo/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/axis-fifo/Kconfig b/drivers/staging/axis-fifo/Kconfig
index f180a8e9f58a..e618f275e283 100644
--- a/drivers/staging/axis-fifo/Kconfig
+++ b/drivers/staging/axis-fifo/Kconfig
@@ -7,6 +7,6 @@ config XIL_AXIS_FIFO
 	depends on OF && HAS_IOMEM
 	help
 	  This adds support for the Xilinx AXI-Stream FIFO IP core driver.
-	  The AXI Streaming FIFO allows memory mapped access to a AXI Streaming
+	  The AXI Streaming FIFO allows memory mapped access to an AXI Streaming
 	  interface. The Xilinx AXI-Stream FIFO IP core can be used to interface
 	  to the AXI Ethernet without the need to use DMA.
-- 
2.43.0

