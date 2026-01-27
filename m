Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA8F2749D5
	for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 01:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769476908; cv=none; b=LSfjtDnIqG+pXe5yEqMNUa5YT5hQKKZCHZBqOYMEvaRJNw/5rh/pBxEUs4RWO+Rz2XbWVSiiu5i1BrKK5IxDKuGPoLufd3ZItCO1c3QrWJUv9PULC59o45OXADLIl2raD7st8lP/KI0wBV6JectdL8mVENQdw6IZdlqeZB48Obs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769476908; c=relaxed/simple;
	bh=bWXSX2Z2iObBnmWXf3385WaPD0EcXLv/mgJ7rblnwLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dqtdQ+JWXZlNH4Re7nb/7FEN8DcjgoI1zLJwfA4PaVqOwzLOQ2uhC84tk4P7iI1wQ9WtbJf9dBl56AN6MfNjGygnh/RSgDRIPeBTcJzK50iIF61Tcl9in6SOjCbN05zlsgVS4B+VcGETjgYMzaen0HsfmubWsaL2I2X9ullxva0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aycz/3kR; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aycz/3kR"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-79430ef54c3so47314347b3.2
        for <linux-staging@lists.linux.dev>; Mon, 26 Jan 2026 17:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769476905; x=1770081705; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4G9x9taUAv5JzYdnkyHFAF8EphpOgK4vinweKZ7n8k8=;
        b=Aycz/3kRYHAy15QFxZAmszF5g8XLC1OERRfXd290sDEZ85rhllaRw2cHguCi06IpCy
         r55j6/7+C18dLSGAmiCB9MPtNwnSt6u1jyxKliMGZjRwBd8R7+TJqXE2mI/Fpe3ifntH
         BUkZuMTATFuunmWwpg7WICY2XOScrr9VmOJw64C7LkgcYyG5ACrrVxyRUtcqAqVISrP3
         2evX9WQms06Pnc5dWrD06aBAQk9rv+ewAbVH4SCDuDQi0wrRAWUSNV9esY5OaJNVGFtR
         9z0IogJ9RWAMdyAXL2pBeT4rswaoUOsKpJtywpLHUD10pSMlgVY6LorjhNxwTQl9X15H
         YOPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769476905; x=1770081705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4G9x9taUAv5JzYdnkyHFAF8EphpOgK4vinweKZ7n8k8=;
        b=lnxodD3ErptT88EFBWNIG83VfN3o+sp89Kvy9wr9PI6oY7Sa+WY6i16+vMpmjax/KV
         w+IhSF6DtSwILZ2ywh25gA10rrX6wNCCQ3eKhdr0I2mA7SMVrGfzy8lnzFeFsj6I5Wlg
         szOv3AsOtHARaAe4H12f9KfEJis+9WiznwiDYIp+J+tBm45iIamiv6wXtSMvNq6yT5uw
         5zBqYInv3Mx1liz8D2l7EYCyHrY3qYAEBv3rHHbtq8ys/OiPVlXFEXlCuGYIY167aw4l
         XfozFibzYfqH5U/KIo0Wq0mPuKZMu/y68vWP2wWP/oa10DV2u26HZ2kv0sn7/LfKwZ9R
         JC8g==
X-Forwarded-Encrypted: i=1; AJvYcCXNl/WjO/tlPalLQQ8Xz38kQyJHsvPp9fk3DoNR68BjKMw77seZwXbAgpG9tgHN6UaWI+lztlylaF1nVSEf@lists.linux.dev
X-Gm-Message-State: AOJu0YzOT9HJ1wXbaA8nph0ZKVUvRXYC896W2G2/uC2ecKejceEtFD9b
	xWDqokLv/9wpZ8w6oh+89fbmfua+5mYk6KERV+ZiOPcijwopC8HbnINj
X-Gm-Gg: AZuq6aJQmU3rUI0qnrsob+Q1xm82ZW7Sm0XRZJtYAw+MIDQ1Co3GO5fX+tp/DHrxxmt
	xjc/HeCYgoJQWBGis2LttNKUlTI50vTHO7lfwbAe7nslmsThaViaUtp0j7a+hJBVQumfoUK9/hw
	K5GxgpMHD8O6hZJzwhkbFwvLug4DL1g1sEQV3hNSeBJ/mc41wE+EoXrq5W7ZX8nssfbiOJrFWKE
	daXLJaWRYqRC7Plnhuo8X2sr4pZp+apt38H0K7YVg/iCabPPmZJoZAQjqy6MM6L/HDorFQkakmv
	smHov5EaTp6EianZuken+gp5p3XrX5waZmrvaaaDK/SQ3YaSbHX7maocargttq79GZLz28MEQgj
	jukrwOfmM06xof+YW65stoP1P9WFZTEMykCaWMAkSmopEUPUH/8xrLaSYSrKIhpxCQN8=
X-Received: by 2002:a05:690c:d82:b0:793:cf09:cbb6 with SMTP id 00721157ae682-7945a96337bmr48886287b3.45.1769476905176;
        Mon, 26 Jan 2026 17:21:45 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00::89f2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7944c5c9b0bsm40189657b3.57.2026.01.26.17.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 17:21:45 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH v2 6/8] staging: rtl8723bs: remove unused variable AmplifierType_2G
Date: Mon, 26 Jan 2026 19:21:16 -0600
Message-ID: <20260127012118.43037-7-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127012118.43037-1-ethantidmore06@gmail.com>
References: <20260127012118.43037-1-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable AmplifierType_2G is declared in struct registry_priv but
is never initialized or used within the driver. Remove it to clean up
the code and fix a CamelCase warning.

Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/staging/rtl8723bs/include/drv_types.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index cbbdf45012c4..64a2ffd45563 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -160,7 +160,6 @@ struct registry_priv {
 	u8 reg_enable_tx_power_by_rate;
 	u8 reg_power_base;
 	u8 reg_pwr_tbl_sel;
-	u8 AmplifierType_2G;
 	u8 bEn_RFE;
 	u8 RFE_Type;
 	u8  check_fw_ps;
-- 
2.52.0

