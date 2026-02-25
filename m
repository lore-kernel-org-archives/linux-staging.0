Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17121392C2C
	for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 10:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772015449; cv=none; b=C9PeyXxkfHbsSUGmVNUubx5MqqU8Kw52n4qePhh34RQ4j500D0YywyaQG5zV9mLSJJep95nfVeqbMR4o46/bvGQsN22Bw2iEDosBonp6y74lvOY16QJWINVZv1RCcUrqxZF1ButwUqvXzPDgEyOKNyG9R25UFMIV/ubtTvoDUJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772015449; c=relaxed/simple;
	bh=bMMsz9sz2Ry03Pf+W7ccpJaFPmJanl/h8fhuyPdctvI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xih29SShuDhxnQicriErFgj06s8xWlnLbSSQugx6OrSlKeraK6r/CHqAUzK8NwWZCWgVafThVxCpiJLyLdXzUfBn+6Q+EeYxKXf/NAhsJbGX3ryHSx/DEaMhgPAfGxjCC+2abqpbOUC49HSF7VHfb32Ga7jVaIc6Y857ORMvxjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kmmcinea; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kmmcinea"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59e64657f0cso7186566e87.2
        for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 02:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772015446; x=1772620246; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qOO5wQwrSmDwfOumxY9P5EzZBIqL1pQdH7RIRo8a33c=;
        b=kmmcineaVBI3YVZRO2WUiVfbvby6jMpcTGBy8Fjr8YZcC3wgQvqqyEU0cN0flk6cmy
         eFH269WenhHD7HGEu8w8MLtaWKaFQ9UOBNdKcIwHLPf8k6tKRk+on1xuMMN5rRjstX8u
         2q9cQDn7IFPa5iy/9P1p7wH2VrEe875Jcp0gR3NwmDzxj8B8IGFrvrFSH5IHbxfqN2i3
         zRAnewSApvcjd+Dl7bHx+0CCvBzet2q3uJczDX9SN8NusEmTUaJOQtmnp8jvd7d4za+c
         6SV/gO1QF6ALTBbFAuHJmDCm9eI8uEHY195OuRzHJw1Cgb73GjgVt+H4XNAjTFh5jEJc
         GaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772015446; x=1772620246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qOO5wQwrSmDwfOumxY9P5EzZBIqL1pQdH7RIRo8a33c=;
        b=Yp0T+zjvts0E3ozsLomMNpaM/W9pD5e4lvJiwCSMuipO3IcQ6gD3iPVRXZMJNnzE0n
         xCodK/AbF0au52rZcNCUUKXSM9cd6i5dJWbw48lZH624JVr0rxZQHixlekg/morf7Yj+
         Jf0Lu7z/eJwv2ihcbUkPwqb43CNmbVjtUbaUUzKTGBbh56vkVecQI30EU27MpJ/MCR1S
         P4X7M1+Lm1Cs1aacZKMfIdZhU+c2ka2tbFc9QXuuinGVhnwS9JzQfQEyVZCwkkp2r8oU
         0GqLFMFC+r9GusMF6rY8+hYbup5umklgywkYsS5pevP6L+Y8YewtdgmeEipQqjuLYZy8
         JO9g==
X-Forwarded-Encrypted: i=1; AJvYcCXtd4BUi1yDUPAfTJXi5N5jfpCGTQPTWF5ptn94IpTE9OEqTS1UN/G1AW6L/+SH/cHI3ASm6oEamUA5Vadj@lists.linux.dev
X-Gm-Message-State: AOJu0Yxejp5Ro1wJmRxdEy7IjFhINbCd24n29LCNpOh0l5yof9mXvHuv
	logIO+kMh269iE3DLFXGIQkyZ1iN2VCYA2WNWh/DAhOvlQ5qBCiSdGDw
X-Gm-Gg: ATEYQzxz3XeNVYdknrTKl5gobHpXVA2WAHBCmTzA8IFROKg6mTwPbTn40xWhbf9S5Mf
	B4npUAyWAk7C+XDdiQ9fiswF/eh6LLMBF0l7OYtvNDcBN4vZeUrQoclTot4BOLBg3wq+mSB3U39
	EuLPY5s6HYqrN7ReSMyb80TIZn93VXb+zfPJx+ZDMrExeSfxpcYeXjXr1+JQ39QdXqSMi3R9cGC
	eduEB4xYXFICkX4TXPe9PuC2KZYmjI/b/e663nacgiLOYst28jA9o/T3ViiLEMcjlzXiWE4wBgl
	6c7z1B+OOg8umun3ucypVCNACFsQPcyhf35k2Klm39HtAmFphEVDQ000rhYBvKO6q8UEpsOsuPT
	ewN0CTRI+wI/7165bmABncUgtCgx2bz3W64qkv+7USTZjKngrGDxNgrYjx+9Wx6QkvYEs9dAt+y
	Ef9/eyqNUyofpMevRJEjDyPA+5ysbGu6aO2cFkinkBfQ==
X-Received: by 2002:a05:6512:2346:b0:5a0:ff38:2531 with SMTP id 2adb3069b0e04-5a1026b9fe9mr701334e87.14.1772015445884;
        Wed, 25 Feb 2026 02:30:45 -0800 (PST)
Received: from overpm-TM1701 ([176.124.85.73])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb4c530sm2872999e87.83.2026.02.25.02.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 02:30:44 -0800 (PST)
From: Matvey Oborotov <oborotovmatvey@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Matvey Oborotov <oborotovmatvey@gmail.com>
Subject: [PATCH] staging: greybus: Use guard(mutex) in receive_data()
Date: Wed, 25 Feb 2026 15:30:06 +0500
Message-ID: <20260225103006.295553-1-oborotovmatvey@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace manual mutex_lock/unlock with guard(mutex) in raw.c
receive_data(). This automates lock release on function exit, ensures
that lock is released on early returns, and makes the code cleaner.

Signed-off-by: Matvey Oborotov <oborotovmatvey@gmail.com>
---
 drivers/staging/greybus/raw.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
index 3027a2c25bcd..6c31bae0d8ea 100644
--- a/drivers/staging/greybus/raw.c
+++ b/drivers/staging/greybus/raw.c
@@ -59,34 +59,28 @@ static int receive_data(struct gb_raw *raw, u32 len, u8 *data)
 {
 	struct raw_data *raw_data;
 	struct device *dev = &raw->connection->bundle->dev;
-	int retval = 0;
 
 	if (len > MAX_PACKET_SIZE) {
 		dev_err(dev, "Too big of a data packet, rejected\n");
 		return -EINVAL;
 	}
 
-	mutex_lock(&raw->list_lock);
+	guard(mutex)(&raw->list_lock);
 	if ((raw->list_data + len) > MAX_DATA_SIZE) {
 		dev_err(dev, "Too much data in receive buffer, now dropping packets\n");
-		retval = -EINVAL;
-		goto exit;
+		return -EINVAL;
 	}
 
 	raw_data = kmalloc_flex(*raw_data, data, len);
-	if (!raw_data) {
-		retval = -ENOMEM;
-		goto exit;
-	}
+	if (!raw_data)
+		return -ENOMEM;
 
 	raw->list_data += len;
 	raw_data->len = len;
 	memcpy(&raw_data->data[0], data, len);
 
 	list_add_tail(&raw_data->entry, &raw->list);
-exit:
-	mutex_unlock(&raw->list_lock);
-	return retval;
+	return 0;
 }
 
 static int gb_raw_request_handler(struct gb_operation *op)
-- 
2.43.0

