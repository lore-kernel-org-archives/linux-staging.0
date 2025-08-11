Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A90F2472B5
	for <linux-staging@lists.linux.dev>; Mon, 11 Aug 2025 08:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754902499; cv=none; b=G2gnOg9FBa+TkaOqIueAY+sC9GBsHCJHl3cksU5YlJ1HGmnfDTlFxKxOqhxnmT8aXycrnF0S2slX11mdDq+qpp+NimA2nOxvwhrhbaPD3xf7i/nWpHWptL0YFg67y093BzwKPdjmH3zeQKvZt2VcFQK1Iljf+UsryZ1WP/7aAbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754902499; c=relaxed/simple;
	bh=vOb/HCCt2WUEqQ/efVXEzqAG7wvFxG4DONZYmff06TA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GfQwR9z+0NK7RtW/BHBI90joVW9MVjyJiC30HtpqPjLraWfMdzUefr7Jj/PHUcCiZTcilpd64wSt4PPEcXwL1TkCJEllwQFQ9lQQZTTkBEDzpH/CugWJZEsEXu4DcIS41b7JSz0ZtQlv7qgIbDZjEskJ1ZDwxSYKphuAXhgr6D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PEWMM+cV; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PEWMM+cV"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-af925cbd73aso789277566b.1
        for <linux-staging@lists.linux.dev>; Mon, 11 Aug 2025 01:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754902496; x=1755507296; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+FYwnamL8Yi1pORoPawSuyn3NJhs89bPw4JEe6661wE=;
        b=PEWMM+cV4zWNvFpzYWDsTNKK652htN6tNg/fNAx+EFuPA4pndAzOvOnY4I0VQABXtW
         Dq0MQujZ0OoDMV8Gz92fFkC3xQV7FCbRAHksgCwyEVg222+63KmKYUONepvaINxAl6hB
         Km3iljTxQLKZLbsAuan7MkJwstFUDATQ9mdxRv/ErgD59sQUC6H4Y0AjpF+tcpHDDgf2
         l5K5vR7kPe+jE7NtSjSTOh8yIeeG2YkYByXZ9sBLVW+Sq7QWMXzL4US8Q6U0ADHY4myh
         4fQvzy1OUMnK3MWKRvydUzML/VeRcyEAfW4+3DZrf4+Y/uiznd+UDdcsozM4/Zw3o4gQ
         EPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754902496; x=1755507296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+FYwnamL8Yi1pORoPawSuyn3NJhs89bPw4JEe6661wE=;
        b=JmPtzzpxyWiN8vCi5OK6tj3UxWMy+PYJpmG0DH/gNrPBbNXVvCewlh9vATTIXzw1De
         2p2v2sL0sZGgniqKcFzDIUdsgvp4JqJOB1oSimEspbz28p2YfkNgthHj6NeLcCDJQ/zV
         LHx0CQsg2kkC6g0Z+TGD17qcNxHeMN9fDTTYD1K99QKqIOUl/q8brM1sw3+8v4FruqdV
         J2UI1k9IHY5bwAqcIRVWp39D55eRxRC/Fb4E1/NtTdf3A32ix1R2REncdDfFS344BvJd
         +nhT8eXyxeYQUUHf/W7BcbZzZ/IcwYthgVPJRg/3QZVzjgh05y5KHSVDbQXy6ZFy7PFu
         Qb8w==
X-Forwarded-Encrypted: i=1; AJvYcCUxriDfaAkYXEFPSbnJi0FZ9wsTXnEO38v0LXBWPzAGDjrrqLPxq6g6/PguFfdCI2Odp0rQHulURv8QfudU@lists.linux.dev
X-Gm-Message-State: AOJu0YyPDqUS/SdWcXJfU3QoZTGkZOi3ExS9RGlJ5ArbYk7PqpHlekoG
	hLfW8SSW01diMy+msCgZAMJtavBR/1E0rbA9Z1l6b64TNwxWeYbQLgWS
X-Gm-Gg: ASbGncvtlHVC+N6s5W9wjV29hJN/m2bXLIaf2+bNrspcrs+4+SxwWOWQw89IUpvusIj
	iCbFbhvyA4KW2bNpiA+aMb4sTHQ87uLi2xS3YbhpzIy4c7/EiK/IXbKr6mEgz4Saej/xZ43YRwp
	aABHuh9QlPbTHqywwj0eyZUNMu8AAJjqtd/736vufDXqicPo0F04RAP7L8neyHnESGMo14xjBiC
	jUJ4aP5TfsBpgyJkSrLJcMcMZ9pmyrcxmmkyfV025maLKpnjxdr/fGxHM59XsCYcRAqADfzeXGf
	q4VprACed2tPzGa3JmXJGZtkd3LMrT0Sx6QnU7I7JvEZWSDSzDdExcuYXHB3SHEEqjD401LGbEw
	qjKYkvx2KBMxCfve2Vn0gCcmGNCvHFVIz5g==
X-Google-Smtp-Source: AGHT+IFfwIOX9C5Hvq08+iGyCAzDppPVBHIfVhRFt64g6Selhj/kEDegSu31eKdTL1n8aDAHgkZshw==
X-Received: by 2002:a17:907:7215:b0:af9:3116:e0f6 with SMTP id a640c23a62f3a-af9c658c444mr1197031566b.53.1754902495710;
        Mon, 11 Aug 2025 01:54:55 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:c207:b600:978:f6fa:583e:b091])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91ee3c1f7sm1924687166b.68.2025.08.11.01.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 01:54:55 -0700 (PDT)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Subject: [PATCH v2 1/2] staging: axis-fifo: remove unnecessary dev_set_drvdata() calls
Date: Mon, 11 Aug 2025 11:54:16 +0300
Message-ID: <20250811085417.2641674-1-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary dev_set_drvdata() calls - driver_data will be set to
NULL in device_unbind_cleanup() at driver exit time.

This allows us to remove the 'err_initial' label, simplifying the probe
function a bit.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 57ed58065eba..06f7cfab4c6a 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -693,10 +693,8 @@ static int axis_fifo_probe(struct platform_device *pdev)
 
 	/* get iospace for the device and request physical memory */
 	fifo->base_addr = devm_platform_get_and_ioremap_resource(pdev, 0, &r_mem);
-	if (IS_ERR(fifo->base_addr)) {
-		rc = PTR_ERR(fifo->base_addr);
-		goto err_initial;
-	}
+	if (IS_ERR(fifo->base_addr))
+		return PTR_ERR(fifo->base_addr);
 
 	dev_dbg(fifo->dt_device, "remapped memory to 0x%p\n", fifo->base_addr);
 
@@ -711,7 +709,7 @@ static int axis_fifo_probe(struct platform_device *pdev)
 
 	rc = axis_fifo_parse_dt(fifo);
 	if (rc)
-		goto err_initial;
+		return rc;
 
 	reset_ip_core(fifo);
 
@@ -723,7 +721,7 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	/* get IRQ resource */
 	rc = platform_get_irq(pdev, 0);
 	if (rc < 0)
-		goto err_initial;
+		return rc;
 
 	/* request IRQ */
 	fifo->irq = rc;
@@ -732,7 +730,7 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	if (rc) {
 		dev_err(fifo->dt_device, "couldn't allocate interrupt %i\n",
 			fifo->irq);
-		goto err_initial;
+		return rc;
 	}
 
 	/* ----------------------------
@@ -747,15 +745,11 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	fifo->miscdev.parent = dev;
 	rc = misc_register(&fifo->miscdev);
 	if (rc < 0)
-		goto err_initial;
+		return rc;
 
 	axis_fifo_debugfs_init(fifo);
 
 	return 0;
-
-err_initial:
-	dev_set_drvdata(dev, NULL);
-	return rc;
 }
 
 static void axis_fifo_remove(struct platform_device *pdev)
@@ -765,7 +759,6 @@ static void axis_fifo_remove(struct platform_device *pdev)
 
 	debugfs_remove(fifo->debugfs_dir);
 	misc_deregister(&fifo->miscdev);
-	dev_set_drvdata(dev, NULL);
 }
 
 static const struct of_device_id axis_fifo_of_match[] = {
-- 
2.50.0

