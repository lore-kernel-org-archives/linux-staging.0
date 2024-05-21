Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB0458217
	for <linux-staging@lists.linux.dev>; Tue, 21 May 2024 03:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716261454; cv=none; b=AA8sOPF0d2EaXmwcVV2oykD8l4jamrSWv3mJ7pqK5dFrOZia+lPamdaASJE6ymaVHAsksCPdTqkdr1XcHPQqc+0rb3llbznUraw7ehg/EWUijQuFIpyki7L4e8UHnuQgzQXRZhH4OqnD8cphYvpypw6uRzUWZ+O5+cUNuKD1QPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716261454; c=relaxed/simple;
	bh=0KJ6/0UmzK8lxJK25BNUy5fsFD+en8FEeDG8l85Cv5A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DBR2UBP6F6lMAiWmL8aFpzl48grJKz/0F2ga8PNvc7GxRNA8wvg5T1OFRXFjwxOib7NmuyvhanVF9pPQbxY3xJY0kaSiIdLt31Sk3QjHbTKuVB9ZAjQkHVMqcW+ziRH1MDchJP4sZgvCWI0gkSxcqTDBKXfKUeXwhqGnPgKFOS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=iyXE1Zre; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="iyXE1Zre"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1ee38966529so24149085ad.1
        for <linux-staging@lists.linux.dev>; Mon, 20 May 2024 20:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1716261452; x=1716866252; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZPE9OC+GQk0I6LRtpC2oK8ZC/gu1AchzTamw8jiTg6I=;
        b=iyXE1Zre/YilWy7UhvWt6XDFLVz2EQ4cEBuEmF9qOPtsBnfA/z9Fe+zCZtQKd8yhyJ
         KDkHPEyJdzuVuGaIm7WUEmVZOeEtwNaYAy+RUXUxm05NkpRrh/zHZSV0Kip0meXuIbuD
         V1XcF+LGzzELMFCCexvnEIsllmIiofQ2yQeG62SNa59GqpBmh6T9W4pY/5cewhP7T6Xe
         k+4yn+7bAGqWTPD2acRwQs5c98ZsAq8zXiZ1Us49AJZTXWjshAoblDCH8w8d3fRwh94S
         9IsBzba3ADEjB3o4axXXMV05TOTY0fkJpAUH5uOhiCDh7PM/BTDKBPxSBcZrUXCbzzzb
         23/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716261452; x=1716866252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZPE9OC+GQk0I6LRtpC2oK8ZC/gu1AchzTamw8jiTg6I=;
        b=ShuTLzzLfxmPJNn+6gWZODwBzDGYFcNgSN5Boyhix4OFUyTNZxZnbZy+CG4LRdYeKI
         Eo4waE8vSMr6O0NCvZBIIjwCoKiDaerr2yqCnIIq/+e7i1xsy3JUP3lXbKco7FahEIXd
         5xy/8+ViWQSfqroM5kacMCQmJxGFd2k0sjiXmFJymkXwEP+Z5SSuPjk8ShLlQXzG/Z7q
         10sJNNxFCsW46aPVoeecMQopiN1JDWvGJ8toOBQWTSX/VSYHfXRqnRwHm1ca2SL5Eyfp
         uQQHFPL2+fSiW/VRsdfOJougkPWvAi/8ptlMA2/x/BwJ7w0Iqz7pWfqrqEeJ/ZHKuweK
         jgsw==
X-Forwarded-Encrypted: i=1; AJvYcCUqg6bIRT0DUZ8Rkaf7t4vGZo6Bd4N9zykeW9j98ly2eiMgLc8JyiKrKvlbRvZu6QE76wrwnJgFejl/7beUVXPUfKK7dWA2zBuSs6tu6g==
X-Gm-Message-State: AOJu0Yz+x0iSS+tk3kdmgu7OcPhY42eeM7KuTNbw84D3wf0mqBMzzhM7
	9ZKJVMee2TUEwtD1WnBlMOTiqUjQbm22adNWtWNE68F2NA0M+IelZBWKvyqJbaQ=
X-Google-Smtp-Source: AGHT+IGhvkZi6H3ProckbnUiRXtNCDkSP46gIyKASbmiGcRGeltnEGsRQDKagpTmcKzBrSYzXsvV6w==
X-Received: by 2002:a17:902:e741:b0:1f2:f954:d69f with SMTP id d9443c01a7336-1f2f954db9amr76401125ad.18.1716261452501;
        Mon, 20 May 2024 20:17:32 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf31a93sm214885415ad.134.2024.05.20.20.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 20:17:32 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 14/31] Staging: rtl8192e: Rename variable Decrypted
Date: Mon, 20 May 2024 20:17:01 -0700
Message-Id: <20240521031718.17852-15-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240521031718.17852-1-tdavies@darkphysics.net>
References: <20240521031718.17852-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable Decrypted to decrypted
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No change.
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h              | 2 +-
 drivers/staging/rtl8192e/rtllib_rx.c           | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index fdf8fc66939d..1901a319316b 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1646,7 +1646,7 @@ bool rtl92e_get_rx_stats(struct net_device *dev, struct rtllib_rx_stats *stats,
 
 	stats->RxDrvInfoSize = pdesc->RxDrvInfoSize;
 	stats->RxBufShift = (pdesc->Shift) & 0x03;
-	stats->Decrypted = !pdesc->SWDec;
+	stats->decrypted = !pdesc->SWDec;
 
 	pDrvInfo = (struct rx_fwinfo *)(skb->data + stats->RxBufShift);
 
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 996662a06e3f..f69f4ca39fd5 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -481,7 +481,7 @@ struct rtllib_rx_stats {
 	u16 bHwError:1;
 	u16 bCRC:1;
 	u16 bICV:1;
-	u16 Decrypted:1;
+	u16 decrypted:1;
 	u32 time_stamp_low;
 	u32 time_stamp_high;
 
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 4c8cfa40927c..3afce436a5d8 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1025,7 +1025,7 @@ static int rtllib_rx_decrypt(struct rtllib_device *ieee, struct sk_buff *skb,
 	sc = le16_to_cpu(hdr->seq_ctrl);
 	frag = WLAN_GET_SEQ_FRAG(sc);
 
-	if ((!rx_stats->Decrypted))
+	if ((!rx_stats->decrypted))
 		ieee->need_sw_enc = 1;
 	else
 		ieee->need_sw_enc = 0;
-- 
2.30.2

