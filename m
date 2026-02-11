Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0249B352958
	for <linux-staging@lists.linux.dev>; Wed, 11 Feb 2026 09:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770803429; cv=none; b=qSVQG2cAPZ6X6/wcBu2xJLMtI5l97VqEEBZ/U1ItkwXys8p9z+tiddISdXsnSh9XO3GbhDuu3rrIZUp3uAMJt6dibgU3oibizwvyRj3Q++df23BG1wNcQVJjeMiAhcAcwHPELpo79Oiv4A/tmN5pb3rINub2EBg38VdFjMrXB5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770803429; c=relaxed/simple;
	bh=a36fMckGiyvMWytoP+vz2fIEQejD1J/1tqyFcG9Z71o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sm69hzRfhNc/gXNKIRImpZVjs+QJJU8gCTr5OR2zvOkgtFxylAW+ZsIa7L2ndbRWr9yPsg2nEv6s2WLBXNsMhiiV2oBnL8/EO8TMM9Wp3aAXMp9tAPxw5V8DxW65QpFetyMlos8jY/fZJSpUaBMW2ITgc+InCoFBKo1szTUzhec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TL+yYza2; arc=none smtp.client-ip=209.85.215.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TL+yYza2"
Received: by mail-pg1-f195.google.com with SMTP id 41be03b00d2f7-c56188aef06so2709060a12.2
        for <linux-staging@lists.linux.dev>; Wed, 11 Feb 2026 01:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770803426; x=1771408226; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tVC+Oos4tgXtdJQvwn4Ngi485+uo/sqy1+R2xbaB3n0=;
        b=TL+yYza2kjSqtKNQFZcZR0bEWRz3VH4HHYD7eBrfCUBlgJLNyj3aHiOBtZcF9HYYAq
         fE6LG82AB4LCW4c62bVuM8K7jBLlOEALRfzk1AYcN+w31rGwTMMy+YHQC682gbS9HvLz
         yKLkzj15nCl6ttDucyjvSv1hM2nQ+zgcCt/B1O2KkqF5wcMSAIyPLizQKyrXdvNz1y1J
         n4R9I3vBytxlYf/PDQLYcJ3PBg18nkwNW/oO4vnNet2gIa1LdlwVBKViyBb8YlcnfNv9
         K5d91RMpbnejXNcfuV1+0/6s9KvEEgn2YQPPAoDAGQQrZy4hgudCSOmH+CL082C6XFsa
         GNAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770803426; x=1771408226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tVC+Oos4tgXtdJQvwn4Ngi485+uo/sqy1+R2xbaB3n0=;
        b=r0l2Tn4UiSmGXEX4ZxMcPQipq9WKIOZ1UqUUr4yOGzuqW7GYJ1EPbyCqy3VTTomQo4
         7xWCVBuSO3cyfY9rORjxd4ncj7lZxL+Xda4KLp5fUAmOt7ju7zlUY4XrNo0pcvW+LyeQ
         wgi7YvxZtMsRwAEQnkCeezuQtF85HHCyUQpNvPIWJNSlDdvjBECiCVdE5Y4eUd3qxrGG
         1A6qC1IskrwXbrJx+99q77CayRtlQP1gvK4rd6lrCNnwuvSDGMmhQX5/ODfrMuN2r6gO
         lvY3xVO6eBkxncQbtJeNBpFnGonBxdpV3vbQ4M4zAUHsdRlCVweo3h+x8OaDkThzhUUk
         U9wQ==
X-Gm-Message-State: AOJu0Ywv2Jney549QSAgImWO92TBOtwZya5EYZtKFS1OwTyy7Ae5501G
	X+kkrZ5IB+O0cSichTza6j+kA5DK7JG5MGJND2qYmpGsFLKJhnz1RejvTrz6lB2+exk=
X-Gm-Gg: AZuq6aK63LaoN3qto913ocmfasEhHTOYBFQlY8Ifw6+yHhsEYl9PguUvssbhZtt6wbh
	sS2XPEWsKQ40eNlV6LwMNsUGq8bSwwZfRay/kxC9DAnVou9VLp/xzSY5OV00izsd/k+yugu0OHd
	bDRICV1dGt7JPZcw/PjFEIZ/19MrdZ9+Rx54j9EER+HQVIcdA8SB+KML7n2vYTMKl8wphOaFqbk
	mArJFoKlyWPwZwVHJRZfI7Tkp2v1Xrpp+pahMyEMAwsqunt4m3voCCHYnE/rzCRngBq1YYYVNuT
	fG3NhiqCW/nPHoawBGQxjGbFah5yKfu2H+xWs8m+Gc0WHQOyiW3DPlHLT0E+Vwdvkvk4kOo6hNF
	pfPivS0lOXh73ZGV9i1OlFXYnLyINfjkel5cabTKiIwpcOCoj0GhFP/IDLQc6Bwalag1zu4scoQ
	fdRswPL3a2FBKkPgGEfiOV93yBoeukz5y2Hy09a4Ms
X-Received: by 2002:a05:6a20:4308:b0:366:18b3:85c3 with SMTP id adf61e73a8af0-394178511b3mr5261023637.1.1770803426378;
        Wed, 11 Feb 2026 01:50:26 -0800 (PST)
Received: from ubuntu22.. ([113.59.185.40])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab2c522a60sm12335935ad.63.2026.02.11.01.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 01:50:25 -0800 (PST)
From: Juyeong Jun <juyeongjun.knu@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Juyeong Jun <juyeongjun.knu@gmail.com>
Subject: [PATCH] staging: rtl8723bs: split multiple assignment in osdep_service.c
Date: Wed, 11 Feb 2026 18:46:34 +0900
Message-Id: <20260211094633.3549-1-juyeongjun.knu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2026021137-buddhism-upcoming-392e@gregkh>
References: <2026021137-buddhism-upcoming-392e@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2:
- Fix incorrect Author email in commit

Sorry for the mistake. This is my first time, and I sent a new email instead of a reply. Resending as a reply. My apologies

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

