Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793433529;
	b=VStArZl3K/xhR1W2PzyMYnG8+Z5EVlhWnns9IqFUwC87qrS5GTRPfOwqtRi3kLq4QnLi
	 tqGewZn+eHwng7YGDwfWyK1ySdlBS0VK/cTOMaEaf/x5EdvX108za7SVdboCDqxrzeQak
	 1GreLC+Q3LQOIK9aB0Maz3NaJHrdRr7IaCLjwMAg7qHboU50syb9irj/MlV6OpETM77o5
	 8ByiSRrGDhb8X7dn0Uye3eVb44FGp93jMevQrpZ0xUsgP8q1ZFmgun81hwkZYq9922vL6
	 i1wqkDqhelZYBijNrvorXXWk8Tlz4Rg9JUjzYystJARdSeHPDoxVHubDYJLJ7B41k3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793433529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YkC7yBaZrE2XAa9kIglc92DWg36i3099yYhR26+EG0M=;
	b=vjS+rqVJoH3NjGPUTWxukDwCaL17EtQWv3rFy4F9IMJRyxzDZBDxgiPBMqyg2zKoWkDQ
	 wo8B8h/FfRob12GqFd+XUQFxS2UF0CS7rp1M82to3baAPY6hFF5GcKg98yQaXv44oKGvk
	 DL06xYGGXRslFO+WV+zGLqIiI+R+RuuOfTo1smIRuAjQw4mHq8ihWGjcwzCb/zG2uPWQG
	 nmZrGapNnyIoHHPfetUeBbmCD8jqNXBr5yvebz3PF8Xg64+gfw6nEXJXGpGnjZA9NH6Vn
	 M7uaEERYDvkQit7pbC0KwE3hS5RY+8JfDE14cZrL+ERgliwAau2hG9fcBW5SoD5dnDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZMNF5iOs;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851BD606A31F
	for <linux-staging@lists.linux.dev>; Sat, 31 Oct 2026 07:58:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 851BD606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZMNF5iOs
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso1879831eec.1
        for <linux-staging@lists.linux.dev>; Sat, 31 Oct 2026 00:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793433529; x=1794038329; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YkC7yBaZrE2XAa9kIglc92DWg36i3099yYhR26+EG0M=;
        b=ZMNF5iOsz9bVB8+SEzZLKziCZuqhrdqhrRSXXV296t3XXyz28oCt7s3NBtOWYwaJDt
         AwWVX1Z+2l1Tzb7xNM0u1+hdxWjsLFa+bMyO3FVKKWCtyLMUuA9XNcT4fdwa9zD8qc2Y
         dUhGhfTPtkboaz3iQSjua1R23a0FUDHo/oH3pJC2DzzaV1DMJGNLyAhz0UWOqSbMsX/3
         uxJYrTGCn4dh+ZrDdKINDms2/lGRk+ytvvvpsOf1iyn05KUBOc2TCGZY8FtErAHvRG3q
         AG4tdcJSgrtK3K5jE0G06XlNlwlPKTF+tktcatcULXRf9MvMXfiNwHGbo2WqcjJKl6bH
         uG3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793433529; x=1794038329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YkC7yBaZrE2XAa9kIglc92DWg36i3099yYhR26+EG0M=;
        b=Iy9S40WDFOzU7shG5FxOmbUIYp3vrgml6tSsSkWFvH2yRBeCq6iZayYdttE3XV3gSz
         AKMGIL39+wwD7C4Q23daezI3LpnBgPwmA6jt6YWUTaYqfxnIZMljur97Ty9i27yZWzZC
         wb0Jxk4+3g6saPgOmM1VcKmbhvJe9IBmb+WPcHV40qovYz8yjzYODIZ0pfWsG0VsnZnd
         taM0KGVP3yafj6XQorMCXAbIGyZH8apS+6sM6qZ0vD5DY40D4ZkcJnguZf5rLIqtKS9F
         jZZKtc9YmJlUxphVmrVJZ35KmZtjV99jQqCeqFBXIM7zlBKnNwhDDVPVZPYOqf7uBOOh
         LF/g==
X-Forwarded-Encrypted: i=1; AKwUvBwk5WA8PjJdSU4fbHnne1AuXGqSuSec7Oz/GTn6Tsy5T//2H0+VFs1u8Ql13zSN3rc1SPd12wFJ0Q2e3vI4@lists.linux.dev
X-Gm-Message-State: AFq9FYIaexWEbCYD++Bd7bJBzN4u5MG0kNSi+euGresj9uOR/CxT7LMZ
	ZCRZ9H24hWtQuztbRaYy4uxl4gXvzhZjFdAxIRbCE7b6mAB2/GVxyNCx
X-Gm-Gg: AYBFou3XuytX3lVmDLE21qgt3es6/gxqlQtGTQCvoIlXnuy0GNnTNQg63FrU55unISq
	0zXKHIqHdMfVn/s9l6iE6P5SMAo9/GawqNzp8zRVFlgXiJ9Nc1uFtaEWypMIqa4Zdwyp6y1FBGI
	ovDvsIwUZoXTLCIwGSUz4F0kKIJzOXpdESC+yEyg3yQESjcXKRUx2SX/ds/h36ZCM0lBjj69n4o
	Jo3ZonSkpWHE/dTN6kCPQgw3+ksTu0ph26kV4tBqLzyp0zDBaKsS0WU72HWaDP0bbMi3do8XwEo
	p6h81ygMiN7XShuGVu+gyh7OfV48eWU8Wnxr+oBTLxGy5MKOwdHzdUjZZi/s8IQ/wtcGwQWD6zw
	Dkd5x2Kyr2TYiEvfQJe9nO1cwNA3kjCjOeNgVKPeTAuH7AxfbDtVVQZcIbRJMDSdaEBbfucBVbd
	We4lW8cDHUqlCbmAtjwcYa1mi53hKemh3zCM/t2i1uLtWiKdCvPymsiFswt7F24dRqh7tEnzrKS
	evxgkoQpfNYcJLhEqcMO9kCUGNGcS00k4xsvwNY8lORIWSoqnfY5R7hdPDNdRggcuvyN7ClzR1D
	A+eGF7VNmKiZmRHlY21S4cFIXgYTlbxOORAAY+3dTKR08OkA3ktwMPIBlg==
X-Received: by 2002:a05:693c:894f:20b0:369:d992:e3 with SMTP id 5a478bee46e88-36a4242b2ebmr6391012eec.32.1793433528497;
        Sat, 31 Oct 2026 00:58:48 -0700 (PDT)
Received: from archlinux ([2401:4900:ccca:8aae:db4f:18dc:62fa:a502])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af91bsm14275467eec.8.2026.10.31.00.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 00:58:48 -0700 (PDT)
From: Nithishvelan M <mnithishvelan@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>
Cc: David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux@analog.com,
	Nithishvelan M <mnithishvelan@gmail.com>
Subject: [PATCH RESEND] staging: iio: frequency: ad9832: use devm_mutex_init()
Date: Sat, 31 Oct 2026 13:28:14 +0530
Message-ID: <20261031075814.34379-1-mnithishvelan@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace mutex_init() with devm_mutex_init() in ad9832_probe() and
check its return value. The driver already uses devm_* helpers for
its other resources and has no remove() callback, so this ensures
the mutex is destroyed automatically on teardown when mutex
debugging is enabled.

No functional change intended. Compile-tested only.

Signed-off-by: Nithishvelan M <mnithishvelan@gmail.com>
---
Resending because the first mail carried the patch as an attachment
instead of inline. No changes to the patch itself.

 drivers/staging/iio/frequency/ad9832.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index 35f823f24f..a90ee89803 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -325,7 +325,9 @@ static int ad9832_probe(struct spi_device *spi)
 		return PTR_ERR(st->mclk);
 
 	st->spi = spi;
-	mutex_init(&st->lock);
+	ret = devm_mutex_init(&spi->dev, &st->lock);
+	if (ret)
+		return ret;
 
 	indio_dev->name = spi_get_device_id(spi)->name;
 	indio_dev->info = &ad9832_info;
-- 
2.56.0

