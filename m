Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968952F5A22
	for <linux-staging@lists.linux.dev>; Wed, 18 Feb 2026 09:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771405424; cv=none; b=B9jzQfLhaJqooCcRVBdGH5ajn5LMpEt2xdpEGKJC7nrXPD9qMIJSP7taLVy3hgrbgXewTXZAoRKDdaODXtE7O7n3femFUKj01W5WBJbYDx2eItkg2wBzsje2dw7A/c2cqwdH3RfmfMPH8tiBgIXGQ3lW2fSKM8nsMSt3eXWtSmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771405424; c=relaxed/simple;
	bh=+yNeBBsVJ/bHlHRUHv1QD/duQAQJ/Pvjl2Lb5h9kgpA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ertI92SKlclVCrCkHKk45eglGFwnFN27WxKaPsrTx1sPScKBp7KWMSI7BuVeRFxHxvGzaQKY21br/6kAsj4uxTy28sxL+EB5sS1e+9X/bln1DkvDR1vb66nG7Jo5yCuxDWMJGewinDezk+9XWWNmO5O7Z2Z8CaUBQxfDJLSlzZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NHinHB2M; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NHinHB2M"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4830f029407so10591955e9.2
        for <linux-staging@lists.linux.dev>; Wed, 18 Feb 2026 01:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771405422; x=1772010222; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pd8vK0G2rm2VZu4Qx7pdUlqtDPU98i6VZK7FfoEtCl8=;
        b=NHinHB2MypNp6pv8BSBP1vIdO2kA2esvBCusGnvMToINGnQm02SEHJDy0mIeIX+Fw/
         y3NOk7UT07KM9yZuEgF+dnO/okHoTjXBcm8E77mg0wNjpBZObfeQuhDkRlhcSJKaHfUk
         /kYyYm5VHeYG39/eIlQZjmnvHOZ+uwL4pNuCto6WgD3/UxatJQKULUplH1gDkpWelJ0/
         kcFjmobCBUzMJlf5GglgGkRHCBy8nSQL1M+e+mNi3ueHVfpo1gXf7h+dnVTLK6juI+dy
         +iPAYCHhlJPGHnwNQ2VGCbp/v5y0kryKw4YDG0LHiw8M3HD4WlssE6zJ3dJL0xcw4Wre
         xpiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771405422; x=1772010222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pd8vK0G2rm2VZu4Qx7pdUlqtDPU98i6VZK7FfoEtCl8=;
        b=NmLWyXFE71ItPieQ+wQTo28y7Rar5saG6eeEqt5Z7T4TmJzyKj3QGdnme3LGDZTfQT
         gXkCWoxw9L5gItIX0vyEyP/iGfCe1thBWS1TzfOxdE3DO9dAVAzkWudyCfWBLmONtdDx
         MuFV4DR6PG2oS3FuqXJGtSCk4YXgLJnWWp8BqC9KyazrwoHf15ccW4Ax/6xB55x3pgnf
         vU84buMxAXguP9ZHkm7dog+7IsCrGwT27gW7xuRfhvCyqFSNv0lNwzP68Ayz45i1vBuq
         R3aFqjz6k4vqknCgWgC0nEMWtxCiUnLNkdflhY+9pGZSXCpBCgd9XRzkDBD6mgL1S8CT
         7njw==
X-Forwarded-Encrypted: i=1; AJvYcCVQGPLFPNcwewWX4fLWc1cIehkZxH1Kn68VrccO4XV4BVdZqPotSyMpvlBAt8A9wAC5MALKYpZY+2akaIpn@lists.linux.dev
X-Gm-Message-State: AOJu0YzZaoEZ6uDHA6tz+6lFD9xb6WEn18h3g2tKiWzHVTszWW3zfPKV
	MEJoHxbn16mvp8O/9ar0nK7sHpkW4c5QJ0Qm44u/z5jQRXHG8eMEl2N7vPJA2idc
X-Gm-Gg: AZuq6aKxyG0AqmNC3mKJ8l13LKsOPRn5OiCnfhmXd91skZC22F/jmxsr+4Y2IsLDv5C
	mjORVFSYklNGIssedbdnCHTJYYVesGMuC2n4v3XyJbVJlHrMW48O1ZfACm2O8G2oRiA0sQTFsc5
	FSK5R1vd+Y0t4C04igYCM+hC3Snk0VHdyTmYgWlRJjW8PsfSs2E7abzeEralgp2UwDlNuBl+UI7
	1Cndluk7ORw3YAoB8c3ufx3dL5mSPU/7LH5nhC9OdaHkPng7/gQ2b1tWzt52AzP9MGOl4eilVJ8
	qgl0t4YRuWMli4HsqZD0AdiWRC6kLQlSb9GOI4Ez+IQUXXs/0mQR7UgoZSJdvJ6SyCIxfYu34wO
	TJvIJpg3ZOS+uH19iwwGGih+/d9xLWKdvvtB2LMDkdKCy/OfeOpZNLlqz11U8IYV/OD7RWHaO3i
	/WdWte21Z1spgzUAjpOYKf2hjCTSyhHrJA4WHvHGSAbqRC4pjWzj1MDLmtdMW/dK0sgsAEPsQOK
	1zTa7J7UmibUyWy+Df8f/rEhO2m/6E+ziEffvRQ16Ey9PtmYoKQTN2Ny1V9xeM=
X-Received: by 2002:a05:600c:8b35:b0:477:5b01:7d42 with SMTP id 5b1f17b1804b1-4837104003fmr176676995e9.5.1771405421719;
        Wed, 18 Feb 2026 01:03:41 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796abc85csm39995299f8f.22.2026.02.18.01.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 01:03:41 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH] staging : rtl8723bs : Fix typo in comment
Date: Wed, 18 Feb 2026 13:03:07 +0400
Message-ID: <20260218090306.117841-2-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change 'adpative" to "adaptive"

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_xmit.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_xmit.h b/drivers/staging/rtl8723bs/include/rtw_xmit.h
index 544468f57692..67a5d5f78a1d 100644
--- a/drivers/staging/rtl8723bs/include/rtw_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtw_xmit.h
@@ -157,7 +157,7 @@ struct pkt_attrib {
 	u8 key_idx;
 	u8 qos_en;
 	u8 ht_en;
-	u8 raid;/* rate adpative id */
+	u8 raid;/* rate adaptive id */
 	u8 bwmode;
 	u8 ch_offset;/* PRIME_CHNL_OFFSET */
 	u8 sgi;/* short GI */
-- 
2.52.0

