Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCBF33B95A
	for <linux-staging@lists.linux.dev>; Sat, 28 Mar 2026 19:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774726061; cv=none; b=M7aPQ5HxrXRhRtcXYqECoeCvzMbmtzsmO/kfEDOMDdAOebdAPzVqTcf3nODR2wRoAa1Nl5+YvWCc07QsVoNITty+WfrGp7bFbeONMN5qzXuTZRcR+Qp5yMPepukKFHZQPe6jkGGugR1bZg1LSrN44XGcuYKMLetOlOisdGOUFTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774726061; c=relaxed/simple;
	bh=GVRxR9DR6BNTeMbwcgOSckR9scW3aYPHHGFpcnGc7ME=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eM9lFjmYpaqNIHpYGa2RQKBZMQSl/hPinnRfl7VpwEf98mdiLokEyS5AvoeKYJ/M3D3NTBpS9EJlZO8Z0EBdyekAOE//zCG/xmuhv9g3dtPhyufuVJiqmq1HCmZe9dcKwXiNByJA2tMLF2UTMZagDmI+f+b6UbQ//B4Z3dfvuSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yoio/PU8; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yoio/PU8"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-66b957dd76dso619025a12.3
        for <linux-staging@lists.linux.dev>; Sat, 28 Mar 2026 12:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774726058; x=1775330858; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JSeN3V88uibyEs5RYs3jHhul9aAk7hwutPM7RxvGY8I=;
        b=Yoio/PU83U56cIJSs0O3YmTQCym2jJ7Hb4W4UK79WAjzXMw/JebFLPzoGMFGW1d4V1
         tFOBevfGlp4TGPf6wyMY96X3bQtoHb6NkKFVpaMPCCNXUPK2+imzlghxpHq2bmZ0k9H7
         4xB/RrUo1QiBnJsmdFufY0dlnWsvKllSaP2GL/SsfAedM1ieE7DnDlz6KqwurABKaKf/
         owuEA64ojaix8h0D7CfJup9BjB6n0y7Moq5ejR4MV8hRoUacRcI/k6fqbEu/nfVGxGVD
         n5cSBtX5aNCrEWYtbbDATC3BJGSHAkr4kmdEsEm4fdor0S+AVOOaQF9vVqjCEI5w/A28
         qLeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774726058; x=1775330858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSeN3V88uibyEs5RYs3jHhul9aAk7hwutPM7RxvGY8I=;
        b=ZN5mZLLWFDjznLv2muZ0TbaSKmPmdQmlTvxiIuY97jB5opZQdu95Lxdq/B3+XxCY4S
         KmAyAIMZOWS7J4CuZsUwcD96odpnsv44eviCe94aEXO5McvZbVYUQPAbSXPlNol6dBJw
         6mzk5Nq/F46DZ5JmWGqrYmRGX+Q24OB9EPEq1SuT3YQDJW2mB8OkdXI/B1AGUo3Ugnhe
         ltH+ExS2LsYjnvzlj/zHaXcI33UD7l5TWDsOVGjUKROIEE+8qlmWuYHXPal2kgqBVmEx
         20Wc8q27QWIZdIHUIXN3rwGx9h21uFD6XrTFu63+KaNmdKnhgM3hZj+VQjw07IUcwj2V
         4/ug==
X-Gm-Message-State: AOJu0YwEamGLkv+K+i5CWCiyJArC6FLOnpwrMrT4gFPnkn8iv7KGn3pu
	U4Fym/TyWCZ7BQjZbA32iEdrvfH1pNcafhpgz0KM0Rq44tajrMHyhWnn1mE8jn7h
X-Gm-Gg: ATEYQzwnPMWGOeY2JfvrtaYKBFwCK5+DE5ThcLu3lAtINoWaRGnUemSLaZ1mhAoHpMo
	JpdAJsbeg+HNvfpaREvHgWQfiOeLALPf7QAeac5ZSOWqo0kCyMX01ynVJwu/ZplYathtuWIDH79
	FMWkvGGbU/OVITGOxtGCtHHRyg179+yHSQU9iC5JVaz7WnuJs2BVgZTaZYAiFZ5sQcBVJzRnz+2
	EtkPGD+4wWX2c1XjICllsDHTc4u/tglttX9W8xnU/Tmy8AWMr6nQvoseH96mDCK16EDGGFRqzUW
	zKeNDw3eL95/LBZAihx7zUM1ZIcSoLE3qoUCWtIlORMx8BXQr9kCSd/C/EEpiaZ/mzTg1IN66/5
	6n7EfeHk4iPRlXJ97sNSAl9yH/wbXaJ2wwj/wSAb4dNRsg40S719/pNLhLTZ4w3l89yAG4PgjzX
	0Y3JRdxsjulsQZWL+VBJ8OLf+rZda03K34JfMMFp8SqK27haIqkKOJ6zpR
X-Received: by 2002:a05:6402:40d6:b0:663:71dc:127e with SMTP id 4fb4d7f45d1cf-66b28757b27mr4092857a12.13.1774726057583;
        Sat, 28 Mar 2026 12:27:37 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:18b7:e580:68f0:a6ff:fe88:bed7])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b76081af8sm857420a12.27.2026.03.28.12.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 12:27:36 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Cox <alan@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v1 0/2] media: atomisp: harden and clean up isp configuration
Date: Sat, 28 Mar 2026 20:21:36 +0100
Message-ID: <20260328192721.255493-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series addresses stability issues and technical debt within the
ISP configuration path of the AtomISP driver.

Jose A. Perez de Azpillaga (2):
  media: atomisp: fix potential NULL pointer dereference in
    configure_isp_from_args()
  media: atomisp: remove redundant call to ia_css_output0_configure()

 drivers/staging/media/atomisp/pci/sh_css_sp.c | 48 +++++++++++--------
 1 file changed, 28 insertions(+), 20 deletions(-)

--
2.53.0

