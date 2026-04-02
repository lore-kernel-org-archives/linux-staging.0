Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2AF30F816
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 15:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775144818; cv=none; b=AGQuvwU3b0+1QlHbGKzLKSNUZzlKt5xR2cK6T2iZtUpfBcU18ZAxUcakAxrQ5VFLBEjnD8Qmc30W6taCXE1siV9sNuJLt0o9jUfHQ8L4KeSxvuMmbxVC4b97A/IgcmNy6dUCTcSHAtAhliTQqQe5jOGLS3RyyYTvppz3MtR+9ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775144818; c=relaxed/simple;
	bh=gZ0bFRAetFIZ7U5zSj403z9sxVUGAHKkh6uNUNR6LH8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nrbfYzqKbDBLfJHV49AxIff2D7a8u1Xk/g1SO80wOYzeTmgnIqBFZTGATnuf3oeA04Pj+TbQ/g8YbbnYeL63pW0hPvI8icVcxxM0igsScDQMxOUKmMWGjGaDKEHcsle/fK1cbNGsyINtV40nIJhRa3wQ99iD7ZE5a4Mzbd47QgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QW9dyI/G; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QW9dyI/G"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-79c20063a32so10761077b3.1
        for <linux-staging@lists.linux.dev>; Thu, 02 Apr 2026 08:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775144817; x=1775749617; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eN9+QDnSDNC29mlX0j2eamOw2ff06dphsavnD8btczo=;
        b=QW9dyI/GnHw6DXIQjUAqilaXyigWYbp49gqTRsoAoOdxzumCUsKUGGHVu2oHJDgea8
         ogp2XmVPg6dkzUpmn9+UGpm76i77vfW/yloI11SAWpu9p4uZcs3P7Xbm58SrrEjFNTn1
         r19y+AQWfT/SCZ4Y8eT/Q398KgvjH/UgFoTviZHIjx60wfBdsIInBZ86cPhHpJm/2XWJ
         1nJYxq+8gZV76ESUn41QqjEl70ish58wwz57DcZU03yukLpdohfZENsRP43hsks5Qwqm
         uJsvCc+t+zLm/ZSqj1LP8X5/1cZ+se1wTOrISh0Pw+3/B1omwHSLlxDi3jwWC679+oL7
         FkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775144817; x=1775749617;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eN9+QDnSDNC29mlX0j2eamOw2ff06dphsavnD8btczo=;
        b=L+vv0Z/cZLLH+9cjgI5EIgMjH5JSJdfXIt7R1yy4wnKH0Z+7GncKoFKpfnJu0DLmVo
         WJiTNTlT3oA5LhgGb6zHX9gBw9TD4B8tAuG3XaxpjBdOycRlnRruNYnvghELjAIR7Z7w
         Nh36uKCFgKzgK0TL7XfW7JUk/fpV0GwhHrRDGPJQl9vuodqzj9J4gLfst42xqvcvRNsb
         smgienGUmn+2ro908QhN7rIB6mrAS4N3M7mxeGrxyRBtRKGLP02rYsIBzwFHSQsBFRRa
         nQHbnCJPCvvOzzilCqHcLdvo+J4K2rnOhtyEbQpuhacDnDX7RMcx2jcmmC17RCFFTq5v
         yAgA==
X-Gm-Message-State: AOJu0YwY4qd8s+bt2FyIVXzniuYMCQFUFrNBoVwgr6D3/GvvSRPCyEMY
	1h/9poV0RxOF+uBPrb4VVdSqQIEhpHoPgD4tGo3T20WSniS/OomIaows
X-Gm-Gg: AeBDietqoZy5bo1qM50oBaaYmZpr2pGFEL5bJP6KBT3CPERf9eLGDpjs1mokjqTV0wq
	3TZ1aF/8zuP8hgIpiuDzllZdNfQnxWqJDiwJzvSL9/3DAk3slN1gEb5T2kUC+T6V65LvKsrArKA
	HxQRihOoBJBqTsLALcKwqeQoKMOBL52UZBjOGvjbZGVYBoKdFad3iCYy6FT3vPyQRQfEiYJ/naw
	WOuRS3MS4By0YZtxrpgfWWwLSRzvUpqdL9QTBS3iN7Zbl884XK3G81XRa7JkYAUez+Lmd8m46qw
	B/Y56h1cwKhKziUxAP6jf0uInD8bN959C/CLGT+u07y6xvUzdWD7ZIhK4g03kc3Hb366K/qldo/
	6j3BpEWjob7zN8VbGnLk3qykeoDU817lLXxbNA/8OauOr18rd1Cc0EEjN3DaChoH1in/Ifwhsvg
	C1A+SOX3t1Xbv6EEhZ8k4U414Ra0I861KE
X-Received: by 2002:a05:690c:9e:b0:79c:3a9:6fea with SMTP id 00721157ae682-7a3bdd81de2mr21980367b3.22.1775144816853;
        Thu, 02 Apr 2026 08:46:56 -0700 (PDT)
Received: from [192.168.243.250] ([93.186.98.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a370ef3fa5sm11768097b3.42.2026.04.02.08.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 08:46:56 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 0/2] cleanup rtw_io.c
Date: Thu, 02 Apr 2026 18:45:49 +0300
Message-Id: <20260402-cleanup_rtw_io-v1-0-874b9747de6b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEwMj3eSc1MS80oL4opLy+Mx83eRUQ3Mj0+Q0U4MkCyWgpoKi1LTMCrC
 B0bG1tQBpaLZRYAAAAA==
X-Change-ID: 20260402-cleanup_rtw_io-ce1725cf50b8
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nikolay Kulikov <nikolayof23@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775144815; l=578;
 i=nikolayof23@gmail.com; s=20260402; h=from:subject:message-id;
 bh=gZ0bFRAetFIZ7U5zSj403z9sxVUGAHKkh6uNUNR6LH8=;
 b=mPirhWtCZpzgcPJs+Vy7ZgywrQ3TIxEo5ocKaHyyrbfVJNuxfWX6yV41H468+IjZkYDA8OQwp
 mEINa0n0tgcD0lSwGV323dbFuAk9He5aq0oBTzjeF2bSSRRFsx1uDw1
X-Developer-Key: i=nikolayof23@gmail.com; a=ed25519;
 pk=2GWUU1isl5NJpkwSCQ4OG80EinZ3EUZXlrgAg6Pz5zI=

This series removes the dead code and fixes separators in core/rtw_io.c

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
Nikolay Kulikov (2):
      staging: rtl8723bs: remove dead code in rtw_io.c
      staging: rtl8723bs: replace tabs used as separators with spaces

 drivers/staging/rtl8723bs/core/rtw_io.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)
---
base-commit: e87946666e47d4b6f615e9ba0075375493194810
change-id: 20260402-cleanup_rtw_io-ce1725cf50b8

Best regards,
-- 
Nikolay Kulikov <nikolayof23@gmail.com>

