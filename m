Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F43CA4D;
	Sun, 15 Oct 2023 19:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SY4EGOnL"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6b201a93c9cso1771570b3a.0;
        Sun, 15 Oct 2023 12:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697397706; x=1698002506; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rkm4IcvDcpDNyn/dmP3dcHytJ9yQBVbR6NWIK3pDrZM=;
        b=SY4EGOnLMR9Z6fmJd3wiQWId/z+N4wStDnVuCMpLroeE+EWFFD9fhu1ZQgGA0umIon
         KpoInUTtx5/BltbKvqYA/BZqTUh52hPpAbtk/BI1P6sI2VC66wtQQsqv2zQRg5T8SnNz
         fZjcYnaUAOnZAw1Wk0epyWlupzHTAC1tbF7VIx7fVMBDIrmbBYhSfQu6R4tzK1R+e0Ov
         e0oyMdODB4PsAEh61IfDe4RcquhsVT44wRUJkII35mFi5dNDBSGDSILPaSmGxhiTrORZ
         gn3U1+zBld279RGjion73ipY3kI0AObNDnFi03u7fb0T8PAIz/Y6L+FmBhPoHFGyn1gU
         tXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697397706; x=1698002506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rkm4IcvDcpDNyn/dmP3dcHytJ9yQBVbR6NWIK3pDrZM=;
        b=XYV+MQ+6wqZheCNvE/FRaDFBK06vHmXkqjMLFwocfM+iuPkbfrCINdPpTL+aSPoNlm
         eQNwlrr8mFl+2XRdgYAUbhcX0Tn1JdcA3VIIp8X0J+oViKjDxQA5RS1anFu0tA26GGB0
         F6sd0smlBzJkYxKeTBMQ4ze1ylbY7JlCEMrH/OuE0cfPkSk1CsoV7oqlLLXd3OuMXGRA
         HUilzqwAaR2dNh66tTLN/SM1SxPXbRFHD+msOQi+vVZqc6g5T7Hb4+uhO2eBimOhrDYR
         ofwY/qWW6nJ70MycyR4/beB4jUqJWieTp08R8AYIuud9qhmIXoB87q0Oecz5/xHh4jm/
         GEeg==
X-Gm-Message-State: AOJu0Yx1JGkQeaL5KE7itA7U9qQTLfdH5NiYzOMS++zpoSEugj4CRzze
	PPqXSSFmm5/sqVptgewzs7kELHxnAwYa8A==
X-Google-Smtp-Source: AGHT+IEHmMpf6Rm/sWnpzlo/bdWvcRKKD2y2j53MnHy6A0Yb3BU2hl9khGJ4C/e6eRWXocz7ezS6wA==
X-Received: by 2002:a05:6a21:998c:b0:161:76a4:4f79 with SMTP id ve12-20020a056a21998c00b0016176a44f79mr33218988pzb.23.1697397706076;
        Sun, 15 Oct 2023 12:21:46 -0700 (PDT)
Received: from Negi (2603-8000-b93d-20a0-2184-6fa4-0d39-1c6b.res6.spectrum.com. [2603:8000:b93d:20a0:2184:6fa4:d39:1c6b])
        by smtp.gmail.com with ESMTPSA id gq9-20020a17090b104900b0027768cd88d7sm2277968pjb.1.2023.10.15.12.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 12:21:45 -0700 (PDT)
From: Soumya Negi <soumya.negi97@gmail.com>
To: Jonathan Kim <jonathankim@gctsemi.com>,
	Dean ahn <deanahn@gctsemi.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Soumya Negi <soumya.negi97@gmail.com>,
	outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: gdm724x: Add blank line after declaration
Date: Sun, 15 Oct 2023 12:21:37 -0700
Message-ID: <20231015192139.3121-1-soumya.negi97@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix WARNING: Missing a blank line after declarations
Issue found by checkpatch.pl

Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
---
 drivers/staging/gdm724x/gdm_tty.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/gdm724x/gdm_tty.c b/drivers/staging/gdm724x/gdm_tty.c
index 4e5cac76db58..0c61eaff6122 100644
--- a/drivers/staging/gdm724x/gdm_tty.c
+++ b/drivers/staging/gdm724x/gdm_tty.c
@@ -160,6 +160,7 @@ static ssize_t gdm_tty_write(struct tty_struct *tty, const u8 *buf, size_t len)
 
 	while (remain) {
 		size_t sending_len = min_t(size_t, MUX_TX_MAX_SIZE, remain);
+
 		gdm->tty_dev->send_func(gdm->tty_dev->priv_dev,
 					(void *)(buf + sent_len),
 					sending_len,
-- 
2.42.0

