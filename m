Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1862A153BED
	for <linux-staging@lists.linux.dev>; Fri, 25 Jul 2025 17:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753463979; cv=none; b=DTrHVbdbKwf6ltQ6N3ZqKYYP5VQnx84QmFOTH77MwXhPcqqY8kC8pXXKePsbvL4QZMov7L3BDVgxbr9fIo+woi7H9PZcq0nIMhTQUj6YCgFngvz0u89nAieCQ8A7PXN1E6eb9b011kegGs7bUBCV3fDsAbhzQ3UaHBDwGNaDt+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753463979; c=relaxed/simple;
	bh=Y1KSUYsyaE6HbJs2IIuCubCrplcn/uqjWMb9Oub3kMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fH8PGs6yRU9o8I3xEPufjwpTZIYNPtU10P3JdnRm8g9d2HIyAc9W+ODALck+1yhWOM+wZDpThZsjzasWXT4oVqH926aehVWjxzftmdDc7pemof+fNGVKKm0PJwyLXB4I6vtx8/2gFV/7Pvl40Zya306xBoyYl08UoC+b6PXC5M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hSVLE2Cn; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hSVLE2Cn"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ae3be3eabd8so505604766b.1
        for <linux-staging@lists.linux.dev>; Fri, 25 Jul 2025 10:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753463975; x=1754068775; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FMKeCN6G97kMJOA2iye1JNWo2RzUVGDnYFn5d9NsQ9g=;
        b=hSVLE2CnIAPYLcagL8pU3jYG2cYEFtkqalqEF/uqynrBlJ6xXue3PNammlfENYEWZ9
         tOYacgX7faPOQFJnQzT5TtZT1rOqlDrd8ICE0S2MIGB1Di5S5RmiKgh7aQnT7glG41Ac
         08eICCVxE+Beaa4IJ+ndXIMjLwLcEiSEzwDJVeOR/iLynmsux0h1CBnfijZ1EC4NdWhR
         5fzVqplRQZmz9/MVsegaamdMPuiyEUZg6Rw5M3RpnZnXs/qYr9y2RK1937c9RCLh1kyq
         IAylNHKnBGlHqvthZuFIsmcvblCAvf5fN28GgDpQgCNskJJFoP7af2JFxF5Y6Lvi9aHD
         /Pbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753463975; x=1754068775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FMKeCN6G97kMJOA2iye1JNWo2RzUVGDnYFn5d9NsQ9g=;
        b=M6DXUsbS5JgEDd9rGM9W51KgBLqpwu8EWnkyG7FdBUL5fSBojZiW/CuiPPldh8EbgV
         UoPqeTe1kjSp6cqAz1pJgLBdgp/09XQgfEQWCrmMnLz+b2GFaZo+1pcDoq/qsbnaa9pK
         pyh81LjHpfjqk9s7fXHCCJr1KC7UshIkTRHsUbOcvJ3qvEFr+abA9cBI/giw7PmTMW0e
         3GtyohgHcjs/B4PzUo3ufNo0omSaMjxb4EFhSlmK3efTMTlmmKfx/nSNypKB5qgOFTIW
         nQgjtz+B4sDZ+ppEAA8sPeOVDnArK6dQ0iWyolSy5mEwfjdQ2ISbUrayX+winvPnEele
         xQxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXP/Tkk5ARPUkHEzXjSpwDq2mFkHFT5GQ+WJc27BDnpKPTWRL42vxKkIJhCX1qoPSZuN0PJpxZ+6ZuGqtRs@lists.linux.dev
X-Gm-Message-State: AOJu0YwCd4KQflU01GEBM0kOJ/qsg6DNvXsrH6N2X46zndPRWAnfL3D0
	Xrwgbjg7RTvChYvhQkqVNzjtFUZror3NcC/YkcV5jbdL5KWZjVUitok0
X-Gm-Gg: ASbGncuSl4nkdwgcTurMTRG4odXHeA8dhVTfrpJ0mLvfM9onnmb/9G//uEqhfXKfqK/
	/UnIgA1f9Q6WmxFmMaNo13/sM6U25WJWumxLUxorea9NUqn9Rj+CpjzjhhbdNnRlvpe1kezmFZD
	UwUid65E1/OLs2GCmteBIyMDHFWaE8PGqzb7uqkXYCcIGAq/W+Z2VvSAXK5Ak8gx+hVu90X9b5M
	X8eakZWErNGcRUxu0yUS+lvmWlzplWGC0QWiFOv94yjZU1cA0R1XgUfDw/Tz3I2eVZJ+DjBXrcI
	ukbwPm7sQ6c48Tk3wqOvs6t/DktLja9OmsTdmKy+ymMikyMIWVne5S/dNok/Jwq+d13a4AxjqIa
	JQvO1YASlhcQ0rluCgq3OsBKdwDRs1poJGY98IjJ3NOYPTr4Y3apRITuPAKhQM+nEteb0UbLBun
	ari7xDEg==
X-Google-Smtp-Source: AGHT+IEaEmCiIoGrZas9PLfSl62sSWOiTuZrFdkBEM7IJKU/GlPZfysTiUH5h5P0uHyk7NJHEItEiw==
X-Received: by 2002:a17:907:3d46:b0:ae3:52ae:b0d2 with SMTP id a640c23a62f3a-af61df5289dmr370816266b.18.1753463974809;
        Fri, 25 Jul 2025 10:19:34 -0700 (PDT)
Received: from PC01.localdomain (094190205166.static.ipv4.heldenvannu.net. [94.190.205.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635a61103sm18857066b.70.2025.07.25.10.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 10:19:34 -0700 (PDT)
From: Bruce Qin <bqn9090@gmail.com>
To: gregkh@linuxfoundation.org
Cc: bqn9090@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3] staging: rtl8723bs: fix if-statement alignment and line continuation in rtw_ap.c
Date: Fri, 25 Jul 2025 19:19:33 +0200
Message-ID: <20250725171933.10027-1-bqn9090@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2025072552-filled-glacier-1e9d@gregkh>
References: <2025072552-filled-glacier-1e9d@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes several style issues in a multiline if-statement:

- Moved '&&' to the end of the previous line to follow logical
  continuation style
- Fixed indentation to align with the opening parenthesis of the expression
- Avoided ending a line with an open parenthesis '('
- Moved closing ')' to the end of the last expression line
  (as suggested by the maintainer)

These changes improve readability
  and conform to Linux kernel coding conventions.
No functional changes.

Signed-off-by: Bruce Qin <bqn9090@gmail.com>
---
Changes in v3:
- Wrapped commit message lines at 72 columns (checkpatch warning resolved).
- Ensured only one copy is submitted (per Greg's feedback).
- Carried forward the fix from v2 (closing ')' adjustment 
  as suggested by Greg).
- Thanks again to Greg Kroah-Hartman for the helpful review!

 drivers/staging/rtl8723bs/core/rtw_ap.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 383a6f7c06f4..c652e0cd35f3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -258,11 +258,9 @@ void expire_timeout_chk(struct adapter *padapter)
 		} else {
 			/* TODO: Aging mechanism to digest frames in sleep_q to */
 			/* avoid running out of xmitframe */
-			if (psta->sleepq_len > (NR_XMITFRAME / pstapriv->asoc_list_cnt)
-				&& padapter->xmitpriv.free_xmitframe_cnt < ((
-					NR_XMITFRAME / pstapriv->asoc_list_cnt
-				) / 2)
-			)
+			if (psta->sleepq_len > (NR_XMITFRAME / pstapriv->asoc_list_cnt) &&
+			    padapter->xmitpriv.free_xmitframe_cnt <
+					((NR_XMITFRAME / pstapriv->asoc_list_cnt) / 2))
 				wakeup_sta_to_xmit(padapter, psta);
 		}
 	}
-- 
2.43.0

