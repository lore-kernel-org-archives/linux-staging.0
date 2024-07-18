Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2734F1B86CE
	for <linux-staging@lists.linux.dev>; Thu, 18 Jul 2024 03:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721273574; cv=none; b=RKZ+nVixIyI2lKnqw8zbkh4vkhKso9fu+gS7CH1P9sRU/3BrafI334CCsYvTwMiqTC5DEk/05JCfSe+DmvzJVYz5q843TUGZ2jQUAFxT9WKMf91PSp7JlSSFp4jftr/WHkDZn8fvcv9zpwylE54fRwvnCxT5BhpmTdEofrm+dm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721273574; c=relaxed/simple;
	bh=pn0XkbJ5xt8Lw87GVQU4S3dyqfCB13ZnuXjhfE2jv6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KoU/BL/sHJpSfTh1HyrRcaswXY5c/lFne1Csd1fJoV6nJsq+CRFXgQQxDmk91iZ7vEHge34Xl117t/jvHKAHCkhWatI19pBAZmboeqmatf/sDdjgyzEoTsJPTrtfes8F33P3Qy5ek3FxXE1D37OBcouCx/WNSSNRed1578DYm2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMuBpNRq; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMuBpNRq"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-4f2faade55dso131078e0c.1
        for <linux-staging@lists.linux.dev>; Wed, 17 Jul 2024 20:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721273572; x=1721878372; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NwxJu27KxqSJJA/LPshmYXOW4rkUwmPyEJHd8O9VTg0=;
        b=gMuBpNRqtBbAUDrdltUwjl6Dhy2LmmE1dPZ4zoerFflEekEakikQzF9zGSHSIsP+PW
         bEuO8XuNbDG6ImciGTx7bMx02KM7813UtaydEvAqFCA5UU6AVuC648twJ1SV0/QGaj78
         D0LfVB580YLERRLbBbthq7FAEt4P+iXU1zCXFL2VVufwSh+JkLLIOm/5AMoErEQL8trC
         C/aB5m8Jb8hKytjkxXUpb0KyXhvvqjcQmdyQdbfeL3xyWXC7Y9qpON6h+6+OwMKs0FdJ
         kYXUCFaGZIf3HIh7eI9y9toVBqq63avtdY7ttyjzzkRQLsiVJHzUaYL64Wy4uVDLzcPR
         cK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721273572; x=1721878372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NwxJu27KxqSJJA/LPshmYXOW4rkUwmPyEJHd8O9VTg0=;
        b=JDInUjShYwKqnN9r5c6lG0yfbCOo5eTee4Q2QjUFqEQPT7oskU2ieVXBjPgacbgps3
         IK4LcH1dCizD3gPWSFepa2fFuBJpuIEz55rN3TXdoWo8Pc67Hfa/nky+BMO2/ip0vSxr
         YDC4Xs1WwPi+fjKsB4Rhl+PLVjWth14JTcSzPF5NEAyy+ollqqG2/Ij0f1LdljGxFT2c
         7X8/ef9mc257P+KJQm0DwiJCqqbiQb3MKnJasIaN3okkSylPbVWAvQOcQIzitjYSzNEB
         Ur8zsRwyATg5N2wz694W4IpPld024Huk9QAqX0WnGQh2fK/0wRDYQAGCVSwl6UseLzlM
         zrtw==
X-Forwarded-Encrypted: i=1; AJvYcCVjsSCMWLxXBbdh3hRGsYITdQ6DW5sWTer/3l4jYR17jrtp/ZKKYhTBr64IV1/9vwNCCv0Z0fVRkAblu9ZKXh2k6NqzT7Rxn1joRtpBlA==
X-Gm-Message-State: AOJu0YxHGHIJF7/XYrtWYKL2J5Bhs6NYLEt16ovY5Tel+6gga6302nqO
	gJCSUJj+urIu6OMqKuevQGUuc4kavmp4ZgvdGxW3HQtbzPHIQC/9
X-Google-Smtp-Source: AGHT+IEeKSQL1uTy69+TewRtzoQfxHTxK88+wkfnor583yF3CqLB+tjyij1cbo5XSfRexgBA2Sqj9A==
X-Received: by 2002:a05:6122:3d06:b0:4ef:530b:9d56 with SMTP id 71dfb90a1353d-4f4df66e7ddmr5308652e0c.6.1721273571458;
        Wed, 17 Jul 2024 20:32:51 -0700 (PDT)
Received: from fedora.. ([2800:e6:4000:47e:7c52:7bd4:cfe5:9874])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-4f4ee9bfa27sm68582e0c.31.2024.07.17.20.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 20:32:51 -0700 (PDT)
From: =?UTF-8?q?Juan=20Jos=C3=A9=20Arboleda?= <soyjuanarbol@gmail.com>
To: gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	johan@kernel.org,
	linux-staging@lists.linux.dev,
	pure.logic@nexus-software.ie,
	soyjuanarbol@gmail.com,
	trivial@kernel.org
Subject: [PATCH v2] staging: greybus: break multi statement macro into multiple lines
Date: Wed, 17 Jul 2024 22:32:07 -0500
Message-ID: <20240718033207.333591-1-soyjuanarbol@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <2024071723-nurture-magical-7817@gregkh>
References: <2024071723-nurture-magical-7817@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The macro `gb_loopback_stats_attrs` in the Greybus loopback driver
contains multiple statements, which should be enclosed in a do-while
loop to ensure proper execution and adhere to coding standards.

The latter is not possible as the macro expansion will create invalid C
syntax. Theres is not such thing like inner function definition inside a
global scope do-while in C.

This patch nukes the `gb_loopback_stats_attrs` macro to enclose,
addressing the style error flagged by checkpatch.pl.

Signed-off-by: Juan José Arboleda <soyjuanarbol@gmail.com>
---
Notes:

This new version uses a bit different approach so the commit message
will be a bit different as well.

P.S: Thanks for being that patience and apologies for that false
positive of building the non-included driver. Now it is tested-built.

 drivers/staging/greybus/loopback.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index 4313d3bbc23a..88d86b084f28 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -162,11 +162,6 @@ static ssize_t name##_avg_show(struct device *dev,		\
 }									\
 static DEVICE_ATTR_RO(name##_avg)
 
-#define gb_loopback_stats_attrs(field)				\
-	gb_loopback_ro_stats_attr(field, min, u);		\
-	gb_loopback_ro_stats_attr(field, max, u);		\
-	gb_loopback_ro_avg_attr(field)
-
 #define gb_loopback_attr(field, type)					\
 static ssize_t field##_show(struct device *dev,				\
 			    struct device_attribute *attr,		\
@@ -268,15 +263,29 @@ static void gb_loopback_check_attr(struct gb_loopback *gb)
 }
 
 /* Time to send and receive one message */
-gb_loopback_stats_attrs(latency);
+gb_loopback_ro_stats_attr(latency, min, u);
+gb_loopback_ro_stats_attr(latency, max, u);
+gb_loopback_ro_avg_attr(latency);
+
 /* Number of requests sent per second on this cport */
-gb_loopback_stats_attrs(requests_per_second);
+gb_loopback_ro_stats_attr(requests_per_second, min, u);
+gb_loopback_ro_stats_attr(requests_per_second, max, u);
+gb_loopback_ro_avg_attr(requests_per_second);
+
 /* Quantity of data sent and received on this cport */
-gb_loopback_stats_attrs(throughput);
+gb_loopback_ro_stats_attr(throughput, min, u);
+gb_loopback_ro_stats_attr(throughput, max, u);
+gb_loopback_ro_avg_attr(throughput);
+
 /* Latency across the UniPro link from APBridge's perspective */
-gb_loopback_stats_attrs(apbridge_unipro_latency);
+gb_loopback_ro_stats_attr(apbridge_unipro_latency, min, u);
+gb_loopback_ro_stats_attr(apbridge_unipro_latency, max, u);
+gb_loopback_ro_avg_attr(apbridge_unipro_latency);
+
 /* Firmware induced overhead in the GPBridge */
-gb_loopback_stats_attrs(gbphy_firmware_latency);
+gb_loopback_ro_stats_attr(gbphy_firmware_latency, min, u);
+gb_loopback_ro_stats_attr(gbphy_firmware_latency, max, u);
+gb_loopback_ro_avg_attr(gbphy_firmware_latency);
 
 /* Number of errors encountered during loop */
 gb_loopback_ro_attr(error);
-- 
2.45.2

