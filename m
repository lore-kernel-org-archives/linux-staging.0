Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A560D36B075
	for <linux-staging@lists.linux.dev>; Wed,  3 Dec 2025 16:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764779491; cv=none; b=unzMf+wgZ79sTzjA6+g4VXQNnekCWH5SnujoHXRX/7GzvU6vUN6u0/x81UQzW/8G+KMpjcek3MFxuVnHCZfg35rUm8UO7bTrvaloXQ3GxoSXMWffXhZQECEylmRYjZyVCToVZ8JfZna5CI+G6rTCzk3z9TXzpVHfEUe/ZWNg2C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764779491; c=relaxed/simple;
	bh=YoADryU59aYpkOezCs6O+uG6lM6nXV9UrMyAgc6hrso=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iLnOJ+Ms7D25spzMIaKfTcYq71hCAMLx4boant16vg641M5mu6ipXqOZ7tlhVfBc9yDquk4Zph9lEbxz0qvwtMyql+3nid8L4hTGCSEX+be02qT3NC0yaHl+BZAP1JobJveSq+9HH6BI5yu0H/skxcBTC8l2xak44IRWen9BOhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XMVQzfXk; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XMVQzfXk"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-298456bb53aso89114845ad.0
        for <linux-staging@lists.linux.dev>; Wed, 03 Dec 2025 08:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764779489; x=1765384289; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a5TSHvDMJBdTXDqiXLMAzffyBsmdgx/8Tqq9mCOJqcI=;
        b=XMVQzfXkeJzYF28dlcege9ppf07pSFi6tSg+z7oTZ1JMJ382Kbc/ev/T5qqwOOj39L
         JDZdwVviFmBVyQNdWWcQyxuAdOscF1jSE/crUjyzdDmjfiCv47DwAoeAZ9uy+igVEBWB
         RHnn9QdhkYnjbhVAvni3N6ptm/1om5d+WOO6joWp7sx+VkUteV5GJIjWMW8/+b2OQ34B
         DDHHuHZvER8EzdsUTWsUMY64NOLW19NJ2d/L5j0+iut2OpA7oMlr3fqLd/zJBjL/2p+U
         38jcs+Ig35RwjfvjE6lf64j7gqYK/vO7Kmek65u/lHF0Yqzih5MbW5nvT+ZSIRcDVRtD
         tQ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764779489; x=1765384289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5TSHvDMJBdTXDqiXLMAzffyBsmdgx/8Tqq9mCOJqcI=;
        b=Sw0ilqwd2kpPav2SrOV1O2JsaXL8DxyPSSHJ8g3OMPxUByloQbP0KJlot/ugq0K1DH
         SSLgRllMYyMxlSn89W+lwvVpB/sk0yz5GLVMnOTuRQJ6sXTeHOs0snAoP3Aq3VAncox6
         UiHPtN352Dicr84/QBt9wH87xwlLiZBegE3d6GpyOW+9Fh66BbPe2NGxSscSBD6m6W0j
         tIFMAgijXNvXaW23W20sUqMdn6cKsgeeuW66Do5q3pD27RRcQBQs4JqGjksQkrxsHTLi
         dMIwB/GrtnRwfbTi8ZwD5lyY2wZRRsQfeVTeHZB0Kd3cGm5OuSGAteiAGsZNQmZWsQnW
         H+xw==
X-Gm-Message-State: AOJu0YwH5j9tSrhjA8xdlhVX6koFLx6MsvHKqqM0PHU+32bCvhYvi2Ga
	LvaYPuqyOvM4D2l++gvhGbyB1f1KBpd41S91O4cFMbiInI6JuyJvMWYRvEDVSg==
X-Gm-Gg: ASbGncukfevEQsJozVPq4JW/IE12br9RGtfFA5GqboeFJIXoYRq9Ht8Aqr5EZKjpKWw
	fD7qeSCsRNNcMR7myPnLVvERYiNgv1frotkc97cxFYlvBONv/9cFCJ/X57wVOgPQ9rA0LIxu82M
	ZI7GMaQsTHOsNIXPha/abrxA5s0MB8vwp9jdjeB9kHe+iGeE7QlcID1J+YsEG0ptfvpwSC8uPBr
	ka/MCNCdilytqLWEz4YotJ3R247SGht56BZ0TWD1UuaywvS5dQNS6kYABwF93BYuDpGspCbowLY
	LwFhRascFsfqCR2sEJGS9F8XqA4a+rOAEqLj2kxS1Tl5QUmEj4AsOmepTX1fFQh0s4gaerAgR6V
	3v6O9h2QrRUFOAjaCme9V5D5H9B8N8Tl8dxIP+835M1PHQWEOfYIQKbJLpmDBJSk+JKoHtG1gGJ
	TUPsRVVx4W9aaAoYC84TyG8WDuAqIdwkO14l7ZTVgRI997
X-Google-Smtp-Source: AGHT+IGuMqkVMi8M9JU6mR8UrhMeb9ftEWmyNC1H9NK+gPBQUm85vKcoli4AJIPk3UmropeaSvtBkg==
X-Received: by 2002:a17:903:1b2e:b0:28d:18d3:46ca with SMTP id d9443c01a7336-29d683b00c2mr38444985ad.49.1764779488798;
        Wed, 03 Dec 2025 08:31:28 -0800 (PST)
Received: from fedora ([59.9.171.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce40a60asm193635465ad.19.2025.12.03.08.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 08:31:28 -0800 (PST)
From: SeungJu Cheon <suunj1331@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH] Staging: rtl8723bs: fix space before tab in rtl8723bs_xmit.c
Date: Thu,  4 Dec 2025 01:30:56 +0900
Message-ID: <20251203163056.121915-1-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed a coding style issue - please, no space before tabs

Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index abb6fdfe7e1f..33c23b80e11b 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -146,7 +146,7 @@ s32 rtl8723bs_xmit_buf_handler(struct adapter *padapter)
 
 	do {
 		queue_empty = rtl8723_dequeue_writeport(padapter);
-/* 	dump secondary adapter xmitbuf */
+/*	dump secondary adapter xmitbuf */
 	} while (!queue_empty);
 
 	rtw_unregister_tx_alive(padapter);
-- 
2.52.0

