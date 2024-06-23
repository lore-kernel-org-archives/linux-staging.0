Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5089D184107
	for <linux-staging@lists.linux.dev>; Sun, 23 Jun 2024 17:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719165431; cv=none; b=umlAMmMyVpU8ncqr4sRFwF1WEEKc4rrvTS+3er5a9EInEx7FecErXSZHktri4E30A4W+M7ZFeizCwtFqLTQIjuh8x6bS1lUmi88JYVhMJppyPP9tb6TvXIPlB7vMIdWs92dIhCnR0zHHCchanBxKViQ4FescYFgzlqQFHvw7mCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719165431; c=relaxed/simple;
	bh=MFDsON5eJ5q6Dsx0C7oF5pE6X2tzjdY7tJL46c9ssVU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sj2wfBQhpltLhicCT9d0FGDPYtT5kpEu5olNmtAB+tpcM7O8QkD0v1foT4m8aMUYWom2mRDIERedb5E+cdv/s9TCwrVSdAMEGaBMAQttlCogS07i8r6HXK+QTRROY4qfK61L+Y/j4yqZ8DGiHcIcWa0wI8CpSpmXOTcl9xkBGy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ldVyLL4o; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ldVyLL4o"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a7250bad44dso818666b.0
        for <linux-staging@lists.linux.dev>; Sun, 23 Jun 2024 10:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719165427; x=1719770227; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z+UaUsS6E3j3bsDShHg2M/UApPqSHw5Z20YwkeFVoac=;
        b=ldVyLL4o3qel4zy5OPK27WvXz7SegEdDAaS6ns5hQVF4MON4Y88hnZOKjVKYQ2mM6t
         p3CZFPu81aLWtRDqlUxvFx+VlgzfoAPQjCFGvpTb68eOZlXAqsI4F60DwOrnGFIWU3EY
         Goku8v7WmXLrsGVNB1ZrsK/2itUCwAKNiOmB6DLFaBsoQg9ttVRGVmMqt66+05Z5oCAa
         4zAPSb92R8g2bae2AtURae9+n3KJWuUFLcIEY7d3gvXBBCsSG1EZLpEv71CBVYdL0fix
         S9fPb65c9Yko2z6PxO3k5yNFhyC+6YuGjsz/qvVx6/mW6DbystEvyLlK9TRI4PckBPdf
         cTqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719165427; x=1719770227;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z+UaUsS6E3j3bsDShHg2M/UApPqSHw5Z20YwkeFVoac=;
        b=QEfzONi6BT4mWt7szCApbCe4EzFzBIugg9XT8zTh8vOj7byjjmSjMbVuD5aVZ4qQgX
         ZnjduVGpDVaaTFxGvXqLTt6lgbGbYHt5xmTmzZlrGkEvoonH9Z/lokCvrfE0542CbqpR
         3Jj3y8O+x8ng48b40ge1u1xUS6icV3ieBbmLTG8QBrSJqYf4+4HleQbCUXWsDFDSMFhH
         jxBnSZNde/KTkd0Yn/dNtO2ER+pKoE6d7HBVyPZouEIHTLXVgexMQyEk1lRLBKkAR2YG
         J1O2C3siMwqWGBV1Y5ppVG4fVIcr8l/sZiZL/1z9HtFom8CxYhlZ08b3W6tltiDKVV2X
         JgRw==
X-Forwarded-Encrypted: i=1; AJvYcCUaat0rSF0NnSwu2ELig7ItvDAZ+B4tno77jGWnZf1JppBOrk5bkwlVE7Gcd+6ud2IwKQ9Ow9ZVFDZcq3vw25u1p4N92EBLquR79VWk8Q==
X-Gm-Message-State: AOJu0Yxam31gFUstWaVy6lea9XY2x2nFXpPInioFlsGc7TD+f24P8MLg
	Ac/9t4vM91DaNRtgsbSzcoaRwzlA0+Qjn/LvURpZKHcn9lE0Ybik
X-Google-Smtp-Source: AGHT+IHTJwIOZ3cZJ0c7JvsG128bWDCwoJiKqvdWDwjeUApoTv1m1gcC/Dfy95oCe7cal8NwVyfwlw==
X-Received: by 2002:a17:906:258a:b0:a72:51d8:bf30 with SMTP id a640c23a62f3a-a7251d8c3d0mr59135466b.0.1719165426439;
        Sun, 23 Jun 2024 10:57:06 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935a9b.dip0.t-ipconnect.de. [87.147.90.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fe779bc80sm202386566b.174.2024.06.23.10.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 10:57:06 -0700 (PDT)
Date: Sun, 23 Jun 2024 19:57:04 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 03/14] staging: rtl8723bs: Remove unused declarations start
 with sd_hal_bus_init
Message-ID: <37d2c677e5ef57a9aeb6857d7857d4512b8e3954.1719155208.git.philipp.g.hortmann@gmail.com>
References: <cover.1719155208.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1719155208.git.philipp.g.hortmann@gmail.com>

Remove unused function declarations.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/include/sdio_hal.h    | 4 ----
 drivers/staging/rtl8723bs/include/sdio_osintf.h | 6 ------
 2 files changed, 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/sdio_hal.h b/drivers/staging/rtl8723bs/include/sdio_hal.h
index 6fae19dd0cbd..024acf9b530d 100644
--- a/drivers/staging/rtl8723bs/include/sdio_hal.h
+++ b/drivers/staging/rtl8723bs/include/sdio_hal.h
@@ -7,10 +7,6 @@
 #ifndef __SDIO_HAL_H__
 #define __SDIO_HAL_H__
 
-
-extern u8 sd_hal_bus_init(struct adapter *padapter);
-extern u8 sd_hal_bus_deinit(struct adapter *padapter);
-
 u8 sd_int_isr(struct adapter *padapter);
 void sd_int_dpc(struct adapter *padapter);
 void rtw_set_hal_ops(struct adapter *padapter);
diff --git a/drivers/staging/rtl8723bs/include/sdio_osintf.h b/drivers/staging/rtl8723bs/include/sdio_osintf.h
index 146b44f95e29..198cf3889a27 100644
--- a/drivers/staging/rtl8723bs/include/sdio_osintf.h
+++ b/drivers/staging/rtl8723bs/include/sdio_osintf.h
@@ -7,10 +7,4 @@
 #ifndef __SDIO_OSINTF_H__
 #define __SDIO_OSINTF_H__
 
-
-
-u8 sd_hal_bus_init(struct adapter *padapter);
-u8 sd_hal_bus_deinit(struct adapter *padapter);
-void sd_c2h_hdl(struct adapter *padapter);
-
 #endif
-- 
2.45.2

