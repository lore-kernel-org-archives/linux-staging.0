Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D7228F1
	for <linux-staging@lists.linux.dev>; Mon, 26 Aug 2024 00:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724631452; cv=none; b=GcnLah2Im3fCiPoUV2QACE9H2R4pR5LWQDQteZXlT6K5zCTJbX+xCFAj28XO4Y2Gsm46LvOhBxXnrad5Yo8Ga3D9YcNtOBigrcRo66fll8Nnv3hVCjVr+sl1Txib63dVdbghbX+ejFke3uegXN9qEzouIdyUe+EHv07qjMgYk3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724631452; c=relaxed/simple;
	bh=h/pmg8LUsT8ycegCUf7sWEuMzRhBHVTMnNYn3LAuREk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q5ArD71iP3wkVwNj8YThGxczhxWAAri97XUqvmDqmxVgN5CcVVEwu39rxKEYCG9E0FnfUqogI01bkSEbqoxOy+YSiBCaFpyfdigZkQI/4DYFOm576lDhlQQhdPZ34CsSeUzthPZtIkgENknABKIg0BqhXXmupMJXoVki1gqivxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=gISQzAvp; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="gISQzAvp"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2025031eb60so31607285ad.3
        for <linux-staging@lists.linux.dev>; Sun, 25 Aug 2024 17:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1724631448; x=1725236248; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZtBxOsTWvnnsjgp2ET9l+XUHkm7CYnC/EJsQtXJxes=;
        b=gISQzAvpcQwIkD9TLQ1/Mam/qTZsZ0oJ8QRPcGNXMHWoO5R5DFSbNLe0uTp3EvZvt0
         Tn6BoRp5nLhHg3rT3jsRb53x5zqPWM/fquMbfYjqfnT1A6G8kV5F0m3HZj5HqKeRgBGU
         RGjRmAi3pJi3xML9I+cj+cqEvmL1MZDIKx75P3nupsc35kH+6JWDqZxi5Fkt3FJnv/6a
         Q1cvKNN0n5ZfkSFF2r/rOH52a0bYQCTvtcjwib0h5xxuH3lq00NzxpAbHHepCa66WzV0
         UebFw7sjtwI8cpVqozU2sCjcD4SfN3KvvSC+D5anU/0MzF9b48xsyawA6hN7tyyfda2z
         T3MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724631448; x=1725236248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DZtBxOsTWvnnsjgp2ET9l+XUHkm7CYnC/EJsQtXJxes=;
        b=Re+zpGzV1sefMVxCkKlKpk611y+23zw2qaFEiDc6NuQcL0HGZouJ+7n2m+UAHJGfWI
         0zbhQzsV7UBs7dO3pMuqCupzXOmoFQCZDHL/Oy9XeNKuwSEUB//K7uotcKmoEHxfj7jY
         Cpz66P7FBIXvhWJ6vWsqLIaWS3FtCeHBx7uNoTa/PgZYcW6l6a2dmEZHf9dxYFfUSFbV
         u2mBq8Ru3w+Vdvftl9G5WNIaHj+G/GjObE4fTR1e+TJ4PQnbw5lNf1bzwKOdbKu3CtUA
         Dvpjgl3M0VFnC5aeZrKZRY64e9ohIXQUPUQyxfuuV2i4Rh8Tmc5y6frQv7MUXGCRLoQQ
         dOcw==
X-Gm-Message-State: AOJu0YwV16VFw2LZ1Btkbfq9untbvRp3xm+5lon42hUzH9esOyJV6X20
	GxSACkhYiTab/EeTp5mqZC92jHkokYgk/LjBp4szx/Gli5q+n18miIgvKg58Dk0=
X-Google-Smtp-Source: AGHT+IE65Pj227dZDpU9K1kQRxll85DZkyJsRnnsWMYyCw12XMX6xgBNc80X1neDYMEB/yplijOrtg==
X-Received: by 2002:a17:902:d203:b0:1fd:a1d2:c035 with SMTP id d9443c01a7336-2039e4adf24mr71182805ad.31.1724631448509;
        Sun, 25 Aug 2024 17:17:28 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203857051b9sm58695955ad.234.2024.08.25.17.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 17:17:28 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 1/6] Staging: rtl8192e: Rename variable CurPsLevel
Date: Sun, 25 Aug 2024 17:17:19 -0700
Message-Id: <20240826001724.274811-2-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240826001724.274811-1-tdavies@darkphysics.net>
References: <20240826001724.274811-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable CurPsLevel to cur_ps_level
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index a332759367ec..4e72fa65a559 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -93,9 +93,9 @@ static inline void *netdev_priv_rsl(struct net_device *dev)
 #define SUPPORT_CKIP_PK			0x10
 #define	RT_RF_OFF_LEVL_HALT_NIC		BIT(3)
 #define	RT_IN_PS_LEVEL(psc, _PS_FLAG)		\
-	((psc->CurPsLevel & _PS_FLAG) ? true : false)
+	((psc->cur_ps_level & _PS_FLAG) ? true : false)
 #define	RT_CLEAR_PS_LEVEL(psc, _PS_FLAG)	\
-	(psc->CurPsLevel &= (~(_PS_FLAG)))
+	(psc->cur_ps_level &= (~(_PS_FLAG)))
 
 /* defined for skb cb field */
 /* At most 28 byte */
@@ -1046,7 +1046,7 @@ struct rt_pwr_save_ctrl {
 	u8				lps_idle_count;
 	u8				lps_awake_intvl;
 
-	u32				CurPsLevel;
+	u32				cur_ps_level;
 };
 
 #define RT_RF_CHANGE_SOURCE u32
-- 
2.30.2

