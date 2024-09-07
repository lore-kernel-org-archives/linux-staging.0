Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1152E634
	for <linux-staging@lists.linux.dev>; Sat,  7 Sep 2024 18:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725733523; cv=none; b=qUv5kNXLZYo1BNr7E9IDQdFtFLUl28DKI9P5gaSXCdUkioxjvZKuOBpvNhyuiVrxMQp+FeFw9O9++otbQJI/KXdRT9t+2MKXxj4INpKefhY4OEeP99JkAmG51OndvSQXdVm7gW1Z9UO/wyoxLEi2kTUNjdLhmUy0IRmi8dNBoXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725733523; c=relaxed/simple;
	bh=gcpGFBFg0H0/IruCN+pZW8EPsyzEBVVwuZQxUCf02CY=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=Wv3HvcpItzjXgeCXEh5qGaO21k3SDH6hE+vuMDZtWF9Kn/IrBeVXwOYcC2588Nn7Z1iXC1J//Mq7FOe5Ikj69f3pM/D1kh+9eMkL2aNuZKv7s1iP+Rl9c+isjvvBohHHzGcNyRDUQi4RdJyhxQHrTHvjl9TYbfvjNKQ6dqRc3W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X69i1DWy; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X69i1DWy"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7d50e7a3652so1733719a12.3
        for <linux-staging@lists.linux.dev>; Sat, 07 Sep 2024 11:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725733521; x=1726338321; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=edP83QBzX7UwJjaTERgXqlxTEp9fmaImIzQGn5iQK0E=;
        b=X69i1DWyOCxLR2T0Ybd/pNbIzDQMDrH4wB56YASTF5QFhr8dkDGbVe0xSppKezNPrG
         3lPtBBJNHLiDCKXkEKlk+IUA0JCl5RHlefMs0VA3R/2I+WpaimUfZ73SKnmDERniQZHL
         QV6ELDvMoJP/F4OnV4vF8fe8pciNS2aaMboYTezh74vBE1BTc+hB/mZv+MaJuwgkLKiZ
         IXvEn3mw2V5izMG7Us9XD3aV+N39/oQ4VWQGi4xoPnSRH4O0UWGlbsFIU2H8dPdpA2G0
         adZPwY/6S2fH8XqGQSMkhITY5GrIrIPWPGNkZ9CY4FUjQ2rVnY4JiaTigvrD1oirZDZW
         Kn8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725733521; x=1726338321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=edP83QBzX7UwJjaTERgXqlxTEp9fmaImIzQGn5iQK0E=;
        b=n8PEubxlGlMGwbI9w68F5zcLGGOvJo+YJ7XyhoqXKjTR3IRxg8ZwS+Lqz/77crVwT7
         BOfGO0o3MYoo+kZ3Mt48HY8BAXV2vRpQtPVdCISMSiwTFys+bZh1OPXcHDTDAweqlbHj
         tften5jSiwPyefFisF/G+dlHeU47qn3nsGyISc8qMOcGDxjtIBVzzmUkDxnGt82qZ3bF
         W1rpXVS729gzPf9X0bb7frF+Y4D8Flmx17JfggtFxAqC9109qZS2VKewutBGxDDOHgmy
         Gr/WMu3qxxwXfSBlZ3z3ReDkoA/t/87KHCmgGNeofzX0JDpr0mPgTvbBETEKSG6fndMa
         YGpg==
X-Gm-Message-State: AOJu0YzoUngF1SDfb31aWzNEwaBGxwcIh6Kldzv7PDJiJci79hd6JH5U
	xfTsiGE+dlUg95cC2TCB5qkRfJLZZSD8hnLqBoRovgCXjz83uYQeG8EAdT8Y37bjsA==
X-Google-Smtp-Source: AGHT+IHvbws6SGNTlD8nj7ciGO77hQwNEVucbajjZGHwsSKLDuYg253/0RxgrJrG7wDZ2pq6YNaBLg==
X-Received: by 2002:a05:6a21:7101:b0:1cc:dd58:e23b with SMTP id adf61e73a8af0-1cf1d05aaa1mr6607945637.10.1725733520958;
        Sat, 07 Sep 2024 11:25:20 -0700 (PDT)
Received: from fabio-Inspiron-3583.. (189-68-106-247.dsl.telesp.net.br. [189.68.106.247])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-718e5982103sm1170240b3a.142.2024.09.07.11.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Sep 2024 11:25:20 -0700 (PDT)
From: Fabio Joaquin <joakobar2000@gmail.com>
To: linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH] staging: iio: Solved warning of undefined string.
Date: Sat,  7 Sep 2024 15:25:14 -0300
Message-Id: <20240907182514.8257-1-joakobar2000@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The remove of the line of the referenced string was the forced solution of this source of warning.
The string wasn't defined in the bindings directory, so this was necessary.

Signed-off-by: Fabio Joaquin <joakobar2000@gmail.com>
---
 drivers/staging/iio/accel/adis16203.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/iio/accel/adis16203.c b/drivers/staging/iio/accel/adis16203.c
index c0e4c9266b5f4..0255ed6dc300d 100644
--- a/drivers/staging/iio/accel/adis16203.c
+++ b/drivers/staging/iio/accel/adis16203.c
@@ -293,7 +293,6 @@ static int adis16203_probe(struct spi_device *spi)
 }
 
 static const struct of_device_id adis16203_of_match[] = {
-	{ .compatible = "adi,adis16203" },
 	{ },
 };
 
-- 
2.34.1

