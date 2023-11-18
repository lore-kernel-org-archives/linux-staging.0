Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B890A199DB
	for <linux-staging@lists.linux.dev>; Sat, 18 Nov 2023 18:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KMu/eFR4"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-9df8d0c2505so579278666b.0
        for <linux-staging@lists.linux.dev>; Sat, 18 Nov 2023 10:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700330711; x=1700935511; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZEQQ4sBftaBxEQfqkfYlxYDOwzoa8t3+UXmC0vdAGio=;
        b=KMu/eFR4xZ1EljLOveRLk7j9mQPNus24mbY1Px1RhjV7J4UtymHM670v+UZNq/t1Oc
         7C+A+lNinitrBmgVoQBWPf60EmBAWZ6Fspy/q+GRnfalBc9grnqRQFaH2fPT4awL76s7
         IhO8J8AmJxFRaWhMusqLVKxi80CvUQxH25Tp1ec3Bkvwp9LLWiH/NhgGKsnzHWeQFbHf
         YTTUDbxniPAKsPX17eNM3lBAiUWkoJL5wGladb9s3+khIjp3AYNh/lA75Nwnlm2RTrPk
         594b/PfsvSo/mFMYt9LsHL7ixg38IFUTa7CMfocjZI2fkt8ebKo5qbxf6K3s4xUkKd2h
         KbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700330711; x=1700935511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZEQQ4sBftaBxEQfqkfYlxYDOwzoa8t3+UXmC0vdAGio=;
        b=ic5BprbNoCvNgOy22bYgEDQMG7aBwXDNF/AumTXWAuH1ZMWE9IQ57wtBY/vMDw2Jfz
         1HfIB3zCrvDxaR1cavkG6ZXZP+vyzbZjMMP1GlvaFCw0IUPVzZFv5pisb2t3s9B4d/40
         BiXs2QUNApPHLKTyLDh4vLf4jiZfMKAek3QuY7HyXJgzFyg9ZSz/iBZoAoJW5ESTIsJX
         +RWwGl0rozaoub4PywGvTwlGTYbj3KVw5zhypJ4sBIudtlrm3SLl+6pnHhbeurC6ccL3
         fldMV87Ki4kGa6svlUYhiRrR54mHNIU7S7dCyJAuH6k4MVHd1p2ar/jAiB+lpSutjYrY
         h65w==
X-Gm-Message-State: AOJu0YwodhlacsmmHHDNfU0QRXfYxRLTtuIML4q9EVcb3nr5a/ZdHdUn
	piT9HavleAX+ikbpj4jn26I=
X-Google-Smtp-Source: AGHT+IGYLilIkdrNACXRJAHaolL+uXijwWBEXjtZAesjgsYT4+SMXgcWH+uTG6gF4MPghLKCC6/PYA==
X-Received: by 2002:a17:907:d21:b0:9f4:1bd6:2d26 with SMTP id gn33-20020a1709070d2100b009f41bd62d26mr10976580ejc.0.1700330710912;
        Sat, 18 Nov 2023 10:05:10 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:77bf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id m20-20020a1709062b9400b009f2c769b4ebsm2079456ejg.151.2023.11.18.10.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 10:05:10 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/10] drivers/staging/greybus/i2c.c: Don't let i2c adapters declare I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
Date: Sat, 18 Nov 2023 19:04:56 +0100
Message-ID: <20231118180504.1785-3-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231118180504.1785-1-hkallweit1@gmail.com>
References: <20231118180504.1785-1-hkallweit1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After removal of the legacy eeprom driver the only remaining I2C
client device driver supporting I2C_CLASS_SPD is jc42. Because this
driver also supports I2C_CLASS_HWMON, adapters don't have to
declare support for I2C_CLASS_SPD if they support I2C_CLASS_HWMON.
It's one step towards getting rid of I2C_CLASS_SPD mid-term.

Series was created supported by Coccinelle and its splitpatch.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/staging/greybus/i2c.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/i2c.c b/drivers/staging/greybus/i2c.c
index de2f6516d..22325ab9d 100644
--- a/drivers/staging/greybus/i2c.c
+++ b/drivers/staging/greybus/i2c.c
@@ -264,7 +264,7 @@ static int gb_i2c_probe(struct gbphy_device *gbphy_dev,
 	/* Looks good; up our i2c adapter */
 	adapter = &gb_i2c_dev->adapter;
 	adapter->owner = THIS_MODULE;
-	adapter->class = I2C_CLASS_HWMON | I2C_CLASS_SPD;
+	adapter->class = I2C_CLASS_HWMON;
 	adapter->algo = &gb_i2c_algorithm;
 
 	adapter->dev.parent = &gbphy_dev->dev;

