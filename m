Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90AE248886
	for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 18:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772044848; cv=none; b=qthlsov3yYvZiAGJQ7C0z8+De4R6z9WBGAmAMxjmOj4xDzybbPLA0p6rWPJaZJ7ByGXMCMgQVJraSs0OLUmeQw6h9VoZFxsqGZ2bbnKwWTNnu6b5dH3Ly7rY2ZDzG5N0C3ulFYvZvKrb5Pbs9RXR14Lhjj+6eB442NrFHmBwFnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772044848; c=relaxed/simple;
	bh=Ta0YbASn1qZAbcPSQuAwHJNVzIkYSAUPG7JIA/lS+SI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gM1MGEgUsy9nFLIvZEBouiXP3F+MqXeMIl7ZnkuaPycOVmoNsTJFLyVHnYhVn5xKauttfVD+fF+ComqMjrXTOHsEzVkCOQR4+3mJhCHzRi+E2tizOEiaH/4YfdzkoIIlZ7hEhCqZEn4Y3t7DqCIPjXS76a13wYUF8s6/H1lwLDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HGZP0gZb; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HGZP0gZb"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-82491fbf02cso46190b3a.1
        for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 10:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772044846; x=1772649646; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKtDVfmPVgPIEBZ9rN4VgM/NHjO9Hae2x87Y+mFQu+Q=;
        b=HGZP0gZbcUpVs0Ad4pk6zZWtT+arfwoDzktnUKOjLIl7caLvNr8OuNAS8jcoa8pJ0B
         NUC+JVnWss5mGB7d2q9QUSwlWzN68mNOxIefMJ4Ws248UH4WEoZveegdbWMTQ3fxcgCp
         gxH33BNgmblZ/xDS+VGZ17dY239E0OJ3cJVS1KvaBqWYYDFPsyyzPPpt+FYOlbaN0u7J
         X5voxPRRGDDWmZCIOiS/EAsnLPLegVKDq7EktNfTeRySnmS4hN8ZG5kuz7AI5SjerhJi
         QgbkrS7bHuOaSHnW48GGqPbScrrKaEQeYcdGvmo7Wg/z70sx1sSoRxPwrVot/Lcpsnub
         o4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772044846; x=1772649646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wKtDVfmPVgPIEBZ9rN4VgM/NHjO9Hae2x87Y+mFQu+Q=;
        b=amtRfMwg8mHN1fQIp117/gKA+GqMELP++a83awyclaz8Z4UlASTwliBAc5TgM8N4mp
         kvLJksSh0ikXwdrwhFGFF7NICBA7xQdeFZ1O9748BUvUBzdFR4DSefkM4ItdKJtVd5+T
         2rD8RsEDjAS7C/UhvhgvKU9dmUlLuB43gaMawYNKTfw4I0DHmoHdpbeNnz0e0GYwR5sh
         t8KraYLifEdtB5aMHRBrgAEY6nJkbqz8AIwIDWt4+grLjUmRw9a6yrJwtaI7aOO+futd
         dKGLsViRXUCZ4yIzJ7mia5HVppZe0ouVF1mrxeK5dXjM+9oieu5/MxmuEeOZm8KTN0yP
         s9eg==
X-Forwarded-Encrypted: i=1; AJvYcCVZsN+FPwPswgHEsISjI5idijTJO9CKSPwq88oBFVc4o3d45FMT+lIHrNwN/vhukFQtYMntiwwXdKjt2LMD@lists.linux.dev
X-Gm-Message-State: AOJu0Yyg4HGxMKaW9BRO3Ig+Pin2G9QL/y4h/viX5LPVnh6x/XyLmmOQ
	K0UMYoYwQJtQZXNbacQW5o3pbMu4zKqMocsuc3+Mv9kuP61HyLEjzZDf
X-Gm-Gg: ATEYQzzj/yrF8CxJc4q2c0vlCcPbZ3QHPK8onHnTZAu1fanc2IEYe5Q+SfTDQhSLf7L
	qi/2fvloyn6l2SWyaIgyRh5JWvvEeQtreK4I8+Dnc4mZ6HdJYtL7MgN8SarVONjd9FSAzvYzJIT
	82toxSmXlz55MTWk/+UF0JWZDpx1ioOHgTePV3WzO/zdhzuSxwJ5camKGmdJaOBwEFgBiptv9sZ
	tzn9WhmiCW+8gQL1iFY/ipQH75oZgG2RndUXQ/LXHK6UmvEmM23bsnqP/E5Qas29+C8xjaWD3K7
	h3Lre4pkIqQR0+8CiCA0AAnHAf72JeGpoHilPTmYvVa1icK8QyYllREHICF6IkULVC0C7FQUEVY
	kuez8VnL4Gk4tRjXChCGdXVOYWkQBVwVNcIFoKuvS6goUb0bYEnGAi7wyO9f0zggqG7OgbRUsPa
	Cr6Y2/4jfyfgnhIxopslc38C2pWlV6Mallb/Q=
X-Received: by 2002:a05:6a21:610c:b0:395:151c:4ed5 with SMTP id adf61e73a8af0-395ad1ad008mr1109867637.37.1772044845950;
        Wed, 25 Feb 2026 10:40:45 -0800 (PST)
Received: from fedora ([2409:40e5:105a:d068:a95a:8654:94eb:1089])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70b724321esm14010380a12.16.2026.02.25.10.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 10:40:45 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: David Lin <dtwlin@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: [PATCH 2/2] staging: greybus: uart: convert to XArray
Date: Thu, 26 Feb 2026 00:08:36 +0530
Message-ID: <20260225183836.20434-2-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225183836.20434-1-chakrabortyshubham66@gmail.com>
References: <20260225183836.20434-1-chakrabortyshubham66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the deprecated IDR API with the more modern XArray API.
This simplifies the code and improves efficiency.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 drivers/staging/greybus/uart.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 1d2c4ef70865..fe554eba555a 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -67,7 +67,7 @@ struct gb_tty {
 };
 
 static struct tty_driver *gb_tty_driver;
-static DEFINE_IDR(tty_minors);
+static DEFINE_XARRAY(tty_minors);
 static DEFINE_MUTEX(table_lock);
 
 static int gb_uart_receive_data_handler(struct gb_operation *op)
@@ -342,7 +342,7 @@ static struct gb_tty *get_gb_by_minor(unsigned int minor)
 	struct gb_tty *gb_tty;
 
 	mutex_lock(&table_lock);
-	gb_tty = idr_find(&tty_minors, minor);
+	gb_tty = xa_load(&tty_minors, minor);
 	if (gb_tty) {
 		mutex_lock(&gb_tty->mutex);
 		if (gb_tty->disconnected) {
@@ -359,14 +359,18 @@ static struct gb_tty *get_gb_by_minor(unsigned int minor)
 
 static int alloc_minor(struct gb_tty *gb_tty)
 {
-	int minor;
+	u32 minor;
+	int ret;
 
 	mutex_lock(&table_lock);
-	minor = idr_alloc(&tty_minors, gb_tty, 0, GB_NUM_MINORS, GFP_KERNEL);
+	ret = xa_alloc(&tty_minors, &minor, gb_tty,
+		       XA_LIMIT(0, GB_NUM_MINORS - 1), GFP_KERNEL);
 	mutex_unlock(&table_lock);
-	if (minor >= 0)
+	if (ret >= 0) {
 		gb_tty->minor = minor;
-	return minor;
+		return minor;
+	}
+	return ret;
 }
 
 static void release_minor(struct gb_tty *gb_tty)
@@ -375,7 +379,7 @@ static void release_minor(struct gb_tty *gb_tty)
 
 	gb_tty->minor = 0;	/* Maybe should use an invalid value instead */
 	mutex_lock(&table_lock);
-	idr_remove(&tty_minors, minor);
+	xa_erase(&tty_minors, minor);
 	mutex_unlock(&table_lock);
 }
 
@@ -984,7 +988,7 @@ static void gb_tty_exit(void)
 {
 	tty_unregister_driver(gb_tty_driver);
 	tty_driver_kref_put(gb_tty_driver);
-	idr_destroy(&tty_minors);
+	xa_destroy(&tty_minors);
 }
 
 static const struct gbphy_device_id gb_uart_id_table[] = {
-- 
2.53.0

