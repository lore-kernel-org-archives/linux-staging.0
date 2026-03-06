Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CAD2DEA68
	for <linux-staging@lists.linux.dev>; Fri,  6 Mar 2026 07:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772781467; cv=none; b=WIJR+87l1syuQy8VAITTahKE613Ce2FgPsSsTTXlXIPkGRkZyt0B98f30uvZdIiDUwxddo/lQhqlQjRjnhxoqvv6GTvYNLarTWWdSXGjkuQpYVtKYKqqulhchfJOcI73+7/JYK80w8brthH1Yhe5oQI5sImwQ4gYRFnwq+XhG+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772781467; c=relaxed/simple;
	bh=Fh0qbI1ajq3bnjSa3lbVuUPdV7Dqmb+F94tP/KqFas4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XIddxOKAM25XBEtXDokIvYki126ptXmDNnP0PgfSc4HYnn+/KhO4Fr84gWGDC1M2LIGHVTCkVaN0awH6rIYHdsHKRndJbxan0QIhvw44vAPB6R0JLr9Zj3HBBjIpVvECPLfmloGnGi+wlt97CBWgjBM1dX2KzXFjkzs2IDUxbv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TlnyOQGP; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TlnyOQGP"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2be3bdfda8eso1961383eec.1
        for <linux-staging@lists.linux.dev>; Thu, 05 Mar 2026 23:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772781464; x=1773386264; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=89vr0ibjLvGlXMkZMP8eAKhnr81FzcNLTu0TR8b9MfQ=;
        b=TlnyOQGPjkU00Xmz9xm566kAsSKC1VOCaH5F/l+pENSNifYCE0vDiqsglkLxS608A6
         m2vp4T3lc1vfPZgUG1nOjTp78RvRSiclF2xU9x0zYKF03o3hA/rwkaDRMCEb6mH5O7Jl
         IDW4IoKZ758X0jd2e4C4cHHp/afiHWxwMn19vvP7jl/MjJqSNw8T4H+FNnEUQBtifo/E
         ZEa/FBXg1D2rejXqnj2KUcMR00ddyL3YRl9svQtTjGWNPeRffLYE7NAliXWXiHTkW37y
         rvlfBaIiXMdbaSpwS5MDvHX9VV/OmO+L45BxRiN0AXVZCTdqsvj3RUQS/nDLZHG5HW6H
         hgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772781464; x=1773386264;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89vr0ibjLvGlXMkZMP8eAKhnr81FzcNLTu0TR8b9MfQ=;
        b=wBrxsaM5JLr74QedYgfPQ3aUpDhZUqUJ88bPnqhpbW5cFL8wYhoqCpCievCXizxR2B
         yLg2KDXiBIO6T5onnym7BmSMJycEj58NEdqxAilfG4bOiVrRbepikjjvUc9xM80DXnJ0
         nVuCiv8CW61BAKuNszjBkbymZ4YGBXsuh1/F56IUkVDqcbXG73YjsaCVO3r6PEYV+HrL
         TvzMCWKJ4C4THruQOemwnE1Mq1zKLY8CIWH1EK70AzJshto0Mx3luuWAmENMAHFYdYDM
         BnwVXPrHOABVNOuwlI6SDJrW3q3iouRWvCTHA371TQkwQ82Mmn2rMTInXwI0JgRHFYqh
         jAvg==
X-Forwarded-Encrypted: i=1; AJvYcCXC2iNoy8jR0XGee+qSotkbXjnyEKOrly0HXMJGb9vC2S4i5mFCqEty/arcodQhTxUhcJqqdJ/RvQwdeFB6@lists.linux.dev
X-Gm-Message-State: AOJu0YwU3aQwZB7BDSL6d63vPFjrRlxqPwMbWmVnpm3fW+I/NJvtTx/5
	p3CcXTVxzl2OuFzQ2nNGayj4seHoeBTXPqCiDg4Kr36J8cZJcjr/sbmd
X-Gm-Gg: ATEYQzyB52HcX1zTb8pqeyR+5v17rcd2L3VPn7hP0cy0Zj+UJGnbn/iUDLh+P7ndwrS
	GmwMq5aRY9ftbzfxwiXibMeTJk2hlVm8xHYuvVpkgIZoCe1a0gZiyxGamy4reJV6jZohMG+T6fS
	UGA9gxcQ8AqxXTjm7EK2QkAFX+YcTNB09TKkniSQQx/1dUqvKx9AAOtdFDk0n0NidNVGDiNPJOE
	HNs2bskrSawRJquT19yRLLfU7+NNIsY7gSVtcemfEYGH1JaAr9WLe5h2BWsdEFfsc0bYix0FwdA
	gSR5rhFwdQiqB9V1iIdfk7areTruKKItgUCKKzF6tO4L7x+YhOslVvKGVYrYEfVwoxPbRvOwtv1
	S+azjgpERaRGidU1Rh+RVoczsIV3yj48X8N2+f85W+ti9xcWL2kpckyewHd4VwT/249VqrJah76
	qd4rPCl9s8DLmLtd+R50zc8l9+ftcn6ptPfOGihw==
X-Received: by 2002:a05:7300:cd90:b0:2be:2b16:b99f with SMTP id 5a478bee46e88-2be4de928fcmr419987eec.13.1772781464272;
        Thu, 05 Mar 2026 23:17:44 -0800 (PST)
Received: from [192.168.1.187] ([76.50.196.152])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f96f25bsm545713eec.28.2026.03.05.23.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 23:17:42 -0800 (PST)
From: Michael Harris <michaelharriscode@gmail.com>
Subject: [PATCH v2 0/4] correct macro issues
Date: Thu, 05 Mar 2026 23:16:57 -0800
Message-Id: <20260305-adt7316-correct-macros-v2-0-3702e3841c42@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NPQ+CMBRF/wp5szV9BQtx0rg4OrgZhkc/oIlQ0
 xKiIfx3K5ObjvfenHtmiCY4E2GfzRDM5KLzQwpik4HqaGgNczplEFxIjjlnpMcyR8mUD8GokfW
 kgo+skRXHpiCDDUKCH8FY91yPb3A5Xk9nqFPduTj68Fp1E67jr+cJGWc7klZzqqiUdGh7cvet8
 v1H9BeeONQWTSEsfuH1sixvQj4iWAIBAAA=
X-Change-ID: 20260130-adt7316-correct-macros-b6801b4ae1b1
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Michael Harris <michaelharriscode@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772781459; l=1853;
 i=michaelharriscode@gmail.com; s=20260130; h=from:subject:message-id;
 bh=Fh0qbI1ajq3bnjSa3lbVuUPdV7Dqmb+F94tP/KqFas4=;
 b=bLF4VJL2k9NZhl/Et4g24Kw/ijyppHV+Zvz0gQWWsgYPZRSIg3VsOzW/b6nX+7plHyvwMrQL2
 e5spsYum3BxCsZoniEr9xpgTkBdn0KPmcATyEkQ83ygDtuizCmfj7pN
X-Developer-Key: i=michaelharriscode@gmail.com; a=ed25519;
 pk=td/zQD3XANAhdG3Kf3mSetXiynk1Ql0eM4s0+eks5DU=

This patch series fixes various issues with the macros definitions, such
as:
- Config macro names that don't indicate which config it's for
- Magic numbers
- Mask values being before the mask itself

Additionally, some macros are outright removed due to having better
modern standards:
- Offset/shift macros are replaced with the use of FIELD_GET(),
  FIELD_PREP(), or FIELD_FIT()
- Macros used for custom sign manipulation are replaced with
  sign_extend32()

---
Changes in v2:
- Delete "remove unused macros" patch
- Add a patch that fixes manual temperature calculation and deletes the
  associated macros
- Add a patch that removes offset/shift macros
- Add a patch that adds the associated config to
  macro names and adjusts ordering so that mask values are below the
  mask itself
- Use GENMASK_U32() and BIT_U32() instead of GENMASK() and BIT(), to
  prevent sysfs_emit() from expecting unsigned long (thanks to David
  Laight for this suggestion)
- Corrected macros that were incorrectly using BIT() or GENMASK()
- Change the cover letter description to better fit all the new patches
- Link to v1: https://lore.kernel.org/r/20260130-adt7316-correct-macros-v1-0-8a71df1e42f1@gmail.com

---
Michael Harris (4):
      staging: iio: adt7316: refactor temperature calculation logic
      staging: iio: adt7316: remove shift/offset macros
      staging: iio: adt7316: add config names to registers and reorder
      staging: iio: adt7316: convert magic numbers to BIT_U32() or GENMASK_U32()

 drivers/staging/iio/addac/adt7316.c | 384 +++++++++++++++++++-----------------
 1 file changed, 203 insertions(+), 181 deletions(-)
---
base-commit: 5d2905f2c6acdd1c553f9b022dee730ab2cced71
change-id: 20260130-adt7316-correct-macros-b6801b4ae1b1

Best regards,
-- 
Michael Harris <michaelharriscode@gmail.com>

