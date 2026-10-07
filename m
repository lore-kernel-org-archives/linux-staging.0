Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A6A4766A5
	for <linux-staging@lists.linux.dev>; Wed,  7 Oct 2026 11:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791374059; cv=none; b=McAkb51jhyi4iWJU6HKE3LMj7NfQM8txXMKrpkM2OftqWdHE4xLV+838MGoiCL+mFfhocVRqCKM5Glx1/c5Lx0IZlIYcFNa4rz3zDAxa64/S3+qVLWuKqXa/MhwfnGuUJLDeHXuCHR4kRhC0oC3WL+X0LZuiCt+0MYnezmbbTcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791374059; c=relaxed/simple;
	bh=fcGoZRBmcT/XnntCGGMJuw3KhhpWm+oE/Y84BlaoIRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XnwUO+8EyBgL3Z0sjKi332Ih33HPiS6p9340vPIGiJPzTC62gqnWRvgH+50UvmZXFwK4Y4U74NsUv94EJY3GVL/CdUH34ZS2OyO3d5nwNlaud9Zulo7xpkZkiwQptd+I8AYRzkHg6ggM5cSfTwjRQR2AHDHLPXPc/Ro2SgPyuEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dUaBnwTo; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dUaBnwTo"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc4dbda1e5dso913568a12.2
        for <linux-staging@lists.linux.dev>; Wed, 07 Oct 2026 04:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791374049; x=1791978849; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PLm7KzD79N/Cg7Z5ZIyi8jbxgll41XxA0GnbG59QrvM=;
        b=dUaBnwToTZ4YMx82EzBr7fRSWtdCiCRMf2eHGp59kWrX0qFZZ2qFxFguTMfnIKgPWB
         R8IcOk+eN0NVmEtSIGmTKWOAODkj35SCxwj1ngd4fsIRGYawgAQr3/QhfE7u15PDN8vN
         EC0+st+VbVgvh9V6MI14smHwf3UBHQBCES+9pxrcQSlA07C9AZRj3GWIKQpDCCNzbHMZ
         gBi1ot1V7mNWZGkCVHa7paJggke4a9C7S9LPn4nHQBoqRsUxn4NuEWjJcxroHWjYA/3Z
         JhVbafohKFTcR5P7vS3RGV2odq5fi/y1irCQKfRoeCiLKPHvdTh2ls5IT0NQ12lWCKHU
         FwtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791374049; x=1791978849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PLm7KzD79N/Cg7Z5ZIyi8jbxgll41XxA0GnbG59QrvM=;
        b=xijOSkajFrnV5e8/SwyyJuDsAgjNt9+E+ezZp+UpcMtnQ82VGX6BpKlN/jx4eReUm/
         qqbPULXDW8HmFhgNfcxCRBHoLg4KuKuletX0HV0hQqgV0P8paTRQIcclxtIiOasnwvcs
         8QLeyi6Algig6DFq+ykCrPUIKdkZi5zYdYcd21t6nc//kTcFYixLaqJwi3mXYQMPd6hn
         QKwyjWC3uFWimYvrZqYfowVtERlXlyQFTWDkTx4bgHf0Hi5ruudbw/VSmTkCzuWG1d47
         FrQfz5sdNcGcZo8XAFGtz4JM2M1Pd9EZdfFEEy6vTdRBlIO7kDJfgZFBdq22Yuqc0aRP
         /jvg==
X-Gm-Message-State: AFq9FYLRHUFrN553AuwenlWu6GLEqlvZxQgG8V2RTC/ClTITmTw+hxr+
	U6Vz9aW18BNSq85/kuwhegx64vxTthbeT74l/BOfXStxduuW+fln/Mwa
X-Gm-Gg: AYBFou359hBXzXXzKo+MHVwL8l9iVA5I/6Pxe+BerAg//n6J1jdnY7t0dWzC3DSNm+0
	s2DRZJHim1+6XgETkkcN03rKlOC9wv1L0+z6Tz5kkuwM1uY25FAXSexTuwKKQOjZ6JqLk1u7WtP
	AwET6Uc/JbqeXN6dekBIm4P8G0hDDAg/50xBcqXWS6uED54T3NaTV1ToEvNxcD4sqAqo5+V/046
	No1kubyPYzV9O/CuptDv2QttGI1pXlNPu2TD1K6w2Cnm0tiYTPjIM48Q5zIpdeT0JrjvTyqL2fx
	GMEQr5tiD+0oPNXIE0lHnLxFMJBmGYiQj/WOpvRNcrctznvf8Gm+qjCQehtoJobZBpjXvI8xAwl
	SiYBDVj3xkdyTXcUZ4QcUy2SJFXBvP45xhEmHyKTiA42q4/fHTKDM+tYuJkOVfZGFZ5ZsYt+eII
	f2Bjv67H+u//B3Ia6uZx6Km26n6KT8smMHyw9WIKIhH8QZBDY0yNIA1C4ORdhwreHn/m16mDIxD
	g==
X-Received: by 2002:a17:90b:3e86:b0:39e:4c7f:7306 with SMTP id 98e67ed59e1d1-3a8a19b1e0cmr1657682a91.29.1791374048481;
        Wed, 07 Oct 2026 04:54:08 -0700 (PDT)
Received: from host ([103.103.208.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89b625d01sm4160128a91.14.2026.10.07.04.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:54:08 -0700 (PDT)
From: Pranav Desai <contact.pranavdesai@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pranav Desai <contact.pranavdesai@gmail.com>
Subject: [PATCH v3 1/6] staging: rtl8723bs: use explicit types for lengths in rtw_security.c
Date: Wed,  7 Oct 2026 17:23:37 +0530
Message-ID: <20261007115342.1121742-2-contact.pranavdesai@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007115342.1121742-1-contact.pranavdesai@gmail.com>
References: <20261007115342.1121742-1-contact.pranavdesai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace 'uint' with explicit types for length variables in rtw_security.c
based on how they are used:

- aes_cipher(): use u16 for hdrlen and u32 for plen to match the fields
  in struct pkt_attrib.
- aes_decipher(): use u8 for hdrlen to match struct rx_pkt_attrib. Use
  u32 for plen since it is calculated from a 32-bit packet length.

Signed-off-by: Pranav Desai <contact.pranavdesai@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 72af46391e23..af461971c827 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -780,8 +780,8 @@ static void construct_ctr_preload(u8 *ctr_preload,
 	ctr_preload[15] = (unsigned char)(c % 256);
 }
 
-static signed int aes_cipher(u8 *key, uint hdrlen,
-			     u8 *pframe, uint plen)
+static signed int aes_cipher(u8 *key, u16 hdrlen,
+			     u8 *pframe, u32 plen)
 {
 	uint	qc_exists, a4_exists, i, j, payload_remainder,
 		num_blocks, payload_index;
@@ -980,8 +980,8 @@ u32 rtw_aes_encrypt(struct adapter *padapter, u8 *pxmitframe)
 	return res;
 }
 
-static signed int aes_decipher(u8 *key, uint hdrlen,
-			       u8 *pframe, uint plen)
+static signed int aes_decipher(u8 *key, u8 hdrlen,
+			       u8 *pframe, u32 plen)
 {
 	static u8 message[MAX_MSG_SIZE];
 	uint qc_exists, a4_exists, i, j, payload_remainder,
-- 
2.55.0

