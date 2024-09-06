Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF371D0DF6
	for <linux-staging@lists.linux.dev>; Fri,  6 Sep 2024 14:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725631875; cv=none; b=Tou6X4mF+LY1MRziPmNT630ngxvnL3XW/a8LQSXIGmy2YxuzeVaWhrLxz/JLfoK2B2rXkHvALPqkVpmK1+srAlqr4hQEENZjNlUEmh/f+lGGodmeLDHzh4vJe7N9E0cShrPJhnwhm2Lady/Y5zybbUh9vIeovnyOAUpwfMX1k9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725631875; c=relaxed/simple;
	bh=NJpeB18vKppi3sPR1bENr9hx4bGqvxj7rl1VDFXzZLE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ncM4DhmumL93Pks8tlffGlxEqbxPQSaH+NzmMewpEiPreE8PwHBbvMeI+bZGpsYv+XEAT2/LO2rlzr+1bfu00IKyhySb0IzNY4E69/0DstVjub0CUJmSEZXGGEnfXNbQDp5rpgz2SKMGP405PPvr6BqI2lCAkm0Zr3d6oMWXXQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QmDJKp18; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QmDJKp18"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7d697aa2e8fso33773a12.3
        for <linux-staging@lists.linux.dev>; Fri, 06 Sep 2024 07:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725631874; x=1726236674; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pXB1DsCbeTuVjSg3/qsHRi4/y32gxxaca4O6wPKMbMM=;
        b=QmDJKp18MzWdWHN80SsehhkN2xmKh1rawIRw+LX/0/pCZv9PEx6dzMDCVPeNpgxvVU
         Q6Ue+CUHJEJy2lGJtsl5IXZTa079DMGMJvKhZYY/4mug2zoxoVUIP1GnbQgFRm5ulUf+
         7HDYoxzJ0Sm5Kgdac+eq97Pc1Ik5gvi+NhWWqYrhi4ydSFk00XxDQ5bwFikFDwVuuM7w
         5PFmvCIILwnuo2u0Dfjlx+PBSlOJWcq1x7vhQ2R2V4xqwlmYWyGKr8qbdEQIc9xldC4x
         fz0oVceVcNn+dwYkKx3mn3fTE9Kn1xVfIIiYQR5Erur38Yf0odUdt9P+VjvH/SnLc60m
         p2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725631874; x=1726236674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pXB1DsCbeTuVjSg3/qsHRi4/y32gxxaca4O6wPKMbMM=;
        b=i36N84LuRJvZ36uWP12YS9rlvpKWOwMwrL/ELeEe/DIF5DyI4iF8Ld5ExL+kYz/72A
         6ajwm835QpVedqvp+fN4P43xpzVeYWXqK/l+HZblVa/K6zAdfy0DYDDZMYlts2bwQqFQ
         mhpDcQQdQcNyPqTYjPxFB3a37WEUGTP9sYMw48k1Vqix2HjZhs4QuzyztyStAc8v/IOd
         gwmnHjqMQ5pPf89L/kX0vfLWUFAEA0w0PObJEnV2jqEDzvlmYe8t/dnmI1Mv0LHLE13c
         k18mCuaHUp9jaq0bJd6frGqFKRo4k5iG9A1jBWh2iW3bPLuyYjH9pcstDPHt4zf+1pLQ
         Z8MQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwWNP38h/hCwQFb79K9AsTDeegCSNOnlqPkrsX/XEmLGICaIEvG/sLvaAEHX10YDKHUUZoXjOrs+p+yhRo@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6oTZOiuGHw5hzd535Vq7QZ94c6F0ORIUoFJ3u4KaDxT0M1+18
	7xJaz+vfitUzm+7K63/XE/yZ+hx9QYQA7swNJJzYtRTcVvWLvGnIkcBuM1fN
X-Google-Smtp-Source: AGHT+IEC5jJTpGmBqCMU3EOh7gEMh+NzIQRwIxJ/mWCRsCyDqQmJ/k2CbFLhwLT+0uqt99odukmklw==
X-Received: by 2002:a17:90b:78a:b0:2d8:9f4e:1c3d with SMTP id 98e67ed59e1d1-2dad517f749mr1645704a91.5.1725631873516;
        Fri, 06 Sep 2024 07:11:13 -0700 (PDT)
Received: from ubuntukernelserver.. ([49.236.212.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dadbff255dsm1589348a91.8.2024.09.06.07.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 07:11:13 -0700 (PDT)
From: Roshan Khatri <topofeverest8848@gmail.com>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: Roshan Khatri <topofeverest8848@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: include: Fix spelling mistake in rtw_io.h
Date: Fri,  6 Sep 2024 19:56:04 +0545
Message-Id: <20240906141104.10076-1-topofeverest8848@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes spelling mistake to increase code readability
and searching.

Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_io.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_io.h b/drivers/staging/rtl8723bs/include/rtw_io.h
index be9741a056e5..0ee87be6dc4f 100644
--- a/drivers/staging/rtl8723bs/include/rtw_io.h
+++ b/drivers/staging/rtl8723bs/include/rtw_io.h
@@ -13,7 +13,7 @@
 	Otherwise, io_handler will free io_req
 */
 
-/* below is for the intf_option bit defition... */
+/* below is for the intf_option bit definition... */
 
 struct intf_priv;
 struct intf_hdl;
-- 
2.34.1

