Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F17238D2A
	for <linux-staging@lists.linux.dev>; Fri,  7 Feb 2025 15:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738940769; cv=none; b=l2iUNM8oWMLQLh3EOwIAEiseWy0R/EWAFv4GWC5y2xwJ3lJc4ZKMcI/sA1LIuoHtbQll1zxZdcclNxYAeRMVEXQZ0HxBb6esuzsahGUC40JiID0Em4iODvtVyNjHmImDn0ZrHTaEgP/GNyMwD3BipMFq14NnCQ23xcQARbWGSY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738940769; c=relaxed/simple;
	bh=QyEFET+WwhrCxy0RKGlbftv6rHAuPH7khhDep27+5YA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SJD0GFal9H7Tc3j6WsURciR6aLkZ/u2RLaFuEESuJjeEMeILigNcUELr0ObU0YD9DmkhmYgBJA4+VSMIvLDwGXSwPvdRx847ETHZtPAbt7ykRWhuiJL7QRfs4lnif65SPXuz5fXu3gaFs282j5NccGmrBytMZ4Z812Sj4nkHFSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UgBxbB8D; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UgBxbB8D"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21f3826e88cso4153735ad.0
        for <linux-staging@lists.linux.dev>; Fri, 07 Feb 2025 07:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738940766; x=1739545566; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RIGuPfXQLAKNc1iWTzxQRmz1cixh0e2PBKByK6aiTPA=;
        b=UgBxbB8DCG4Ic1u1LHbvYYiiUk61rMS/gMDuLIW7D8Hdhr/1BDaDySrBqvwRxJnnpx
         d0hGgiUdqPAftYNPvdHT4aP//8gc03iWNLqGb++BEAX5aR4sJAfnRSOlUQv/pUYdVsDl
         49tM0egrJTZPYErsSZdAqOU+UQOBkVVFGMyEqSp8vcziED2BlFQikdJRxGu8neApU70Y
         +FA26qfR+5/OBGlsi57vGqLGShdhV5N7QrUxxZyyKH6C2nfGWJxJLWZmN4EKx0hJX8D7
         LBdl32Lqx4hjIaYcIdO1S4/ft29ktJax9opyAogMkLUI7LEyiNEaAxn5eRc5ip36YxWW
         orsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738940766; x=1739545566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RIGuPfXQLAKNc1iWTzxQRmz1cixh0e2PBKByK6aiTPA=;
        b=ZnXGz1UWIdizElsYNuNHvJeiKbtjMtkFkFDJ/e9PthBvIVmrhVyVXmLh2d6n5wOMpu
         B8tG4vkxSJbvlggRjhH940Hau1W7mrscZvX3upNiurAT8YC7gz8tMe0Aqqw7bMm5rO5P
         L9vTU/SZdSqjJKHRgcy+Y4hVakLkIw3vRC9+N9Sfv3bfenRe1GYewCYpKOTXXSuPHpwX
         94MGLBkVX00D6f91IJkIeTD1zInPrRu7I8S5YHDGPgTAqc54MK2lreYdo9pXYoo0UTtU
         0+E0PZV/0o1z4vaFjSgOzRceAZ2RLM6vi7lrpjOBAv8HveshleRVRW5PUagYvtdkPvUD
         6FAQ==
X-Gm-Message-State: AOJu0YwVHLI9PscQYz1QNScxDr1V/SVfcfvyU6P/m9V8fK4h5z0V/m7X
	NE1zhsSFovDFCSzdOf4aD1e8eGyA5rJ6ZbtPtTxxqvK+xhIzxDo7El6IxTca
X-Gm-Gg: ASbGnct5BekR+M7+bzBk8sWM/0vPcJnUO1+L5T/KgrKGsAD6BIbAfguAowp62pV1U4s
	NknmSyfJj32RcJDKnvBiICBLPnmhdQFNaWmFM0aS2nGxejZBwSuXYqAVURDjRlUEP8/irIdxf+5
	ishq8QLhBRZt0fhsHb/E2YmJdh/QVweSYA7qo+9+bSsV0aNASgyXxdBPg0T2UFebDbjgNxMDxKQ
	Ig3mure9AusqQRaZ781E8neHu0Usvqx2uxNCucuvTXF2QOt3fFFrKJwChi7BAePGpWbdA94VEZd
	0zkxthFgi2BAocQD3aMmwhxYEIcN
X-Google-Smtp-Source: AGHT+IHpUifPkda6sUfbo6+MrAoqTdTT7zUDn7sav/LK+GemDVyy8m9Y/0pS2ZAOk7TkitGj6vVo2w==
X-Received: by 2002:a17:902:cf4c:b0:21b:b2b4:93ab with SMTP id d9443c01a7336-21f4e7d13b6mr20523145ad.14.1738940766629;
        Fri, 07 Feb 2025 07:06:06 -0800 (PST)
Received: from localhost.localdomain ([2802:8012:30:9200:a83e:911f:eb3e:1cb7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653b143sm31855815ad.54.2025.02.07.07.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:06:06 -0800 (PST)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: dpenkler@gmail.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	dan.carpenter@oracle.com,
	ajithpv.linux@gmail.com,
	roheetchavan@gmail.com,
	niharchaithanya@gmail.com,
	eleanor15x@gmail.com,
	everestkc@everestkc.com.np,
	kees@ijzerbout.nl,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: [PATCH 3/5] staging: gpib: ni_usb: remove unused variable
Date: Fri,  7 Feb 2025 12:04:09 -0300
Message-ID: <20250207150427.153982-7-gascoar@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207150427.153982-1-gascoar@gmail.com>
References: <20250207150427.153982-1-gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove unused variable 'adr1_bits' in function 'parse_board_ibrd_readback'

This change removes the following warning:

warning: variable ‘adr1_bits’ set but not used [-Wunused-but-set-variable]

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
index d0656dc520f5..b7f221def217 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -427,7 +427,6 @@ static int parse_board_ibrd_readback(const u8 *raw_data, struct ni_usb_status_bl
 	int i = 0;
 	int j = 0;
 	int k;
-	unsigned int adr1_bits;
 	int num_data_blocks = 0;
 	struct ni_usb_status_block register_write_status;
 	int unexpected = 0;
@@ -460,7 +459,6 @@ static int parse_board_ibrd_readback(const u8 *raw_data, struct ni_usb_status_bl
 		pr_err("%s: bug: status->id=%i, != ibrd_status_id\n", __func__, status->id);
 		return -EIO;
 	}
-	adr1_bits = raw_data[i++];
 	if (num_data_blocks) {
 		*actual_bytes_read = (num_data_blocks - 1) * data_block_length + raw_data[i++];
 	} else {
-- 
2.47.2

