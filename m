Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495EB272E42
	for <linux-staging@lists.linux.dev>; Mon,  1 Sep 2025 09:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756717858; cv=none; b=K2U5lv6bLWH2UbaEUMkh7T66PNqrxRiJG1TtGYdPmYq40ioUGqJ3akBL1AX2jPyflzPlI/zUNnZ81zzX985/c7N+iaRwKLxopUDJJb6qNaexclpdL375WiD4REUkI78V5iPtntQVcxlHEacs/dV8lJ3PwJxmjWr1Bi2Pp82cugg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756717858; c=relaxed/simple;
	bh=ACP8MZnAlAb5InMjYQgm922aUo2YjOy4WzsnXNakYg4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=cJbX7g/F2EpQR79WE6umNx1U7KrUkbTTpBe357NHB9RM4nkyLmAsnGp7XWRPZ8/mfO/lqQsagIBexDPhwDPdN5MNs+geXkq9Ma3nvBbC2qEdY6UOBGzk/mYe46Iqudx5pLyCCdDRywpIkkbiiwDA8L9RnKjd/ReUarnshzihFFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3fP9Ysx1; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3fP9Ysx1"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-45b467f5173so40174635e9.3
        for <linux-staging@lists.linux.dev>; Mon, 01 Sep 2025 02:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756717856; x=1757322656; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hDxtfYjlB+z7OHUF4dwiWALUYeYYqi6hQFXH7mpSg+o=;
        b=3fP9Ysx1htgqxfpOBk/9KVaAHmv3p+wNTV3mxra5ksn592xOBYzeL/wXKuNHZwIAcT
         I3tN3Gr6pxDByzji4k+JkQr/xcN57MZteG4ueT5wngkCjqqA6vXQgQtq/RlJdLPRblre
         imuUOw9Ops1fmvkDQJmsY4re1R8G4fft+iBGbQEQ9+waO+oRlWSHVj/LhLTee1oHzAi9
         YrupuicllJ8mYkq+ed/FUpp38bZyNSqYNoMcuMLsREhnq9q3LBIPrh09XoaIxBBhd8bG
         ZJXO+tyBJ8yPiW/VrfQ/H+WnsguvmdDpH8FmSAxRI1KoaxZhg9YIf2MCJ+q/dBsT/XE+
         dL1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756717856; x=1757322656;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDxtfYjlB+z7OHUF4dwiWALUYeYYqi6hQFXH7mpSg+o=;
        b=Bojb2MOByuQ3symfNhm7MpmZxGnpaqH3mB0KrmrecAg8Dj+iFkcB55MEeteJuhND7i
         B6gRv/9JvbX3FjR+YFcGhxbSUz1+6Vf3yJmgkRobNNDBgRriQ5LyRy5BJ/YPSeCnlEPI
         kuo6Vi3GIT6NxY/cZ+2MJ2yOZ/bjlTalptcWpH5hDpOsDqW9vmrgqBjq4dErCyZWBTKc
         95+FL7qx5/1DjSznGoCvRefOZuAcVaWKiS+vjlhtNuuNq9HFSXUIP09k0uf70Q8Qh0Ny
         PwfChdOtNgf0vl2ei4g3UINrhc3MxwVFQIYDyCdHpCdFyjGOhEHGLt6UtHI/RVaXcTl0
         Ldlg==
X-Forwarded-Encrypted: i=1; AJvYcCUUg//CvJouFrGUI9CZkVDPYYT79dnidT2APlRbJwvQYNksc7GLaTD66gzhzwLEN/2sInf6X0Oc8xz6gs6r@lists.linux.dev
X-Gm-Message-State: AOJu0Yyinsh+9kuNitecapd3YNY/zpvP1kIPGN/azs6OYZGDy9pQ92J1
	WavGuzHhu2VmNYMWacndMkNHlQkYpXxa4CUZPIZCV8gh05/Ncs1v5A3BbGah91gYiuZdqE8PhM/
	9JlGje+YfGQ==
X-Google-Smtp-Source: AGHT+IGOfALiy9m2ZadFM7Lqo/znox4/GCfzOHB+U0RHpZwPYSarW0J3a2cBE64h5xyOJH4bR9NboaXjLbqI
X-Received: from wmbez7.prod.google.com ([2002:a05:600c:83c7:b0:459:10dd:2e55])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3b9a:b0:45b:629b:dc1e
 with SMTP id 5b1f17b1804b1-45b88525cf2mr46556505e9.1.1756717855565; Mon, 01
 Sep 2025 02:10:55 -0700 (PDT)
Date: Mon,  1 Sep 2025 09:10:48 +0000
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.318.gd7df087d1a-goog
Message-ID: <20250901091050.1935505-1-abarnas@google.com>
Subject: [PATCH 0/2] staging: media: atomisp: Style fixes for vmem.c
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Cc: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Style fixes for pci/hive/isp/css/common/host/vmem.c. First patch
triggers check issues in checkpatch.pl that are fixed in the second one.

Adrian Barna=C5=9B (2):
  staging: media: atomisp: Remove typedefs for basic types in vmem.c
  staging:media: atomisp: Whitespaces cleanup in vmem.c

 .../pci/hive_isp_css_common/host/vmem.c       | 111 ++++++------------
 1 file changed, 36 insertions(+), 75 deletions(-)

--=20
2.51.0.318.gd7df087d1a-goog

