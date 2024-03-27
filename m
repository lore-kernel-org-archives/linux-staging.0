Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C62155317
	for <linux-staging@lists.linux.dev>; Wed, 27 Mar 2024 23:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711581554; cv=none; b=VPHCO3GNMTbp7QUiJdGaUwWlMfduHtbZJKXpjbRsxsHdsy+K/CjdBsNp/DAkFJGCf73qax3iZUvVoK2ZRRo22t7o+54kJdx4bIUl0he1iMWx33W3U+QI8Km89TNDsPzM5b4zKDt5M3pOsWAC7EoSnYScj1FqI+cN87Hbd9XJbjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711581554; c=relaxed/simple;
	bh=h9SozZx07F/ieSA3Tkw6/3vSYWM+YqSBRP3PPQIUB78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hHN1+cir6c4J+HK7F+4KAhsBta4arsF4ldmVRJ36BM3bJYt0EQy4pJeGHCM6tG3iagFMaKxWuSxodfpkdODVTvfdI7hBUEEi3gaSR0wZexQdwDtJFVzTnVFTFcu0t7vpELGSSGlarFhZBMzErWg5ze+/+wVIpTJH0ks5OM36Q9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Zy6Or95M; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Zy6Or95M"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-22963f0e12cso216369fac.1
        for <linux-staging@lists.linux.dev>; Wed, 27 Mar 2024 16:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711581550; x=1712186350; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CJZsj0mH5Na8/6xZVfDNraoADX8hsL14D7DbLT7TMPI=;
        b=Zy6Or95MO503AJrT2QILkM/iuL5C3MxS/6n0OSs2rwZft9CuWcL5uwLFQ00mENzvIP
         cUS5Ft8h+KWELYhrGrGrzY4khJfnpE13js37mybvvbRnVoGKPc/7OmMFq7YNQq1NHvce
         zPuyELfoz+pb8cXA7MBz1a1rTDsnpA3pYsfSuFGB4D0zi6ZceM218hW+i6pU46h2720p
         T6GUfvKte4MxutT3kp2nHslRcSjvsPVarw/FGUfRBuYOYhwHsJktgp2mW96GDP3Z6EB/
         RLZmFdRuQmICgfmqu6D46qBDTH/+cyJB8N2YXqvP1lE8I99G3DzR3bzEisS0q1mIarpL
         6Fig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711581550; x=1712186350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CJZsj0mH5Na8/6xZVfDNraoADX8hsL14D7DbLT7TMPI=;
        b=t+L/RPDB1tFGmDiLJWsF5u7Y9GbxhP4/r53K0rbEiXGuR5gyYZT15liQz6eM0oxF66
         4hNXl9vZwAkZvV8nYo5EkrSfYQqInp/FCbg6fcI2w9jRbtn5JgWA9L9Cz20DlOaoMWUl
         uab5p+cw7gj2sin+KkZzjkuX0skppOyE2Mm4DwVYrPigmMVXCmGHDXNyX4M1SvG2UZ/O
         fs7OZmjNEPSDH8OnkVjRm2nW0muY6JRJLh++SSG6OxTvl1WK6T/qklGgmgUPXOX7OKYR
         wru2C4qhbp6jn7SxNBulZNIj6570+uZJaY32oXD41Ytl0tXk93BAh3J/T3RsPNDG2PBm
         OX7w==
X-Forwarded-Encrypted: i=1; AJvYcCUKq8G/Z4XUZOQAS+PTuL8+y+m7O8EbH5wpu/LqAq2V9hvEIysrPbp8x39aFTeJ2B2/HVUjd1A7eZkjS12zg6kB18myJsj5XDQAmj0S1g==
X-Gm-Message-State: AOJu0YxVS35qzuC7soaKRj9GmWBMrJ/C6Ok9fFVqL5WqamgA7AhDOxIH
	ZMfsUfZEL5KZhy0efZPrHkdiRQwK8ZJaxrUvdAdmSCYv1auXqJkahsCRqvrylCE=
X-Google-Smtp-Source: AGHT+IFF6sA3ju+9mCH35rHh1zhgVOle14esmb64OwmiwIjcccCZ+Gff/k0HvFE6jlRCad9wpwZTGw==
X-Received: by 2002:a05:6871:3a14:b0:221:9013:d783 with SMTP id pu20-20020a0568713a1400b002219013d783mr1213589oac.34.1711581550253;
        Wed, 27 Mar 2024 16:19:10 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id js3-20020a056870bac300b0022a0519183csm81381oab.2.2024.03.27.16.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 16:19:09 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Support Opensource <support.opensource@diasemi.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-input@vger.kernel.org
Subject: [PATCH RFC 7/7] Input: mpr121: Use devm_regulator_get_enable_get_voltage()
Date: Wed, 27 Mar 2024 18:18:56 -0500
Message-ID: <20240327-regulator-get-enable-get-votlage-v1-7-5f4517faa059@baylibre.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240327-regulator-get-enable-get-votlage-v1-0-5f4517faa059@baylibre.com>
References: <20240327-regulator-get-enable-get-votlage-v1-0-5f4517faa059@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.4
Content-Transfer-Encoding: 8bit

We can reduce boilerplate code by using
devm_regulator_get_enable_get_voltage().

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/input/keyboard/mpr121_touchkey.c | 45 +++-----------------------------
 1 file changed, 3 insertions(+), 42 deletions(-)

diff --git a/drivers/input/keyboard/mpr121_touchkey.c b/drivers/input/keyboard/mpr121_touchkey.c
index d434753afab1..c59e7451f3cd 100644
--- a/drivers/input/keyboard/mpr121_touchkey.c
+++ b/drivers/input/keyboard/mpr121_touchkey.c
@@ -82,42 +82,6 @@ static const struct mpr121_init_register init_reg_table[] = {
 	{ AUTO_CONFIG_CTRL_ADDR, 0x0b },
 };
 
-static void mpr121_vdd_supply_disable(void *data)
-{
-	struct regulator *vdd_supply = data;
-
-	regulator_disable(vdd_supply);
-}
-
-static struct regulator *mpr121_vdd_supply_init(struct device *dev)
-{
-	struct regulator *vdd_supply;
-	int err;
-
-	vdd_supply = devm_regulator_get(dev, "vdd");
-	if (IS_ERR(vdd_supply)) {
-		dev_err(dev, "failed to get vdd regulator: %ld\n",
-			PTR_ERR(vdd_supply));
-		return vdd_supply;
-	}
-
-	err = regulator_enable(vdd_supply);
-	if (err) {
-		dev_err(dev, "failed to enable vdd regulator: %d\n", err);
-		return ERR_PTR(err);
-	}
-
-	err = devm_add_action_or_reset(dev, mpr121_vdd_supply_disable,
-				       vdd_supply);
-	if (err) {
-		dev_err(dev, "failed to add disable regulator action: %d\n",
-			err);
-		return ERR_PTR(err);
-	}
-
-	return vdd_supply;
-}
-
 static void mpr_touchkey_report(struct input_dev *dev)
 {
 	struct mpr121_touchkey *mpr121 = input_get_drvdata(dev);
@@ -233,7 +197,6 @@ static int mpr121_phys_init(struct mpr121_touchkey *mpr121,
 static int mpr_touchkey_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-	struct regulator *vdd_supply;
 	int vdd_uv;
 	struct mpr121_touchkey *mpr121;
 	struct input_dev *input_dev;
@@ -241,11 +204,9 @@ static int mpr_touchkey_probe(struct i2c_client *client)
 	int error;
 	int i;
 
-	vdd_supply = mpr121_vdd_supply_init(dev);
-	if (IS_ERR(vdd_supply))
-		return PTR_ERR(vdd_supply);
-
-	vdd_uv = regulator_get_voltage(vdd_supply);
+	vdd_uv = devm_regulator_get_enable_get_voltage(dev, "vdd");
+	if (vdd_uv < 0)
+		return vdd_uv;
 
 	mpr121 = devm_kzalloc(dev, sizeof(*mpr121), GFP_KERNEL);
 	if (!mpr121)

-- 
2.43.2

