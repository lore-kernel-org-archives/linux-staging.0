Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2203027700D
	for <linux-staging@lists.linux.dev>; Tue, 30 Dec 2025 20:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767126946; cv=none; b=kAAY6fHq/MMCzeoOxgRmreTqE8ZVvMzjocxQHJceul30gheDiwEr7ItGohmtbiSHlKEOPPjD+LkPu/3rL24vVFFmY73SCh0V4xPb6jLuAM96BIyUO9vYlXvb/4BbodODQInOu4L08s140SzOElwI1PnxuxDS4dnWQAZG0mzvwWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767126946; c=relaxed/simple;
	bh=Jtdn53sO5xTyxl4ArPEzfhAa7SYwkzbyNV1kgWEy5K0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NYR19SDFsMdCbTl4rUWesiDl9RYKxFj3rcx6FFkIQEhcdR8Zbk+8OryBweyccs3yuYL04VeNjwN8bBisesYwj/Mf7tsmBsceRMYrQOO9RWHNSsDzaFAiBLZWykx58uM0Ca9qWiy0iFLbjGUYmKT56d5pkZIft70UOKQxC2ExLMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mhTowX1W; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mhTowX1W"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-8035e31d834so7799240b3a.2
        for <linux-staging@lists.linux.dev>; Tue, 30 Dec 2025 12:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767126944; x=1767731744; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+OOVo27sMdHzajJrTWUzpISPZpC3vx0/WhHb1JyWK/M=;
        b=mhTowX1WvrX+3Z/5bhDmJW2xmg9ojo2fXZbmWjJOYwRMKzC4ypcVVBxwgIZVDBCtuy
         xcRC73AaI5ctIty+GJza97NXer37yPWOrW3Oj562JmsDGVQjSpB2HsCy4Su/H05nlute
         L7qtULdFyVZvZc/M6uKVTs0VyQ7d5r9cXaVvFIXtn0zsnhKLvrLIUpSV4U/C1m67BngJ
         c2uxDQ85XvMIaHcD6lnQY+M+gSJE/eJgmOLCN0rZWJj+/W0zLmvrZD9xozXt8Ia7Q+yb
         a969HkA/fofacMSyY517PKLoQQ8nm6cVSC+72Nwk8+kEFr4hbljN45NlCpqi6RjiDmG1
         +Pmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767126944; x=1767731744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+OOVo27sMdHzajJrTWUzpISPZpC3vx0/WhHb1JyWK/M=;
        b=GURdxgkM10oEBxQHwkyoOlpeSQxpEuuboCcMuCPhtfyECgDrilqEeTinDjq3J11ryt
         wOoSursA/gGcAYlkc59+unMsVKE9iFKJIhmSH0+ABrb+U2YKrBQBqHiYqP93IxhB0VvM
         orNgC26YrJ5miQLKe90/AaA9gNOKoGOu42X7faiY/Yvm0rSMY+10lD0vlo2dTR7aueRd
         M3JTi5DVr9oG6arZDEndfr5FQWe8D5uKdf6QwO4bD7tmr/T8KZIu1rK8aTUD7wN1ujHV
         uMdHe8l0oIFUZ+zvsn5QWSFr+C55e1S8UeWJZLiBevEUyrLv/5szkXO+X/HHtsMQitJg
         mKOA==
X-Forwarded-Encrypted: i=1; AJvYcCX4+6BUeAgmjjQZzCfV1y940l/hEl7TLGVDBXzKk/qddgOdigCP1bCuJvXcnbt9Fn+MCse/0pixQeuWi93B@lists.linux.dev
X-Gm-Message-State: AOJu0YyhzBrjgKZu641/1tBiyLvgiQnXbqI788Q2Zrp2EUYJLFijkH8n
	PE7N9CqKnduG3wLgXIkJMEeHK+FXvv3cJ71C9C9OTmbMmhmiJACSaghx
X-Gm-Gg: AY/fxX4S3tp/yLN6PUzP859e8GeM/UHcSewe7AIstLbP5pwFTZHjhmMA4K4909WRkte
	BZF3QQ4We1g6QgxRSSCdQnEXRtG93TpvFBrRv9fwhsI5AfkKAEcyE8EeXNUu4EJO8gh9R0M8B19
	wdH0nxguK9yV1IzafzmGjtQD6lYh65kdBSu8pC8Jrhp4ipXTbYv+74Sv1Ph6WcJXXprUe2yG7wk
	Fjn+PvQ5moS3E3z76BDL5+l5gY+MXJQ1e+GbgEx0S7l12NVFAbKA5d7QDmv1u2u2cyRdSJE2Zv1
	0ApWsGqIo69Rc+mS092EK4B4KcvvcesBXn0bjkvkpyuypX2khQLU+jXPCQ0S3O3b2VCXIvYGu4z
	J/FdozKgftd7rR93EW85m7fH5W7EH00iy6Rvl/SMrsbEgZpB01vFbfLh2on5B2vi3KvDuDbRg2d
	uNqnG/WXPTnkyGGmP7rRHP3pD538CEpkPnMOul7OdjCu0oRD3TItx3SuYUz6HPst6cGa9+vmQQB
	6xwJ4VjXJFoxLhGOmLcuyMIExcTiH1UKlOXxXyYWAzF8Is+AsEdSD1aJmutw+6UqqNpcBty
X-Google-Smtp-Source: AGHT+IEf48DdE7VsXtXnbFcBm78wkH4EF5qNQu7VPO5lx/tFK8WMwAZgL/85b3tX2lJle4DBsUCaRg==
X-Received: by 2002:a05:7022:7e8e:b0:11a:c387:1357 with SMTP id a92af1059eb24-121722ac203mr31008621c88.16.1767126943997;
        Tue, 30 Dec 2025 12:35:43 -0800 (PST)
Received: from Lewboski.localdomain ([181.191.143.75])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253c23csm128074981c88.9.2025.12.30.12.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 12:35:43 -0800 (PST)
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
Subject: [PATCH v2 6/6] staging: iio: ad9832: add sysfs documentation
Date: Tue, 30 Dec 2025 17:34:59 -0300
Message-ID: <20251230203459.28935-7-tomasborquez13@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251230203459.28935-1-tomasborquez13@gmail.com>
References: <20251230203459.28935-1-tomasborquez13@gmail.com>
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
 .../iio/Documentation/sysfs-bus-iio-frequency | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 drivers/staging/iio/Documentation/sysfs-bus-iio-frequency

diff --git a/drivers/staging/iio/Documentation/sysfs-bus-iio-frequency b/drivers/staging/iio/Documentation/sysfs-bus-iio-frequency
new file mode 100644
index 000000000000..10627c19bdb7
--- /dev/null
+++ b/drivers/staging/iio/Documentation/sysfs-bus-iio-frequency
@@ -0,0 +1,40 @@
+What:		/sys/bus/iio/devices/iio:deviceX/out_altcurrentY_frequencyZ
+KernelVersion:	6.19
+Contact:	linux-iio@vger.kernel.org
+Description:
+    Frequency in Hz for symbol Z of channel Y. The active
+    frequency symbol is selected via out_altcurrentY_frequency_symbol.
+
+What:		/sys/bus/iio/devices/iio:deviceX/out_altcurrentY_phaseZ
+KernelVersion:	6.19
+Contact:	linux-iio@vger.kernel.org
+Description:
+    Phase offset in radians for symbol Z of channel Y. Valid range
+    is 0 to 2*PI (exclusive). The active phase symbol is selected
+    via out_altcurrentY_phase_symbol.
+
+What:		/sys/bus/iio/devices/iio:deviceX/out_altcurrentY_frequency_symbol
+KernelVersion:	6.19
+Contact:	linux-iio@vger.kernel.org
+Description:
+    Selects which frequency symbol is active for channel Y.
+
+What:		/sys/bus/iio/devices/iio:deviceX/out_altcurrentY_phase_symbol
+KernelVersion:	6.19
+Contact:	linux-iio@vger.kernel.org
+Description:
+    Selects which phase symbol is active for channel Y.
+
+What:		/sys/bus/iio/devices/iio:deviceX/out_altcurrentY_enable
+KernelVersion:	6.19
+Contact:	linux-iio@vger.kernel.org
+Description:
+    Enables (1) or disables (0) the output for channel Y.
+
+What:		/sys/bus/iio/devices/iio:deviceX/out_altcurrentY_pincontrol_en
+KernelVersion:	6.19
+Contact:	linux-iio@vger.kernel.org
+Description:
+    Enables (1) or disables (0) hardware pin control for frequency
+    and phase symbol selection on channel Y. When enabled, external
+    pins control symbol selection instead of software.
-- 
2.43.0

