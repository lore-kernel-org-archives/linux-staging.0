Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01861F8AC8
	for <linux-staging@lists.linux.dev>; Fri, 23 Jan 2026 21:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769203160; cv=none; b=SW19KMM3geE4Uph/EpV6ygCnAJFvdmF+rcWj5hKhlAFlQOKbCf+fEWqv7e73EvtCNpWSrRtkU7s7RFl96uCEInWtiywixIaB/pjJU8/meQ5rDasnev6UJwEWUjlJUm86Xtr9fnnU0dMpK3Jd5ruB64nBzGH5HEoXhjPOjVZUdB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769203160; c=relaxed/simple;
	bh=wChx/5X5lFaS2cXQ7CZQtLOb9E1ql93J1lmnXLlO0UY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tP9awn+jwvZHBL0TqLTK1/N4ZSEK13GvGERvICZLNHgiecl9l97ZtSQlIiU3qi5G/Y0hDdLwlABp9OARc3AATrtFl6qEpy3tI9VScrz3CMNMiZX+R3bdCmaraRHiSn1U5c9RzmliGvEjvKT+ob1QnvvmeKZvKwTyHHXFEbGCCug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nhFV1v9P; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nhFV1v9P"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8230f8f27cfso1077121b3a.0
        for <linux-staging@lists.linux.dev>; Fri, 23 Jan 2026 13:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769203159; x=1769807959; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gLBuSES5NI8CbFVQPEjZVejEqonJ0uEsn1I4FnIuIwQ=;
        b=nhFV1v9PoyiifihxiYUDWJeQ+Zzfl4R0AQY+EjsEFHQR9NbCnMsBMJEtsfSMwOKtkY
         zNJMbipmF6OyGLVtplPZojgYbFELvTKHKb4XYGHQGBZyiHeH1GuJKRkbdLNnMfplNNWP
         gf8jalrYeSJ4Q8bWPX0iLSNQgqxjy990NsB1kuc5M8rIKHLPwHIN/IQxzCVtW6cTxhWt
         DPcEb3F/NQoP1o/g806/M36tj1pzjZOqU3EYmKqE4PSP/yCYXtjdsoVt7FJa9mjbR8uj
         XSuX9nSmH5NeykZl9B6K+Vb+xPx2qYFErHmJGx94sgxjt3gd7xgOY5R4Mg8rUvf3U+xX
         tf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769203159; x=1769807959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLBuSES5NI8CbFVQPEjZVejEqonJ0uEsn1I4FnIuIwQ=;
        b=YNw1M1/Fs6uGgi9NUQqG6z6JQAA/Th8SgAJBGmjEdUcz1Ch0TuP2dEbFA3nDFwXTRh
         ruLfjESIMFE8q3MbZXs8sdOwoxdeh6OHeZ6WgZKrtVWKBhWRfDhQjsLhmcRvJ6BI5nTU
         38tvAARN3Xg8OTL8ndv+OadnSr2BOzANbxhxvD1gMXiA93/i+LeEZePgOuXXlwNT/h96
         u2ytfz9lwFY1DtJUOu31JiLOVLmpseIdvzhShhhpAfuJ4/jwi0437GEOHRSsusR/gpgx
         iHXdgjD21A43o7QzWALcA2gmMyRMXZ3RzGWE/RhVVaGv1PoxmPTS1OMJofZvBs3wYy0S
         f/cQ==
X-Gm-Message-State: AOJu0YwIVsJT7qpFewxM7MqWZFNvy/tPbqBvgBUyWHIdzOaBcXb9WH8i
	v3VHtflnjTY4hvOvbZj2GhByg3oP4Ljgv/4atS+lm2D0A9DCbHGVZRVt
X-Gm-Gg: AZuq6aJoQ8cz/ro7iNmaqrKtCoomPk00SQ4iWCkLfJ5FXzpSSLkKKoCcD0fQlsvu+lp
	hpZxtumiTvYaWjZzHZzX3OHgosSyqooYLzwSg9TJP4gc2zzJOmdoo3OhFZ9qipebgJrtXV4/ajN
	0DiqQ5y8uEhnMOCB0ZUaSy7DHGRY6DJZQze/69foPnlFMi8WXxhHYXX1M82+LIvNqGQGpbGY6h9
	QM4OtxqaKjcyPGoxv0xyKwzUrU+DcQ+FQY++jTLLEWC+mIYRkxtNAcYS03JYWnef+JNbARV4Na6
	QtlKbzpomHlDmKYW/g4XxFryM0VGBETtcz3VIpyxKJoWWYNuKFxv47J+z9gWmyxRPfru9FdcDya
	bfhHN1imvXsHns0P+KAdDQQfHwhrkiBHDJV7DG9XU+2XqeM0L/R6TvAMtbv+ZElOYsNOWiVKyqS
	CAZqZFscakISqFqlJ50v+U52Mm7ObkVmPl
X-Received: by 2002:a05:6a21:a4a:b0:35d:d477:a7f3 with SMTP id adf61e73a8af0-38e6f70c3dfmr3779854637.20.1769203158822;
        Fri, 23 Jan 2026 13:19:18 -0800 (PST)
Received: from tehuang-Alienware-m16-R2.. ([50.47.240.160])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a141fc4sm2779469a12.8.2026.01.23.13.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 13:19:18 -0800 (PST)
From: Michael Huang <tehsiu.huang@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Huang <tehsiu.huang@gmail.com>
Subject: [PATCH v3 0/2] staging: rtl8723bs: cleanup and indentation refactoring
Date: Fri, 23 Jan 2026 13:19:02 -0800
Message-ID: <20260123211904.64589-1-tehsiu.huang@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series improves the code quality and readability of rtw_mlme_ext.c
in the rtl8723bs driver.

The first patch refactors several deeply nested loops and if-statements
by using guard clauses (continue statements). This flattens the logic
and makes the code easier to follow.

The second patch addresses various style issues reported by
checkpatch.pl, including line length exceeding 100 columns,
unnecessary parentheses, and unnecessary braces.

Michael Huang (2):
  staging: rtl8723bs: refactor nested loops to reduce indentation
  staging: rtl8723bs: fix line length and coding style issues

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 142 ++++++++++--------
 1 file changed, 80 insertions(+), 62 deletions(-)

--
2.43.0

