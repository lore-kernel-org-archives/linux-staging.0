Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E922978F2E
	for <linux-staging@lists.linux.dev>; Fri,  5 Dec 2025 02:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764900862; cv=none; b=UGXmw4zYdMQvab6lZFDvqMUqVcJ6nVAx145Bux/9gmh7lKnMYvK+/KUpA/egsFeT44Tsg5geDLt3SqGj6TOmsUOako8kz77X+3hC7QvYeXJ4VaWghp2cimZSzK9l22cQNHQHibH0DYLT7BuIFQGKWkI+gh16XiPZKgWtVbMOYDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764900862; c=relaxed/simple;
	bh=MtL5ai83fZS44NIc05q1gOJt5gZmz3uUt9YGn0wq1NE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uPRLst+ahwruj9AlTkLaazNyScPuzh2b+RKKqPYP3bPF/uscOAyTIMj0xcWv4kKxTN+Mq03NBz/9XQ5RHwWvNNnTNyctIQ7tlGkc+XhxtiBVqyYgFpVo7o52R37S3M+UPXgDEykeBEmaCnsKS5BI3WUvHxnq9eKXtz9J9RiyRHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1iKGQez; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1iKGQez"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8b2f2c5ec36so167167685a.1
        for <linux-staging@lists.linux.dev>; Thu, 04 Dec 2025 18:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764900860; x=1765505660; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xi6dvPRZr1Reb1B8d+Gm7VQBYX2ePwevW0dzS3qybXM=;
        b=Q1iKGQezbCPb57xWWz+WIGL9KeHGa4sPjiNWrKYW8CxUe16q/peaOOVGiK1640pWw0
         JBEnmhRWqfSjeX/W+CIvzwXH0bbG+6YqAmU587jgq90yVkGCKm2EykxsRZgty9NSPZLd
         bn4baOoswwJbSHP59Y+jqm3heoccUs7BJUaCdi3bv7TWLuz1I0uOxY5DamnBvqh2q2yV
         o3VpcII5hSFZlmvrfs87/8Q+El3R4x1x3ndiEtV1hwXn5fU6OMHH8wCc+aDGI4f7qayK
         YmpmFG5vc+FoQHCTS6rFy69eNYZqGR4YJ/ymNHzmUS0FmQETOfK4GlIG86TMsOmHABzd
         N9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764900860; x=1765505660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xi6dvPRZr1Reb1B8d+Gm7VQBYX2ePwevW0dzS3qybXM=;
        b=lxHQhSqo5NLA15HFifMjbnJ5B8zXSDVvmfXyz11+aY7LHIX6rcfD0BV70CXVX+Y5kQ
         +9DMLqT4duJC6/pkpIRYQP/CVvTgvy2ho0IU6DE/qRMxeLMN1JtpW0AbF6UtoRSTMdIk
         4Uyd+bJb/SCG+HqdmXntRx+M0pE9DFpWF/XeIMNHdQOZMYo6ogfglAUH4D0/SqDN3ExH
         CSinccznyhCdCaJZNU2/2RSU1begNCWWRxiR5E+t2bwiINpWU23d5QjorNvU9uhBdF8g
         gfrrNRCRAAaUhZGeTa7dBgsfn3R29IIRv74UaWgRsyLifJxzqe3YdNEHPp7OsEx5Ahsm
         QzkA==
X-Forwarded-Encrypted: i=1; AJvYcCXYJT260ZiddXPrJH1FUCYv7hLOe07oUHsMiwLA5cXTnD4eAbv747OkGVq7K44RqAzNXOSQe5ZjsprtcJOR@lists.linux.dev
X-Gm-Message-State: AOJu0YzoT/jc4kj0mPkaMPkjgfHhgSSqt98P9i/gz1e3LcKu9gqgetGn
	1mPNoJ04iUg+RioKnEYTq/6b3LAvqKhrq0EWg39Oss7jEcN27GCG417o
X-Gm-Gg: ASbGncvFgBRZBfbs6vZw2koKIt1q7kC2+ofwGqwV0UuCP7N+ro2eDT7sCVXSs2yrWtl
	8iAjMFraax+k8hhdSuKoZcDkZgRBj5ViPVX0OAGKfofsuL59bFqcl63Wl3I5/cv/+i0uv3zUpV8
	KYAamPEaV1qwlarAxvKnlA38uCOth04ktFtOuTxRJCaT2wxe/EruRgZeRxZOiYAyFE+2wzBHftn
	xQPrPX2c0omkQmYx3SMjgiQBiz1v8FaTV2vaZRR3y2TaTWElujkAi/T2abwAJ4cU41nJkqZZgZg
	tKMZrx+5/Qj2FhQygoNMy3ykoZabB3sHUWahnmFKoi7Upa3bfY6F9trm0/Bqqvg7m9rSgE7oU2h
	mGYIaxOA129gX8JNS4efsTjhcWIJR3qoOlL7pp7+Q3QrCDCTbZRX6v/j8qgB0on47m6nOLCGuSD
	qByLOdXa2hQQgznbz4vohDR2XkqHfm8JAdaP7yM8zS1so=
X-Google-Smtp-Source: AGHT+IF3ep9nFOJuZs4iIWMYuTerRkgO5WM2PRiGUJg3KeJ/rSZnh0PxCbjcYLxI6JEbaC0xkgsVKw==
X-Received: by 2002:a05:620a:280b:b0:8b2:7777:f662 with SMTP id af79cd13be357-8b5e6f7cd44mr1282523285a.64.1764900859802;
        Thu, 04 Dec 2025 18:14:19 -0800 (PST)
Received: from kernel-internship-machine.. ([143.110.209.46])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88827f51ab8sm23661356d6.21.2025.12.04.18.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 18:14:19 -0800 (PST)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	hansg@kernel.org,
	tglx@linutronix.de,
	abrahamadeakunle50@gmail.com,
	mingo@kernel.org,
	dizhouweng@kylinos.cn,
	ninoxzhang001@gmail.com,
	dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH 0/2] staging: rtl8723bs: comment and style cleanups
Date: Fri,  5 Dec 2025 02:14:15 +0000
Message-Id: <20251205021417.2705864-1-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This small series does some minor cleanups in rtw_mlme.c for the
rtl8723bs staging driver:

  - Patch 1 removes trailing whitespace in a multi-line comment.
  - Patch 2 fixes spacing around operators as reported by checkpatch.pl.

These are purely code-style changes and should be NFC.

Best
Vivek

Vivek BalachandharTN (2):
  staging: rtl8723bs: remove trailing whitespace in comment
  staging: rtl8723bs: fix spacing around operators

 drivers/staging/rtl8723bs/core/rtw_mlme.c | 74 +++++++++++------------
 1 file changed, 37 insertions(+), 37 deletions(-)

-- 
2.34.1

