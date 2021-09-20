Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7364472
	for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 15:30:29 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id r1so1603588qta.12
        for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 08:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rQ99H87nx71zTeZnm1PBaqgtUrgnKGZgxB0njW1Zu98=;
        b=qIlxa1d1fM85RtMxf1hyFljZ/Ht4E0RjTSVdscTBBXzFq5D8OQugMpk++T8QIx71Ix
         n9VrYAhnxJbnmo2/RaTW4XUeya7hORyQHYF7e/rmwy/+gDpz7zgHr7mLSn75ysmZVKgR
         tTjUuax7VyLsO3nkE46T5cjyUa/OySGIeyS6zqh+n/2T+cJmQ9l9G9dMiM07HE/h70L4
         oOy4mfosauZUth0NpnZCHFo6whv3JkbEdgOW9zWC3IoQ5DX6p2stN0oIM6T6RvudOTUW
         hudWaJU3gnJFEceDkTBEKK5blm/aayJlwwQ2GBwdhPZX+fANYWS20DSvTFLtHRB16COP
         CoEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rQ99H87nx71zTeZnm1PBaqgtUrgnKGZgxB0njW1Zu98=;
        b=5qVtrUmlPhix8ikp112KpvnhbnTEJ+XQH2SA6NOjAAszjsy5HFX9qfY/aUnydfKboQ
         O+93w9/pi/qXDLRU33UyNY+PNMpsv9iFkQ/j40scmq3unKd3dJ0Z4sQi1S5r2M5GNZUV
         CAS7AF6DnYZthcSBAc1QJB73H260dffMzwNyfS/prnLWNGPOIRiTEWxTtugRNi52xebv
         Fd/bnyXZoDljz2e/tk3intGKFLdgYfxZiDreS2pKVNtEA5an39Fa7qJWiS7jR0/3H5ju
         UEshzv7s7Z/GvWmp7j+V9FiWIe5wRKPeu0iBlORGd/3bOI2jRXWxooQVlPjjqiLWIBrH
         jK1Q==
X-Gm-Message-State: AOAM531WhLgroonQWpM+sNky9hKjZqAcn1Nb8e1IIX8P7OpLY30znVUo
	LH70wNDn0vWbuC96t5Cm6ow=
X-Google-Smtp-Source: ABdhPJyqhK1V1TSoxa5piMCubgiZqrVbP9IuW+Qr/Hw1ALcUG/YAFw6MNFTYOHdrFlq6ng/x7saQ0Q==
X-Received: by 2002:ac8:5c4c:: with SMTP id j12mr24140831qtj.127.1632151828458;
        Mon, 20 Sep 2021 08:30:28 -0700 (PDT)
Received: from Zachary-Arch ([128.211.185.212])
        by smtp.gmail.com with ESMTPSA id y12sm8962055qtj.3.2021.09.20.08.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 08:30:27 -0700 (PDT)
From: Zachary Mayhew <zacklukem.kernel@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Zachary Mayhew <zacklukem.kernel@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@lists.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: fbtft: add docs for fbtft_write_spi()
Date: Mon, 20 Sep 2021 08:26:03 -0700
Message-Id: <20210920152601.170453-1-zacklukem.kernel@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Subject: [PATCH] staging: fbtft: add docs for fbtft_write_spi()

This patch adds documentation for fbtft_write_spi() to make its
calling context clear and explain what it does.

Signed-off-by: Zachary Mayhew <zacklukem.kernel@gmail.com>
---
 drivers/staging/fbtft/fbtft-io.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/staging/fbtft/fbtft-io.c b/drivers/staging/fbtft/fbtft-io.c
index de1904a443c2..985d7cf8c774 100644
--- a/drivers/staging/fbtft/fbtft-io.c
+++ b/drivers/staging/fbtft/fbtft-io.c
@@ -5,6 +5,19 @@
 #include <linux/spi/spi.h>
 #include "fbtft.h"
 
+/**
+ * fbtft_write_spi() - write data to current spi
+ * @par: Driver data including driver &struct spi_device
+ * @buf: Buffer to write to spi
+ * @len: Length of the buffer
+ * Context: can sleep
+ *
+ * Builds an &struct spi_transfer and &struct spi_message object based on the
+ * given @buf and @len.  These are then used in a call to spi_sync() which will
+ * write to the spi.
+ *
+ * Return: zero on success or else a negative error code
+ */
 int fbtft_write_spi(struct fbtft_par *par, void *buf, size_t len)
 {
 	struct spi_transfer t = {
-- 
2.33.0

