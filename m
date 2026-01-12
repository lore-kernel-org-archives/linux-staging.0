Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06802C21C2
	for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 10:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768214350; cv=none; b=I3gU3JejtQRYeiLzBQXV4kQUIO9rfAv4bgZXy+WyNPKpMUCI5DnU13RC2fzcKYv4NfJHIL4V7DvXY17my/ZVazc+Eiic6b74hYsslAYBRZlsUH4KjI3rVMmhIbjFZ+1yV5K2Hd2NLb1Fz5B2FABqxo5jvjzdVWcQrkCh9wVvXu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768214350; c=relaxed/simple;
	bh=6GN5OLks7CVN3xZnRAG8Elxtq2enD+onkx6FZ/seN5s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qL+VK6ogqzkT8FdXzZpEWwkuFoWftUC4NwHgUlzoufnFTXvnDjNG5FlOR7st6cf0eC1duW+5ZGWse7gwv9QMq+yIjjiNdXisU85283OIE8e6HC2Ac+6dGe7BJpf9unwHDqA9csiqMTPKQPVV7P/nc4yDBR9/PirNsxPUigi1+os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UsXJiZsJ; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UsXJiZsJ"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-81f478e5283so1103641b3a.2
        for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 02:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768214348; x=1768819148; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ui+V6GEq0tAFtoS7qG9vSLrHLiqwJZVjJzI24qFkSgk=;
        b=UsXJiZsJUNf3Dce4/UNhDIpXxQY3+StHNWZpr2i1sW6fJoDP1mYDg9IpsY9gVprnGy
         fdle0o5voLKwf5dmTYMlFTi0yPM6cZUBTaEzVMwiiTxMEVB3tTrY+VlV6Q90eW9py5md
         hAtdrHNJC8AIruOnTEZCsGvh2PgMMQpTEHS2Ik4m3ilUnwZce0he5SURCARdWbhvJwfe
         JOLPKEO2dWXAYI4vNBuEt2ePyIPkpZFIRckpqadRTqUiMoIGTe6gazBlZQzP2/B82UaK
         Vfec48Z2wxZtsW2BvHhvizby7iM/lgSWJLF956n47rlEZLKnTtRDokwUZC3t4kXG88K2
         OSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768214348; x=1768819148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ui+V6GEq0tAFtoS7qG9vSLrHLiqwJZVjJzI24qFkSgk=;
        b=HGyRbmVM/gHA8LxfK3OubEmxU1fWVnod13h8/xT+VCwDRiXmMJfPTGH4E1tqzBxlYH
         8YOUuleZHrgHaJaVMQEw2lzU2F4PjTHgkX4Nu0BQ71Q/HOXEBJtVLeZi0LiWzG16M7v+
         iLLIIc5U6ojxJkYlzBPB10r94kIP0xlqfRe45GEbu8ramn6hXjkTz9t9ySbgaklhkfaL
         9LCmyCDpj3SwIOjbGskLUSTZ+E8f7iCiiZqTsgTPWvEKR8zWtS/pXui460Z9SA0KCfvH
         nocDP+E0kZ1jaGF0pIP4/dpyfybbXLE4ClCkentlGKRBNa8CbwJq3s5NCwUw1I7hbtSM
         3bww==
X-Forwarded-Encrypted: i=1; AJvYcCUKzHR5kPW9qTL6tlW3Ud3iMd98l3813VQ9x5QT0x541DNrY1i1zFS1SEeIa+XHrO4Kt8ApfBuLTVe3L6XU@lists.linux.dev
X-Gm-Message-State: AOJu0Yzd8/aZhZKArGVWDLEroJqwKgyiqKPG8lEMFIudmYYE1JSMUKx2
	CFwsKSCTtNvZBQNUHWS3oRaFcdKHwqe8O1E00OMZqa0nYE3Yup3OHbYT
X-Gm-Gg: AY/fxX6f1NX2yk/iB/Fe+h04mYt7zvq3y20oBg9j9WHP8Nw1QPz8ynt0pBQcp37nL+R
	TPTJ5DBqHW/OTSQmcMKqijKb0wI795Pycu8NQp1SHRk1PaFsYfKmisNLfwenvbpgCaD1/D7HkxR
	gEPPI8GZy2+Um41uipkNZaDm6pO1mTotCAz5RmNR8O2EK+Niz/D1IG4S91L3mx4u582SCh/g4Mj
	02aDrSMRUlI0sZUIbJmKUB88vMPqtlWN8TNOsfhc2owwLdDH7ztb4nIOxW+VB3V3lXu9Y/my0r9
	AjJW4jG3e4DmqUtTIXfbT+k0UFvm4+scx7Zr7ALqdnliQfvZLgGIT4W2VaTqqrcxHfT7/yub58A
	8mUOd2WEizfe4raGMURIcmA8rpDdQYPx5N8eNZ0wc6L5U3tkeIQxSnGrOCauis5zMlPF85I2jUW
	ICHjZAuji+zpriFZxejm+XsUAmseSGrQ==
X-Google-Smtp-Source: AGHT+IGCEegZv9c9USe2WVt4K3BTU/fp3ltvQvAk0xMCdt6Z9AWSScfDPK+97I6LnYsi/elU1hJjHA==
X-Received: by 2002:a05:6a20:a110:b0:253:1e04:4e8 with SMTP id adf61e73a8af0-3898f9bdfc0mr14753443637.56.1768214348272;
        Mon, 12 Jan 2026 02:39:08 -0800 (PST)
Received: from localhost.localdomain ([103.215.237.209])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cb5352268sm16680309a12.0.2026.01.12.02.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:39:07 -0800 (PST)
From: Karthikey Kadati <karthikey3608@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikey Kadati <karthikey3608@gmail.com>
Subject: [PATCH v2] staging: sm750fb: Convert sw_i2c_read_sda to return bool
Date: Mon, 12 Jan 2026 16:08:38 +0530
Message-ID: <20260112103838.22890-1-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sw_i2c_read_sda function currently returns unsigned char (1 or 0).

Standardize it to return bool (true or false) to match kernel standards.

Signed-off-by: Karthikey Kadati <karthikey3608@gmail.com>
---
 drivers/staging/sm750fb/ddk750_swi2c.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_swi2c.c b/drivers/staging/sm750fb/ddk750_swi2c.c
index 0ef8d4ff2..9d48673d3 100644
--- a/drivers/staging/sm750fb/ddk750_swi2c.c
+++ b/drivers/staging/sm750fb/ddk750_swi2c.c
@@ -180,7 +180,7 @@ static void sw_i2c_sda(unsigned char value)
  *  Return Value:
  *      The SDA data bit sent by the Slave
  */
-static unsigned char sw_i2c_read_sda(void)
+static bool sw_i2c_read_sda(void)
 {
 	unsigned long gpio_dir;
 	unsigned long gpio_data;
@@ -196,9 +196,9 @@ static unsigned char sw_i2c_read_sda(void)
 	/* Now read the SDA line */
 	gpio_data = peek32(sw_i2c_data_gpio_data_reg);
 	if (gpio_data & (1 << sw_i2c_data_gpio))
-		return 1;
+		return true;
 	else
-		return 0;
+		return false;
 }
 
 /*
-- 
2.43.0

