Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D5D29E114
	for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 14:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769524172; cv=none; b=U30iWakWHtSEHOysLyPTAuUX/5M9bKcf4OmciD8bYK9I5A1ft2owcD3DvQYdZpPuMsb9sHfvTZYyO5GFO61SXNnZmy9C9W7Naa4lTV8zoJ0tZupKayyfpnadjFR2Uh0lZFf6wg5u8w2nG//XmYNE42pJ0189chsYqhnnbu7WO0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769524172; c=relaxed/simple;
	bh=qALeV034Gx6saYvXbJhwipHo/u6qgZgp/GyfpYZ9ATY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N72v+KNpVHbT3fuolnRkE3OWNexYF0ke1ymnBMISIHkGkMoFZ++rjBcTJhuOMhPEZq/yJFy6imnzZwdtvsqBAr5ZUSnd6IQz7zl9PrY0e2/t3pBVfNPpy3Hecy6YDXGAoOdDM0QBWUD2kF1/yJjXKa77ydQV3vu32HiwK3ezSzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTICTMK+; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTICTMK+"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4806b88d8c9so848715e9.2
        for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 06:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769524169; x=1770128969; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+cPFIZoN8hqnT/FAk24vFsmPZx+YPVb2Mtmm0q23OEg=;
        b=PTICTMK+ylpslEOXsAMGICB+s1qQ1JMH5HyE4xjgt7dCrLmsgUzumwIVF1sbNOiakL
         rns/GcKFubeNDq0ojFK3zYvSuBWxW4w01KZUJrrOQ3RTFjhYfCtIV335blbsQ+ZndKPA
         Qe0WMB1Ayv3bsMmhpiGB15gahSBwVmI1yY21P6m3CAq/1GhgpdDjzie/tOl9DcvmagOi
         qDy8JAonbYgIo3nmDfza50UkAwbEQV3wIBQedS/abLYIaVaI0NrrKbd/f6W5eoKOigNM
         QhyLDgED0L/AZJ14hY8kqS964CW8PbYRs9zsIqwHmBiqepAZxt0+hciVH8S/I9aIAMqA
         CeaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769524169; x=1770128969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+cPFIZoN8hqnT/FAk24vFsmPZx+YPVb2Mtmm0q23OEg=;
        b=b/SGptmxNMaM9xJFHblEAPrfNvyOaNg0/n0So6KqaI8IMR3xUUuEykbvj6OoCqJHRX
         yj3c1IWgmbdmAwWxdrmhyMai8zoJjn03PQDCIQ4wGofGlUPc0ZI4eaIZ3q2nbJmJ6vbg
         PI+BtLtymDAMVausar0WJEVgejo9J7btdgqiBoCyOEwZJk9bKfzTq/waphnOvZ970B0s
         yE2A4elV51VscAdcAsD4nwa1FF29d7nBG5P7uowdh7NZLxTybkFH90jaAD8+jxeyUxgL
         bMc9up9HElrICzmet0K750Y/Q5bZ9v96Hi5eKLuk1zQ+3X+ISLwRJAgRLNzSCRMCLfn5
         Z13Q==
X-Gm-Message-State: AOJu0YwJbgh5rl5AmhJJslimcCrDkPuewypkbk8IgUsRis+pnRPDLMMJ
	jsz0GR2yv01wRPwxFZtoKY0vpNmYTf4ZuH4LyGhkzU0kO+tlrIuISw0w
X-Gm-Gg: AZuq6aI/jwelQMo8LWcq9Y6oV/7Pj6HqWWz0KCHohEZCggZjUVqpqq7QFUMROlsefj3
	1rQDb/R/V+2WHpanmaur8rUiHLFMTkpu9a0mMpw7Uaw2PBup9yGBR6Hhgb8HBaxbOpUooFuVq/1
	EbNtYd16rcAkb3hRdoACqKc17bqOPqiGQAvE6WIc8i71TwtXqzwMePQZfFxWRi3e2cRhZiqOe0g
	Ri3I+3Zlrtdl371xEnodQXd1fmoYeipx1P4CJhGZJAfRPK0fdQgzdEOOBkNKp8XZ9yObNadVEll
	XdLUlizWrEpg6KoEvfpM5CPLDclsqcJwCclJLvHRyM0axqECqQOFCq8hLprXmtP9YsMB5THm8FH
	PsQ2lVd9KAzJtxoh4Tzh5pSDJOASl8WS724u0FWegyBsif7oCjGQCcfwv6x2aJjX3bpRhpZwGl+
	dklh7pHiT8Gjf5lbkom2k=
X-Received: by 2002:a05:600c:529a:b0:477:7bd8:8f2d with SMTP id 5b1f17b1804b1-48069caff83mr14932975e9.8.1769524169240;
        Tue, 27 Jan 2026 06:29:29 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c37420sm70719245e9.9.2026.01.27.06.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 06:29:28 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	straube.linux@gmail.com,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: Remove trailing whitespace in rtw_mlme.c
Date: Tue, 27 Jan 2026 18:29:17 +0400
Message-ID: <20260127142917.57857-1-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove trailing whitespace found by checkpatch.pl in rtw_mlme.c.

Changes in v2:
- Separated from parentheses cleanup to comply with "do one thing at a
  time" rule
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 98704179ad35..ff4e668f199c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2018,7 +2018,7 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
 	return ielength;
 }
 
-/* Ported from 8185: IsInPreAuthKeyList(). 
+/* Ported from 8185: IsInPreAuthKeyList().
  * (Renamed from SecIsInPreAuthKeyList(), 2006-10-13.)
  * Added by Annie, 2006-05-07.
  *
-- 
2.52.0

