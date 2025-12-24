Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1CE2222D0
	for <linux-staging@lists.linux.dev>; Wed, 24 Dec 2025 11:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766575035; cv=none; b=sPXGfsOBXE1hNB05zGZb/oMs1U6VLb0TMHEFB7mcC11eWpfw6YvhnWMrJ2Y6lxJuLkFXi9NFE+Z8NqdIsRFYo7ouJPVwXhyBURNVDtwXS6OFAXVzwy3+P8W8n3t0/1Fi2bnJH0TeM2y07CZFd/qYd48Fhd5brtd9j8PjUVVdbSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766575035; c=relaxed/simple;
	bh=Q9TBK8v9IamcPxziafotlqobzS512kz9y7tL/A1ETlE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BRHL+zj6cF7krrg5f6R/itihtTgblKJ5LwwU/cLdUb0apstdKP9YDTJD4zV7A0FIpevr8Gd53ppC9iSucJUD5ynx0KmY5j588++YfnRIW3GgJ6Y//bfUyLksdLMXckjUH1umrC67mcsFfNDO0VTH9YG4uXgmacZNs7AWb3cADvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FfueRRva; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FfueRRva"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42fb2314eb0so4310217f8f.2
        for <linux-staging@lists.linux.dev>; Wed, 24 Dec 2025 03:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766575032; x=1767179832; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nkOk+yiD2ZOYk6PyCrLiOp/Whut/X9MPksemD7AFox0=;
        b=FfueRRvaq8nntBOU+Djqxrmn7k3IOJvQLJ2PccD492JGb9z9qmlCSmyh+zEZfaoSbY
         OckpHtkMJDP4GZnyP2qC8TBMHhoPepQr0krLMHbx7+EpkKxdS7/RxeAPZvp0xuWJ4I7i
         B2h5bTp4AvjRn8Tpt8zjDpnj9VtJdN75jnhzsYoqQyFodnxYBS3gFDHMrGjaVpTqw+z8
         qqHR1H9bpzA7yzYl6JZj0k5E9SHOEnMczk2u09EgC4chm9H/6dx+Ji20QsKRaA4+/zFO
         G1sZrcE0zpv2or/r5K/8cKDrzp7k/fN7MsE4L6WJlrOvYRuA7x3uGRRNMy3TCCUPDP8+
         /qOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766575032; x=1767179832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nkOk+yiD2ZOYk6PyCrLiOp/Whut/X9MPksemD7AFox0=;
        b=WS/72aVuifzySG0VAZSuCTJCBb8+T4eeJFv7k3L0ZC3nZUvXVtJV1wwAZvOthF+l+b
         VAUEk5obomNRxKBGd7gI9Z1ogFU3gUZNqoLJno8Q5Jr0X81v3a9rjuUHpP6PZZYNMfKe
         VxuZ8NRCmHh2qO+0WQx8OJrRvMXAYXXQF/LqwY19CdrmtNepm7eVwPHeM2E6/oCAjp2D
         FeXVFeEYCmdJN59swPH5882wSKmO+zJdfX1h+ycT27rZa47OFa1UQZ9UwikLGdSSTR/J
         6ehKYdgWO6nY9g7i5dTaXARvT5otfHsspHW3npX3o6YFBYHicM4xx8TB7iVnct8Hz6h4
         Sq8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUE29TussgjL4dO11Ez7PftmPYVTULdmkAnZPoDqN90qzRkA/xH/SL2i09qm2a37Uunyx1BV/xefS9O85zz@lists.linux.dev
X-Gm-Message-State: AOJu0Yztxcw+hZZ9JdguLBVjGxT1wrgpd+V9ukEIJ5uGBrGjR7y5/i/m
	Omcaa/T2qdAZ/COi8hRE69qUJjWNW+T2Yz5ozVPxvofopA85AflWdAig
X-Gm-Gg: AY/fxX6WSAuhLXPtA9gc1Q0cK2PQCm8jWqCxssMmDenv/kjk9Zuz3tteCajkISvxmNK
	lwlJ3amOKygbG2amV10aJJBwMf0RXFC9caN0AFKTJnm10JXS4Y5T7j1A/GmkVBoLVTaRDNaZ57u
	+cRcMeBxtOrQ8eY/H/hXEM6nj0Bflfs7MUYO68p+G9Dqaf+eG6lCPCfFr+GDXY2JtrHLJ/ju12G
	tYSsvUIFkBj6+kKJ8DPVzTBmuym9omSpD1NPaInq46PegujsnpxIsVd/DTB/jETRkyy5KfSTiR2
	i+oYEtFvhI4zrDx+a8Jw/g7PQ+PKEyDqQtMCUJeuHXyP0tLm2H7sN5xDyPDuge8t8Xw3N4zFprU
	DnedK5LWBz758Q9d2ybVxa4NoT1kC76cRskD9v3njippwhmoSgbJdpY3p+sbYIiy9CUh5DlzK3b
	9DslwBwg==
X-Google-Smtp-Source: AGHT+IFk5NWPP1mAAnYgnCDHuVsEDDNY1RQWNp97lhTRKxY7CxIgrXDdZUlZ6oMC5ul6hpVaRzK+eA==
X-Received: by 2002:a05:6000:186a:b0:430:f301:3e6c with SMTP id ffacd0b85a97d-4324e4fdcd8mr16701457f8f.34.1766575032532;
        Wed, 24 Dec 2025 03:17:12 -0800 (PST)
Received: from user ([178.19.85.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830fesm33699241f8f.20.2025.12.24.03.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 03:17:12 -0800 (PST)
From: ShadowMonkee <sshadowmonkeyy@gmail.com>
To: Marc Dietrich <marvin24@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ShadowMonkee <sshadowmonkeyy@gmail.com>
Subject: [PATCH] staging: nvec: replace udelay with usleep_range
Date: Wed, 24 Dec 2025 12:16:51 +0100
Message-ID: <20251224111651.217679-1-sshadowmonkeyy@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

udelay() was used for a short delay in the NVEC I2C receive path.
Replace it with usleep_range(), which is preferred as it avoids
busy-waiting and allows the scheduler to run other tasks.

Signed-off-by: ShadowMonkee <sshadowmonkeyy@gmail.com>
---
 drivers/staging/nvec/nvec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 263774e6a78c..dd92f186e0db 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -648,7 +648,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 		break;
 	case 2:		/* first byte after command */
 		if (status == (I2C_SL_IRQ | RNW | RCVD)) {
-			udelay(33);
+			usleep_range(33, 34);
 			if (nvec->rx->data[0] != 0x01) {
 				dev_err(nvec->dev,
 					"Read without prior read command\n");
-- 
2.52.0

