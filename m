Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D461B3A1D0B
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 10:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772100280; cv=none; b=fmAGs9nHdHKmQULfTxp/TbhFh0mrK4Zj9jgaYKkkGNrVtVEdWUTOoosjhadhjeXOP8gRke2ItUT1yZuZlaKe0UGzXixX/g6ToOANnav+wg2C9EmNnJMHOOVxJ+QlqVAUoVh65U+TiAip6f0Oz0eYc+gZt79cVO0n3iWUVLkiqus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772100280; c=relaxed/simple;
	bh=Zaf0eziRinxMd4bohajyb1iQZFa2oGIBIJgPvpBp+Z0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YYmfHoEPhX9d854YP+ivPj5a3kwHCW+orlsuxlW7sCivZaZqkX95WEPNHoV8jLW4GyQJLzRj+suK3TPKo9zc7G80W6FPqtXQj8kvyizxgW7lRlld2NdKtU894u+Lfos99+XKOUXdObpcS6ah5BVI5nfLRRpdZvwiCWocU/6YykA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fhMB+upz; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fhMB+upz"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4399567ea8cso25269f8f.3
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 02:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772100275; x=1772705075; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I/icaBdFU2cohJVM8bVSrJ16ogtcifnPw/XoPcW2qv4=;
        b=fhMB+upzWzgMD+sikrxqEOhbfNx88UTThz87iqBcfWDbxjpCOEt2FK/f9NJvjnt+fq
         H7fb+zg/FnHvezneT7ChcLd1CcsLV3TvJV5UkpOIfU5aQ2W3GMVWK0B3ajQeEUJkUPGf
         oU2rd5Orr9ooNQweJpEV2zaCjcj90j5LCCYfORYQk78y+Ee4wBIaZkkuCAaxoZpw91u7
         VG9BCAV0USG74EiALxJCco6cKIkE33LE3HdOAmKEKFO8o/vHvxOx1pqgxJgS2EfYBcSr
         nI7ucHKW7ChhSLZqb8cJKx+9xlvY9XzXyhPj4bH6VCrev3/pXcIIcfyLexEOHPz3O5Xm
         Rqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772100275; x=1772705075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/icaBdFU2cohJVM8bVSrJ16ogtcifnPw/XoPcW2qv4=;
        b=msO94zmZbPe+aMPRP3uphBiBmWKsqNXTb1WL/b6vIJ/w88JmPRxlCaTGmvCE0+g33Z
         AkQ9QuQ1+pfs03ZFw+vZcOXRn+hK4EJKSO351Fm8zG5fY1bVMmzNhCM5jA2QCh2fNVpR
         QHupjvqiWYd+S4OROVi7zbYOTQKbpz83d8BP9f/qcVERyU0MDdcNm0N8Zq4uOJl/ym7w
         a7ab28AiD0T/RJ3ezs5FPdxavnARFI+zmhhra8394yF07YJnMM/4Ewo5wSZKNPvP+e5q
         Ex7KM3ilL/sDd/KFRdEuHL8crOfUnbbX6b0WYbm87detQg4cuCHzNTPt3Om6lLQYrYEG
         0byA==
X-Gm-Message-State: AOJu0YzdHWtF2/KNfcfLDQC83WX6rBhg4SvQZlHx4OVEOTxSFFhiZlZ2
	PAB6efQGJ4Ek45DjtD3bpNVFs5V7U826Oz5F45F2H3dcRhg3GaceIOEV
X-Gm-Gg: ATEYQzxPjHyGOynr1jzqBtF7TWPovR3SLoSa7JRMAFTFj8/LL/0L9Sf3XhgBDo5oefw
	ZqDS01JwYLcuFs/6Gqzq95nox/tXvODmpPRpaEqFx0zIlqNA3fCllrk+uYwqCeaYxHlmR7GT+a6
	9q5RyguoBuGzNDSRqcw8K5LimQFyhzodWdekvVWzWknSiXZWn19SNOvqmcOA3/qR/gnSLNmvHTR
	ujAlbRy9S2W737XR8DGs+TJkm6udULczXI1UbFe85IvnvDGE1+X6qgvQir4SoEVF36zBfUot3U2
	oWAw3Q0gGDIsjR0OJd18e1yiP/6df3Dp+dleoIcoP3Kk3HcnYFo9eQhjh5iV4rx3SeOQodYnnzY
	1/AF19r+7L1RzKSTLx2BEX1b7y25sZRMJPsLBoVZ8QSOvG533hqyY/FVKjfCZV9+NZZMz/cvP3w
	perBLQmo28Mz+yYQJDR9HesLiluBs/D72eFZX+mooQ8+I8Zly7nti4t33gLSc0gnAZ04IKMzffk
	02fez+j+sAST/6D3iY9sneeVnexw+J1zSl5PpIe0VqRIwo66BIQCG86LxDNA+o=
X-Received: by 2002:a05:600c:350d:b0:47b:d992:601e with SMTP id 5b1f17b1804b1-483a95affc8mr195528715e9.2.1772100274832;
        Thu, 26 Feb 2026 02:04:34 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43994da2584sm7127026f8f.12.2026.02.26.02.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 02:04:34 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH 09/12] staging: rtl8723bs: remove unnecessary casts in rtw_xmit.c
Date: Thu, 26 Feb 2026 14:02:53 +0400
Message-ID: <20260226100255.167059-11-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary pointer casts in memset(), memcpy(), and memcmp()
calls. These functions accept void * arguments, so explicit casts
are not needed.

No functional change. Object code verified identical before and after.

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 7b18be8912e6..351f5344af03 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -19,7 +19,7 @@ static void _init_txservq(struct tx_servq *ptxservq)
 
 void _rtw_init_sta_xmit_priv(struct sta_xmit_priv *psta_xmitpriv)
 {
-	memset((unsigned char *)psta_xmitpriv, 0, sizeof(struct sta_xmit_priv));
+	memset(psta_xmitpriv, 0, sizeof(struct sta_xmit_priv));
 
 	spin_lock_init(&psta_xmitpriv->lock);
 
-- 
2.52.0

