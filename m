Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B3A402B90
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 11:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775041451; cv=none; b=Cu4hcMSbTs4molAu4baKvKogtgXwS5GAtCdDd3fRpoWnLbnKsVWkujL+X+KP7O3zyoUqph8DQkqB27Qo5J0nRCl6rczBeHmKHNscAT2zhcltJ8crRKQaR8dJbnJx69MEKlxYRsT2IZ0aHssvp5GYJE119lXOYI6g6BqM6eOozEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775041451; c=relaxed/simple;
	bh=dzDStz9iwV5MYYX5o9CgzczsBHcxFhovrgPsu4tsRUQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lQ7jOI0sgwaW7UikVctY7Kkw+YIB2QZm8db2pXzDYvx9ZIrq2xFdW/PoZI9xAvBANbvwfwMi5V0AJYpcPCCI42HOZ0iSLJyqy7Py/KdVshVbQ91kosQsnNH92PNOZn/NwnQK1cPChNvQ5nfUK1tLAmdAZpRUR1Of4VlAFc9LbJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ARrSZA7h; arc=none smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ARrSZA7h"
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-12a74039dc6so5474887c88.0
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 04:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775041447; x=1775646247; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hMfeRu9b749Njl/7ShAl1WSebaqWTLPdrShnRNZLrUE=;
        b=ARrSZA7hQsHKySvTw6KTwavUV2Aq1pq3wTgW3KuiB85LMQg2FLNr/HwwTc+NWePuMB
         w/AnfahL+X1AV64XCSlAzhGYha+TGJ2U3fXOeWSXz/aJPW91MXY9gAt5ay3s3LF3GATN
         keN+S3xts7XGfx1j2o/iLoSvXlePqtdsHz8PMVkjKFrAfN7GVVuuaEVhsPPN/tqN9eVq
         zhZz8b7ac4Q8cRMqhLXxQ0SrEMjrnvWNoOJE5Np64O5blJBuvmtMSo63/Eo5g3iEpDXr
         tSaRlNIlftBnzVpHF9PwPIkBXwPp7ZsdyA9MGRljU42JLP5Era99osmg5wceR6NtVe+D
         vFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775041447; x=1775646247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hMfeRu9b749Njl/7ShAl1WSebaqWTLPdrShnRNZLrUE=;
        b=Oo3PJoxOunxFcaQO5e++hVGgvK+KyurLewaOaqxEDk8xrwaujuxaieIuLaoYKZ//2P
         7ZKybPHz5H4e+Twj+DfNr3+uch1mVB3RK8GsxFeuapyCC73pBsFJAkJqGroRpBIocHiu
         rSqKLrVmvHoipiAxdhH2tuKgT8F7U8IQ6Cm6FbtktUOe/NNH8ApKeovsBgVN0hjZTqEw
         SMLyly2ffqTm2d92qdFsid1jdBANEYl5PwUuZmN0n5HP5YAP0vtWI7tqGyFUuzq1gy9G
         EVsM9X5A9eB0B+STMtgbS+TU2rerVCcZDsKG98dv98CNTlqiUC7Gh6NW00JBSTg8CdeY
         0vbg==
X-Forwarded-Encrypted: i=1; AJvYcCVYJq+1tAbdBQHxNac+9Ldd3VZQRUuE5j/6OjJAMuj9rdxVQzstMk8vT7e1ImsbM9T5szBVCTOo8/zUPBUR@lists.linux.dev
X-Gm-Message-State: AOJu0Ywpo/3vYcAEfUp3UcSA1yj6oX5O+WWcyZ5+YvIHWJmJiC5v0XiK
	nEeWF9r9a2/wZGdVuX3/Ktnoo6BuGl6xF/vOcGX4M6mWtjrM2imsR7N4
X-Gm-Gg: ATEYQzw86hT9mao0705OweM8Z6r9dMsZCo71xTMhtBSGSN3xgR/oXg9y2OMo9+McS/e
	rX4NojJH+Fe6MCS5GotXRVmfBZo625JsdT/vkEDC0uCSihHFfT89n8coRQr7CdZAt8wMTJLJItv
	3lZA1fYVlpNgrhxNOWbkryxziN0gop4HXCNlHZHOD/fDkLxM22f7KQebKhTWykZ1jC2glFKHjLd
	4kx3v+egBsct1cY7ra0mJ4ZtX0JEPo9O0PwTtB4gAsL8mC8BjL4vfoRD0GtpC/9uo75NLLdz67G
	YP3s8QIm9fB5Z1jnJhTvi66QHt+koZneuSI8mv4HZ2Gq2UJsgM58qgZuzsMyKrUMLC0U30n70ID
	qC8vCLqJh3x4z0pUyxQIvx+rfgc+Z/H27v2PrwCFAg12pm/mmKemgiKuA870s+9tLhij9B3IRzW
	V7DMfU0qsTgjAuPVTBt9XPZmmctdkmxf6BwFSdxQGH91zloYbtHTzwNCCE/EaVCX8qIg==
X-Received: by 2002:a05:7022:698e:b0:12a:6902:ddce with SMTP id a92af1059eb24-12be6495948mr1916007c88.10.1775041446808;
        Wed, 01 Apr 2026 04:04:06 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c8a1de559csm3023432eec.22.2026.04.01.04.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 04:04:06 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v3] staging: sm750fb: constify fix_id array
Date: Wed,  1 Apr 2026 11:03:33 +0000
Message-Id: <20260401110333.2535-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the static fix_id array const-qualified so it can be placed
in read-only memory.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>

---
Changes in v3:
- Drop g_fbmode change as it is modified at runtime.
- Resend as a new thread as requested.
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 9a42a08c8..f7b5b22f1 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -728,7 +728,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 		lynx750_ext, NULL, vesa_modes,
 	};
 	int cdb[] = {ARRAY_SIZE(lynx750_ext), 0, VESA_MODEDB_SIZE};
-	static const char *fix_id[2] = {
+	static const char * const fix_id[2] = {
 		"sm750_fb1", "sm750_fb2",
 	};
 
-- 
2.34.1

