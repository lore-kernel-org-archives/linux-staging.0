Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3801D4E1A5
	for <linux-staging@lists.linux.dev>; Tue, 26 Dec 2023 11:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yr7Dbfj5"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-28bfdf3cd12so1585844a91.3
        for <linux-staging@lists.linux.dev>; Tue, 26 Dec 2023 03:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703588741; x=1704193541; darn=lists.linux.dev;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IkCD6iZZ1N4nQk3q0fBJ3HOIS6lxjMi9Q2hMg5m+uNs=;
        b=Yr7Dbfj5Mk77XZj8j3e71kUiRdUK7ej2ts7EDpE25kgMVYdp/ycjGTfHiT7WRI94M2
         AR4qiDcvawlKun3vj1GWbUcq59BdK+Xs1yNj34EfveJVFAiMxZLOHBqFhwK4gXIq4K7h
         WdVs6jAJtRrCv1eqNEChK02rjZOnihVWGIFXJNf054vJUzfNEmoVeL+WXlVwtC4vGBes
         iCNL0WKB9yAbKroTDkOHLJkpoos82r3Pjdi6PkW5f24NVxM841zQvwq67mOinJv4j63/
         wVLAg+iWHN3y+aWyS5hGXHNhZa7MLSHcn3Wmn9k+3vNLW2T1y0JVnNl8fRT9csQSnYrl
         quCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703588741; x=1704193541;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IkCD6iZZ1N4nQk3q0fBJ3HOIS6lxjMi9Q2hMg5m+uNs=;
        b=ne2GOug3+NUo+cyHU3Qm0yvut1Ivnc+q2SRZdjyXalKlm3W2pu6sa4qeDRMNu+Udvw
         jndWQl6Tut94ZaJouIlVBHT8KRBD6L8TYddGShdtLQywJiDBTG6Z3jWo14WnXz4qJCSX
         MbdC2qJWF7dg5Rpo4YKJFNGYYPvuUz9/elIJz9krgeI1Hs0DgXEZdMdAroKNl/dW1PtW
         SYnEhYFf+QQuPnVcGRdSRchtqN3xkuJ6W8dsqE0OE6AFfoEP0zm/3SGywYuo+ngG/0MB
         nOqgpE+MyeWgtVTjr/xHHF/kPGGh2OoGaM1CqLnuPNVTpXiqpV1sCd40klGpEKB+QKQe
         eD7A==
X-Gm-Message-State: AOJu0YysJu9zkoVpNfIQqpjQsk97P8SHmosTBLlkGrxBccK7xaWps6tt
	V7K7KTyXxw89fUgEbsFyhb0=
X-Google-Smtp-Source: AGHT+IHVs+p9J2TGobuvwbqzA1aOiLzDcrj+DAbNxfbMdxAee9+tVZ2yY8dAoBKOJssVHWwtG7afQQ==
X-Received: by 2002:a17:90a:f187:b0:28c:3d74:5b28 with SMTP id bv7-20020a17090af18700b0028c3d745b28mr729936pjb.86.1703588741382;
        Tue, 26 Dec 2023 03:05:41 -0800 (PST)
Received: from devopsvmp.mshome.net ([152.58.196.235])
        by smtp.googlemail.com with ESMTPSA id 17-20020a17090a195100b0028b1fce7c01sm15262186pjh.37.2023.12.26.03.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Dec 2023 03:05:41 -0800 (PST)
From: phanirajkiran <phanirajkiran.a@gmail.com>
To: 
Cc: phanirajkiran.a@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Prathu Baronia <prathubaronia2011@gmail.com>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Yangtao Li <frank.li@vivo.com>,
	Khadija Kamran <kamrankhadijadj@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: axis-fifo: fixes alignment should match open parenthesis
Date: Tue, 26 Dec 2023 16:34:58 +0530
Message-Id: <20231226110459.6816-1-phanirajkiran.a@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

This patch fixes the checks reported by checkpatch.pl
for alignment should match open parenthesis

Signed-off-by: phanirajkiran <phanirajkiran.a@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 727b956aa231..ab758a527261 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -381,8 +381,8 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 		 */
 		mutex_lock(&fifo->read_lock);
 		ret = wait_event_interruptible_timeout(fifo->read_queue,
-			ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
-			read_timeout);
+						       ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
+						       read_timeout);
 
 		if (ret <= 0) {
 			if (ret == 0) {
@@ -522,9 +522,9 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		 */
 		mutex_lock(&fifo->write_lock);
 		ret = wait_event_interruptible_timeout(fifo->write_queue,
-			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
-				 >= words_to_write,
-			write_timeout);
+						       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
+								>= words_to_write,
+						       write_timeout);
 
 		if (ret <= 0) {
 			if (ret == 0) {
-- 
2.17.1

