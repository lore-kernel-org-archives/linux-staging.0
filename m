Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F813A7F4B
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 07:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778486229; cv=none; b=hb090D7RqNM/ESN85eSGQj19ouI3Lk3bqOahsebBvCySKG/TKRfyc3BmICZis9NIK+60exff9MMY+bHiA4cXGJVkRBYRfmOB80g7C9bHbSIe/n3LGFur3B245ltjNFANpIpu385eCU9boSweaLa+vll6POs6cTXjX72OhQwCf/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778486229; c=relaxed/simple;
	bh=mkubptnGLYPP5tIv7TvkWIPIngqaF9KDKrWohl5eK+c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HIiUpKFzT1uKdypii2NJaoLYje+QLLAuhj9CgVSb6LYiE2Ig+lg7OpKgqtnhyPlyLNgDSKT5ojbo7ka9OZjtmGagD4gSVD2Auqs5Y3Ve2r72OWjDPInb3zlEX+AazrSk6y3NyY4UQkGe+VnqnpAWXA7nF8RMQ096inUxQ+lXejI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iBeWwCUq; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iBeWwCUq"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a8738c178dso2715659e87.1
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 00:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778486215; x=1779091015; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i2MAXc0nFYfpRMUtrGR3zCT7Awb1wRW2mDAZvSV3yn4=;
        b=iBeWwCUqgVQRDRW1qahA/KZuieO8J2gXmlviHMYF4yKj1d1+IXFXrpnWrnuefZQkEr
         iN2ttPQfIHTXlXugdQuNH/vgC/6wgLLrpspE1Wet8m9oLmfTD56AaxUVU2UPRBkbvCJ2
         Njei+dbUfr9V2ySFJ7tC7tj9AFpo+omZgZZLv6mWXVegOnuwbefLD5+b7sho7G1UhTZe
         nDf0M02dMAwzyMjLNfHwos6dxFN8p1zD7Q99ZimDVS2fX0LAANp45EE2SJZqlp3gi5an
         P78+H1zYf+rMSiDVjOdOLDXxjsV1NEnqbZOlURdfJdOAax1IRYH2cs3Wqgpz8IlSu/NN
         2EHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778486215; x=1779091015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2MAXc0nFYfpRMUtrGR3zCT7Awb1wRW2mDAZvSV3yn4=;
        b=kLVn/itS3bbaOM7QhdWpuOHGoWNWMJYXyvv3s0CWXQUbx7uSLSrUP/MemlWy6AXOVq
         V6qe9tOFcj/ufmu6PGc3BBXfyxDB5lOKsMAxc3QXBAml/nvpzriYkg//lt0xDto26ZSr
         wjfi2nZKkSWWWkzwoEBZQHehxCCsQ6/POkMXovEIw6EI+U/ZxTqzr4SwSyV2776C9LV6
         efrGcVrJrG62rLqKxlTxy797azhv4rqA9NqkMrJPrw2xA7dsE1q73RH2RU2Y+PjtkVwm
         M0Xq+LQTlKSxMxwcFnRmGgTBevxcJRsSJB0UB5yhnW7Ft4kU1MA1lttajFav6Kj8K8n8
         mzsg==
X-Gm-Message-State: AOJu0Ywt/bBEWzH8Ark0YthSgr9JPDjvfaVe4EnH1bqPEi/sEHyYNQi5
	WgEBhKaotn3tnnZ4R0glFSICVw1x3N+c2TlCqRuQ3Aq+bLJWnagWePe3
X-Gm-Gg: Acq92OEERiFhBq2GkcG0aDTuDbkcu1yHqqdgFbuFMeyHuEYUVhjRIlM+hOovf656sLD
	htJNl/Unldiwcb7PNWND8Ehe8Fvz+rp276JCPX79EFauncy4agH7EyBaM0RGw2CfWIjyxcJGMss
	MX+qdZg0TlnV/N0fOvs1TQnSeBDZaJyDjvjNq3MEiV3lVwjVvQnDV/Z2W/8LCBWKJUtzB3Svsm5
	qbs2wVDZUV5cqGgFPksLcq30srkfw47ic8lIpEtAu7O2eRMhCPbUHb6IuCN4HBTxSCBMhHwmvQH
	h/NUzzzaALdSFrdNiaqnX+JfZz3SOquiS7h1Wh8AZ5rRd9AepDsFBa6aYuY7SfdZsrRLf63WKOr
	N2wM86xqUtvsqfHopiV4O7R1SehxiWKU0Y1IUbXCyCE35g0NXfnNDlTCahhFr8RDvxcMPyu9jep
	gVcQq8ZLRX628rpLj1QBc/wOQA
X-Received: by 2002:a05:6512:1088:b0:5a8:8222:7fc9 with SMTP id 2adb3069b0e04-5a887ae0273mr9338303e87.13.1778486214352;
        Mon, 11 May 2026 00:56:54 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951d487sm2433861e87.24.2026.05.11.00.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:56:54 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 0/4] staging: rtl8723bs: remove unused sys interrupt
Date: Mon, 11 May 2026 10:55:27 +0300
Message-ID: <20260511075651.11637-1-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes fields 'SysIntrStatus' and 'SysIntrMask' from struct
hal_com_data.

'SysIntrStatus' is actually unused.
'SysIntrMask' is initialized to zero and never changes.

Nikolay Kulikov (4):
  staging: rtl8723bs: remove unused SysIntrMask from struct hal_com_data
  staging: rtl8723bs: remove empty InitSysInterrupt8723BSdio()
  staging: rtl8723bs: remove overwriting of current IMR settings
  staging: rtl8723bs: remove unused SysIntrStatus from struct
    hal_com_data

 drivers/staging/rtl8723bs/hal/sdio_halinit.c |  5 -----
 drivers/staging/rtl8723bs/hal/sdio_ops.c     | 20 --------------------
 drivers/staging/rtl8723bs/include/hal_data.h |  4 ----
 drivers/staging/rtl8723bs/include/sdio_ops.h |  1 -
 4 files changed, 30 deletions(-)


base-commit: ea09c82fbc53aad867541cd2f0bde96c6b228ba0
-- 
2.54.0

