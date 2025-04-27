Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE08924C099
	for <linux-staging@lists.linux.dev>; Sun, 27 Apr 2025 09:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745745036; cv=none; b=lh9+7cIjKZ0FmrIJ+tmhmUsP1Eh31vrMxnBe6XAG+ow6rSWS5PjQWEpmfLWvZq50Tplw5spQlhmebAYTa5/UhIuOI9Qe3hi3Fo/cwDi9DDJdSAS7Wt+0ZgImEuuzvrcocRmMro9+i9gYvNUeEfCBgDXPgsEJzd3UVdMF1br4RO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745745036; c=relaxed/simple;
	bh=UA+cvZElZlyjZuyFX2EFMnvtlOX6L661FSlIyfzkuwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iubp1xXW7J5Z5HhcdspPAkFfX231cSjN66VKH3XPacij10H38Z24V7D9wXgp6DieVpFvS57NMLEvhOODwL6xylJl1KfJx3x6g8NuVU/c/bdZQLQ9KRDl9Z6YSMRxe45+91YUplUoiP9T/ChQmzcDk/96pVZOT+xexp1BFUlrTp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NOuN5ih6; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NOuN5ih6"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3913b539aabso2085865f8f.2
        for <linux-staging@lists.linux.dev>; Sun, 27 Apr 2025 02:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745745033; x=1746349833; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V99EMTWWXaGhjrbD4OzKCKARxP+WZmBldZfdsQ6WV0I=;
        b=NOuN5ih6fh9VXZXLKpJYPJswqN9lmlsKD8VFowzNyix55EtMHrKp5SsavZGzIX+oma
         qxppZDafxZl4CxlVvyT8uHW8V6p7eSsikrYcyHfZLWBm+d5diL0NONKkXudGu7xD/yNb
         DaKVysEAQT5EJWZTJ/2CHlulPx/csJ5EZ/x6I9OxDIvHwab1jZEVqY2/vbgVR0NMRGdl
         RaHnEVtvJzksRbIy2Gj03KbmS6ivoAqityisJ8bPf7BiNTxRSV/BRg8LR62wrzU2xhf2
         11sDC27uqq0Mbs98OvRIP8p0d66qHwJcUmLPry5ZczFjZ282Z+6fPRbnBuS7cth6naNY
         ukTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745745033; x=1746349833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V99EMTWWXaGhjrbD4OzKCKARxP+WZmBldZfdsQ6WV0I=;
        b=uvm4+cmgzXRnVsPJOs3/kTwyEbwpY7pDDrI+RCpG+IWcyT1ZiuwBlV4niVKQ7EevAo
         h8KfzvOsiaERZO0fGYdc+IMoUXYySEegB0qtY2bSFJZQKuZQkXv7NVAvvByIvCCEgeve
         VQad+NHkVsWJClFfEy2zCXAujfkD9rrtmXtTz+Npk0oXTQbgVyaYwZFkKf+1wFashiZQ
         zaZG/BlK+Eq4AWJeD63oZzer+2chd4s9hbga8U3ZkHG89B3P3urbFy03l18eKOSW+A4I
         PvO2xV7hpwLG6o3/g8r3EJqdshv8cl7r/FRAK3LX+9nQB/T+W/I/4gvTutWvbhbyrS3Q
         HCaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGfUe/tY4W0V6zBm4j12ljn5JJxQNjiD4DHg9L/oqW8eckzy+MGFwltsnVxvMchTlN7FTuFt/U8GU1PCvv@lists.linux.dev
X-Gm-Message-State: AOJu0YwxOgrcw3db4eIh9TNr02ZRa04WHXOmeTA+FF7S4pV6DqGUhTa7
	q6qthAW+Jk3OT+Ufb2VTB3ykXkeQZQxFULgxaf+qGudXebgmooeP
X-Gm-Gg: ASbGnctXDZ76nNolnl23yppWSEZA6LySY+26hwCn4cUWDdjMCaWYB6tO0qCyNhZww9n
	qCyM3uSqkZF6q/rFSSpFU6OrUFzG79HtCm+HgdGJVhWQQQcdbaHKa2MD8tJthQG8HbZAsh07VAP
	+o6sjuiaTAmmv1ernVUYgUZSiciTUxQjmDuqX1blbNo/PshHAXlePRx7iiijWPWtbq0xn1UPj6Y
	0IrYERoDmHc6H5ootL43x1Z/a+2MA9sjutNdQy+pYpPDw+hmNprMHRi1/N1DrKoWPAYeWUgXb6h
	Cs36X1x40qxHLSXDI6y1e1EKTlW+toNcF8gTjnk278bgfbnlMzLNhATt0OZuj5tFTDgVjLTkqyL
	12cTY8aJnzyA=
X-Google-Smtp-Source: AGHT+IGnbRIp4zIDH5q0X081pg4Kq7T7MoVVMLlgJURBzSJHHwVVHobY7sMzHUn9prbYxlGdYJHoWg==
X-Received: by 2002:a05:6000:4202:b0:3a0:833b:a1e2 with SMTP id ffacd0b85a97d-3a0833ba364mr570019f8f.46.1745745032832;
        Sun, 27 Apr 2025 02:10:32 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca557bsm7925805f8f.35.2025.04.27.02.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 02:10:32 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 3/3] staging: gpib: Avoid unused variable warning
Date: Sun, 27 Apr 2025 11:10:18 +0200
Message-ID: <20250427091018.13705-4-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250427091018.13705-1-dpenkler@gmail.com>
References: <20250427091018.13705-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This addresses a warning produced by make W=1 with the configuration
parameter CONFIG_GPIB_PCMCIA=y

ines/ines_gpib.c:1115:28: warning: variable 'dev' set but not used [-Wunused-but-set-variable]

Remove the declaration of the unused variable.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/ines/ines_gpib.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index a16219c0f7c8..3f79d3c850d5 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -1112,7 +1112,6 @@ static int ines_gpib_config_iteration(struct pcmcia_device *link, void *priv_dat
  */
 static int ines_gpib_config(struct pcmcia_device *link)
 {
-	struct local_info *dev;
 	int retval;
 	void __iomem *virt;
 
-- 
2.49.0

