Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCF41F12F8
	for <linux-staging@lists.linux.dev>; Sat, 25 Oct 2025 19:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761421026; cv=none; b=NYssLCBz01yFvvTQJI4RpIeAKtyHEtjD1h1kDdWMtth32wqylZtN+WsQiiQCcdBEMoKgpBl7AiOJRLvbA1zyARMF3XebqDxoGyuFmtD1IWGpa77b3oUAxn3X6n5UZq87x1jEHP2nrsE5Tq3zdyzsjs+34UcjiHDqyvl4onGf2ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761421026; c=relaxed/simple;
	bh=+crvZClNQQCnwm3zZNAYgqCzKPrb9KlK5KyZOWEfDsQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uNtrvt4GkcPFUXyvHZu8OrS2wveX98IhOUJO5dSS1Ctdmnw8lJXCn/WhXUmTE8A1cx4uiBc2hdg03C7PN2wWLvt8QE1XT24A3FuWgd2TdPqo9iqx8g2pzwt0l7ClnNgokMIxo01CqaRtQBLlMMViP0bynzJYGxlf32p4Igie4Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJEzzC+u; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJEzzC+u"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b6d855ca585so181720566b.0
        for <linux-staging@lists.linux.dev>; Sat, 25 Oct 2025 12:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761421023; x=1762025823; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xv9RNCJUU4L4prMpvQIr5fUfZjPP6iuDGaE4hqx6zyQ=;
        b=QJEzzC+uSRMUIP2ndDkARjsU+k8oAfiMk223ZdO+QcFoPq5dE/MyMxnOc6Bq95o3hl
         oP0Wi44a+2BdTAYWl1WwfUYy3gU6inafhDm8a+yB2oMeaeOTnDERQU/aQRsG2AdG2lfC
         DAtkW+fOX+v3EDP5kE8rnH+WOzT2UoukcFfQP5+S4OuFR/wgZLWTAO1DhP0sh1y+e+8N
         2hHJJi/xf4u0JMF4/cDPXfyhqnADLxjEwa2FzI9LUlh1b457Ii4xSaxn7EuobhGh+xcx
         6xMSARE3bBPobA9MiUUxnOlJMRBue/mgekiDTPZoAUK8g1L2oMWbLVTJ7eAjOSAbj+b8
         crRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761421023; x=1762025823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xv9RNCJUU4L4prMpvQIr5fUfZjPP6iuDGaE4hqx6zyQ=;
        b=kegedHeZZkaXqQ6dYsj+b9hhOns/cqqNMCzFzqaMlv0IDdXwhiQRnfASIlQud8Z6Zw
         0rrtUzBsBV0A5GNRLWY2Rfbg7UeJ0t15N1Jr0bK/h6rhRCAVO/CmMVw+lzuGCtJ33CRY
         SwuIn1UDwlnHMf9W3xhxz9zpGadUoRTfTC6uKwYYVew3Jl7wqaz4Cl1hGQWHYS8Kt00M
         4zPM6R1zYcedwZGGW7i9P20jDVwQPJ0iA42tAj53j7hhhFHc9K8j1zP3XLCgilzyd3Jc
         8qXmrjZ8f4nzaUNZfQ6b3oP9CdY2d27nVB1HeW004tpih7kimaFkYCxt4oMAq1IVp8IU
         ps2Q==
X-Gm-Message-State: AOJu0YyGKc2HPMD2SU5tOpR71ocrQ2LwiL+M+o21TspqozI3J3BtDHCC
	V9PngrDmdifzfnUrcSWJmaN9JhTjaim6gRupaQinlj3BHS4whaPfXE1YSwvJLw==
X-Gm-Gg: ASbGncvOQFXaqUGJMSRv/3JrZzIrKccpolXz5/XxWEFelFRAT3n9BZBgXWyNCzOenEZ
	YQ1fscqIXqV89iQjvSpTf2T8UCtLJ3KkiwLt4Hkk2T3tyuN9B/XDuoRUwd5Z4GT1XKWkRBpg262
	3w9PWbrIVF+IYo4u1XGZSobgV9Bucgyct8TvSkPm4d90Ncn8frPrkdGZhnQlQ213+D3JKVzrG88
	qvfBSPCTdyGkRp/s21O5qS7e5N/1oD1EKbSykHYQ7qjUTA7Aeu4wLQBPFBwsB6/axaVJpu5aaKz
	7B+b7CZrUP38WkY6+LmDfPrhql25iqV/aqHZlX0Yo1aw5FfSpp4aMZI3K30cDf4yvQqwHbEmVuO
	4XHzA9pQ8R+0g9rg1HZdw7d3Yhgc10/3d7+C3Vxsk6W99z9T/hqt6Wq+w1uHl90E1yNNxluNn3x
	pHV6B8XSWkykZIGe0usRL1rGR6a7hWKHfiYg==
X-Google-Smtp-Source: AGHT+IGp8VJ8f96q0Hl3WFVWGbJu7gFgn0/t1dBgHLjvjsWRAg44ndpqTl5nwDeXHqlFzkx2hAoKcA==
X-Received: by 2002:a17:906:f589:b0:b04:61aa:6adc with SMTP id a640c23a62f3a-b647195b6c9mr3543269666b.7.1761421023130;
        Sat, 25 Oct 2025 12:37:03 -0700 (PDT)
Received: from localhost ([2a02:810d:bb0b:f200:16b9:a443:7d2f:9581])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8548eda6sm270706166b.75.2025.10.25.12.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 12:37:02 -0700 (PDT)
From: rafiqul713 <rafiqul713@gmail.com>
To: linux-staging@lists.linux.dev
Cc: rafiqul713 <rafiqul713@gmail.com>
Subject: [PATCH] staging: rtl8723bs: replace rtw_sprintf with scnprintf
Date: Sat, 25 Oct 2025 21:36:58 +0200
Message-Id: <20251025193658.175399-1-rafiqul713@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: rafiqul713 <rafiqul713@gmail.com>
---
 drivers/staging/rtl8723bs/include/osdep_service.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index 8b1634f4091e..019792d0595a 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -119,6 +119,6 @@ struct rtw_cbuf *rtw_cbuf_alloc(u32 size);
 /*
  * Write formatted output to sized buffer
  */
-#define rtw_sprintf(buf, size, format, arg...)	snprintf(buf, size, format, ##arg)
+#define rtw_sprintf(buf, size, fmt, ...) scnprintf(buf, size, fmt, ##__VA_ARGS__)
 
 #endif
-- 
2.34.1

