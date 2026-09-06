Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872FA382F0F
	for <linux-staging@lists.linux.dev>; Sun,  6 Sep 2026 11:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788694997; cv=none; b=Fq+SCioln84Z1wxgUl6C80cxB+hX5XMIupDR4y69yuUMh/OEXU9BPy5Y7k9RMvC+/IdTEx3Hf2Yz517UPCyuSYSbhUvgn8LZZinmD0HhCgiS8MqPmZHMfMbd//51OsC7sYiygXSMmXcJCFCsHHMks0kl2IzPz/AwUB+NUVq8klk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788694997; c=relaxed/simple;
	bh=Tgs81imXHXxl5PUz46cTacwZvL65MXU8w2OLv0AdJH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SQls/mzXZMXU4cKOTQxeKTVW6LF0SXZBtcM4jMbxn6/AxSccsRKo5GoP0gs6LkNLeRBJvwoqTMgqU98lHnLQiBUQqhcASkqiOAzCFp1Y9+dj8iKbM6jeTSF+bfZ4FhIuVxtfBwFPzjZtiYWeyQvaZ+JQsQZvcXo+Ie/s6Sa2Nmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OaM+ZIA+; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OaM+ZIA+"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso26662865e9.3
        for <linux-staging@lists.linux.dev>; Sun, 06 Sep 2026 04:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788694994; x=1789299794; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0kt+nixPnxV+vJED7IjIV2XXQGlXwwe0QJtiMVPgU48=;
        b=OaM+ZIA+3LKZ3tjVqc6BiotdIl0OCp4xjlHBs+ezZ6h6zQKAD4oPR90IRGEfOyqOzb
         POXNCkdF7FzQ0ClaO0AkYqfUnIaGT3570tYGQ5Ps2EaHTTjftfxMiZu+/8a8rZPWqleF
         KVjBgjP61E+5ezjpGyHWIpUDPg2uuzTDXsAmLB9DOdbzbJ65thRzglk4BtlsP3HKdW3+
         Ce+S69vM9Yv+GzokMt/eH+9NuqHzlyhPfJY4SQ4/2CuZFRLGBAadOansoVpTgqSUWaAM
         HQ7eYeWaPOuu1GbrpbLG6amKESWLvUYOhFfa//93esv7mYeEsuiATE1ap+OljM2alWLm
         tpGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788694994; x=1789299794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0kt+nixPnxV+vJED7IjIV2XXQGlXwwe0QJtiMVPgU48=;
        b=WEsN5Jxiac4+8lKxxFbG3v64hfbb1Hr7w5e3x8sQ0rtBywVz1it8MumrRS2kCIqWTI
         AjO9mNq5sq09ECgPvPn9t0rBIywciOAXqI+etVx6+/LnJLzdJ6ZY4wEl1V/6IsaW8Aow
         TMJ7eOVP0v3k9xL+ljYA9QbwBXovDBLtYPf6LQ9IlW1JfFly+aAyvZnQzfevrYfiKu+b
         yZtMKYLvGcxwTKqL0R2F98QyckQjmIGbOBubbY3CkxHwmgcgn7dVAKyRQyj6CC60Cp42
         jmVj4qtpmdpl7AjXWHBjK/J90pVZkp7IUy7kOjXLMPcYa0k/yyOykmDXgjC/2+ehcq94
         JTFw==
X-Forwarded-Encrypted: i=1; AKwUvBzozyp29otcqm9sIOd7cIo/JQIbnD6DN31mwn8/Mt6NwnFocq+NeyOUr9W8XJtyKe1VHQTVVeWWREgv4WnR@lists.linux.dev
X-Gm-Message-State: AFuF++lOli0XRDZC+PAYWeuyZUgJaeJaKZaS8uIcx7CstkLB1Q3Dl03h
	M49Ds2L76cA3HcQ53msPL6hnycXIvvBl1ZArPZI8xJdNtOUEvbBHA0+U
X-Gm-Gg: AYBFou2gw4AL/mRqFcBD2fOdrArc5EFmK2IwSh+mKfA+o7rxF90khUHQ9gRSncdkieX
	HbuMF1Oj003aDF1ksRoB3wAGgSDM8zemc4D9tZYmeN4a/pyz2c99nNuumFXTYYEJLzovkXDdZwy
	pfp23JdnE5wHn9Txuv1BJ+Lq9cGyF3aoStS1ySbAe+h2kL04KsvUrMWj0hFCQhG/sRhE6MuVsb+
	DyZdIUGN1ETlvfsXwlTRHm+vPKMGjGLJf+8tik/O8heccybcY/JPU8YvQKjbTCKdFmzi3aNdavy
	6IHqsLsYrRBfuVIGt2UlJ3JlqgQFCxsoLYWLz8r1R8433VRpOHzLQN80jfuX8Ve/1XnF4ytfcB5
	S6HaGrlNNJajTRrA3dh3+hX1r8FnMVHhsC5eGZcWQZhIAllgkYfz2QBU7sBmkxt60Y1uAxNjqAi
	8hvxnPCYL1hfbu+tnY7sUZo4Efnl7v581hsWQkNLO31L2IR9Wodu1Xiuf6J0sE+hagvpM0H+whc
	qX+OQ8G/h2NQcY38PQ=
X-Received: by 2002:a05:600c:6383:b0:49c:e88b:b7ce with SMTP id 5b1f17b1804b1-49cf823f147mr327098175e9.11.1788694993614;
        Sun, 06 Sep 2026 04:43:13 -0700 (PDT)
Received: from fedora ([154.182.82.204])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ab73c2bsm19356223f8f.22.2026.09.06.04.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 04:43:13 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: gregkh@linuxfoundation.org,
	jic23@kernel.org,
	nuno.sa@analog.com,
	Michael.Hennerich@analog.com
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v4 2/2] staging: iio: adc: ad7816: Use DMA-safe buffer for SPI read
Date: Sun,  6 Sep 2026 14:40:49 +0300
Message-ID: <20260906114049.32912-3-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260906114049.32912-1-abdelnasserhussein11@gmail.com>
References: <20260906114049.32912-1-abdelnasserhussein11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Stack buffers are not guaranteed to be cache-coherent and must not
be used with SPI reads, which can trigger issues with VMAP_STACK.
Fix this by using a dedicated DMA-safe rx_buf aligned with
IIO_DMA_MINALIGN. Also, correct the sizeof() argument from *data
to chip->rx_buf to match the buffer size.

Fixes: 7024425db64a ("staging: iio: adc: new driver for AD7816 devices")
Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index ab80b3a889bb..e14ae805f076 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -52,6 +52,8 @@ struct ad7816_chip_info {
 	u8  oti_data[AD7816_CS_MAX + 1];
 	u8  channel_id;	/* 0 always be temperature */
 	u8  mode;
+	struct mutex lock; /* protect device state during SPI transfers */
+	__be16 rx_buf __aligned(IIO_DMA_MINALIGN);
 };
 
 enum ad7816_type {
@@ -94,13 +96,13 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
 
 	gpiod_set_value(chip->rdwr_pin, 0);
 	gpiod_set_value(chip->rdwr_pin, 1);
-	ret = spi_read(spi_dev, &buf, sizeof(*data));
+	ret = spi_read(spi_dev, &chip->rx_buf, sizeof(chip->rx_buf));
 	if (ret < 0) {
 		dev_err(&spi_dev->dev, "SPI data read error\n");
 		return ret;
 	}
 
-	*data = be16_to_cpu(buf);
+	*data = be16_to_cpu(chip->rx_buf);
 
 	return ret;
 }
-- 
2.54.0

