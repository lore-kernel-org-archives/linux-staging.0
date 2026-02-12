Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E60344D9F
	for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 11:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770894857; cv=none; b=JxfQdWeCtN1obsGrtRydqr5QZTNghODIzix3bbI5BVtMB/fUu7essQ1Xs719/dtSUAbTbZo5lHtTWeGBR6nFCZrQuV9pdeSuuLeBiT7ZtgBvx0RJcNerlCArY/oIJm3oDD5Vsj0QoG5eaDPLwF8YAn/alVFKggwqvktEvZHmGzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770894857; c=relaxed/simple;
	bh=wAFhG8InvoLhzV5uGwr0scyG7BC/ZiPFSBz5yrXw1j8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UByNT+ltcQHbHDewntW2QrTmEZ5gcVmLDmr+Z0vlAEJAuR7wQOyGjarpK2Z/bFYyFIaSjJzl/OCnITzD1MRAZ8WZOkh6FXlat9u5qjufdLy9XS/39WTiwJQMQjlsV8WE4zktgCI2BFVkyLpw/89L6hPHj4N7KJdBht0PTXlV790=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZgmR0bh; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZgmR0bh"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2aaf9191da3so20986425ad.2
        for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 03:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770894856; x=1771499656; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R9FN3hOlybhKoiOZ6iOb3NAMSqlX15Ic6Esb3p05Yog=;
        b=EZgmR0bhFlLs06CUPipF44rPIHw+E6l1u/n4pyMPUEVi1vULv19N1SUPDrdGjQgGtX
         8vo/bunNw19djKtickZk89n5zmVcqLPse0BhvdMN4sZcCq8q249DSWQLD23pKh82hgHb
         ev+FDz03HQjTZAPdvQJ1toFash6qoPyh8XFh+HNaItDJwcIakQcg7OlbSV+y1XVU9/gn
         bEmUe0lFV/EMWfaegXc4HpjnjJJ8EKbih98HuNcU2E7KmSnTJuVRELj3uuaj4jgNjpVA
         Kw75vnIe6yN84uwGNk/CWhLkVTtcqDtr1ljTgcbAOEIWPHZKdCjhO5rkcJpkyNoinLfb
         Ucyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770894856; x=1771499656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R9FN3hOlybhKoiOZ6iOb3NAMSqlX15Ic6Esb3p05Yog=;
        b=hu37Oc0taWSY7/lf1pcUQ5XYiM4iJHRNE1S+cqxFuk5j9Mrk0ELHtg3hzW9Jss+t7v
         W7mGW1KbBPVq3UAQRqUJJ+aTIwUmRFlFVhybTPCny13O2mcAEMcApuJvYjpF8hW5IPFI
         mgF8016sGUloV6EYwezVwNSkVcDl17ZY9hjmIlD2+ShGdEklTgkGR2/JdbrplTZP6nJG
         CVfpihXkrQFq2hwFvR6rHGb/oGRSEvjp529chWf1wrJouJ1V3keI0ZK0CgaoIIEEbLAf
         wwzxOAuOed72RkdOCdB+aCd/IxiAfgkqN7CROgQCHPJWOUU9jVpphe5DBegX+/DcUrcA
         eAlg==
X-Gm-Message-State: AOJu0YyHRSHrSuB6n/BzdHQSTxHMyNYMbt6Dc5eYKUbYdk2khIjC1mgh
	rKUffIrREJYgn7pwl/bxhbqXLQ8uRLtAR2OeKya0xwguJsvCyEc+GZwb
X-Gm-Gg: AZuq6aIdw7liZgEraqWfhSsjACejaWxnfeWBIfXTuN3z/7j+Syr/GQyr0PdrqH8RQgt
	Ybpijmwcasb/8ADPWsUpfRzHmKDLiEeCXGLGvV0/q0wcH+5MpFtLO5q0QUspsx30Mh4+YPLac2a
	dpK/Q3dFKUzszHXeL6Uf1wvFwy8jnlFxUY1d6znrwgMToy+Xtui33bFoILSS/B2etGs+3A1cBEA
	LogDNfsOKUQal1k56NniNkW6lcSMSWAXLTuiUJtsy+l0O1fz/3GxNH1EZFWHO18ZjuwFVlsGkLR
	C1QTtxQd334zWmJ+34vzB1m9e8b5F+NWqE5SLD8JXWGfYq5mRN1N+MF1pXXRvstNL2i5DZ4Yo/U
	r55k+aYFamHvuuY00C0qXdX9Jgt4QIr5sMTHitpqwSAOlGgmlEoICCvgDJAY60LWuWkC1/OXG0F
	0g9zL017hx6msWycsfZMtaTf8UBvPd3CBUihi5wJ0drw==
X-Received: by 2002:a17:903:2385:b0:2a9:327f:a8ff with SMTP id d9443c01a7336-2ab3b21f69bmr18487055ad.33.1770894856255;
        Thu, 12 Feb 2026 03:14:16 -0800 (PST)
Received: from ubuntu22.. ([39.112.232.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab299987a8sm46115825ad.81.2026.02.12.03.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 03:14:15 -0800 (PST)
From: Juyeong Jun <juyeongjun.knu@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Juyeong Jun <juyeongjun.knu@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: split multiple assignment in osdep_service.c
Date: Thu, 12 Feb 2026 20:13:16 +0900
Message-Id: <20260212111315.4979-1-juyeongjun.knu@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2:I fixed my git configuration. There are no code changes.

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

