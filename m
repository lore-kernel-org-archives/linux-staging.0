Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BFA3624B3
	for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 11:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781607675; cv=none; b=MAzdPhRijFbFMaqd0icwpeny9gmENlC05WRD1JrO2m0Mo5nGLLV9ib0pLf9FKg/AM6V+JSd2BDn+PpoxvNeqOyDDrCdtSQ7X3kTW0Mwcmw/06jb5FaiDI2atvJsS38Pts1We1iRiavU42WWuJfV/iMa+hIGRctnUKvMRlUhO+2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781607675; c=relaxed/simple;
	bh=nkGX7aBSh0NMhVYqfcgOl9KY/KD9kb/e/gJDznAGx7E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=POC7KAeK7G3tLnk5KPNgW7b2c3kcfeulE31mO5qBbVI3keTXVYiYpM6kE1bKpWI8c76GopIvPJzVo9VfCV0fvHoAfO+pAvca2u+0EX4E3tLi0G4kxGwjoN5GkZTeuvF86dxrneDbdRGSDIol/6yl66rvoZUekhfDlUcwKDfj7/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cCUr6vlg; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cCUr6vlg"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2bf125989f2so31911785ad.3
        for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 04:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781607674; x=1782212474; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FvHXhmMuRTxT2U7EJexM8fyhk7GGHL82JxHbL3tXBFg=;
        b=cCUr6vlgLTc9t/h/VXa0aIJyGhnPJlK+COZBo24NMQVrxWKGW34xbJsndqBjdF8rn8
         t6GyRD0p2gJheMxY8jbDaqswDXmLoIgis4eHUqcc28J+zHLXhdd4GBRuP1m/Q/qmPw1e
         3wM4qtlV8T3Kf5CL6wVrLFhTrUS902WoQy7FKIQeujeHmLEMP/XtRSbz0CgurPf6dFzR
         G+5onNyTk3+zNdq//Ddz/Vo4kU6mGFunFe61BIewz2i3PSR0DUaXNjV6XgKyh/FHN6q0
         1ZSccGms+dpR971mez+ECCCePtNFLfdsrnZLI1/wUnU1dIDjAznhbI2wLdqu7HnHzCL/
         M75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781607674; x=1782212474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FvHXhmMuRTxT2U7EJexM8fyhk7GGHL82JxHbL3tXBFg=;
        b=P2iJLH9OPjz9lyAG3x9FfnENTKIVT8TdYhJMzOXIwyXHjDruDs3J4HTHUfLWNbKbgW
         kq2knqFQGbQUSWNjPMCnGINs4E6Kv8TIoPMBTZbHiyB9dQLSVvweK1Bj7zznked+O1xk
         TlFLGzLf1ftO+OVjbtSk+BEnPNOr8iqqpJK/7lGzAS7c0J7qJFGAUorC38f8tAhl6G87
         XaQEGoe/h4J1vWYisL0uWp68QWDSdVrS7Px6uJPk04XmebyseDoZR9PtERPoeyM0qELA
         JQZXrcCjnWwrzmeZnFZFQ/0n001NXT34DHnXqrj2KLzhgbkMGuBZt2nan23XaIxykahx
         Mnww==
X-Gm-Message-State: AOJu0YynTIr3H/ngTfCwPaqZHxp+T2mCh8mBRIC8nBs6M4O13+dnpFeG
	Ky6FwHyIIx9mJ1fbfFImeDzMFve+HBRSbJsTx+obLDmuF+ZREGmdyQaz
X-Gm-Gg: Acq92OHX0NsaWwZMboc3WN0kVohC2HZIPzNgQQGCwM8QtOv4dHW9QBNTRuSqqSucutR
	x5BRUFnyQUzdVGa7xJw8iZbstuZzh+jvhN6mreutp/yanZAycERM1Fcr69iBKE43pp8EkcBIKxG
	kXZeJ58zB7n4iJC+vXDT7QjcgyumQV2ft1HVZNeFaeR/yViUNNt3OKNbzFWvcfgc29oYlVzqAQ3
	BU60P5V0oS2X3Swf0WfaR7xOxcNkpoEyGvoK3OrSbKuLhFavzdwGfbbnJb8vsAYy9h9uZWIshaY
	OUDdsnfJVyU++Vfzs7vLZ1zPqJRFQ9D9qmiqYGWESKz4Z72s4bupWou1YxvfQKxX8oPw39PR5gb
	BgxRGR41gf+7H7GXCmIf8xhhgGdOz/QECov4vBSndG0cxlw95HxzxaCxMI8ij2OYpqA10Ze3TZq
	HnmYhHqcTB1lcC+QdU8b1a7Z8=
X-Received: by 2002:a17:902:e546:b0:2c1:566b:f907 with SMTP id d9443c01a7336-2c69a167667mr33659935ad.20.1781607673625;
        Tue, 16 Jun 2026 04:01:13 -0700 (PDT)
Received: from fedora ([103.51.149.90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e52a9sm132561995ad.11.2026.06.16.04.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 04:01:12 -0700 (PDT)
From: Subhrojyoti Bala <subhrojyoti0609@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Subhrojyoti Bala <subhrojyoti0609@gmail.com>
Subject: [PATCH 0/5] staging: rtl8723bs: Fix coding style issues in header files
Date: Tue, 16 Jun 2026 16:30:43 +0530
Message-ID: <20260616110048.45541-1-subhrojyoti0609@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series fixes various coding style issues in the
rtl8723bs staging driver header files, as reported by
checkpatch.pl:

- Fix multi-line comment style in wlan_bssdef.h
- Fix enum indentation in rtw_mlme.h
- Fix block comment style in rtw_mlme.h
- Fix multi-line comment style in rtw_mlme.h
- Fix whitespace in comments in rtw_mlme.h

Subhrojyoti Bala (5):
  staging: rtl8723bs: Fix multi-line comment style in wlan_bssdef.h
  staging: rtl8723bs: Fix indentation in enum in rtw_mlme.h
  staging: rtl8723bs: Fix block comment style in rtw_mlme.h
  staging: rtl8723bs: Fix multi-line comment style in rtw_mlme.h
  staging: rtl8723bs: Fix whitespace in comments in rtw_mlme.h

 drivers/staging/rtl8723bs/include/rtw_mlme.h  | 55 ++++++++++---------
 .../staging/rtl8723bs/include/wlan_bssdef.h   | 14 ++---
 2 files changed, 35 insertions(+), 34 deletions(-)

Signed-off-by: Subhrojyoti Bala <subhrojyoti0609@gmail.com>
-- 
2.54.0

