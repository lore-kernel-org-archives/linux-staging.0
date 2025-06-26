Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E632ECE81
	for <linux-staging@lists.linux.dev>; Thu, 26 Jun 2025 17:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750959216; cv=none; b=qK/xb0zo6a3Gc0MFy24e7VclHJAFD71p+zfFLHluyWdd0KQNM6tQePuszmQ9h8nIbThhYZH78iCdFMF2aAkcIwoiXoThkf4OMi/LR7J26sySVrRwMV000MCD3bW4weSmsBajJumm29N6OlRIdj7PDfq1blCpK/Ter09c14j7ZmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750959216; c=relaxed/simple;
	bh=AQiq4z0xA88o3HSFvbhcfQRTGqMXtRqE6hPl7TrS0QA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XIuy8r6jDIDbb2J2A5tvKMlX3gPg3Yciqag8i94q4wZRoXXMKyw0e+h60hlA8aANUex9CxM/MqNA0RXqZ1cyySR1viP+b89aFKO8eBk2r3XT3LaZLmKJSPheLGSxyF6GySRrfioIkIGj3fdTQL3BOZnjaE63MmotjJ6IhNhnOUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HKWLtjr3; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HKWLtjr3"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b2fca9dc5f8so1191829a12.1
        for <linux-staging@lists.linux.dev>; Thu, 26 Jun 2025 10:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750959214; x=1751564014; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RO2tN+aSoxvaSEMRq7XEvMbHrJsjG9xLguEP52powFc=;
        b=HKWLtjr3iEnQ2Z3Q7poid/77hkU0IlHmo9KTbMSUzSNPOyhm3RFjvzU8HcX/OsKIMh
         2qyMASwPfnsjzSOy016XJQ9mixsXTPoTYjs9xZIfsZXNaNlzu+I23Oi5+8wIePLXB/HY
         FbggYHj7bGKtTdD9utPuVhenuSK/+w+xzDPtETLkBVZ0p6W+EUd1uwW6ny8n2Nei+nGF
         h51C/HQrubFqU3EsHwKxoGErzXm4Xfuj4VdkW78cZJw0BNlu5nOXj/R6+/+dcGPVIAYk
         upQl9K1Fb7iSQ2pQbhJhq3RkUPEZgWZrrchfp1tDEYEfo9TgPU7K45AC1eJz8VWrCeGe
         cQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750959214; x=1751564014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RO2tN+aSoxvaSEMRq7XEvMbHrJsjG9xLguEP52powFc=;
        b=P3WrMUanbEOShSVNrjlLS7KlLKGZy9gLtpv5IMj7YnukFyH+rlNjfY2HSYX+h2GUQt
         bMpPxNsukhZksVRj2zs8mNmJ6fuvt2uKnlCMPvBL7bhHgVBZkDiCqNcK6Lz5dLkVfdtQ
         ivfRqhCx70P3efsbcjGPj0rG64Inx2rzOiPyF5bvHWEE6LoEwKehNpL8fHiIh1O21aSz
         /CrthO+H1tOndXEYlFu+8JTskIMUkiqylkh5E19SsutNRGa6PS5LW9XM5o7d9rMqQj5r
         IcsrWoRV2jbvh5VAe73BxcVC6VTZU/qNjmptX1ZlWnMK2SBslSpJFXD+gD7oIig98wBO
         ahpA==
X-Forwarded-Encrypted: i=1; AJvYcCVrJ6TdHAMAzWSiEf97z1MotOHol9m2s+PJKBkD1u2nwWXZn3Chwupir7b+de66K+EdvjEaSqGYyhLhvc0Z@lists.linux.dev
X-Gm-Message-State: AOJu0Yxf7451HQFoA0TltLlHFXc1fxTRcsoKKAR5Vdiu2tvA00qjdIYi
	Z4WjCA5E+Ujy/3VkuuwnsClNwr/BfT6RyZhOTRj/bsbwrLDFW9QBvvT2
X-Gm-Gg: ASbGncs3jBsfB9XC0v7i+di3yGuCO0ua9RmoiI+ZdBgGITe8AGFjZd1Axkn5rQfFmGo
	Kg5Tsukv5MTPzZKaHLbyXEylee/7og+nXyyzRrxoNU7kRUrhExLD/BshFTmCl6lLJbBzDEeIuAp
	BQvSlNV6f7KLwxyCqitbZbR2JN4W4zaR3rhidTdMsohmMjRNaQKjeDU5PkaqcEaH8PEnqcs7FE3
	LV6qKvCY1RCIbv6z9GuelKJx81NC3QscTjp3AxV0/UTT+/wgQr4xizZxj5ku/DSJqgNYI1dbWye
	zX+3kO/hQcGA6jNoiKp8ueT79q8Wd0Y1xkLnl38cU/a5i9jJyNZ57iSvDAP/950aIg==
X-Google-Smtp-Source: AGHT+IG1DAgBupnSqQgcHCQfLJdAyinWnaEnkp06DOFnaLcpFpHJqPABegrTjg5EqIcIrnhafsbaBQ==
X-Received: by 2002:a05:6a21:170f:b0:21f:54e0:b09a with SMTP id adf61e73a8af0-2207f1bb117mr13924042637.15.1750959214258;
        Thu, 26 Jun 2025 10:33:34 -0700 (PDT)
Received: from icarus.. ([45.64.160.138])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34c4472eafsm2172155a12.53.2025.06.26.10.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 10:33:33 -0700 (PDT)
From: Pratibimba Khadka <pratibimbakhadka@gmail.com>
To: mchehab@kernel.org
Cc: Pratibimba Khadka <pratibimbakhadka@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] staging: media: av7110: Replace msleep() with usleep_range() in tuner function
Date: Thu, 26 Jun 2025 23:17:25 +0545
Message-ID: <20250626173229.10967-1-pratibimbakhadka@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace msleep(10) with usleep_range(10000, 12000) in the PLL lock
waiting loop of nexusca_stv0297_tuner_set_params().

usleep_range() is preferred over msleep() for short delays (< 20ms) as
it provides better accuracy and allows the scheduler flexibility for
power management optimizations. The 10-12ms range maintains the same
timing behavior while giving the kernel scheduler room to optimize.

This change improves timing precision during the PLL lock detection
phase without affecting the overall functionality of the tuner
configuration process.

Signed-off-by: Pratibimba Khadka <pratibimbakhadka@gmail.com>
---
 drivers/staging/media/av7110/av7110.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index bc9a2a40afcb..7f6c610579c8 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -1827,7 +1827,7 @@ static int nexusca_stv0297_tuner_set_params(struct dvb_frontend *fe)
 		if (i2c_transfer(&av7110->i2c_adap, &readmsg, 1) == 1)
 			if (data[0] & 0x40)
 				break;
-		msleep(10);
+		usleep_range(10000, 12000);
 	}
 
 	return 0;
-- 
2.49.0

