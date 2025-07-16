Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A69E28E594
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 11:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752665868; cv=none; b=HPgWvCrNzbi4lPWs5Dy+otraDZ4cAwEuBlMmU03AZPg0lMrOf28ZaTBkCvi4mKv4ryrWTZ5jkgB2zAX7RpB54RAcOmFz8oRgyjAKjCwiUyowcPv0ihMl4Y2B0dHTUEXFGuE31LOKYWXKBXQj35Xo12Wz7Q5LG7jL3Baa4xaWEK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752665868; c=relaxed/simple;
	bh=weW9xJjrkzaCH7Hrw6XcHSom/EuMx1e5TuHHxS58nVc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=omvwkzMVMdKO+IjOK5Fa3MYekURdNjj03T7bZroPBkv7brZAUk6R8bUajER9fKwdXyy4AZ9EYPF8PK8TxsCOUTg40H34TLLZ+svzTUFaeQgtOAdEl5pNZXg8WYpyhr2dlExDGUNYQmJCa+i3FOjKvOQ8h2kil/n4m5uiXmjmBB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DMekQ5I2; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DMekQ5I2"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-73e55e829fdso1218640a34.2
        for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 04:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752665866; x=1753270666; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E/nyxTASqFpICDFAtdIim/Uv6sN7ikk9BK5+ibmR71w=;
        b=DMekQ5I2roTDQOwZp4aihVjLRAJc5K3QzaGi8H5SQHlDq8VrtRi8PwFBvyyOpHr8Mp
         4fQkZAg8IFn/5heAYYWhhPnb/ZEZVftMUKd9mzS5yAtdyURSWFNbbQ5IHlU2FC+k1uxM
         /pEpzXz1I+cYe7Aw/NQYPQB8beSBfFJfu49wNaYzZNmOX+0fY8HHrlkydg9yX0NlY16z
         6sxURIxAOc/btjZVSsOey7KeeSPbPht6a8Wm7zXfRyy1x96xEC1BFZUV4OVNQQvX2heA
         3a01WlnUqSVrThD5AeOXb/VXVSsqVhcmJW+Z4TlxFGclZdSzKhRFYMygz9pabxibRJbI
         Y2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752665866; x=1753270666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/nyxTASqFpICDFAtdIim/Uv6sN7ikk9BK5+ibmR71w=;
        b=NkgRGkWcWexC4cJZYaZ6sD73YlMP2GmLdMS0E7/OmnmJETD/BB3sM0boLJjDuNO6fq
         XmCFMmj4Vt3WdGBCu8vPHbFPbre758r38RsnKzsLWZTEVrQGECCxGdmRmZD4Q+FDjmha
         vZhfVNwv4FWcqhhGG1LO23O+Gjtxf8mu0xhynaftDJq4bxVC6Erhi5wvL3M0khoI7uVz
         SqtilvU72DV9rTF3EvDu5aTVdL0RoXoMH6VQ3M5VwR317QaASLc6LQ2mZ8UuY6WzWP8j
         4jWs44k0hn1zV3PyWTlIZb4r7I81blrY8LUoLkUcgUifTMb1dGQWmfI69YzMlzKv4Qpb
         fHJA==
X-Forwarded-Encrypted: i=1; AJvYcCXER9IOnfAuQiJe3K5b7BrfBQyRAopwrcc2GcXTk3wszXizioxcP3f67CgJex6ea4YKZocQWKH1FVy1+RfA@lists.linux.dev
X-Gm-Message-State: AOJu0YzuIv3W/qxv1EPqADiZH6HVKAqcDVjMgR5PRqsY35RRYrpqx3Ru
	kVippRBYM20XCiPqEdmjwVJeM/tBqmwqmwQBB8+hTOwnf8ncnUp/VXO3
X-Gm-Gg: ASbGncvF97gtWak3vQuQ76rKw665Cv6hGRmI4WS0lgoH7XdXB9fRgfVoHV2YWbseHKf
	Tfid5ALua6Kw6g+35v4pJaqCdKZU2etiO5L0Upv8BPRpLR6D5R19XjA6RqkTG4Nvfn6vq8bEyLi
	f9lUL2o4KZ+YYyDLTSPcLSzQeDJ7f79BMceycFazlFtaLD0JyocPNd3Hy6AlBmahttgHBkNEW1z
	j8HBqf/p3iYsdXU60gw15VaYlAxv1x7Fziu/xsULheehXvtSJGbH/USvD6yVZjGkUoiGXB6JtxS
	iBFB6wGAQ4bSxYHZC+lE5b6ErAG4XbzHAt5W4eOuF6Sz1SpzMUoHmIbGpoPvn3tBZiNUGrV6FzB
	iiQ4UN6l90GMjwN1M/b/Xl1hXMsm/vXz7sCHL4AK8i19o1BY5VvtH
X-Google-Smtp-Source: AGHT+IFjktlMQyL10G8tJcxa24+V2Yl3blcwfbFICEepkpZBPXC9YBV3jyPVbGUBWvoRTYLzzhwsSw==
X-Received: by 2002:a05:6830:64ca:b0:72b:872f:efc8 with SMTP id 46e09a7af769-73e665c07d7mr1699898a34.24.1752665866441;
        Wed, 16 Jul 2025 04:37:46 -0700 (PDT)
Received: from localhost.localdomain ([181.161.11.224])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73cf12b62e8sm2904769a34.60.2025.07.16.04.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 04:37:46 -0700 (PDT)
From: =?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: Ignacio Pena <ignacio.pena87@gmail.com>
Subject: [PATCH v2 3/3] staging: rtl8723bs: remove unnecessary commented code
Date: Wed, 16 Jul 2025 07:37:40 -0400
Message-Id: <20250716113740.73025-3-ignacio.pena87@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250716113740.73025-1-ignacio.pena87@gmail.com>
References: <20250716113740.73025-1-ignacio.pena87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ignacio Pena <ignacio.pena87@gmail.com>

Remove commented out code that serves no purpose, as suggested
by Greg KH.

Signed-off-by: Ignacio Pena <ignacio.pena87@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 437934dd2..abc789def 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1317,9 +1317,6 @@ u8 rtw_lps_ctrl_wk_cmd(struct adapter *padapter, u8 lps_ctrl_type, u8 enqueue)
 	/* struct pwrctrl_priv *pwrctrlpriv = adapter_to_pwrctl(padapter); */
 	u8 res = _SUCCESS;
 
-	/* if (!pwrctrlpriv->bLeisurePs) */
-	/* 	return res; */
-
 	if (enqueue) {
 		ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
 		if (!ph2c) {
-- 
2.39.5
