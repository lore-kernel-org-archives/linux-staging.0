Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B298A1C3F1C
	for <linux-staging@lists.linux.dev>; Thu, 26 Dec 2024 19:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735242572; cv=none; b=FUXakAESxpsEw+9RVUd1Qw0EEbA1xvcn0jQukvH5R15hUmptMk6PoJL9qnbq9dPCX50/ufKNHr2F2J6vaGDk+UCcTGCzBphgcwLhcFjK2xZPjDUY9nlHaRLyRhwGbnO026Rer5yxZs012P4IDFaF0AMXe3/gNvnnia0qPcC5G7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735242572; c=relaxed/simple;
	bh=f9NCgfzsIe6h+GVonhu5wjjsUqVhKNoQn7Uy+tts5dg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pkWGylAtFXBVC6E7/gxhwMFPhkumfTNa7VEPt9Uernwsmgn2Q+rbLfCjcemxB3ia1AEMm4jaXx9bFWW4v2zH1DZYjDO9Gmdyq6KB39PLiQ4QNgjnPLnEyKRgr4q3aAfJc47gfgFL1aCSHNZ8ebPXojN8zszzjwbvA+qpiYsMA/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Frp/SKSa; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Frp/SKSa"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2166db59927so9430505ad.0
        for <linux-staging@lists.linux.dev>; Thu, 26 Dec 2024 11:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735242570; x=1735847370; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yt2glYu/Skw1HVNCbtnoM321oyEzxI0AuWZ4m/1+W6k=;
        b=Frp/SKSaZh3pllzLTCGJS/Xd5QXGNo/EaB8MfmC10frp8IsRUpIZ06mguHN/cG7xdh
         49Ztrf6wQ4cxKOfAj8W2C+CO5It+zk7jknCPZx4TaKm08lRFOSuaOHYLv5K0yHZcznlf
         XxxjoCq5KTtz0fpjkQ5gaCAn1x95KXXTeQ/cOoQKotcx4NyJFal6wjpuIbFnPGTlFl/0
         d7z/d4q6uyACrm3gxXlTajxGyoM72H9qa85U81rycCi9dnJl5wKtA/iWhTIEmfMlyEab
         O2Ft049VHAg+Ur6K8bXxSlSc1mLzGti+nlqFieLZ1JVZaJP/ODwOWjFm31W9Nmf/TZxv
         ZfHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735242570; x=1735847370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yt2glYu/Skw1HVNCbtnoM321oyEzxI0AuWZ4m/1+W6k=;
        b=wB4MIyzNjgbN2aj48gJOXMS/QuEwx6U5tTOrfQkYZ44+bECr70TocflMyE+6DB/Rmh
         huQEoWvmMNeFhdrO9mLz+dgkL5OdLFD3iq0o81dRbK4015Pq4N6j0t18bLuMM2Va6gjs
         fJX2tweGhsB/h8MuFjUhVpgnyt+V1aCphQmXgt4/ZKbkfk9GwYjvDBY6NDi5/7mp58KW
         R3C9/6i0ipdNWjL2S7vKqrDhqe8NZE4A4hRnElQPFhwxY5MG16kCL5AkJSgZkRjH58uY
         0UpGejaAwrirzRuQEhWcjY7oyZ5+TNJ2nLd0MywOoNVxknV5xgRtCvsiWwSdnFLIAP25
         S/pQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4gPkvvhj24h/OqMI3Kjgk9OmZi0VDXfijxZqntq80q/qy9wU6YEK039jU1zX32bMpcj7+y2BjCtYvcPdt@lists.linux.dev
X-Gm-Message-State: AOJu0YzLXyA9xLTdtwmWtCREzbCENdCpjaf1EcxOyNhPqI4oZXYNdQ3S
	n8g3IIa+ibDCq3OvlRnJP15XnqxJ87+zal1mPq2D0I2Z2PX/6FrQ
X-Gm-Gg: ASbGncu6pn2nPnajoTHU8PQty2QhkrFPJtI3ARsptRNmQoeSwJrZV8EQ0doKYF0YCGD
	yi1Ch5BBcGC4rPjQ7o5fDEfjnRy8AlnNggu9OEGHXEqYogHK4ZaKTOJOXz9VvFS3LmX6SfLhmA0
	oatozysjvI7JeKhITbF2QWUzpBI3abxQe9FzNCre71+u+nT8Z4MiCknnpRyjkzSb86pBS9lmQP0
	0T88rk66Ks7thknIB43ACmumq7Cwi74UWR6H5A67gJzSzwcZy5KwO4=
X-Google-Smtp-Source: AGHT+IE01zw8BgwNwUzzQy+6SXWtkQWySXV/1PQqDygaDgj93zLX+tkhhzaSdFf1JW14cZRIz1YfJQ==
X-Received: by 2002:a05:6a20:9c8d:b0:1e0:d4c4:f736 with SMTP id adf61e73a8af0-1e5e080247bmr14626358637.8.1735242570093;
        Thu, 26 Dec 2024 11:49:30 -0800 (PST)
Received: from ice.. ([171.76.83.141])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842e35d4becsm10304580a12.79.2024.12.26.11.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 11:49:29 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v4 08/15] staging: gpib: gpio: Return error value from gpib_register_driver()
Date: Fri, 27 Dec 2024 01:06:32 +0530
Message-Id: <20241226193637.241049-9-niharchaithanya@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241226193637.241049-1-niharchaithanya@gmail.com>
References: <20241226193637.241049-1-niharchaithanya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function gpib_register_driver() can fail and does not return an
error value if it fails.

Return the error value if gpib_register_driver() fails.

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 drivers/staging/gpib/gpio/gpib_bitbang.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index a2d562cbd65b..c88d85b7dc71 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -1341,7 +1341,10 @@ return_to_local : bb_return_to_local,
 
 static int __init bb_init_module(void)
 {
-	gpib_register_driver(&bb_interface, THIS_MODULE);
+	int result = gpib_register_driver(&bb_interface, THIS_MODULE);
+
+	if (result)
+		return result;
 
 	dbg_printk(0, "module loaded with pin map \"%s\"%s\n",
 		   pin_map, (sn7516x_used) ? " and SN7516x driver support" : "");
-- 
2.34.1

