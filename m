Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C947F1863A
	for <linux-staging@lists.linux.dev>; Fri, 24 Nov 2023 10:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T8atSkyE"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-54a94e68fb1so3745490a12.0
        for <linux-staging@lists.linux.dev>; Fri, 24 Nov 2023 02:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700820986; x=1701425786; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQhIen8bUSqCDzW7zy5bjryP0TL4VgTr4AnDnzWte8c=;
        b=T8atSkyEH2xvr568QYTxec7PYbdjfJTLGaZGco9+Cg8vlyPj0/MtQeg2CRlOzjyeja
         nrBBoZ5hPLqHRxKv2m4PhkEdc0c5eI9UX4pdp3csTddX26BV6s74XP57jwlLhjuKYSci
         anM51GRezxI+yh9uUS0xm9DakcRcrs7d7ThFuFdnTfg1QkeC7EFGb5GiPnpS3oxOPsPF
         kNWTg14cG7W9m9xBx3x3H76z5bobYiQ8dGVe2ALYqqKFh8gbLzT62l9tWFCeiGNEV7MV
         67ySuizsVVvDVva7oi3XcaM7M5C7xkHiacBSUaM85+hgBoClYXdgd/Su3FMsBBEO+exB
         j7Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700820986; x=1701425786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hQhIen8bUSqCDzW7zy5bjryP0TL4VgTr4AnDnzWte8c=;
        b=d5FAH9FNLMGqBmwcv1WuQvZfLK1lfrNNkBGnmQkJfau/QUwdAYTT3vPj54FhlqJjB3
         VPpYMe6VVtlPzPBybB5H51ZdQl/iHbkTuj2br8CBUUpyXX2dyel3ub9tN6vHmX2VYftX
         19J9+Caw84agT/hLFo0fK9kReAcqFIVj777/nsvNhK/echmT63e/ihfDSuBAj1J8jrT4
         2l55M9vos1fJDlWfj4GwxnjqptVGQH7umQmTWJ4TwqGA6ZK/y3tqXroUaWprzINOOHsM
         B+zzd2Wux99DgGFw6t/zwKu24yhn48rOIvCbcR/nbdMSIG6pgIGV7qPg97Ch1jh6EwAm
         Nl3w==
X-Gm-Message-State: AOJu0YzYtgJ40aeJw1Q7Lni31i0oqz+UlRyVTx2QQpVhxO8gk1X67Wg1
	HkT57PP5XPK3BkaEEHIpzZc=
X-Google-Smtp-Source: AGHT+IHz9/ZoaYSQJbFyOHsePDZMaOznbJoXwDJXSZ85fMNDrqkQyfPkDwrbhFLw3bibv4ewkyWC7g==
X-Received: by 2002:a17:906:78c:b0:a04:e1e7:d14c with SMTP id l12-20020a170906078c00b00a04e1e7d14cmr4941004ejc.32.1700820985634;
        Fri, 24 Nov 2023 02:16:25 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-72cf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:72cf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id oq12-20020a170906cc8c00b009fbf15cee7fsm1887801ejb.69.2023.11.24.02.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 02:16:25 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/10] staging: greybus: Don't let i2c adapters declare I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
Date: Fri, 24 Nov 2023 11:16:11 +0100
Message-ID: <20231124101619.6470-3-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231124101619.6470-1-hkallweit1@gmail.com>
References: <20231124101619.6470-1-hkallweit1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After removal of the legacy eeprom driver the only remaining I2C
client device driver supporting I2C_CLASS_SPD is jc42. Because this
driver also supports I2C_CLASS_HWMON, adapters don't have to
declare support for I2C_CLASS_SPD if they support I2C_CLASS_HWMON.
It's one step towards getting rid of I2C_CLASS_SPD mid-term.

Series was created supported by Coccinelle and its splitpatch.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/staging/greybus/i2c.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/i2c.c b/drivers/staging/greybus/i2c.c
index de2f6516d..22325ab9d 100644
--- a/drivers/staging/greybus/i2c.c
+++ b/drivers/staging/greybus/i2c.c
@@ -264,7 +264,7 @@ static int gb_i2c_probe(struct gbphy_device *gbphy_dev,
 	/* Looks good; up our i2c adapter */
 	adapter = &gb_i2c_dev->adapter;
 	adapter->owner = THIS_MODULE;
-	adapter->class = I2C_CLASS_HWMON | I2C_CLASS_SPD;
+	adapter->class = I2C_CLASS_HWMON;
 	adapter->algo = &gb_i2c_algorithm;
 
 	adapter->dev.parent = &gbphy_dev->dev;

