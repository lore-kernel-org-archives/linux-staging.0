Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191B63DD516
	for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 23:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872673; cv=none; b=Zv2TRFNtcn3ehlo/tk+ungVWgsb6Dfb5RTwzmOyjxO7tRL9BqyRvRhuLAFQBGNp3WXT6+uvpV+eLLJWED6fljJzXljP4uz63otYL50hjdUpqH9YAKoHwdK0Q1E6ZqfsQ1/6d5i7HZkQ9mXnGf6mh3bWrdYsaWG4lwyqcIa/FRWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872673; c=relaxed/simple;
	bh=8sgBglwA/JZD3s5QLDFR6gbGeXrL/rfq/BC01OXwQ6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QPkS/vRq/1iy2VhYkSihAo8aESgS5fg6AYkCXy8oIMuDZh6FJ/8/2QyjEKlObUyPqG3vpU6ecpO/ueQsnE8pIMj6KJR+ItmklYUlJsGOkjcwUsuqMtTPGe7Mg5mkXeKhley0EcOID7xkmRLqNRnGl4NW/RY1oGPCWt4+cfJtfH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jBVGSoc+; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jBVGSoc+"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4956869750eso1761735e9.2
        for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 16:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872668; x=1788477468; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GebuOBWxdSlma292Cd7c/kTR3183p1RfnNGHX7vtHbs=;
        b=jBVGSoc+vr3n0JvCJqYsKMj5TDIKBDL2hioctJBbwUuDVmEQcNXuDdLWHK6gxx/VuV
         cxJSoEuPkQ7xeF8nLltECnYURabUGCajDq7QS7ErORVu7A5NOIiCKomnx+d8kNvjSLNl
         LGVahX6bNnhex5pqlZpxwL7fW212+Qkq2Sm0Z3jV9NRaJRAS2J68eMlWXE6qZAjLRy+l
         8A+gysgudAOxXqeZSj3wW59QSswkJUtnUWJWLydCHXo4uardjH1reYWTNrOESrFXNa9o
         UcNKO7KN2xCfBrJPPN3xOt5z7nhsggCBnVjWJgH86qAkExPoMjqT04i9EDv0C9KlHtmu
         uU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872668; x=1788477468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GebuOBWxdSlma292Cd7c/kTR3183p1RfnNGHX7vtHbs=;
        b=P8HiyhxjQQgbXmIkwNbuIbyYy3IaocC7wvAMuB+LyZsIFH/i1M7UraDyPobkX1mqdk
         mf/QBAE7F2KcqftR/zNKi7LKFqgws3BQ7RvI2puAOuWJWK26ECmgl/aysh5ZlTlvxblZ
         lAeNCuL01Wt8dBFsiBeOawt4v9hMakR9xWPjwKR678sGFWkrz5/QJnBM/inzrAw/WENF
         m7Fks1BU1cgOvvQh5OoZKMzB3QwYjzSOCKe0LErG964zLDI87UeT1EFc4PmUKX5WP2TH
         /B+G+oo+lJznbA+O6nNNpKOUc8wC+7D+WyT+uF303yUcx4oagtLLTUVHsuw7DhQrUPUQ
         E+ig==
X-Forwarded-Encrypted: i=1; AHgh+RoZ6o9ulwuCOlyIkvnlUtvv6K3Vdg5IXH8At2WEaYK+HWLK4lvokC9PpoIiQjEDiqSE9HnE0URSa7dazRCW@lists.linux.dev
X-Gm-Message-State: AFuF++kootpg87UoeipoJfPydbmYYikdXrmznuXqMmdbmiXhljcrGWfv
	UtAfl1YIk1aZpMyA2xw1xi2eSIeuxEUX19IA5osa6AcnU7l38nqiEEf9
X-Gm-Gg: AR+sD12bHXErOz0N6phwyMvimrZsR0SuzVg3tVCR61cGwod4W1BSqDNv4JGt81gLeRa
	i348hXpkrkIU1bMPqiY1Gq/NgfQJgJe9LGMzuaKEnlvNEUhGaSSC62mjRGKjnjouMRwwu30P0S5
	uSEQHiin54yHyQWVSjmY9aVXAiI2W5JEzsk+UeGjSmlV0xtFS+jG9cOCUza1OtKMhf8kkh633yH
	o9NHlz28rZhCXgjwQTQb2d0gLcHfFZTeVYhiXSEZJatny/2aTWYR8jVPz3Gk/ROwMGCh193bvuB
	pxaqsj86bgGDRlKAzBdl+E1HFvPLNOUv9fzx8MmaCyBAzVtu2uHHv+NSOXwfMKF+cUyN2xM7d3D
	EyAN0aRoH+M816YqySnpMEy8FXPoqD71wLFon0kojKr0S0TxGpPAVX5OMvqsxAHjP21Yb+fqZG2
	XJykVIjRwB5SePn1MmkQOizUT4OssdG4Hqqh8+SwNap4fZ8Le/SykIqA90cEGm15HxYfljEbJbP
	3mqlmOiKFOj53pv6KwNGKARvLqggzoQDgh6jwfiIt6D
X-Received: by 2002:a05:600c:4453:b0:499:8777:ccba with SMTP id 5b1f17b1804b1-49b91c486abmr31698845e9.12.1787872668079;
        Thu, 27 Aug 2026 16:17:48 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dc0f57sm7157765e9.2.2026.08.27.16.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:17:47 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v3 05/12] media: ov8858: Add INT3477 ACPI ID
Date: Fri, 28 Aug 2026 01:17:23 +0200
Message-ID: <10cefd9c6dde13eeebee5a1ba9109f35e2201305.1787872237.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787872237.git.mauriziocasciano7@gmail.com>
References: <cover.1787872237.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Firmware may use INT3477 as the ACPI hardware ID for an OV8858 image
sensor. Add an ACPI match table for that ID.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov8858.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 9b3e6eaca665..26093f887c66 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -6,6 +6,7 @@
  * Copyright (c) 2017 Intel Corporation.
  */
 
+#include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -2088,6 +2089,12 @@ static void ov8858_remove(struct i2c_client *client)
 	pm_runtime_set_suspended(&client->dev);
 }
 
+static const struct acpi_device_id ov8858_acpi_match[] = {
+	{ .id = "INT3477" },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, ov8858_acpi_match);
+
 static const struct of_device_id ov8858_of_match[] = {
 	{ .compatible = "ovti,ov8858" },
 	{ /* sentinel */ },
@@ -2098,6 +2105,7 @@ static struct i2c_driver ov8858_i2c_driver = {
 	.driver = {
 		.name = "ov8858",
 		.pm = &ov8858_pm_ops,
+		.acpi_match_table = ov8858_acpi_match,
 		.of_match_table = ov8858_of_match,
 	},
 	.probe		= ov8858_probe,
-- 
2.53.0

