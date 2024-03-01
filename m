Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DFC67E77
	for <linux-staging@lists.linux.dev>; Fri,  1 Mar 2024 15:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709307114; cv=none; b=u1RIHU3B3DrqyBFQHH6lU8FQPW4H8m/yOKJbZVmbACczhHMO9jjM3LcbG+umveIGysJIvdRRhFOOvybDA9NtVDOmInhBIcl/cHOs/g63LTfEMczEsGFqpVILr8ZQUrALENo7ikct0BHUoLsge6ItyUsYBgJ+OXRSpBHTSVoKEho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709307114; c=relaxed/simple;
	bh=c6VADMQicUPiPOIu9kP0v1RFWmn/JeAemp3LKilZuoE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bv+kqrCVaxND8aef7eF2jt0QYNd4jaWQBxGrnu+6vcPkEWE2NmxOl/MeEpOoDZq8ZgA0hvcXg9cRfHr6iBGJ9TcdaSKecC08AzuNBp/22/QGL76GlMjCs5aDA7+NkHu8q4hUrzQ0sV8MzTVi5tmQb0nLrDI8NvdDv3R0qidiyOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MYWtpjO7; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MYWtpjO7"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d269b2ff48so24351681fa.3
        for <linux-staging@lists.linux.dev>; Fri, 01 Mar 2024 07:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709307111; x=1709911911; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uQkIsiqJa3PbCfK5y5rQ5fldLZTBWAFO6axVFhfQfUk=;
        b=MYWtpjO7dVz014xGh7IwzjjZpk+QBENvq+7AM/nkz4D6Gtgtd1eaIycl2OtbHo2XzM
         maePynwV9isS5todbmcVzxVH5cZuk35CwYMJ3VzIuKVmj64n8QuwANoN0ps8lePyZNMn
         APrlOnVJ+DHNmXRhLtqtxk9L/kK6svCwmHS8eprBwb3Zj3n+BJAAU+q4R0Th7RngVz4U
         TtVrLlY6m/jsLM+6f+kPnEv/JPF1jfAq6BLkCGKl7sv+S2I2audAHwswgGxPRyVe0Kub
         W3XGSq2yyVw29D99dZgodzo8JZTQPDjlrs2Wq/YtVR+oztM6i+J/N15fRRX+STFA8XWL
         Sb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709307111; x=1709911911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uQkIsiqJa3PbCfK5y5rQ5fldLZTBWAFO6axVFhfQfUk=;
        b=aMNRsAOLvUe/gOTKvHedcYMJRkAl9d/85zPc8wVBoOqkHFwxzTz/m9c7EhMtw78GK8
         +qt6YnoOYGvISjm2tEOoFw3JBXDKamUtC6lyNFz8Tlwe8x9HfC6wuFnMDIsT3RbQOF11
         NBfFgX95NoZn8b6xJSQPLFx7VT+C8ADeIJCkoUJxE6zeo+j6xeR/DWMAgl09DsvENCw1
         zpZSekWmjYChngwl74NabUfT8MbF4TEoFRmTXq2HE6OZtikxm0QrDwxCskC8GiXkJQ0j
         Qvjogdg5sRnnvgq5sWKLqr5Wx+X0hSZT/IZGI62ZAlYRi5u2Rlc5gm8e+BLQXOwsR3Bh
         UBeQ==
X-Gm-Message-State: AOJu0Yx7Kg9pUhkHTRO7RpWmdtYhBw5zBPXCOIxObHghI6H+Q2SPEYMN
	4cdnibOVI+42y5Rxq4tKjps7LT6cbZyFeUVF5+sd97h4RbB/278J
X-Google-Smtp-Source: AGHT+IFowqv91ocPiEeEPwajlKa4L03f8UHTtqN7Eo4sKzpVD721ZPHRO+ng/AQ0QUYZzwtnFNGy+Q==
X-Received: by 2002:ac2:5186:0:b0:512:d88a:3a8f with SMTP id u6-20020ac25186000000b00512d88a3a8fmr1450384lfi.25.1709307110610;
        Fri, 01 Mar 2024 07:31:50 -0800 (PST)
Received: from ubuntu2004.cynet.local (vpn1382.cynet.com. [84.110.53.106])
        by smtp.gmail.com with ESMTPSA id u10-20020a05600c210a00b00410df4bf22esm8739925wml.38.2024.03.01.07.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 07:31:50 -0800 (PST)
From: Ariel Silver <arielsilver77@gmail.com>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	yogi.kernel@gmail.com,
	dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	garyrookard@fastmail.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ariel Silver <arielsilver77@gmail.com>
Subject: [PATCH] Staging: rtl8192e: Declare variable with static
Date: Fri,  1 Mar 2024 17:31:28 +0200
Message-Id: <20240301153128.13974-1-arielsilver77@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed sparse warning:
"'dm_rx_path_sel_table' was not declared. Should it be static?"
As dm_rx_path_sel_table is used only in rtl_dm.c it should be static.

Signed-off-by: Ariel Silver <arielsilver77@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 92143c50c149..850ee6ae1f02 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -144,7 +144,7 @@ const u8 dm_cck_tx_bb_gain_ch14[CCK_TX_BB_GAIN_TABLE_LEN][8] = {
 /*------------------------Define global variable-----------------------------*/
 struct dig_t dm_digtable;
 
-struct drx_path_sel dm_rx_path_sel_table;
+static struct drx_path_sel dm_rx_path_sel_table;
 /*------------------------Define global variable-----------------------------*/
 
 
-- 
2.25.1

