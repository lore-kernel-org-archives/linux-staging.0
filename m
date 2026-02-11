Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E82357A34
	for <linux-staging@lists.linux.dev>; Wed, 11 Feb 2026 09:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770802794; cv=none; b=Z2Jh9DvIKrylcLmEDLcD4ZPL+2rmxES1A8TtcHD9Cc1737MKfA3hZeoUsjE+oP2hNkYqZFmRNJEGVyycymvLkd9ATF7Nq9bl6UPYAuEKgTaC3MKvghtnrtciipvwpqYW61rdZiBWXUNL6z2TDSg6LoFsAF96XxaV9OeCrB6+RUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770802794; c=relaxed/simple;
	bh=NiPAgniGOvmAmIqmEZYdiMcfkZ5kZ73/tRZipB3KPiU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pSUaWGg4wZ0foC7E320pqQ3yI8E5M7qXxAbmoyhCt4tce5FFyXn7TGojvlWd+EKOrWxJB6ejh1ox3vJVpjkoFu0oQcnUVj/0nRXTcDKI/V6pqhX3HkyKZvS2NqoGLfSS3YY2Z+UnGC5K2SSaZyTPhUUCAGQx2S7YUoL2a4OYjhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a0t4f14O; arc=none smtp.client-ip=209.85.215.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a0t4f14O"
Received: by mail-pg1-f195.google.com with SMTP id 41be03b00d2f7-c6e191c4b8fso230845a12.0
        for <linux-staging@lists.linux.dev>; Wed, 11 Feb 2026 01:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770802791; x=1771407591; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uq4WnjpmcYszBR4AvsIlQnLNlEv8ihNh6qcRyVIIWqU=;
        b=a0t4f14O4qPxBepizOtLNU0wAxkAsAm2NEA5JZJf+Pr5KMxqFwxJ4Y10CVaNF9vhgd
         v85RQVO/LZYO/tzxkNMzrXsAa9f2WOeqG4UBK+h+0OUrXfhQaezQmKWJ+u55M0bRI+W5
         U5H1ub65mplCAGNEFIG9ZQxPhcLpJda/fe7p6B2OR4nydB7Km6RJHmphZC08oGT2Rkm+
         2AG13ER+SP3wHWsTSLNfrguO3LiBHQl4M6jXPTgFN2Gmev4x+2fzwBTCPSQVu27kpKZX
         soSnc5S0Gu3u96xQPoNl9iIiWuYDhjrmuYnfeBhmvwvt9zqfl8P7LWAVrVSzAFvmWWru
         BI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770802791; x=1771407591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uq4WnjpmcYszBR4AvsIlQnLNlEv8ihNh6qcRyVIIWqU=;
        b=LCG3/JfNRABfUV6zhfZtygfldCaxFCzWXsH9PGdGm729hzy5op8zrhGh26P15GaAUb
         qlZV+gZce43ZVGB5QFTRgNxSqvSM/BLW9hU4HHkH+VI/Ouk5qKzrU5mcJPTlESimyb6t
         eiOR2VA+VyEqLO1XjhfxVMP2IQeyRqcPRTRtauaIIC3hWhvGA+tArSZKaWIsMMd/LgMi
         QKa+t3H1vX2NdRKdPeG7y/nwOSPtQahZpPQWjOqRjEMBtXl+pxHSgmtGAUweqgTZZp8q
         65Yiqi5JcCl2qT9HwCLNh451fUxcr961aeOqixPB1+F2eaw9WFveC10qY8Q5OBdvFXfG
         sDRQ==
X-Gm-Message-State: AOJu0YxHAAeqBrnjDY6jKMTIHwQ2tKupQ0c8jWv6zlCX6DfJTqNpxBZo
	0u/lzAqC8G6JshyAMleDEGJVY9ToCJKBrGp+u9J0IijjvfB/5MpkH0wX
X-Gm-Gg: AZuq6aLUJTBBZzK3KlTavqbhAoySpavwlhcBVqHa8bbrcFexGHdkYYWDu+EHc0XgsdV
	xRajsrzdqs5JnWENKMbX4OnyroGnn/fjKIxdHvXMwPWy6V58sqvFp1Qec0Nmxc2I1pn30mSMMlU
	UU8Inxvd4NbNm1YnsiBBpdUNNZvtLTWDmDwCaOS/WTIVymg9OUlrfyHQeE51nIpHr1Xq4BagsbD
	VgHIG6U974sed5nYtWtwKg1Q8jgaEurCKB/sG5ug/PpJgoEKZr8X15ZZFT6fJRYKHd4cHEiB1Wq
	xk635acoJ/7ZVk1YRgs1oSk5TCzryUWd8rMF0BQGpCN0AtH1m7OpCwVBqMSzRfgZdgDzODn3KvE
	BeJxzSnTC/XdDCz4G+r1UT73A/BcmHudv741qfuhexE/ffBNYMEYRCTKMZ5D7xXz08gmm7tEah9
	6XG7w/bt1ELRi+hZVVKkVRw8BdaYzk7/42XCFnnBxY
X-Received: by 2002:a17:903:4407:b0:2a9:4998:6636 with SMTP id d9443c01a7336-2ab275efc88mr19420355ad.20.1770802791383;
        Wed, 11 Feb 2026 01:39:51 -0800 (PST)
Received: from ubuntu22.. ([113.59.185.40])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab2997ae0csm15972395ad.67.2026.02.11.01.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 01:39:50 -0800 (PST)
From: Juyeong Jun <juyeongjun.knu@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Juyeong Jun <juyeongjun.knu@gmail.com>
Subject: [PATCH] staging: rtl8723bs: split multiple assignment in osdep_service.c
Date: Wed, 11 Feb 2026 18:37:19 +0900
Message-Id: <20260211093718.3511-1-juyeongjun.knu@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2:
- Fix incorrect Author email in commit

Avoid multiple assignments in a single statement.
No functional change.
---
 drivers/staging/rtl8723bs/os_dep/osdep_service.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index a00f9f0c85c5..19b378b49809 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -226,7 +226,8 @@ struct rtw_cbuf *rtw_cbuf_alloc(u32 size)
 	cbuf = rtw_malloc(struct_size(cbuf, bufs, size));
 
 	if (cbuf) {
-		cbuf->write = cbuf->read = 0;
+		cbuf->write = 0;
+		cbuf->read = 0;
 		cbuf->size = size;
 	}
 
-- 
2.34.1

