Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68142C8B
	for <linux-staging@lists.linux.dev>; Wed, 20 Oct 2021 06:10:41 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id p6-20020a9d7446000000b0054e6bb223f3so4601326otk.3
        for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 23:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xKg9EjzdwjkynYiQFahq3nQ5iPSpRZ4rXkfIYG32xcw=;
        b=TsuadMfgh/GFJNDD+k45aJlv52+kHcCKwEXHJoS/wOkW24o3bmT4AnuEqdjINH0iqG
         yxAzJIG63NN5uIwszW4PrJmXXDQ+5nJKzwoEPWGe2g3mvfglPZD9PwDHFQki0L7lvXgK
         MdSpCf6RGy7ynFQMbVGGfxlSNI01l7SpS8AZ3AFny4208jr56lO+aDetEI8UWQayzF8C
         A9dd+aen++mEe8DILo1Ca1HA8uOiz7TyhQrBKvdi94ocup16AcYLEcXzacMxHQQvAkUx
         WEVgMMmhMa0oWOogwkMZhQXP5xTku3XOWBt7hMGG7P4W5IInXO+Z5cs312MyJQS9Hvv+
         y+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xKg9EjzdwjkynYiQFahq3nQ5iPSpRZ4rXkfIYG32xcw=;
        b=qG+rmAxn2xm07TTI2rdn+2yGykB3TBbsR8XPf42C0MYIvX/Lfjxn+ECN8MD6VrDjEZ
         AIuvAYAo+bqPij88ZJqIUA32aSvgqRQGtXsUVYeYuo7ZmWad7oreZvET/Gcj/o7Wh5lu
         17aBxnpGaZ78DFQCbtelQ9EDnLydhlshO+qh8Ys9D6BqIupj9TwdDbiO48r7Z8Pv+iNF
         fAUfPc9yNQ881N96mCs7JPpyHO8fqvbeJ2Kokh8sXQvevLafyDjrPTFud8X8N0jfVgTa
         pvC+9jhvDsUyO4CDByznC1ePLCvtTttsrJNA9TPj8X71QxYh9531qRNZpcLsnqTQn4x3
         +xIA==
X-Gm-Message-State: AOAM531bp9iJrJ2eEu5YqBcC54+mDntNXC1ykfiV5q9qYwvAq3qj3il+
	BzjR2sq2gfSkXz0gF7hlINw=
X-Google-Smtp-Source: ABdhPJwAs2Mu3y2pfrcfs4Vpe07BG3d7WnB1Nn1kNYu1Uo1TTQKAzUkY80nETMmR50KRsypXYO5OFA==
X-Received: by 2002:a05:6830:23ac:: with SMTP id m12mr9518853ots.357.1634710240717;
        Tue, 19 Oct 2021 23:10:40 -0700 (PDT)
Received: from localhost.localdomain (c-76-30-1-35.hsd1.tx.comcast.net. [76.30.1.35])
        by smtp.gmail.com with ESMTPSA id c21sm288182oiy.18.2021.10.19.23.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 23:10:40 -0700 (PDT)
From: sesankm <sesank.mallikarjuna@gmail.com>
X-Google-Original-From: sesankm <26676400+sesankm@users.noreply.github.com>
To: lars@metafoo.de
Cc: Michael.Hennerich@analog.com,
	jic23@kernel.org,
	gregkh@linuxfoundation.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sesankm <26676400+sesankm@users.noreply.github.com>
Subject: [PATCH] Staging: iio: adc: ad7280a: fixed coding style
Date: Wed, 20 Oct 2021 01:10:27 -0500
Message-Id: <20211020061027.34148-1-26676400+sesankm@users.noreply.github.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fixed issue with coding style

Signed-off-by: sesankm <26676400+sesankm@users.noreply.github.com>
---
 drivers/staging/iio/adc/ad7280a.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7280a.c b/drivers/staging/iio/adc/ad7280a.c
index fef0055b8990..473f95118214 100644
--- a/drivers/staging/iio/adc/ad7280a.c
+++ b/drivers/staging/iio/adc/ad7280a.c
@@ -829,14 +829,14 @@ static irqreturn_t ad7280_event_handler(int irq, void *private)
  * The function argument is stringified and doesn't need a fix
  */
 static IIO_DEVICE_ATTR_NAMED(in_thresh_low_value,
-			     in_voltage-voltage_thresh_low_value,
+			     in_voltage - voltage_thresh_low_value,
 			     0644,
 			     ad7280_read_channel_config,
 			     ad7280_write_channel_config,
 			     AD7280A_CELL_UNDERVOLTAGE);
 
 static IIO_DEVICE_ATTR_NAMED(in_thresh_high_value,
-			     in_voltage-voltage_thresh_high_value,
+			     in_voltage - voltage_thresh_high_value,
 			     0644,
 			     ad7280_read_channel_config,
 			     ad7280_write_channel_config,
-- 
2.33.1

