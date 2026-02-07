Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711C52FFDDE
	for <linux-staging@lists.linux.dev>; Sat,  7 Feb 2026 18:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770487782; cv=none; b=cdBRCzQ31sdWW3kQfde61qmXmS94p64l6DH2dH5iShrPUYVPR/DwW+OgvlKT7Muig7xyxNerhM3CHcCgJ8/hF35UqaErwhSlpYK6n65rYUv8yuxpJgxhFOJx1JYs6RXswjy5qJMwRtGzW3InLJmYbExMO8a5e1ESn38hhbfE0nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770487782; c=relaxed/simple;
	bh=YMcozkzavzq/vRR+hPbU4PkZPFq5cvGjVzhMq+Jfs3k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N5o23q0uk21j48KmHXGA889il9ik4nGPxp8cwtE7Zl8kPt8D53LNH3BeIKmRsA6f11hadAeLbTTn0iEJC40cEN5yz21LyWPo6xPX6MgVz77nGoX/df4EFeR48o3VViREYHiyDI8aJBxDR43YH9DqeEDiwASBDjn1ITd2N8dEjKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dDqJqK0u; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dDqJqK0u"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c5e051a47ddso1091252a12.1
        for <linux-staging@lists.linux.dev>; Sat, 07 Feb 2026 10:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770487782; x=1771092582; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vi3dBYAOQpag2SqBlEBdCBTcznYDIdkXa0divGaYQ+c=;
        b=dDqJqK0uTaFFndesvC1kB7gAHin9M8g62EWazh6Io4V1jIaTCy1r1vZ21TYNY/M+bF
         ZWklYISuxqWcVSV0HUIGYloTuOQxUQ8aC+WWWRx+FS8YzEpl3twT6DKHx6WAmq5mb6EA
         UBpDviEXv3uCxo7bZZtUuBKZ6E0PZfjRt8G+3QgTg+5vQaOvE8iT29h5u1FigiWYvUn2
         DyX+F/fu1CWkW3EPidcJz7qbItBGwFYhnmi5WpWyu0yrxzNPKzf8KTsJeEGwABk8asko
         IboqKXm0GhH+/04oiHJ59AxYiWdVB9OFBKSgaf1w27VCo6Faw3ZAhXz6x6NA7uV4uuqD
         aPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770487782; x=1771092582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vi3dBYAOQpag2SqBlEBdCBTcznYDIdkXa0divGaYQ+c=;
        b=RhKefZs3FlJ+GIjrlp437LAxvl9m2i83WlBp7oBj5k2xW9X5lPvOA3uVMgYpLBPsyH
         q8iLWh4tF9y4tDP6IbY8oeAlUr8DSYh3hAKBnBJLHZ3OVD6Te+8woiQw6fdqqmnvtQ2L
         6qWD8wFHC2H40AqjQdJdPi5OxwBpkFup32ELRF+IQP1a/xBkk1TyazPamxKyG3jxlD3f
         Cz11WHklSRZHA81gagNFS9Q/SgWY3J1y4np3LBq1hmS7e/qPf9udAOkIGYAJJHrK16vp
         C69Ih0gX6//tfNLk3UmWmHjEjyShR4qOs3BPwjoh7HV4QTEJ3S0g2Sp8vo1BlWtjq6lz
         VXcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXf46U94tozGwN2z0liuMLVSzo8M6GtR86HYdarebTeTDDzr3uoeWp0ok7DcrPIsT14bDMtALla3+oFJ1jw@lists.linux.dev
X-Gm-Message-State: AOJu0YztVOku6DfmeaXabBfSHj4I0+eBYBOvgCnzbSzuSAmTysQW98yj
	cfkOPJwhVPNBjVdRFsQRzDJ52IVkMvtH1L3QSNmaigN6MD7O20BG9Vk2
X-Gm-Gg: AZuq6aIpEYSPWUbGK/LK/GnAOlFCTBk+vdmQQtA/8lQhx7pImTUkbzT5DMWwEbNKr/D
	wVhLE3Bg3V9bxu5f32B4Y+m7Jak2QCjCUm24vfxcKtvl+VKJCV307HCXRy2qVKMw20wIW4e+MJX
	R+ROvrizQ8QrV/hXsEq/Vopp0tZq2wPVDtRK/j3r+hLwnjIoNUDog6lsjMt0rmbDPAn8xKBmK61
	qGnAwUEoWPT6e6VjZGdoxzIXGeaF11tmnh4h5YCDlRvN8gNLTsMAgbvW8iIO0KGHIwVjm80oIQb
	kvB/b5qxMnySuoqNuJQkpbvlE3isdpwLLCWOz9YZ/7fNDjOzetfJfv4QMh05YOzvb4wtOxIIZXP
	D8I+UfKYiRL4mP5Gwz6MVLIG1N8QYCJiZ7Z8fMogtTgmNu0CmuzuATodopEflNyoWZWpaNW7IyV
	NYCvlFe4SAodxvgwo=
X-Received: by 2002:a05:6a21:386:b0:364:13c3:3dd0 with SMTP id adf61e73a8af0-393ad024582mr7510828637.36.1770487781559;
        Sat, 07 Feb 2026 10:09:41 -0800 (PST)
Received: from HPVictus15 ([2401:4900:1cb0:866:c04:9480:d53b:b35e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c9d415sm61316985ad.42.2026.02.07.10.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 10:09:41 -0800 (PST)
From: Sajja Easwar Sai <eshwarsajja20@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ethantidmore06@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	iryuken@duck.com,
	kernel-janitors@vger.kernel.org,
	Sajja Easwar Sai <eshwarsajja20@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: remove hardcoded dead debug code
Date: Sat,  7 Feb 2026 23:39:34 +0530
Message-ID: <20260207180934.73593-1-eshwarsajja20@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The debug code is guarded by a constant false condition and is never
executed. Remove it to simplify the code. This also removes the now
unused variable 'pattrib'.

Signed-off-by: Sajja Easwar Sai <eshwarsajja20@gmail.com>
---
v3:
 - Removed incorrect Reported-by and Closes tags.
 - Fixed name casing in Signed-off-by to use Title Case.
 - Added blank line before return statement.
 - Included this version history.

v2:
 - Fixed build warnings found in v1.

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index ac49bfbaa..b61841bf1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1849,7 +1849,6 @@ unsigned int OnAction_ht(struct adapter *padapter, union recv_frame *precv_frame
 unsigned int OnAction_sa_query(struct adapter *padapter, union recv_frame *precv_frame)
 {
 	u8 *pframe = precv_frame->u.hdr.rx_data;
-	struct rx_pkt_attrib *pattrib = &precv_frame->u.hdr.attrib;
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
 	unsigned short tid;
 
@@ -1865,14 +1864,6 @@ unsigned int OnAction_sa_query(struct adapter *padapter, union recv_frame *precv
 	default:
 		break;
 	}
-	if (0) {
-		int pp;
-
-		netdev_dbg(padapter->pnetdev, "pattrib->pktlen = %d =>", pattrib->pkt_len);
-		for (pp = 0; pp < pattrib->pkt_len; pp++)
-			pr_cont(" %02x ", pframe[pp]);
-		pr_cont("\n");
-	}
 
 	return _SUCCESS;
 }
-- 
2.53.0
