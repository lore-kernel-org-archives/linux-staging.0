Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107B827A909
	for <linux-staging@lists.linux.dev>; Thu, 21 Aug 2025 07:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755759701; cv=none; b=ijprxAA948xqcSwaHCzxeLQVuWY9DIml9VVy2JRiCXqqoYv7IGQimMVdz8LIdQzG4QdjkCURkNMOYLDyMlB3BjxsovCkr9xH4mHIo4W4emehGuMwq+RtgjB2hkwFj0qO969KdGyQdPWTPLOwihNDJxI7hsNaUamMBfrjHye3o84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755759701; c=relaxed/simple;
	bh=M7Bib/JdBebS40o0jrtpXS8iLuYAPBh94mqbSc28ZVA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=h6W8YDgFFwCQ9Vt1uTC1o8UhK3674GvE2OE+lYI2+2DxLScS4WHgpthC/xM2/0qktLqvnP9ooJKucJSB6+ZFKhvk5LDO98rIGZ5EgPlMXeyWzME7MWzQK1P84QQ2DhiL+oFkU/iD12Hror4GLQxBcT8kLQaYB2PWgmhvNZDKiko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Py64/XpE; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Py64/XpE"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-45a1b0caae1so3336315e9.3
        for <linux-staging@lists.linux.dev>; Thu, 21 Aug 2025 00:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755759698; x=1756364498; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PcGKTRnVn7a8V2x6X2YOKx93dEJmZrO+ztyFPSTimuc=;
        b=Py64/XpEwNcgYiarKCmrzBOxi87yQLUjuXhuQkGvQ8lSY8xEZYqVlzl1kd0qcwbEHU
         U9Qch6uklx1XQZzngZfOvIraZGfb9aA6w8Xj5fEu6uPnCxVYhghR8d8Ny1XVQ0BNz30d
         wDa7YpUAbHYlIyaslaNaO5w1vTAJTJ1zwZrxpccliG8FFK2aAz4wXqgDdBS4KTCTCltU
         F3jkA9C5P9TnIrSIgyHFIcNpAac5AH7xVezMO5V/G7n3n61l74Q8s1yFJFAJA5vTnut8
         cik48RX+s2TCGxko7mH0IvIopzrncFdJdf3cwTTSndkw+kkuTD6CxJxxNSjAJVlGcffv
         lFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755759698; x=1756364498;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PcGKTRnVn7a8V2x6X2YOKx93dEJmZrO+ztyFPSTimuc=;
        b=moyBSnBlzl81W5kwD2aBcUxJG5haLN18WnB61ruQWIqUEJ0cEwUqqLy29zGgEevasx
         QxFJfhBCESV51KC/ih1As2tViHJ39CoctV/YGgxQoZJdBb88zIHxb1Lxd0eBMN+O/iqL
         xjMWiABqLLt0cU4nogFr9V8yy6NpL9xDNwtMT7+3OFho3U+a9LlF1G3nHStWaBXfMWFF
         CM8llpMXaPiqluMYf/kwLyvdouLSJ3xE+Bi/7ITY+fWS4VacvLZpvS7dAQcR3lN92Cq2
         BPrx/YGKXtdytNNV3tJqnMhRbkpqu5rtjAw4f2hvhLReOUR9iRSj4fEKFVy2Y7b5mJsF
         oUYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZnxdsgPcHy9fh09Ukib6zMXKCEDk7DJiMIOfzLGenu11Krh9KwDiUDU6LiNzIRNCV9rbwnh2ndlzwc3kd@lists.linux.dev
X-Gm-Message-State: AOJu0YzDykFdkQ2Kqtk0w8UO38taq9t7+Ij7HNVdkYDr7hBpWMqmop4p
	sLbemLcv4uxr295i9f43dKMXSCvK4n/7+7ztWTH8XQaRC17j8b6BAw2HbYvJvJSJ4QUehykaCSj
	8piFRuXslPw==
X-Google-Smtp-Source: AGHT+IEvKA1t2VWCcec4SBBub/I6NGaabcJJj+3ewD0kETAjlRi67Ua4kezlEOhJEmMUX/fPtb3Na0Ihfzre
X-Received: from wmbdw4.prod.google.com ([2002:a05:600c:6384:b0:459:dcf5:1b54])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3ba7:b0:456:1b93:76b
 with SMTP id 5b1f17b1804b1-45b4e4f5815mr5734895e9.4.1755759698355; Thu, 21
 Aug 2025 00:01:38 -0700 (PDT)
Date: Thu, 21 Aug 2025 07:01:30 +0000
In-Reply-To: <20250821070130.2581766-1-abarnas@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250821070130.2581766-1-abarnas@google.com>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Message-ID: <20250821070130.2581766-3-abarnas@google.com>
Subject: [PATCH v2 3/3] staging: media: atomisp: Remove return from end of
 void function in gdc.c
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Cc: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fix checkpatch.pl warning on useless return on the end of the void function

Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc=
.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
index bd44410729bb4..0906f1d1051b7 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
@@ -43,7 +43,6 @@ void gdc_lut_store(const gdc_ID_t ID, const int data[4][H=
RT_GDC_N])
 		gdc_reg_store(ID, lut_offset++, word_0);
 		gdc_reg_store(ID, lut_offset++, word_1);
 	}
-	return;
 }
=20
 /*
--=20
2.51.0.rc2.233.g662b1ed5c5-goog

