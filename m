Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270CC8BE7
	for <linux-staging@lists.linux.dev>; Fri, 27 Oct 2023 08:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gsIEBxyP"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso1485490a12.3
        for <linux-staging@lists.linux.dev>; Fri, 27 Oct 2023 01:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698396739; x=1699001539; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/jz+invX/2cwEvTPvTxl2fOwHAofZoD0Kt25dPPUM8=;
        b=gsIEBxyPtMVLw6lF2YVw3gtYtRTrGJJ+k2Pkyav7oZuZxRq9XStdcDBxrtgDmhF2HA
         bcLfcrtffd4ji8YZKRrey9fY8LFXEksWr2u2tcTPGzSk8pvgIGJVQVUYceJleXyQf+XO
         pESA4UDq3abXZjt+CsvqUasWKkGxrzUucW0BmsBBpTbW+Y+OHpSkGI40yMe7iiJyF9WV
         jFpFFHDU6osyOM4Zpi8HVaT3lbQ4x8pMNh05UNMLhzCRVjehkjI5Ss5SvNzqJw6zT9c7
         TyiVhuaVestbwz6fc/SEVydOf2E4Wi1yE1BSL+4ks3yxhf+wdUBRZOnru72CWbNtSpoH
         wLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698396739; x=1699001539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3/jz+invX/2cwEvTPvTxl2fOwHAofZoD0Kt25dPPUM8=;
        b=EKLFgL5DOTAxHayaSq93lNMJmsO/4V+Zq3s5iVxHTo3JzJ+QDRs+xzT2B9bs4bzXrb
         8hPKUNPJwk/txdCk+AIQ/Z2+7KjDq/uWk1BKnxVMVwCnHshgKyP8Ljh1OzTvB+NH6abh
         0zlZLE4i6Xam3ZKVZoD9/qt4G0oIM/ugb3vqsJD3fMQcGZQJFFM4cyuFcD7BZ36RMcpt
         UgP2tkgzfRJ181DAPpMXi04uJBg3NTKf3Izusyez1NHScESYgOXM9TYpYvT//q9hzEMy
         tm7MFuhl+bcX6SoOy0RmOQh8p8Sw6saufkElpIWLNnQYiD1mPyOnzKk6KGm3mHiVHaG9
         fBrQ==
X-Gm-Message-State: AOJu0Yz8Gu+J+RKEm/tRxYPye0KW/TqL8I/k7/dMqqy1QUwHYE39MLiI
	685QJ/xNnIstyrm0k9Ny+6s=
X-Google-Smtp-Source: AGHT+IEUIIFk1saxMUL/R7S1hyUsR3PQibo1z6oRrjkNpS3JHza4O/ki+fD8Atx8LtbXq1uNXRo5Aw==
X-Received: by 2002:a05:6a21:9998:b0:17b:8404:96df with SMTP id ve24-20020a056a21999800b0017b840496dfmr2313207pzb.41.1698396739315;
        Fri, 27 Oct 2023 01:52:19 -0700 (PDT)
Received: from ubuntu.. ([122.174.106.169])
        by smtp.gmail.com with ESMTPSA id h12-20020a63b00c000000b0055c178a8df1sm698825pgf.94.2023.10.27.01.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 01:52:18 -0700 (PDT)
From: Pavan Bobba <opensource206@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH 01/10] staging: vt6655: Type encoding info dropped from array name "cwRXBCNTSFOff"
Date: Fri, 27 Oct 2023 14:21:50 +0530
Message-Id: <b66d2cfebc199c20ff05143185400b6afd351f5a.1698396278.git.opensource206@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698396278.git.opensource206@gmail.com>
References: <cover.1698396278.git.opensource206@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

array name "cwRXBCNTSFOff" updated like below:

a.type encoding info dropped from name
b.camelcase name replaced by snakecase

Issue found by checkpatch

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 drivers/staging/vt6655/card.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 079fd01c6780..aa1017d7399c 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -50,7 +50,7 @@
 
 /*---------------------  Static Variables  --------------------------*/
 
-static const unsigned short cwRXBCNTSFOff[MAX_RATE] = {
+static const unsigned short rx_bcn_tsf_off[MAX_RATE] = {
 	17, 17, 17, 17, 34, 23, 17, 11, 8, 5, 4, 3};
 
 /*---------------------  Static Functions  --------------------------*/
@@ -712,7 +712,7 @@ u64 CARDqGetTSFOffset(unsigned char byRxRate, u64 qwTSF1, u64 qwTSF2)
 {
 	unsigned short wRxBcnTSFOffst;
 
-	wRxBcnTSFOffst = cwRXBCNTSFOff[byRxRate % MAX_RATE];
+	wRxBcnTSFOffst = rx_bcn_tsf_off[byRxRate % MAX_RATE];
 
 	qwTSF2 += (u64)wRxBcnTSFOffst;
 
-- 
2.34.1

