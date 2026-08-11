Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410F925B090
	for <linux-staging@lists.linux.dev>; Tue, 11 Aug 2026 04:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786424323; cv=none; b=uGAlwAvCQrxEUZv53s6hKeOUvY/xf/p9k37CqXcqupBXogPSyxz0xEDo5aYLhLCendCNn8rDTzTCAr7zscWwP29wufdZE8ghR8JzpjShWWFztKn+6ObNGOIEZ3aIBtRMWUEaidhnQltzYMHdyioqqf4nLEbktdw4L4srkZAZZhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786424323; c=relaxed/simple;
	bh=V1BC7pcnL7xgkjEYSFKNqg/OEZTeEU62mweOQ+eGzhk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HzF7yT4x1eDErH8kHlnfvqRLuKTpQr1gC036fjiFFohMai8/sYpy/0UfHM45/SXOvMDFyBXnCIzsVBJGXEj2iscuc1zNqK0uXmfSXlA3C3yZexuLaZRbYvNMY7xl2Sr3pausOhjsv4xtwFNS9zxS0+ZRlxh51TQAl+IftvEKyyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OApQWIhX; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OApQWIhX"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38dcbade417so441369a91.1
        for <linux-staging@lists.linux.dev>; Mon, 10 Aug 2026 21:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786424321; x=1787029121; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6XusYfT0eiUdU+Pbin+1ksOwGMs+hLI/teV7kKTMr4k=;
        b=OApQWIhXBEWFHhnJiry5ju4azPhML87O9VZ9te6q6ucFTJvR+reojk2Dxim3VvSyfS
         iLo3EnLRvpHFSTpaRGM2poSgDiIFvL58GLXMsXHxWd9ZpdZbyI8TnRqlHsNgmds93Ofx
         bsf0fP9f2Q1fl/PlS3oknrSvAG846h1XbovgXIWgPtF2oaC7zaLtDv2k5s0v5A8NqRXE
         tEw/pL5OXrjpxyAWjbGqmrIQXtNGRTUCXU9TJ591mvctXZ4btKmAYAmPzsmbEdMiKMz9
         fBAooPMSlJLhpONkv69+nzjL61tBX87l+63SAEGrQFcpgtxZ6WZZUKxaQSdD6Ks0d5Ux
         MI8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786424321; x=1787029121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6XusYfT0eiUdU+Pbin+1ksOwGMs+hLI/teV7kKTMr4k=;
        b=SoNtsE41A9iYT4us0BTOKASvTujZfMiUrMiJk5tuaNNTEgnu3ZQ2jAAiRJOliGxMNR
         UnFw2mnF3Cl+oaO/q6ri0d/F2JFExElQOmWzlL/33HxybmAH26SSTyOl2tX//EVywE78
         cz8v6+9IlC7rlj1mDwkYoeqL67YfzcfANzxrO0Q45Af0i4wCq339AKyF5lawEWXXW6ED
         N0aU9ddgd8zySdpN4D8HEaPIF5QLbGuvZTKqH6EwQSFbExGVK2jYC7kIYn3ow1TwIu4d
         Rgi7O8a5+WmPz8HSbFf9G57pqq/EoYoU98eEyrx2s/UYgIBkdXdiRXwA3ElfG6QBMgjk
         PqUw==
X-Gm-Message-State: AOJu0YwufHE3zEJPn12uM0B/4S62Z+nzh9KXzgFEBQfNqRF4U5q9f01Q
	QyunWJRjLemxxZyYLWjlGXPGoYamgMwyD0MU5bpoE3bKlbLeyfG2y7+0P7m9cg==
X-Gm-Gg: AR+sD110QZnCDQKglCgAPWhKAfp4iHDtjUcdgMClluHZ9fxfq3kKqGqOtnqt5KsgOfj
	LIb2ke+rpc7LzakgZwtjG6S9vP2nU56BYfqU53JJ086aj6bWvbVDrnsNs9K9WbKAAPVYlcNNNOR
	O2yMjTJs+os6QB37XwLkZ0/Sr8b5VRAEb+l6VslNrDlOJ3F6AqWhBGNroAf4dSs9rONXrMJt+kw
	cjiQ3W0kB/WnnALCJp4lvRghPqjvYfyTrO9c7zyL0fSv3cerHlCJVQRxGgHTT3F7c9Qw4jvVgbG
	DuFoQTyFrSgz5RNjsgi/uwY7+WY4lKEiuHRckDNvUJh4BNedUySVOlgMpUcI5HqgfbzffTM8Uu+
	D9k1G62eeBi9eiMgD0ljABcuqvYwEbejnIUxJU3HY7uxaeRmnnWc5xmKOvn7oQt2yRTh4kJYAlT
	iqERNox8Ifg0cSF6GMN/fRg5zhyB/l7Ed7s+ePbi0Vbtm1qbIJGX4P/RLocCCLnw==
X-Received: by 2002:a17:90b:1c03:b0:37c:6910:5758 with SMTP id 98e67ed59e1d1-392ec3958bemr709272a91.1.1786424321425;
        Mon, 10 Aug 2026 21:58:41 -0700 (PDT)
Received: from localhost ([103.210.95.66])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1412042dce8sm1791646c88.10.2026.08.10.21.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 21:58:40 -0700 (PDT)
From: Raushan Kumar <mitramaurya80@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Raushan Kumar <mitramaurya80@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix brace and indentation issues in HalPhyRf.c
Date: Tue, 11 Aug 2026 10:27:30 +0530
Message-ID: <20260811045730.49149-1-mitramaurya80@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary curly braces around a single statement if
block, and fix suspect indentation for two conditional for-loop
bodies in ODM_TXPowerTrackingCallback_ThermalMeter(), as flagged
by checkpatch.pl.

Signed-off-by: Raushan Kumar <mitramaurya80@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalPhyRf.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf.c b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
index 9e4d42e3a122..2fe084eeb364 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
@@ -117,9 +117,8 @@ void ODM_TXPowerTrackingCallback_ThermalMeter(struct adapter *Adapter)
 	}
 
 	/* Calculate Average ThermalValue after average enough times */
-	if (ThermalValue_AVG_count) {
+	if (ThermalValue_AVG_count)
 		ThermalValue = (u8)(ThermalValue_AVG / ThermalValue_AVG_count);
-	}
 
 	/* 4 5. Calculate delta, delta_LCK */
 	/* delta" here is used to determine whether thermal value changes or not. */
@@ -229,8 +228,8 @@ void ODM_TXPowerTrackingCallback_ThermalMeter(struct adapter *Adapter)
 		/* else if (pDM_Odm->RFCalibrateInfo.CCK_index < 0) */
 			/* pDM_Odm->RFCalibrateInfo.CCK_index = 0; */
 	} else {
-			for (p = RF_PATH_A; p < c.RfPathCount; p++)
-				pDM_Odm->RFCalibrateInfo.PowerIndexOffset[p] = 0;
+		for (p = RF_PATH_A; p < c.RfPathCount; p++)
+			pDM_Odm->RFCalibrateInfo.PowerIndexOffset[p] = 0;
 	}
 
 	/* Print Swing base & current */
@@ -253,7 +252,7 @@ void ODM_TXPowerTrackingCallback_ThermalMeter(struct adapter *Adapter)
 
 		if (ThermalValue > pHalData->EEPROMThermalMeter) {
 			for (p = RF_PATH_A; p < c.RfPathCount; p++)
-					(*c.ODM_TxPwrTrackSetPwr)(pDM_Odm, MIX_MODE, p, 0);
+				(*c.ODM_TxPwrTrackSetPwr)(pDM_Odm, MIX_MODE, p, 0);
 		} else {
 			for (p = RF_PATH_A; p < c.RfPathCount; p++)
 				(*c.ODM_TxPwrTrackSetPwr)(pDM_Odm, MIX_MODE, p, Indexforchannel);
-- 
2.55.0

