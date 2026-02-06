Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC53346795
	for <linux-staging@lists.linux.dev>; Fri,  6 Feb 2026 07:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770364511; cv=none; b=UPSJOzUVjB2bYH8O3flkxA/PqY4m+2MUQAxD9xOHzUrKk+aqbrt0mXJV8lvEiDp4WGgWPyZC5pw2C2oW5ux6RjWVoid9NLRJGukOKkMmXXILVxj3rgrYH1XfEqyDczfOnQe/dCl2PeBtVWsKQJpA5XI8854GVRBaSy8flkS2zWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770364511; c=relaxed/simple;
	bh=0JLvMly40iAA5ZpGnc5+tpY9B6nciRVswuTi5BWfxXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rG8LKvf4YFe5QDl51WD31kGQL+GhqaPWHuV+Btn8LGfU8ph48dhevhH6uROdwRcAzQwD4YF/KTDo8aSQV2GtKGm1mDE650wlGMJJ4CE11LLghpjoYRWtyHn8uhhT7F3tqZAJ3xPpiG5O6Sne9tZoyRpPi6X1hw9aatJWoaq4SzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c8ChgUyx; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c8ChgUyx"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4362507f396so1204579f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 05 Feb 2026 23:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770364509; x=1770969309; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCPSZS3n83hjOtMjXj5lQIhDzlwdrXLIQ1D5go3k7tk=;
        b=c8ChgUyxcgc625xRyNG4tfPfBttzXxBGF7+45nA3gBSfq4rDC8j3gVBVRrDm95DEwB
         vcJUw16aWvZKJhWcWUu86dLNq5S6/FGbjNUZm1rCQNzkpbjQ9TblVrVg7zdZkTHunlfG
         dkhwTWbXIJZdWjI4d8rTFMylOz6jSVBvu++waNqpXyEjCLoiFOyrgOX03ynAGbwqA4Nq
         4w4nEVysznF50BvJlD3vucval8oU8lXvwNymAcwQ6eQDHXSVZG3xwnTW1ObmvvAIqk+d
         04pykQhEpk+6ekJPtKB0hCBhAfipJK2SlmV7vryWq526DW7YHXZ3ais82Z+9G9hHY3rr
         X1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770364509; x=1770969309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cCPSZS3n83hjOtMjXj5lQIhDzlwdrXLIQ1D5go3k7tk=;
        b=v27HXBshuhYALQEBnaefWLrTu6++S7qsNG2ua0xugB2qKgTD03sdpwGPHU+T1kmLkR
         HwH1+ZV/9BodjEM58cJmd5BhEeaQW03yCGqkWX2/PQW/cxWvVHWRrEVYgo2WGST+fehZ
         OCmVKLu7tEtcGo3Trrol0klLh/i2+EGE494tP/diBXNZrRoHFDurqzIkeHIQOG3dHTSi
         SNxGXLoD8NB4JHqwJ2nlPnMoRvDTYLH3lEZTLqFDbwFVTJSwdiln3+iMXs6eciBaqa9S
         6NKxT9jVOYLl9e994qQVex3FiDug3j/r5t3wbk5C48HRO+TUPGGhGc0BAtd5eBdzpECe
         l6KQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1Is4MMN5idMGdk18Tem7j1DLPJ5eaKaJv5nPeRP/39Z2DrFhyMaJmzcCKJDJu1noJ6T4OfTBi/6zYVwqV@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3C1MC3ee/apapV75zvtdskrKHN69Xu2/dORhiGYrwlOQoSRjW
	JVDEblm0WsbSPIPBwaDzyYq6M40NPZHep9lmXE4JXRJN6Jrm1l8pFPS6ElyOmzo=
X-Gm-Gg: AZuq6aIDXj4Yatun7Jo4dg4laZ+5iuXNTvSA2TkaippLmCdKJvqX3uqbl+NqGtrnoOG
	3Qv6zKORXpWsQDVpp0PrECqjORnV/SSRl36wcK8p33w5pY33CWjCMlrky5OK+z+V+g74SyRj/B0
	jU+OWtcIshEVDVSvnobE7q7OvrCH3w5lOZErbp0hr9lpKc8pHoq7wABy2cTDxWjGwiQd7DM7H2Z
	tO2K+ZRJmHZ7mKxWkV8pSfwRsPaDKVpB4QFSzh+xN3e+daznc+FukJBMhQjU1Y0ATvoRudKCiSd
	C7p/JfdqrBnqmbkU6aQayvlNt6wI7w6Mb8ZCmMw9yNI0P8PEZD5XjWFnCS59jf6yJ+EhDS7ALbq
	UInp3/ooUPvcw87d9J7YctSwtSOM2cS3KEUQ+muH2WKbMybtPvbvKoO+RoSjWAyl4ad7EDAcXhi
	dP5fmhQ1LV9FYNrlL4AZxAvb/apCwtlUcsyhbPXlzRF8J0V3Mrnx3vtWMatlllwgg=
X-Received: by 2002:a05:6000:230a:b0:435:e482:74e4 with SMTP id ffacd0b85a97d-43629340a58mr3095125f8f.15.1770364508975;
        Thu, 05 Feb 2026 23:55:08 -0800 (PST)
Received: from LGPC ([31.223.131.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd3b8sm3836039f8f.11.2026.02.05.23.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 23:55:08 -0800 (PST)
From: lukagejak5@gmail.com
X-Google-Original-From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v2 08/26] staging: rtl8723bs: remove unused MAX_PATH_NUM defines
Date: Fri,  6 Feb 2026 08:54:21 +0100
Message-ID: <20260206075439.103287-9-luka.gejak@linux.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206075439.103287-1-luka.gejak@linux.dev>
References: <20260206075439.103287-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luka Gejak <luka.gejak@linux.dev>

Remove unused MAX_PATH_NUM_* definitions for other chips (92CS, 8188E,
8192E, 8812A, 8821A, 8814A, 8822B) from odm.h. Only MAX_PATH_NUM_8723B
is actually used by the driver.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 drivers/staging/rtl8723bs/hal/odm.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index 1c929d88e596..38830552d5bc 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -202,14 +202,7 @@ struct odm_rate_adaptive {
 /*  */
 /*  Declare for common info */
 /*  */
-#define MAX_PATH_NUM_92CS		2
-#define MAX_PATH_NUM_8188E		1
-#define MAX_PATH_NUM_8192E		2
 #define MAX_PATH_NUM_8723B		1
-#define MAX_PATH_NUM_8812A		2
-#define MAX_PATH_NUM_8821A		1
-#define MAX_PATH_NUM_8814A		4
-#define MAX_PATH_NUM_8822B		2
 
 #define IQK_THRESHOLD			8
 #define DPK_THRESHOLD			4
-- 
2.52.0

