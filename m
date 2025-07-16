Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AC2219300
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 00:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752627362; cv=none; b=LCXmPQ5ZenddlbTVYcqR/wqwiU/gKFues927qEvGyYuYFCZPmKDWIGHDm/qRP/nZ2QfS5g+WbJczpSzVgr1yBbONk45DIK7tE+czWyvOoJ/u/cB6ktJUwfEpbmv3F62jERetq5TmpH8uX6EbWEdmqCtAT/zWA8QtquM58CKxsIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752627362; c=relaxed/simple;
	bh=A1jcgsCCaH2jJ1PCRVj307kFt7DEWXiLPnpHolIf/3s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bznX26fg3al3undxaPKsmMOaWQgk6IUijl+c2UVtA/vvv4z9zWST1CHCoFt0tBtBmqhjxON0INPRDoiqKeKVtcZozW5ti8dZk8k0ghN+foXqaXHCtMzP06UtItd7qvSQEubQxl8qpwnTTA4G0NIws+0t9rMK0ZVQvAg9XBVApj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aoe4UaZU; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aoe4UaZU"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2efc0ed41efso1790997fac.1
        for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 17:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752627360; x=1753232160; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nzm/Aano13/YJhFLGOliGrjJa3CPGr7ux5PL63hZIZM=;
        b=aoe4UaZUs4sDMIjwlkxfQ43o5wpV9B85E34m78H619vgpzc2jUFyeNNzfwF0GIBJPD
         rousZvf6CnKt1h/xb7zIF2O9OWB1qGDFgsL1mw8hD6FDk9f672sRITOtcGhq1xEp1dMX
         wgJhPcnHWR9TTrW7lbGYjXzMVV4oXn+1sthq3uqWj8BYoDczaRtipCopcx+xMrlvm2Td
         yVadAncrrE+5hhDqg9mr2NMUbOp4DVi021JS+DbBtvf8SsbbmCV9o2OinVcA0aCdmxFi
         dqJEqICULVcMjncDJWsK4yEN/0yiWDfkAzYVWIRfGuDu/g11oWVYcwoRUbaZ4EGvpGd4
         Hzsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752627360; x=1753232160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nzm/Aano13/YJhFLGOliGrjJa3CPGr7ux5PL63hZIZM=;
        b=F1iYP6iEAb5MQl+FtS26tU1veOiFxjork7ltJUD6HD2X2ms2s6knqdIMGp3xg3eV0Z
         m8pM1xSMazsXfqrS2KhjkvH0LfMz9hlBzUhTvUfrp78rMmk1wxi9trkuwL51sWq8IicE
         52FoUItN3tJcEFPblFEVM/ImelzaLynvgbxMI174Vnz+a7LkpcxK3uwwpWualEPmECC6
         6S1uhKg22quye57Ga+92WlSylOtEheKhD1g4HLjp+lpODJqpo7956CBDO6TXTeii1Hmd
         2OF74jRMxRaDRVB2yLJ6MsVbVR7j88V3PAPYH9+ToLDHHL3dXUEmIhy4uuLA6dsY5oXS
         oMsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcXQ31mgH5Jx18N0zMSBDQigNFGJQ+3mFWwAnCAxIqSqKJeKsEfm73V+YpWWET2zVKd3I/o/la/rWm+2YO@lists.linux.dev
X-Gm-Message-State: AOJu0YyohGSe50yWaF+uE/p036unWx0otTBlv/lqVyIEm3amQglLjEOK
	6JO9Pr1IfBF20e31rSzZgOinYddtMS5BKBA7LkC2zIHhrey8+H5n60Xu
X-Gm-Gg: ASbGnctxNVbve6G9hR0XBrYVnnjIIS4LLCtGO3A4f2Tl/+RlOv7ibKG77wW5Lu4oWju
	M5wncQVNqI95rbcNQyYERf5GuAl66iVBGv7SvP1lqSXAFC5yS4qnn4OXd43RJ6crIP1AmVPrfLS
	9xf7yEY07Km55SQdRlp5pCSuUkDmoy+oBlHzyPwJABYRRbxt+7oioE2brJ2054+aal+BzBdw1qQ
	it0Rfq19NSVGirhbCM9Sh8il70PQuQaLApD6Nn3d1CXqaQzRMdLajQFk8kTysZhR2W1HW7jUA+p
	/GM2IODGi4QdGMRoKLT37WVaZg2mWSsqvjZ0WKTLHysKc8qneBfjZIMsW3xLNgYBS/sVRPXTZeY
	vehpKfXBemrKoPTPrfOviytQUufK4itnSRN8osPsP3KO116R1Js+V
X-Google-Smtp-Source: AGHT+IENYU2JZJ8KxIT/saxp4T2oj1N7yAgJSYvan87MotzzuMD7vRsgYPj5GXm38XgMFGLOyu9N7Q==
X-Received: by 2002:a05:6870:2dca:b0:2d4:d07c:7cc5 with SMTP id 586e51a60fabf-2ffaf2a273amr1257732fac.12.1752627360213;
        Tue, 15 Jul 2025 17:56:00 -0700 (PDT)
Received: from localhost.localdomain ([181.161.11.224])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73e56024edasm1035047a34.34.2025.07.15.17.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 17:55:59 -0700 (PDT)
From: =?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
To: dan.carpenter@linaro.org
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	devel@driverdev.osuosl.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
Subject: [PATCH 1/3] staging: sm750fb: Fix const declaration for g_fbmode array
Date: Tue, 15 Jul 2025 20:55:51 -0400
Message-Id: <20250716005553.52369-2-ignacio.pena87@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250716005553.52369-1-ignacio.pena87@gmail.com>
References: <20250716005553.52369-1-ignacio.pena87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The g_fbmode array should be declared as const pointer to const
string as its contents never change.
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 1d929aca3..d3bce107f 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -33,7 +33,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel;
 static int g_nomtrr;
-static const char *g_fbmode[] = {NULL, NULL};
+static const char *const g_fbmode[] = {NULL, NULL};
 static const char *g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview;
-- 
2.39.5 (Apple Git-154)

