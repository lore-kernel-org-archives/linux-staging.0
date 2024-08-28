Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACE41AC891
	for <linux-staging@lists.linux.dev>; Wed, 28 Aug 2024 22:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724883876; cv=none; b=FZR0IIdC/nht0aznKQk30YpFkI1XKZc5UXrb2wTCoHKrp8NfmReRXnME+XdC8Q9uV7RGHRiafCWvydZz0qrKTZuMRdylplvTtLrx+Uk2ZnTwWf0M0fsWwuVc6D7+2VL+2f0t2+8GBanYQ41koUyZNPQ6eDvSi+m2BWJq/GyfVBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724883876; c=relaxed/simple;
	bh=L09wa7vlLRmNr0dmhartiU21dRPbQfFr2TinzdN0/bo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N57NOklfAVPrtrMfgDVvN2E63Vrq/4Hawe/ybsE6kovJsJzA4iKNqQ39JUOkdaxoBD3tp4kBCVHoIB8yQrwSjSOR5ZwfM6hwlcQIQPsdpaU9LzeqwyRyqppe+8IGyUhTL8MdOxla5mzDj7/r/JLbL9CsJOgCWbf6Mu8i/uFYynI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MdNzoBYW; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MdNzoBYW"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7cd9cfe4748so4987018a12.2
        for <linux-staging@lists.linux.dev>; Wed, 28 Aug 2024 15:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724883873; x=1725488673; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vZXmCOMGdmd33F1p60pK7xSyspX5TYCEhDc9OsTh3BE=;
        b=MdNzoBYW0lwDJ29la7WAOcrtpRqDHYz2ErV/8l6f0UfT+FHv0gybRgfd9nTeEx1YO4
         XGClYH5DOAnxhEVGJwF0m605gyravxUr0hHdCobma5ksEX/1TTaejogj5FesQ+pJlqz4
         4OpCAhm2RmGCQshp1n++iZKzr8SBeTeroIqXYmVj6EIyUM60zN8NK4/CxBAlHyl3Inek
         lsI16LCACupLJUpMuvMyhwllUgjzLb15G7s9AL4HYPLR9qVwcgqgc5/iAzxSb7NGxJ6j
         LKzzYraFmEZVuf/ctEGHZ+X6v8EF6K65sW43bpUUv00Y4LZS8fCSa2FgNhL9Zqwx2yJl
         VmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724883873; x=1725488673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vZXmCOMGdmd33F1p60pK7xSyspX5TYCEhDc9OsTh3BE=;
        b=sOdRTVqr1jUmPZRXPcHINA57iHTQTGOExFGKIPtD0hjBfYXRfi8/SGaZ0xUk5lqq+a
         jelCKItZRTGYKC/woG6AqAMPgNAu69FFGKhbaZ9g0o20ryu9Ev8TcsEBcuUXn+CyrNpo
         b3TCbAUtPhaAx3SlCwNiNDJ6efiifGg3Yzerkate+BR3kLFg3h4tVBvFRnl+CSJPqQqO
         TFILtm4KqSYS1f9By+wMTKo0Pd4um/ai3OfdF32jUjILK7ariLnFfwHbYlL/bmnCMh8O
         Y5rLI6ugx3t2+B3ePvWY3c4A7Z2Y64u0AslVoF6ouoOV3Vv9b95I2YBbmbPLfxf0UOn4
         nW0g==
X-Forwarded-Encrypted: i=1; AJvYcCVmiQHtt1gShcOpEf5WRjJddnlX4lDF94i7qyXK94xoHZg6sAIx7nirswQv1wvqfWjxbVvj/vcv+JQFoiX5@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8e2YwYYwVQ5/ctJ3M/iHdKbCOrD+VNkxtFuaXCUNlDPoRCUm/
	0t1ohcQ3F3mo3p8Vntjb3wr9o6UgSTKzaYzYBJxO8qcON5488RPd
X-Google-Smtp-Source: AGHT+IE4BGdNTK7tQc+a59H/LzKSQpWC7djTz5uWod+WYy47V5xBwEewxNT+SiJ17O5Fa1cICIl3cA==
X-Received: by 2002:a17:90b:4ac9:b0:2ca:f39c:8d76 with SMTP id 98e67ed59e1d1-2d856503a5emr829272a91.39.1724883872849;
        Wed, 28 Aug 2024 15:24:32 -0700 (PDT)
Received: from masingh-thinkpad.. ([49.207.54.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8446f3897sm2460744a91.49.2024.08.28.15.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 15:24:32 -0700 (PDT)
From: Manisha Singh <masingh.linux@gmail.com>
To: florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: philipp.g.hortmann@gmail.com,
	Manisha Singh <masingh.linux@gmail.com>
Subject: [PATCH v3 1/2] staging: rtl8712: Fix style issues in rtl871x_io.c
Date: Thu, 29 Aug 2024 03:51:53 +0530
Message-ID: <20240828222153.68062-2-masingh.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the _init_intf_hdl() function to avoid multiple
assignments in a single statement. This change improves code readability
and adheres to kernel coding style guidelines.

Signed-off-by: Manisha Singh <masingh.linux@gmail.com>
---
Changes since v2:
	- commit message updated.
	- assignment done before goto fail.

Changes since v1:
	Broke the patch into 2 different fixes.

 drivers/staging/rtl8712/rtl871x_io.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl871x_io.c b/drivers/staging/rtl8712/rtl871x_io.c
index 6789a4c98564..378da0aa7f55 100644
--- a/drivers/staging/rtl8712/rtl871x_io.c
+++ b/drivers/staging/rtl8712/rtl871x_io.c
@@ -48,8 +48,8 @@ static uint _init_intf_hdl(struct _adapter *padapter,
 	set_intf_funs = &(r8712_usb_set_intf_funs);
 	set_intf_ops = &r8712_usb_set_intf_ops;
 	init_intf_priv = &r8712_usb_init_intf_priv;
-	pintf_priv = pintf_hdl->pintfpriv = kmalloc(sizeof(struct intf_priv),
-						    GFP_ATOMIC);
+	pintf_priv = kmalloc(sizeof(struct intf_priv), GFP_ATOMIC);
+	pintf_hdl->pintfpriv = pintf_priv;
 	if (!pintf_priv)
 		goto _init_intf_hdl_fail;
 	pintf_hdl->adapter = (u8 *)padapter;
-- 
2.43.0

