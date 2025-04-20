Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D7020B814;
	Sun, 20 Apr 2025 17:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745171664; cv=none; b=rIJJTvRXraAvhEAqMnPZcl4+WigxPoAPQZT8VATg54b6T5zz7XnAW0cJxWz7s656ewqt7QqVcSXy5Y7dway3U79aBKmo4mT6JfdLLmY5ggY/mymScArvz88FIZarYmTF92yBwCq12nWDYvziAm1Fkp/m5eXuVjhuN9/2S9ry15s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745171664; c=relaxed/simple;
	bh=G7cQA1vbU7ME82rND+ta8qnI8kBAvliO793si5bKvhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dUquoZ3brQ6FwAiNtiW7/hMYWp2LsNnmKCLofu82gEU4UYzGce0JDV4/+AzIZh5YHauacbzaNr+BIwYReKkRhZ0vyT6/zRXpvMLyBOY5zgeKdi2eltEW+qhZZSKgYxgNoE/lYa2dR34nPPYOk1HDToxpUlBJmu/kS1q20dP/9Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D4AbaOgF; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4AbaOgF"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c5e2fe5f17so298837785a.3;
        Sun, 20 Apr 2025 10:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745171662; x=1745776462; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YwMHB2nUwzNcRVsw3OgexWqiEt8JRdlA5caQ8STPGxo=;
        b=D4AbaOgFicaZW2ZOuEmyK9fnRhNlPtbl3WWIYEHD4goFqUkmXyQMsWvgGUQmU66X/w
         yVM+iwLkNi9yu2fsODrqdnUUfVasOR6cV+RDqNPiDc11s/NlaABOJ9yI4iCNGwHHZVWq
         jgQOOhslTJJtQSbJZkEDQdAdpjKDtvvgmzBsCRmSLaiJs2aXt4AIup2feYLjPymU1mSp
         q2ETBwwdH4MhWMqTEXZu3CBxBHovvJMemHvcIPcQIG8zwLgl6PyenyPEfvMZSq4qw2uA
         Dzsxx0d2n2GoWKc1zwYXeWL+is2zTl9gfnP8dedFkU5yDG5gl+3ECr6ZV/UW+lCpIwwe
         lyKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745171662; x=1745776462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YwMHB2nUwzNcRVsw3OgexWqiEt8JRdlA5caQ8STPGxo=;
        b=ic8vHT/4uw0mKo/8P8IcXlhZB/I51ePPjtwvRZPKhDl3lVjW+qDHqt215vNmAUUm+5
         4UXo/U14g4lnvKWcl6EskjB45+gi8QcF3tx49WlSzC/DhB6kK3zYsa1QEqmRCI1128Sj
         5WJ6h++/FWOXIJqeM1xEF4h1uSiDZaEMRc7KAXSjB6r/C7we62XZRqyUwk0/NSY/jeOG
         uO5R3yUk9cgmGtn9NJ0SWYUPvb4hfM7IPEUhEulFWjgilWZRhhfnRk/Q30XxmzINkEAK
         jE87ErrSS1DeUlh5T5+zsfIg30C6nKr39XmAmqKmy+U69GJj/24NndrfjpevKcl3p6uT
         augw==
X-Forwarded-Encrypted: i=1; AJvYcCU44CPgk3rS6q3ZVv85CLN9e0TnTw09u1qidmMKbduGY/UI1Fw/b4F8CnykR9GE2yLhxMNPD9acloW7uB72NT37mvMgpg==@lists.linux.dev, AJvYcCVPujH1/aKLNOB1eASHD03zHTrHpiQBp+XUH8ObnWP1WjNoLCLNh+EuIkSYFIcJud6aC6oXksUF6tJeLYbGtw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyg6pOB93WOJilatIZaWJcV/IJ/227vQWKkWBqH48DCOWpMUG1T
	3I6x44mdkxibc5uL88a5in9V1UFyqUWlxoT77rblbKcOa9gKPohF4kOuxwb61RA=
X-Gm-Gg: ASbGncu1kf4Aucx3piel8jEi5V559pMWkE8nO5DM6fqKIaBlKqa6oYyYnJ3WzN6Lz4E
	UWEtekW3bT95YnBAg8VA+cYCC36rltOL8cI+Jnn1Y+3KFNf4HRhVBXi/at6tyO12B8lqj1RdC29
	hyfoFCNQNqjbCxpu4e5C/ViarV0nFsEq1Y2z9El59HiJ87C4kQJy+FgWwBAoB3JuX43AdHa1lJ5
	Iotan4naeUNHhjYtC5/a1Qx9GxS/rrBcruUPpNFrj5Ox1B9YD01XRD+xrPj5Z8Aer+UzTSfsoCH
	fGzaPkSRj6/CHU/KyJ+w17AyQ9ACl5cT9DoE1Cc9L0oz35vWlngIA0ZAKdnZaHmQUg==
X-Google-Smtp-Source: AGHT+IFh3Npe3ogkMASCYKQUaCIKFNmK5UDJSRG/Ql7bxSc7zZ6ONLkKYqeskbLzkROXB5vowu1hdQ==
X-Received: by 2002:a05:6214:23cd:b0:6e6:5bd5:f3a8 with SMTP id 6a1803df08f44-6f2c4665531mr123099406d6.29.1745171662125;
        Sun, 20 Apr 2025 10:54:22 -0700 (PDT)
Received: from theriatric.mshome.net ([73.123.232.110])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2b0c1bcsm34801286d6.26.2025.04.20.10.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 10:54:21 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: gregkh@linuxfoundation.org,
	jic23@kernel.org,
	lars@metafoo.de,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Michael.Hennerich@analog.com
Cc: gshahrouzi@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v3 1/3] iio: frequency: Use SLEEP bit instead of RESET to disable output
Date: Sun, 20 Apr 2025 13:54:17 -0400
Message-ID: <20250420175419.889544-2-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250420175419.889544-1-gshahrouzi@gmail.com>
References: <20250420175419.889544-1-gshahrouzi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the AD9832 datasheet (Table 10, D12 description), setting
the RESET bit forces the phase accumulator to zero, which corresponds to
a full-scale DC output, rather than disabling the output signal.

The correct way to disable the output and enter a low-power state is to
set the AD9832_SLEEP bit (Table 10, D13 description), which powers down
the internal DAC current sources and disables internal clocks.

Fixes: ea707584bac1 ("Staging: IIO: DDS: AD9832 / AD9835 driver")
Cc: stable@vger.kernel.org
Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
 drivers/staging/iio/frequency/ad9832.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index db42810c7664b..0872ff4ec4896 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -232,7 +232,7 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
 			st->ctrl_src &= ~(AD9832_RESET | AD9832_SLEEP |
 					AD9832_CLR);
 		else
-			st->ctrl_src |= AD9832_RESET;
+			st->ctrl_src |= AD9832_SLEEP;
 
 		st->data = cpu_to_be16((AD9832_CMD_SLEEPRESCLR << CMD_SHIFT) |
 					st->ctrl_src);
-- 
2.43.0

