Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7EE267734
	for <linux-staging@lists.linux.dev>; Fri,  2 May 2025 07:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746170523; cv=none; b=gqWfJ+WN4sE4ERbz2DF5l5JfC328me1oi+4fbXi/DXDxulDpox6Dfc6fxjit2nwjH3/zyfoOHWl+zJHljnyEyHpG4Ogw3SyVQlsgBEZ+/Zoi7bsytwKVWz6fzUVP2L7GJA4wRQo+xvvP8JbDXrLhScMG3YpzPFU3DyJT6UIoC6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746170523; c=relaxed/simple;
	bh=DGBpbhXvuQ0xEpNrO0isiwgt3s6etMZ8qjti7C0evdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GP7rNlswJgEDvHYcD0/FX8w2pIuX6cSxgAeczBGnf42pqlAuPtov1TEe3kIRI/VV0N5MjGOHu8v+mPxw91WojRjQ7JdFJ/o7u97yyK8pAVgElzreGvDGVahzXd6pknluT7ZB66CXn8AG44kituV/FJURKcBPNYPfKdT1+pffjfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aqRjVR8c; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aqRjVR8c"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-acb615228a4so523574866b.0
        for <linux-staging@lists.linux.dev>; Fri, 02 May 2025 00:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746170520; x=1746775320; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLe9Nl33nhWrZdDvjcJcQXnden9NZdZx4I15zXBAdL8=;
        b=aqRjVR8cj49UMU/pZHEey4/MlL6ZL7HA7rEKVP7WHFFyYAdbH7tOw3r42PC7gX+EDV
         k9Tlskk0eJdxf2YkDLTu49poV8QyE/oktTYHmSYyWHhZiNaIhy2gCwSfsjqaH2rzD40p
         6zSBLH+sQ6SAP1JFRxh2a9oEgr5hj+mPySfkkHfYexS+LPL8rivzH2xKQMVx+yrsir5l
         94Bap4bQjouanSaEhUZ9GL1ZfEr/zCi1Af6hsAyZF9Q+Ou0ra+pkrQJAjCD0fcy6Hoq9
         Z08xdTsSOulldgV0BAjkwinetiRbkIIolfwNV89LH6OgOBC9cc49H3qpzFsZRNX54YB1
         KS+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746170520; x=1746775320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nLe9Nl33nhWrZdDvjcJcQXnden9NZdZx4I15zXBAdL8=;
        b=UkzYYdimKzLx8DwepcSS5u6g6us5S/byZEVuwQAzdXXpGrFg+YUGDFHkQ0KCbarI06
         M8P+zWjgjpbPie6Nr2Ozh4ICGYzB601+mGu6UI04EyL4Pe+Q/MF2DwoszF8rDe9okFW8
         YdCEGbdv/0Tl5bIikrYS1R8fu2344GakZBpl0PHlZrGK2KeWcLICmOkg3vTnVF822tN1
         voN2Y0bhk2w1hsW1tMn8spS5MQnS/QhY7RAQ1EmXhZWdppQEEaE8lHABXQ28KdVB3bNc
         Mpfd5amgOdzIQboRC5IzkFuC8lBLKFCnn7KtfKtBvF1n2CmlHUClbJGruofJVx/UxSVH
         I5MQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQthpsUkbmyEJ4HwKF/m/th/1vhleqFnaEjX1VYlyz7hnOF5Ht+arF3yPRXSezMtZE4O2FIVf0O9XSTLbs@lists.linux.dev
X-Gm-Message-State: AOJu0YypJt1xonJe77VOSCY0gkk8fzoEGMyTYWJ8STuhxQY35UI/xujM
	xKo2z/8bW2xcmFXCVrEl6MD5cbqMD+0o06r80aZqGBpqvFMp11e9
X-Gm-Gg: ASbGncuWmKYx7iLce0I/Jnoq4PwFbBqIDyzqu6HbtfP/H7sNFztwniZcobsvW8wdVOQ
	7/nczMXvrBHOg/N5Gi5rBqRHKEF8VbK+RvmrWHEcDB7BkeMlVtgOionA7l7TowOD8Fa/1eGbGt0
	JlcRVUJtAw6bKmgu97d/sR3TDMbmMfIGDZn3e9sR5j14olTeYZ6lE2s1XIs/8vmR1tIijffiOBu
	hviZIsqBaAB3n0DRrHWRrOF3h7woI9jB6nXr5UP/4B1W3gAkZ+rLMlkDAm7wCOfxrX/B6PreKI8
	FjXQ5Cgh9wZ0g30XabwFWMuW+xL3b7DT3PjvCrM1Joit9MEeubs=
X-Google-Smtp-Source: AGHT+IGGnXUM/UQfhKQAG9Tm1E7L6eKCt04VW7CfVNhHGdFuc1+THezAG4bQV2RaqhajC9diCRAP4A==
X-Received: by 2002:a17:907:d204:b0:ace:be7c:11df with SMTP id a640c23a62f3a-ad17ad444b4mr189350166b.6.1746170519991;
        Fri, 02 May 2025 00:21:59 -0700 (PDT)
Received: from localhost.localdomain ([178.25.124.12])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891f3c6bsm5691966b.82.2025.05.02.00.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 00:21:59 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 3/3 V2] staging: gpib: Avoid unused variable warning
Date: Fri,  2 May 2025 09:21:50 +0200
Message-ID: <20250502072150.32714-4-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502072150.32714-1-dpenkler@gmail.com>
References: <20250502072150.32714-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This addresses a warning produced by make W=1 with the configuration
parameter CONFIG_GPIB_PCMCIA=y

ines/ines_gpib.c:1115:28: warning: variable 'dev' set but not used [-Wunused-but-set-variable]

Remove the declaration and assignment of the unused variable.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
V1 -> V2
  Remove the setting of the unused variable and say so in
  the commit message

 drivers/staging/gpib/ines/ines_gpib.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index a16219c0f7c8..c851fd014f48 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -1112,12 +1112,9 @@ static int ines_gpib_config_iteration(struct pcmcia_device *link, void *priv_dat
  */
 static int ines_gpib_config(struct pcmcia_device *link)
 {
-	struct local_info *dev;
 	int retval;
 	void __iomem *virt;
 
-	dev = link->priv;
-
 	retval = pcmcia_loop_config(link, &ines_gpib_config_iteration, NULL);
 	if (retval) {
 		dev_warn(&link->dev, "no configuration found\n");
-- 
2.49.0

