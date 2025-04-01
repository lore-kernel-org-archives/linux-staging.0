Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47ADA79FE;
	Tue,  1 Apr 2025 16:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743526792; cv=none; b=c4KT53Rs4yVFJOoDfqlZu7R9w7TM8lYF+LW6Y4Y3O59Yd7uYzQdRm8oB21t1MdEzCWB80KcVpuRt3chOhf4GG0UOmGjlmfDt26fBk6n/8tdRFgd1Qh5gdqP31Bp8tDhf7dBkDXwhsknaG9iv8Muqx5JaSkeACiR+jWfgZOiiP4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743526792; c=relaxed/simple;
	bh=2a7Yq/IafeBn556VJLu7R9aQB6OEhtnDGpHvtGWGV34=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b7+jZryOdZsCo7a7fxLEyFVn9Pcafu97ZFlh9WtAaoUEu2ERdjVw78EouNkTqnF5onQaMc9NDZL9+QWCsT3vh8zApNB+hMKn4MBT3rh4+JYcOC69UHaB0DOfIOBRwDBzGgTv5Uwagdw8O4cCsOzi/cC81Td/I0N/4jWT8Vd2PZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=So6fwKbA; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="So6fwKbA"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso195355e9.0;
        Tue, 01 Apr 2025 09:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743526789; x=1744131589; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TGAzQ9IQ4Ej9MxMTWMc7YU+f5UPPEhRpwIFJo9nKtig=;
        b=So6fwKbAe9C7x4cxyP7Baec+phRtIKphiPV0Y2Q2EgqqkOn3MdEGfBPyDE9Tdh1KPl
         yPvI7aEeMfY6D8ICa7AvymLANj04Vp19u/kNcet1tYjkyPP2Zwfne9l6g/Kf2Mg/5X5F
         hRcHNJ0BtOFE0pChqjKbqBVduNuXAfbHydh/G9w9uKSSpizydYs0YPWxtc7elqzPaeRQ
         qZyHXDZpmClMK5s5EdVddSpY5XcbxyaSrWxWPqGvDZFOAFnrEbYIvY4ebCkpy4os+DDN
         OjUhKjPAcnJScOSJfnF6QhLujHog3oDCuiZ/wG4Mq84ncQdMCfsno0FA1uYYWrFfqHGx
         KSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743526789; x=1744131589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TGAzQ9IQ4Ej9MxMTWMc7YU+f5UPPEhRpwIFJo9nKtig=;
        b=Cx8EVYyUgh4wwfFAkWEGKZig2B8XfU+F6LyiCqvhHWlQ3OMq6GomgTlg+zFBUu7F5q
         cg/mfeYr0BuJVedll2CodCDPvyDZSlhS2h54C8deFYFXuC8G3qf0R3UygydTanwhvVNT
         rIhTNA2Ava3GkHTF/mhT4KCGwWWspcXQj0wfZdwWZJuecFtERv7CKkzkcq6JBAOPJg0b
         ua3R52bYZ6HyMt2zixrUWXhQAI8OnQsUBf+J+Mqb4jo5Vlspn6tACpsjkGIF6fdaf1rL
         o0yv8ZbHIDZToQtPSccawdKDguNN+z7J6R2ouslqrWrh2uI6uCaWlhVS2BzW4nWWYLuj
         uktw==
X-Forwarded-Encrypted: i=1; AJvYcCVj+kXt4r+Lf1l+Xpl4ZYyY9jZG4DuPgjBslUkwGXwsC6gSfSHdMfA7L3TS1HACO+f/0JfSSVBftWOT@lists.linux.dev, AJvYcCWyN1VLGazSjrlwM98RXu4AyUQ4QA6P6Kah15491BH0F7QY+fpDMFAY/EOEJTIJTlugWFczHOBO2FhhUIjI@lists.linux.dev
X-Gm-Message-State: AOJu0YxXN3lIj7CoPbFbWLAVnwhVFM7nuMd6uV8RnyChAdsd4Xx51i+5
	pD6QTzRVg+3GY3GFsF8jY8l13ONRdSvKaFSKdF5j5ApkLaEYzjVn
X-Gm-Gg: ASbGnctBGVmqCx+z3JqEfLYEmjJ0g1oT1hsmajNZ7bRF13gcQv1eHRUM7NOkGT+X3+V
	zTzmf81KfiMs5ejzy3MCFx+eKPTj6iIcyxqQmoSj1MjQ18c5mECEij2Fb4g7UZITBHyetIBDFAn
	sw6D3AREn92lUJ0cBC1QLf2Xdu/tCu7cfDxzbOwpTpCtxidE7aD/znz6Lcyo6k5keoZ+9nS2X6z
	0/Mgx063umq7wn2FJQBwM8d3GmsmDj955OlEOAO56GPbhdwDjMxU7yUCqwGmuzcLbUCKLmhwm9h
	jAR+m0ngc8gpF5Ey/timlhr0Meaa8KaEJwtJ6ww=
X-Google-Smtp-Source: AGHT+IGzf3Z1L7pCxeVxuHn5zFAkKaMAMWjFBEvMnHZWUpVMiIx2hwoHxnj5cfKm0Lqk03HzQUpiWQ==
X-Received: by 2002:a05:600c:1c88:b0:43c:ec72:3daf with SMTP id 5b1f17b1804b1-43eb05d13c0mr7427455e9.14.1743526789356;
        Tue, 01 Apr 2025 09:59:49 -0700 (PDT)
Received: from pc.. ([41.206.42.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fccfe2fsm161520215e9.22.2025.04.01.09.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 09:59:48 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] Clean up patches for rtl8723bs driver
Date: Tue,  1 Apr 2025 19:59:32 +0300
Message-ID: <cover.1743524096.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is version 2 of the patch series that cleaned up the rtl8723bs
module.

Changes in v2:
	- Dropped [PATCH 2/5]: Dropped the patch as requested and resubmit the patch
	individually.
	- Record more changes related to [PATCH 5/5]: add a new patch to
	cover for changes related to this patch
	- Redo [PATCH 4/5]: Remove all comments containing code so as to
	adhere to the Linux kernel coding style
Patch 1, 3 and 5 remain unchanged from v1.
	

Erick Karanja (5):
  staging: rtl8723bs: use preferred comparison order
  staging: rtl8723bs: add spaces between ternary and binary operators
  staging: rtl8723bs: Rename variables
  staging: rtl8723bs: fix check lines should not end with a '('
  staging: rtl8723bs: no space before tabs

 .../staging/rtl8723bs/hal/HalBtc8723b1Ant.c   | 1868 ++++++++---------
 drivers/staging/rtl8723bs/hal/hal_btcoex.c    |   55 +-
 .../staging/rtl8723bs/hal/odm_CfoTracking.c   |    4 +-
 3 files changed, 902 insertions(+), 1025 deletions(-)

-- 
2.43.0

