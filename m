Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A94364CD
	for <linux-staging@lists.linux.dev>; Fri, 15 Dec 2023 15:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kg5rEaNz"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-77f43042268so145436785a.1
        for <linux-staging@lists.linux.dev>; Fri, 15 Dec 2023 07:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702654194; x=1703258994; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3b/9IA5Vs/lvs6yWAUrUkdCRzRrQb2WKDgnvhICKhEQ=;
        b=kg5rEaNzap0d1R/XCMzX3qjoMKQFxYFt6YNCDL39bpxehz2hBrn1wzBQOKAngIAmkX
         zUdPi/dw9ZIJVVgsd11g8WZr6GdXFtuyOSE6DRXx2hE8wXt39ZO1XjzjfSgpurIqm4ko
         jDWNigsMRRQl7b39QFXINxX5NepPeSUYPGmRm/HwplfhZqhSpSIOHriDi1FF+FPujefn
         O3m+RnDnLaf8xPDeZs2W+HdJxJffKzi/yfFiH7Go/W6KT2YnH5397nIADfdeSMzvfp+c
         U4O7VQjpUrKUuMjhHJIkLecAyv+gfoaHkde9SrRdnsHOADRGPOuf4jjOqzE00kE4EmFu
         y8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702654194; x=1703258994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3b/9IA5Vs/lvs6yWAUrUkdCRzRrQb2WKDgnvhICKhEQ=;
        b=kyBTZVJe0yWeHrRX/5vXV/QsDGC0Hl7DhRULUgINF2ZsrAA3SPPSjisdp4sb4dVynL
         4Q1BocOdnA4UXRYJvPEzUbXnm2vgA+FjggMScrfXV+dWI1D5Binn0IsYWujCp/k0uiSl
         MPOexfZlJojAdqq6drRr6Xw2ZIbjmS2GU+qpmqgPQ7eWxlNUCtN5L8TQlEYz2Gm1//uQ
         25kkmlLPfWO/kh31Y0i4FehNj6IVUcwXq1MQ/P0C9dZOGGyNhD3+k2YYWcvERFMrMRsu
         8aFkmmqXFtBay7F7rTG82X5LKMhKPLfZMtWak+oIy90Xka7bi/r0Yz0AJ4sou1anej34
         T5ZA==
X-Gm-Message-State: AOJu0Yx65ll213naU9/QS7xCWjjuwevp/oYSP5tY2mhf/PzqMMkXA3Wc
	WXYe+7ouEBWaQCUwSROOVTw=
X-Google-Smtp-Source: AGHT+IHqU5Ny11JN/doGZNTf6XohQ4ee/XB5Uv/POVOpRJHfJ7LwaebSS8rGUOABIGPcrSxnPV3eSA==
X-Received: by 2002:a05:620a:3913:b0:77f:71dd:d64 with SMTP id qr19-20020a05620a391300b0077f71dd0d64mr14357439qkn.13.1702654193947;
        Fri, 15 Dec 2023 07:29:53 -0800 (PST)
Received: from c853c274fc8e.taild933d.ts.net ([97.109.250.36])
        by smtp.gmail.com with ESMTPSA id db14-20020a056214170e00b0067eebb03a09sm1296456qvb.143.2023.12.15.07.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 07:29:53 -0800 (PST)
From: Nathan DSilva <expitau@gmail.com>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	tdavies@darkphysics.net,
	error27@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	expitau@gmail.com
Subject: [PATCH v2] staging: rtl8192e: Add blank line after declarations
Date: Fri, 15 Dec 2023 15:29:18 +0000
Message-ID: <20231215152918.532037-1-expitau@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ZXvevJ2vEEQ92rau@oatmeal.darkphysics>
References: <ZXvevJ2vEEQ92rau@oatmeal.darkphysics>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove a warning about line breaks after declarations found by checkpatch.

Signed-off-by: Nathan DSilva <expitau@gmail.com>
---

Thank you very much for your response. I didn't realize you could select
multiple --to recipients, or that you could have comments not in the changelog.

 drivers/staging/rtl8192e/rtllib_rx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index ecaa4dec3f94..397859c7f5b1 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -946,6 +946,7 @@ static int rtllib_rx_data_filter(struct rtllib_device *ieee, struct ieee80211_hd
 {
 	u8 type, stype;
 	u16 fc = le16_to_cpu(hdr->frame_control);
+
 	type = WLAN_FC_GET_TYPE(fc);
 	stype = WLAN_FC_GET_STYPE(fc);
 
-- 
2.43.0
