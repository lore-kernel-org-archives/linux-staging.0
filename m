Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023EE8248C
	for <linux-staging@lists.linux.dev>; Mon, 26 Aug 2024 18:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724698373; cv=none; b=cyD/SqDhRvINrFwTgDjViDZh0l32QzG6reiaH9v1LZdhQbZCW4+cTEjD/8drXTPZhQmFNU5exTVbod7PsO20L+50D+rk7Eq89h3zPf2Ov9FWKZt6nIvMoJH9Nrl4MKlSKCnO5DOHVB7LO+cwGXJA78FPAjio0t8d28Cf2njOckY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724698373; c=relaxed/simple;
	bh=vzEkV0fc1prvK5DIabDiJ0kU3ZJOr9l9vPx3nu33+Eg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dAJOFa/eYyHgf3ao4C4SjW4OV9aMXte+0X5M5ki9EZz3NghgLCGwXcO31bVvKx9GS2e1zZhawHEt+u0WlOPH/N1Ev/IJbJmu//z0dqifT4/FjJC+LZ4r3uxBvZG06wzCEBAQ1BJroN6XiGnDD96FBy384hRtL2bsXZ5EwQV1Jzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M4wuoxVS; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M4wuoxVS"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20223b5c1c0so41072225ad.2
        for <linux-staging@lists.linux.dev>; Mon, 26 Aug 2024 11:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724698371; x=1725303171; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pwJGUsNOEwsmpVGk46dDj18VF13y1ysRC97a7FWC1j4=;
        b=M4wuoxVSPKfaaJBSQdVej5dOKhomIRJruhkTv1NHBx6IPgy2CjFzCmePscw0Fm8ehT
         70ivj7K7oG2poFsnbePHcVJiIjNwe35DbGqy/ymUC32+JHfuhkyZgEKE/DDNjYfWbcv6
         bIzBnHCGzxqcxkwiXr5G/4kpvadW8uoJokRp91ma0e8Z28yPOQmlgPbU9UxSZPD5+bU+
         5r9HjsPvZ+7dTzSbc2vF+HIAfjEhEq5iPXS+jKGzRWEbt3hMY81WMOQCuSR+VD3VLzp1
         DyS2JBXkPeTd5vrzUG2nOb2P3PGTkkidT8IHyj570W8d/beHd7CyKRjpYiVHlrnNN5U0
         BgpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724698371; x=1725303171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pwJGUsNOEwsmpVGk46dDj18VF13y1ysRC97a7FWC1j4=;
        b=cc9rpHEmkHy7NVcoSYn0O3KuSbrVunDIyd/WLhVTrxEP8xoBzKhN67SuRSdDR8wrJQ
         dNvGSVx28Hnw4NelP0NC6tWam+4HqqinGFRVB9jkeNLS+Ywr2L2E82P7Zg3G5plTLAw5
         PyPjx+pSCRk5z3HGsw+JFGago2uMwYBo8uJlEVwYjiFPm81Fzw97wfNvSXVCTAKlqQdF
         uo6im0AyzehbtNokxuOFswbnpcKMCgo1S3Pcvz2urI/H75CLLb3cvASeeK0BdiLUKXUh
         ZIEOmGqah4wQzqewAHPdwNa6isvrFh96Gzvi9fYpJerV/6EALz8TuoJWr7A/U+qkZo9U
         AIGw==
X-Forwarded-Encrypted: i=1; AJvYcCWSX2gvjmxXOvsK+xCdL464JaE7iN0qdBPIBPoeXneJtjqw6jkj5etkMiX7baI2ruSiZ2uXe1Z3OLZK5UzQ@lists.linux.dev
X-Gm-Message-State: AOJu0YyldhT5DgXZ/VGR3qRZsuYNiihW/yHaYXKMGFYOM73XF5r+k8MF
	L9ERBDse/+gohWWFYf6loLcEGhz2AdyZQBPpRvaefM8gecHsCWBs
X-Google-Smtp-Source: AGHT+IEBe1CP2CQogtHDQSIjYX1OcTMmHdfgt55Gdb3pgGa/ZsEDgfcBfduS/zyNGyKqwEcpY3TGXA==
X-Received: by 2002:a17:903:11c7:b0:202:4d05:a24a with SMTP id d9443c01a7336-204df13ee41mr5432255ad.16.1724698371124;
        Mon, 26 Aug 2024 11:52:51 -0700 (PDT)
Received: from masingh-thinkpad.. ([49.207.52.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203859ef0fdsm70377565ad.248.2024.08.26.11.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 11:52:50 -0700 (PDT)
From: Manisha Singh <masingh.linux@gmail.com>
To: florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Manisha Singh <masingh.linux@gmail.com>
Subject: [PATCH] staging: rtl8712: Fix style issues in rtl871x_io.c
Date: Tue, 27 Aug 2024 00:22:13 +0530
Message-ID: <20240826185213.9445-2-masingh.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch addresses style issues reported by checkpatch.pl in
drivers/staging/rtl8712/rtl871x_io.c:

1. Avoid Multiple Assignments: The original line had multiple
   assignments in a single statement. This is generally discouraged
   for clarity and maintainability. The code has been refactored to
   use separate statements for each assignment.

2. Prefer `sizeof(*pintf_hdl->pintfpriv)` Over
   `sizeof(struct intf_priv)`: Updated the memory allocation call to
   use `sizeof(*pintf_hdl->pintfpriv)` instead of
   `sizeof(struct intf_priv)`. This is considered better practice as it
   automatically adjusts if the type of `pintf_hdl->pintfpriv` changes,
   reducing the risk of mismatches and improving maintainability.

Changes made:
- Replaced the original line with two separate lines for allocation and
  assignment.
- Updated `kmalloc` to use `sizeof(*pintf_hdl->pintfpriv)` for the
  allocation size.

These changes improve code readability and maintain consistency with
coding standards.

Signed-off-by: Manisha Singh <masingh.linux@gmail.com>
---
 drivers/staging/rtl8712/rtl871x_io.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl871x_io.c b/drivers/staging/rtl8712/rtl871x_io.c
index 6789a4c98564..b81e9b06725c 100644
--- a/drivers/staging/rtl8712/rtl871x_io.c
+++ b/drivers/staging/rtl8712/rtl871x_io.c
@@ -48,8 +48,8 @@ static uint _init_intf_hdl(struct _adapter *padapter,
 	set_intf_funs = &(r8712_usb_set_intf_funs);
 	set_intf_ops = &r8712_usb_set_intf_ops;
 	init_intf_priv = &r8712_usb_init_intf_priv;
-	pintf_priv = pintf_hdl->pintfpriv = kmalloc(sizeof(struct intf_priv),
-						    GFP_ATOMIC);
+	pintf_priv = kmalloc(sizeof(*pintf_hdl->pintfpriv), GFP_ATOMIC);
+	pintf_hdl->pintfpriv = pintf_priv;
 	if (!pintf_priv)
 		goto _init_intf_hdl_fail;
 	pintf_hdl->adapter = (u8 *)padapter;
-- 
2.43.0

