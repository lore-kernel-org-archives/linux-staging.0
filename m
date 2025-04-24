Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB66F224B1E;
	Thu, 24 Apr 2025 22:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745534087; cv=none; b=C4gS0wA8biRIq7wi43DZbGWe0ksd2HEQNxBRwuQL6mfGb+Bb8CbOxpRop+CUwKqAGQkteuPcocEERi5FyOkc+C7GA63zUO23w2AG80XMxdbt8TshU2wG/UDmfWojLG8lWML967EFxcMquwZQwtD8GjLJcRNkZc/X+JM7hILAUJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745534087; c=relaxed/simple;
	bh=SMPrGfr8bTytlLMThME5gZ5a9KglEcvzpXeHtz7Oluc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s3ca4SFyrMopijwN6vkkQOkl3p/T0Jxl3uucRiFyaMK0eh2TpiTesTBH+EiIq42BMvvN8SVvksvBpIqytrX3NGNVLldhYUfst+dM9B43o/gJADxwwveaOkVdM+0y0a05g5Fp6iezYokBi5ilPovgf+whra+w6zqjjnNc99rW1yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lq8c6U8P; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lq8c6U8P"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c597760323so179169285a.3;
        Thu, 24 Apr 2025 15:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745534084; x=1746138884; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NmKYu+cBYor5ouArn8J8SGEMb8V+WtQZCe4d7Eom8vw=;
        b=lq8c6U8PavtH+Ci//eLyc0sJbfib+5XjCcitZp813clgT3CGKAv2lRh+VcQuJf3dMn
         giWJsUU0QjRbH4EhVbpfEW8hs6WXPWDtbEW4BZ3dOEX9hLQTYoQgkJhBaah19ffm7heL
         SUWEIdog0cQhLIHVnQ/4Ca5uiLKLvzEuc/VMW059d1+Ul/CPeyCQdYe7mYErEvgdqz6f
         HzyeqC9x+ZNReK59TjUddDuSJVDIO9dxKrrB3fEYzF16sTLTCLzpr2XLSUSK6hxZSw8r
         u2tIrbSjHU8yxLidnmN5DMpawfMHgJ5xwDXn/+NKKJijAmr1b/zMG9bNiQuR4zOEMKTn
         YtfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745534084; x=1746138884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NmKYu+cBYor5ouArn8J8SGEMb8V+WtQZCe4d7Eom8vw=;
        b=N4xU8fyK6YY8uF+Ep97XEn5nuD05fi9hmEIJRQdfeOcaMKDBR62be1pJikD3CKhhP5
         RvG2ur9R5tio7Pe8hlRRQY5ZUyEYV9/ZiwqC1k8omgt97zmIyz2njCUGSdDrv6U2QAbU
         ZF7msEjbvSIQ+B8Fn3bVlc1dq6H4W9V/8m26OzJwMRZd9AaKrmRwu2cPL0zphi+st5kb
         YFkg5bv4GpfJBYuvygdoCJj3GjYkb94CO48abngkvtAYACDJ/UNkS0VxzkU7rwsBTCK6
         G+A/8TM7Ue/y6PAykwPXT+6MpSxcHWEQGduNEQ15rVrD48sZDi1vye6NV+ppHAyhI7lu
         hnmw==
X-Forwarded-Encrypted: i=1; AJvYcCU3sq3lTE2X852Gn2B/H+NkVrlIHq3oYwfOquqVGvT+dZHD8aGghdJnCHiNT+ppdbgcyVltBW9P1G2RRgLZYWdyC3vwtQ==@lists.linux.dev, AJvYcCUyyRWUegn1q6w9RTG8VeSkmj/HWrAV/DLxMMfsBmSnSfzQUiXbLl3SH60JXkbQiR4Q1HCi12QtyopRQI7PqQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxxH1oTe2alZv5X97AiHXR922qCh+5N6t4KLexUqzBPP9dWQozQ
	t3vWXS1J4Vrj+Ft06iRZTaoFJSdmJYFLMCIrLuT/17luFbmrDywT
X-Gm-Gg: ASbGncsMShlauPvrCtlfBjC3uPGGfYWUVkAmfZLGr5EOlrXOtmDVWA3KyDrK4If82W5
	dPElJ7anSxhYoEGZPQscTJVtEtdxZ8GJFk8yXHdynxMGI+bmWm8PB88kv1Of8X7Cq5q3outZYG8
	v2la/lZ7CKjyOl59HM45dkHVHB0uPCryEdUakngrtuaJOgv02qZYwe7tWaJnn8FPpuozyHCTQqV
	CklI5QVghH/FgYTxVN2sG3gYCGrPEntEqf/U7cgSokxKwBxgCc2kK2/cIQoan0iV17RoA0ZQ4hr
	y0GVB/WNdZqF+d3P4gqDh6EVRxP/J7V7XmP4vV8bw6q18zrK8HyDtDFPyBbZUMYziugZopGkShA
	fc5Ye/S6w4rgQ5oYKlIA=
X-Google-Smtp-Source: AGHT+IFhWfpPaS+f5kQCG5DZsx23khz4dr2xWW/RmE/a5uwOzL06L/7GyubItr+3lo8EJrtTepz09Q==
X-Received: by 2002:a05:620a:45a3:b0:7c5:4caa:21af with SMTP id af79cd13be357-7c9607ac638mr39876985a.53.1745534083903;
        Thu, 24 Apr 2025 15:34:43 -0700 (PDT)
Received: from theriatric.mshome.net (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958ea36eesm142986885a.111.2025.04.24.15.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 15:34:43 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: andy@kernel.org,
	dlechner@baylibre.com,
	gregkh@linuxfoundation.org,
	jic23@kernel.org,
	lars@metafoo.de,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Michael.Hennerich@analog.com,
	nuno.sa@analog.com
Cc: gshahrouzi@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v4 1/2] staging: iio: frequency: ad9832: Use SLEEP bit instead of RESET to disable output
Date: Thu, 24 Apr 2025 18:32:08 -0400
Message-ID: <20250424223210.91317-2-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424223210.91317-1-gshahrouzi@gmail.com>
References: <20250424223210.91317-1-gshahrouzi@gmail.com>
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
v3 -> v4:
	- Rebase changes ontop of most recent changes.
v2 -> v3:
v1 -> v2:
---
 drivers/staging/iio/frequency/ad9832.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index 49388da5a684a..2e555084ff98a 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -236,7 +236,7 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
 		if (val)
 			st->ctrl_src &= ~(AD9832_RESET | AD9832_SLEEP | AD9832_CLR);
 		else
-			st->ctrl_src |= FIELD_PREP(AD9832_RESET, 1);
+			st->ctrl_src |= FIELD_PREP(AD9832_SLEEP, 1);
 
 		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_SLEEPRESCLR) |
 						  st->ctrl_src);
-- 
2.43.0

