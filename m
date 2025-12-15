Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4248C327211
	for <linux-staging@lists.linux.dev>; Mon, 15 Dec 2025 19:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765825723; cv=none; b=pQrGJ8KCDFjrF9o7PElc+Vl8jnpiVchwtY+jEVVTNxKuBhWAPh6pH6xkpoyw8Wnxl3ym+XJ65P/VNpwK6e/pWiSN87GE38AzKCMMTzG5lgoDzHP7kiGRiwBMdNTH5z74DXnDsrXgeEkfO/U2FUEkNN9Cy9hasxgfcd/bhUSaFRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765825723; c=relaxed/simple;
	bh=g2Fo+SKpC6PjwBCJ943Rk64IScfy97UhiSWsSJqf/a8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ecKDMrBdHkJOMG3K85jSnoIoyG2VWCahqGBCZEX69MhMcUSQhcK4/GEUaieJYz2GktEjW50UUYFhu6IJ86vi+hcvvlo0w4Bx6Sqr8UXwnCz5b4qKqB7r2B+VhkADd28NAYLwIe7R+imuBTwOHuK8s5FyOTjWKkVskrH1J9fGUb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Md9xq0VQ; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Md9xq0VQ"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-34c84ec3b6eso1686918a91.3
        for <linux-staging@lists.linux.dev>; Mon, 15 Dec 2025 11:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765825720; x=1766430520; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WhOh34wHJYgJjZNzWKgXOXvukXHa40Pe75V9p09ZGls=;
        b=Md9xq0VQxYBvWchil+w7YaP5Cp7F//A3O8SzBRjfahhvywWqk4ChBla5dvn5/nKqUk
         8/xkzsROunHRo4wginnLFux+nBt3368XpD895ahjJ18c9KmAhANMDNFSVNeSby/10wn2
         kCiR2orqcj0z13512LWbo2uWJ9QSt+CbiWAk3nWadJb0mtVXjzsuVaGxa4SBhFGUB4oq
         3eaqQ3N3iAqRFWBUK//bLkiLC4ormqOzgkp3XYef1INJrPY6sAchKdRdtbPMz+qoUBYl
         YE2ZeRccfAsKJYnFZ0Hj8ixehFcuP6b+JzZUvzJcMiMo9SIBRqBffIUlKk5o2+mee+cO
         jvFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765825720; x=1766430520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WhOh34wHJYgJjZNzWKgXOXvukXHa40Pe75V9p09ZGls=;
        b=PFHjdMtkCszmUy63qWNYYnnkMdswwbs7tb2V/dBJobP+Qz/STEkueMFFzvIlNf/Az2
         Yhfmxoajd+b/h3jQiDmO8s4Kp5OBJwyNPbB/lOzxyxYKJCMbI0VpcGNE8nMbFuSlys8t
         6n/2Z6vLF2spkg5RSH5UKWKZMZ1Cye4t6u1iDsO3HjT3l8mdYnANJnRhn2bN2V3u3LP+
         dmJOheqMSK1BfgeqYlpNGeonoBSmP8Jyp1CV2UorvCSzRfBR5o6JnfInE7TPdR4/zyAU
         cn4Miov65CK1JvGJe/creyYzYK3A9NGk1oylJ0/AJq2mjU0NlNnWA2FSflZUpf2PDpwO
         JifA==
X-Forwarded-Encrypted: i=1; AJvYcCUFNi/vALPYfVEgAWf2Cyg+rxOKRfHSx1Cu4e2c8JMGgs2j2b4YUOixu526l8zoin2o4zvPEcfWh72DbTWt@lists.linux.dev
X-Gm-Message-State: AOJu0YyFc6+ZcPefJ23Sd8/0qiw62ljC2v0y0jceNeqNPZLJtIi7W/e5
	O2m2dmNUqujpw+RhQYRjnTV62h342WyGZhcjbZKTfA+M/LJ5HS3McC4c
X-Gm-Gg: AY/fxX5z0I0dfudVAQP4MRETkEaf0ZkZc4o7N3C7b3yR5u/KyHKp4x2iIcG5GwqZA3W
	4Ai3geZy1XzqAzRmsKvFx43TLrBffuW0sEOcKOhswF75ks0ZlaQgF6xis5xcB+/QNELFsHCmXM6
	WSV0W66cXYLVteiECkNtpK+SNjJeYMjkiIu+i9/VAbEM8XZUCcyfiM7sjtox9h3C5ZyX0ajv74d
	cMd+SMqorgL0/uJhXy3dKa4oweKA4BAuhZkI14dQc6v9avEPremUCrY/w5px3vyKFN7ccmWH+6J
	IUX5t0lJMZkpdvw00gnColXUZuNgJfNNKV6YIbdAo7Ia0+wwEO/nOKCPAXRgvnWJ9AgXErfChGc
	2l/0Gewzj+UJlTqdgWot6miOzQbQQ5bWs7Q5JznSklIFJ5035VE2H+VjuMgUPnR7wuYILydGn61
	PJnGCjGsr0qIB4qjHjMaTiSpSJ1UA/DoPgu10NM0aLMoAGU6zlNxu0IS0W4f3s/uelpMgCvHnvy
	o/Nt8MEyzw5oWLmG1QBUUYlQbtaD4DwBgxe8ymmc+caJtDaAX0tXH8LVdlxOlelRUaMp4mm
X-Google-Smtp-Source: AGHT+IE2X6oysUvapY8yh52OObO92D47oeQuQSx8EW1cTC7n+R31cQfuPy0gzfOE75F6exzqvWW5XA==
X-Received: by 2002:a17:90b:5287:b0:340:c179:3657 with SMTP id 98e67ed59e1d1-34abd7bae5dmr10401090a91.33.1765825715761;
        Mon, 15 Dec 2025 11:08:35 -0800 (PST)
Received: from Lewboski.localdomain ([181.191.143.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34abe2948d1sm9958875a91.9.2025.12.15.11.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 11:08:35 -0800 (PST)
From: Tomas Borquez <tomasborquez13@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Tomas Borquez <tomasborquez13@gmail.com>
Subject: [PATCH 5/5] staging: iio: ad9832: add sysfs documentation
Date: Mon, 15 Dec 2025 16:08:06 -0300
Message-ID: <20251215190806.11003-6-tomasborquez13@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251215190806.11003-1-tomasborquez13@gmail.com>
References: <20251215190806.11003-1-tomasborquez13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add sysfs ABI documentation for the AD9832/AD9835 Direct Digital
Synthesizer chips, documenting frequency, phase, output control,
and pin control attributes.

Signed-off-by: Tomas Borquez <tomasborquez13@gmail.com>
---
 .../Documentation/sysfs-bus-iio-dds-ad9832    | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 drivers/staging/iio/Documentation/sysfs-bus-iio-dds-ad9832

diff --git a/drivers/staging/iio/Documentation/sysfs-bus-iio-dds-ad9832 b/drivers/staging/iio/Documentation/sysfs-bus-iio-dds-ad9832
new file mode 100644
index 0000000000..5ceea57917
--- /dev/null
+++ b/drivers/staging/iio/Documentation/sysfs-bus-iio-dds-ad9832
@@ -0,0 +1,41 @@
+What:		/sys/bus/iio/devices/iio:deviceX/out_altcurrent0_frequencyY
+KernelVersion:	6.19
+Contact:	linux-iio@vger.kernel.org
+Description:
+    Frequency in Hz for frequency register Y (0-1). The active
+    frequency register is selected via out_altcurrent0_frequency_symbol.
+
+What:		/sys/bus/iio/devices/iio:deviceX/out_altcurrent0_phaseY
+KernelVersion:	6.19
+Contact:	linux-iio@vger.kernel.org
+Description:
+    Phase offset in radians for phase register Y (0-3). Valid
+    range is 0 to 2*PI (exclusive) with 12-bit hardware resolution. The
+    active phase register is selected via out_altcurrent0_phase_symbol.
+
+What:		/sys/bus/iio/devices/iio:deviceX/out_altcurrent0_frequency_symbol
+KernelVersion:	6.19
+Contact:	linux-iio@vger.kernel.org
+Description:
+    Selects which frequency register (0 or 1) is active for output.
+
+What:		/sys/bus/iio/devices/iio:deviceX/out_altcurrent0_phase_symbol
+KernelVersion:	6.19
+Contact:	linux-iio@vger.kernel.org
+Description:
+    Selects which phase register (0-3) is active for output.
+
+What:		/sys/bus/iio/devices/iio:deviceX/out_altcurrent0_enable
+KernelVersion:	6.19
+Contact:	linux-iio@vger.kernel.org
+Description:
+    Enables (1) or disables (0) the output. When disabled, the
+    device is held in reset state.
+
+What:		/sys/bus/iio/devices/iio:deviceX/out_altcurrent0_pincontrol_en
+KernelVersion:	6.19
+Contact:	linux-iio@vger.kernel.org
+Description:
+    Enables (1) or disables (0) hardware pin control for frequency
+    and phase selection. When enabled, external pins control
+    register selection instead of software.
-- 
2.43.0

