Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A22333AD9E
	for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 15:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769702245; cv=none; b=WtzvfBA2d9OvAOiEXTkLPYSO/8LaPueO0J+j7EdaHCubIn+snaOw63/wvIAitJVXmDPQXZ7ZsiYnmCZRlGFrr8WLsNKKPalrMvO8EaUYNjUFwQ9y9Z/rDP6k5MVJdpkF8coL5LihdjLqYxAnBELc9GcOp7uf2BWZu+YaEOFUfcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769702245; c=relaxed/simple;
	bh=KgPnjkereDX5KqlGWxnGYXiYqSTZRbaT8uVVEkof5kg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nWBo9NUQL2NjYvVu7mtBaWbI0C2O1AgE5T8Q5wkvdbjzSSKroieIYyBHozw0V4Uu7utmXIOqUudc571c8Cj6xirFfJXJiZywqsB06sZsccxn2RK5PuTgN+8rePZ37JGoO3uyXiREPpExh1R4A1l1XmVBJIffQR+z2O2XW7iRtGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z9ck8t8d; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z9ck8t8d"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4807068eacbso9797485e9.2
        for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 07:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769702242; x=1770307042; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0LI8OX4yfH6IgwYI2RaV7W/8FvNlcKtMVfts+WWScD8=;
        b=Z9ck8t8d/pefL7rVbo+RhrJANaUn6e8Xet+vyfhezDTd2o+vT8SgQcxiTpRV4cx0oC
         Rl2u2RgOAXSrWYX/2F/2RAbUjthEQYgwPQ5DXDPlSwU6UoBXuBQ9r6c8ZnRdmjmP4iaQ
         Z1TkR38wVl2hUiiiEwHFRR6slkhgXJwJuw4IYU36u39UCy97SLjw70t4kQ8NEAayORh2
         W1b89DTmjBM1O/WhO9rp4iga7OTZigtgwy80OyC6iNBUTh2ESmROKJ5eVnA60uQhpYX+
         JttTk6NRUn0N/r3DhZNmgFRpf0cJvb27RGIalgOI2CHveaByXuln9NoqwOlA1dA4GLha
         GqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769702242; x=1770307042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0LI8OX4yfH6IgwYI2RaV7W/8FvNlcKtMVfts+WWScD8=;
        b=pvEnc6GEaPL8R/qlpl3MSqde0LrVLJsUF8dt7plccMG8wdSTEkDMsyTczQCTNOepsh
         ysAVWIVjbvFqro6CfZcSj0ALovKQZVxrGcFtlIQSQ9FCu+xf8XOF+cMlXjEJtl56/xGr
         V1e+SkFLoLoIL3Y8YNu7XQfUuUhz6HhJnfN6JrcHbo0q5DbBiOULk6gr5s4Jfdx0e5VR
         DBlfLXLvugBVC3r1c8p5k4ZIxqUKXYfoXbwhmvnMpwB1n726dHRR05yUQgZSI42NPADp
         4q+rlL2lWnfLKQo9jSHQnxIOT9+MIOSZMMOK3BWtMXBHSslUnkwRtCy7gkEnnamIgBzc
         g02w==
X-Forwarded-Encrypted: i=1; AJvYcCWduUKJyoar/Pz5bNcRUwH/gxMdm0SLWlZ3j0HJ3JNe4fEYTXTmTzeqpfSQQKXryzImSW1jt2XEqyUw+KUF@lists.linux.dev
X-Gm-Message-State: AOJu0YxrXXlxkepYrbsuoT4ZHPskSlakof7FR0HAz55Ux9d+4kSzRz64
	CM4aOBuvC+zfwLOoao1BUw4GCb4zcEphp855fl/0/85xnwoTbMzoeTE=
X-Gm-Gg: AZuq6aKrylr4d8tpfT0b7rBGWHEZGmeO2EshsZBrPi/QsmmATrLWlehnEYkf1Ig/C2G
	9h1901eBRcmU1Vw1KcJK+BwHlTpZ9BcWNmWfF4nWHAlaA7d1s4CddEuIntq6jbMnyNIzKro/Gxj
	VdyJUQY0PtBcIc9zR6L95oVbIHdCzxFAlr3rZEBDFXKzEYghGWsXbR4q5NJBWDSqkLqiO41O6xi
	C1Lxs2qsqAx4SsV5OlmwNQfKkw6pfTeiWjGDFOFTJJlVG/17l/Nwgh6Rl6uXW6TeRECV2RmcJmF
	ulPLlRsfdMnee0IoC/WvSfd/DwCEVIZl2YjjSQO/Jmy0eOIquewM/QMWxcA/812euOHbld2gk6y
	8OrxCb0puAZucFNdnpFLKPWJSeoIF4+lUxQ6IxOEVIYOwUziNakqX2mdQiDIDYBGpbd3dgFQlod
	X3
X-Received: by 2002:a05:600c:871a:b0:47d:8479:78d5 with SMTP id 5b1f17b1804b1-4806c00bf4bmr107978585e9.7.1769702241796;
        Thu, 29 Jan 2026 07:57:21 -0800 (PST)
Received: from LGPC ([31.223.131.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee078sm15749231f8f.16.2026.01.29.07.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 07:57:21 -0800 (PST)
From: Luka Gejak <lukagejak5@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <lukagejak5@gmail.com>
Subject: [PATCH v3 4/5] staging: rtl8723bs: modernize hex output in rtw_report_sec_ie
Date: Thu, 29 Jan 2026 16:56:53 +0100
Message-ID: <20260129155654.5565-5-lukagejak5@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129155654.5565-1-lukagejak5@gmail.com>
References: <20260129155654.5565-1-lukagejak5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the manual hex-printing loop with the standard
kernel '%*ph' format string. This simplifies
the code and uses modern logging practices.

Signed-off-by: Luka Gejak <lukagejak5@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 7dfc2678924e..267e487602f0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2087,8 +2087,7 @@ static void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie)
 		len = sec_ie[1] + 2;
 		len = (len < IW_CUSTOM_MAX) ? len : IW_CUSTOM_MAX;
 
-		for (i = 0; i < len; i++)
-			p += scnprintf(p, IW_CUSTOM_MAX - (p - buff), "%02x", sec_ie[i]);
+		p += scnprintf(p, IW_CUSTOM_MAX - (p - buff), " %*ph", len, sec_ie);
 
 		p += scnprintf(p, IW_CUSTOM_MAX - (p - buff), ")");
 
-- 
2.52.0

