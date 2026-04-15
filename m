Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B6F3C455B
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 08:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776240516; cv=none; b=Afpt/SjrkAOPGn1VlYKKjFfnol2oGp6/nYNMl+cBTpVkIN+3J6eUCmm/t2ONeoAy00qAxvr/uF96X5wAzQ0hfShxkbBET7ilDMc7M4WagiHgr4DhUeuwz04+GmSjpr+W8OhFFazSK1kVdp736hysq+nAmJWgIFdZzrIVuwWOBBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776240516; c=relaxed/simple;
	bh=Y/Ufmv8I6uI0ZK4iqLWg4zoVsyDU/NpPCnNLF3lRh08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GQDUAYtQseAb04RrJw00XDo5MMhaGgxxJ8xKhfbWBJKdY9W8DbsJ8o1NJxXwZtjCyvpDwLFck1T93FENs7HS6tggfSUc3WZoHqHRf5vFph4p4Ob0Yc36olMcYYuuQub8eSDoXrBz17WlXI8friQc83UtxjWsoGPhhmLSQm5Js9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EH+GkpN1; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EH+GkpN1"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9c6680aaf8so1071732366b.3
        for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 01:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776240514; x=1776845314; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZdZTpzbciWGX9V3+t+J5jEvv0BObPRDJMbvo38f+x64=;
        b=EH+GkpN1VifwEKiRG1TE8XyXST504x/UmIGT37qj19uH+Jfp1gEeNE/WaECU/CiWYJ
         ggIK/1Hm7w0OW3bCCEXd9JLKbDtOsMASIaZDQysQPyVb04IFFVfufAuIVSMTeULJ0vQd
         wTFm7f19sc2M9sYimeSk9IvsCUiQ92RreVrt87JStX/+7hK/dIuw+C/69AXNpVgfvicd
         rE9jhJrj+rMU1yaXZt0d3UeCt5wXw4O9HJqAaJGH/lHagefvJTmrth7UcJdh7s1XraZV
         wHygauPEXVAsXgbeaNpBhk/TpCvLuuGCUDv/BNOMGyTxlQODp4BS04FbqwEmrr7+kl46
         WLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776240514; x=1776845314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZdZTpzbciWGX9V3+t+J5jEvv0BObPRDJMbvo38f+x64=;
        b=lMRDdGAJ3PRN78dXVzNbp+gYN/IF/5juPfh1AEyMx2kqZTTK0aLF94JMeHhiKhrbOZ
         rPwyHavi9AUYn32K0K3+VIPFC1uhgANUT749kKUAJ186xi+FkUZr1eI8D5GFR6LFgl1c
         TnskJXmOzXh1oQfC3B1KXNTP6GxSl7Y/DZ6IpRgTtmB3SQa7R6rqRu+utBiAiXnaxiDO
         IFEBnCZrp2Y8HHAKuRUlSbZwrq/AOuydP4FapxwyOjOuW8vQfBHOYdqdqZXaztvbM/V3
         +kdx0B7yQbrPlFoLRCgfCbLiT9qqbJPen0KZfHXVaNm/ZJDxRq0y7M7tSlMoKWphw5UP
         2qVg==
X-Forwarded-Encrypted: i=1; AFNElJ8YSfZAecaW1rZLDIEQ2xOXD3EhtaonrZsG3ROZ9Asqr/ixzwGF7dZlek6HJOX43trfElZRFmHONnmrKSAB@lists.linux.dev
X-Gm-Message-State: AOJu0YyrrIc/v+LBoTHlXnpWpwfPnklbrYkmAKmPpUrxDZifJScxHQ3V
	K5nr4AbLMn/gK20/kHfVaCT5bojGOEFACNdWjj3VZsmPRKBNxsAPnO3zqQfgYeZko3UxVw==
X-Gm-Gg: AeBDieuUoqTXj2TAw80b4NP4Y7WSzTWGnkcPBLJ3KxUZtNDHorxNgcIzRAEBhen44W5
	4WvHmOEWQRFjxBI9PSmbQlDRDz760/pZ12XK/XEXB9aCSKIboRcsmWZpzoyObvoAvYGw6uUfhxt
	wreaFS8NAqprAVgL4bye/Hcwp7LqUHPNoyV7lfSHlv8eJrMoZi2fmYGSJohh66N5ZRjVinntS/Q
	eLtCVIZsPWuppXM7LG7NoNNOaGyNlxk8vJjOEz155NLY/Pi8m0bxQrvBVlnkdVm1tRUxzjavKPG
	XfL4vFSRlQRWaT2LDR00mJpQz3MCqMrxCxVOd78C1MZPjIwLqXXAYVe/J4GN459iQl/vURP5Y+/
	G/1cN3xZSg2ZM2lW05Rj3QJKGVFwQtU0md5BDRCQ1W4g2pZB6mC99YTb9xhLjBu2/8ZvnnBDcNY
	gTQtyFZNlIMQzSiu2l4OklbrJDdtGLigal5IOpGuzNcso1EgqUq6DUb8sMF83agGsI8zP5mJE3g
	YOHO6JNQ0QHc0cp2t2o/2UUQFbJGcYprBt56Bxd5z25aiC9R/ZqIEhx/ZQUkx1CdsiG9BEsMZDz
	5bd1GjAQcwd2LK7p/DGO5vyn1cZHg7SbZlsbDYPpQO6m57af9ZSrwW5Lcy/kbjXaaz7nRtuWf2q
	lY9TPo4XRujMAzDQiCN/i24H57vRHmaDKTcBxiOKb5GjmVxpwkSbhG8fhC+MTRAuxDblRP842ju
	PWIGuRI4S5nA==
X-Received: by 2002:a17:907:3d51:b0:b9b:38d4:2cea with SMTP id a640c23a62f3a-b9d724caa11mr1286568466b.23.1776240513089;
        Wed, 15 Apr 2026 01:08:33 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-a.c.od237066db22328bb-tp.internal (239.185.141.34.bc.googleusercontent.com. [34.141.185.239])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba1773c2013sm29720066b.34.2026.04.15.01.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 01:08:32 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH v4 1/2] iio: frequency: ad9832: remove kernel.h proxy header.
Date: Wed, 15 Apr 2026 08:08:11 +0000
Message-ID: <20260415080812.1284-2-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260415080812.1284-1-joshua.crofts1@gmail.com>
References: <20260415080812.1284-1-joshua.crofts1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove kernel.h proxy header and add bitops.h for
better dependency control and code clarity. Also
removed slab.h and moved asm header below generic
linux headers.

Checked with IWYU.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
Reviewed-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/staging/iio/frequency/ad9832.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index b87ea1781b..fbcfdbd398 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -5,21 +5,19 @@
  * Copyright 2011 Analog Devices Inc.
  */
 
-#include <asm/div64.h>
-
 #include <linux/bitfield.h>
-#include <linux/bits.h>
+#include <linux/bitops.h>
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/err.h>
-#include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/regulator/consumer.h>
-#include <linux/slab.h>
 #include <linux/spi/spi.h>
 #include <linux/sysfs.h>
 #include <linux/unaligned.h>
 
+#include <asm/div64.h>
+
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
 
-- 
2.47.3

