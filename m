Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA912D5935
	for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 13:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769693066; cv=none; b=QFMedRibbnuNoB1uPJKeru8UVWbWL5VtkyrdtuoyJCE45IqhKBIfkLusBvVj7sBxpMhwWvpZ38Dl3Ai+XqTmx9aIbpshsKCamciVFByn9UR7EkzNZUSrNWFClPJCfLIVtNrC20S3V2FzagRCYcnju1xo1zVJJvX1Ld08smFmnN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769693066; c=relaxed/simple;
	bh=bUeyerzNTibRKm7wU0xU1y09XX+nLkg2/OqCGqcSZ+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t9E8UV9+jzULrIvczT76bTAuZ1kpHPKsB8WxeHQvCefi08tFW2xEsFuyWX0g6T1ZRHRD4BCkaASDW0yI1WulXtrsqHk+9A330n3xwbalsp0vHzhcVZFEELNLnydSpw53tPEeZl+l48t9dbaKSy8hf6+La65Dqh4dzfTW4ArFfb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EAs8z3Nn; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EAs8z3Nn"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4806dffc64cso7525375e9.1
        for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 05:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769693063; x=1770297863; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbtbqJ7f8/zNbFuNHfOJLh3NY0SZ40/NTWDq64DfleQ=;
        b=EAs8z3NndUP/c2OtSyu6Gj02nCil6O3AXePnABjHg/9vcyYHZVrbtIJ1mVdzX4QLQQ
         nct2WUgKFPNMUeGEBY/PE09v5yffo/up44bn+Gzu1N6uMpc+cceNIYXdEL4SMdhwpAsJ
         JLUPWtAmlHA8uQRmHNxTzDWJV2SCthDVnLp7wyp13OGlSOo1hYZFTmXY4Bku4eo/xUHN
         Kjzv4GSAMuIebb+tTllRdhV3WH/2xpTvoutiO9DHNnH9gdR9eGD11oJpQBzyz+zQqziu
         ZGGWrcfR+Amd3tSsx9hEaJ+3SKScxRw+MPkVFRoGcUxxX+TNNgd3rcHXJEQD/IQadlSL
         jziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769693063; x=1770297863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JbtbqJ7f8/zNbFuNHfOJLh3NY0SZ40/NTWDq64DfleQ=;
        b=GQcnJgcFmuUYgOaLscsqIksu2fKNhIX46fcVCUlJBlCI+Yr61TdbFhPfzidb8zAF3B
         U7mpOILylbdKJ7nImcBFd75kM9g/KBzrn9L7Qn3aXBk9UDFtMyTAmv0qZWeZCi2kdm8U
         UQv1flHLiXB/Yqen17kCg7O5FanaviIdNFzPy+hp8KIZxkJ8+TmyxwxkTWVH2F1qf9Dw
         ILr+XNsOapMX/AMbHxzMENatSSe98dIi9d2lvSSBLX1Zj8gD9OrfR9o9Xwh3HnQdPGg4
         IyutOmGFDHh2TdebYjIBneC6jv1wLxBFp3RdI7AfWo6djlsGAlabrgkU+emyUzT8D4la
         MDcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKUIF8mOsEzq0BzUXcBGgkb+vWG70GXpE3J0tmAT+EclFdsbTekGWdmnT0U/bfzRhViEKEx00/y1I6/JjA@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4LGuwIt+BVd0ESfg2/TNXQKKcp8920lLWK07TKlr4Uf/loUpY
	e+aHVFtEUPUNyYDYJTc02h/PpZAfQk1jDEIr6dNEh3W5okfT175Ai+M=
X-Gm-Gg: AZuq6aIgAFHQZFFVCNP6l67eG1ouuacn/I5xJpMDLpcKRM5R8vLsakXP+1rjLumQrhI
	FKsCJmgxxrK8RFyra2zhKc41Wa/pbCMcoTLydjJeqORXwZmBYdmju0yWmiFGKNtYd586qu4opVO
	+YstASF5xe5pvsVjwSRU7yleZ/FR2Si2qKNX6Ybj3+1IDVRFYz2a1m0vOGbUjuDfzrEvFyy64DU
	Wy0MMWD+1vW4A74R4QODfGrjWkm0TnmlvRxbIErmj10BioCvtHZOaKXWjJt0bw3khifUsarJzJg
	U6bW/bA5ufTCvVZoJVFx/74b+g9srXifB0oPzI3c3qKS/8E4QT5W2ClT8GgmNVp/soBjDU1xNaz
	j5KDZQCV6GH1CfZl8lyEtWpyNWBogyXgSdmG5WKK450v3zgMac8xPd9e+wnX1S3RTu9WEI6H79u
	vgWFTg2T35LLk=
X-Received: by 2002:a05:600c:190c:b0:480:4a4f:c36f with SMTP id 5b1f17b1804b1-48069c4869bmr116635555e9.21.1769693062695;
        Thu, 29 Jan 2026 05:24:22 -0800 (PST)
Received: from LGPC ([31.223.131.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be7404sm217492315e9.1.2026.01.29.05.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 05:24:22 -0800 (PST)
From: Luka Gejak <lukagejak5@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <lukagejak5@gmail.com>
Subject: [PATCH v2 5/5] staging: rtl8723bs: remove dead debugging code in rtw_mlme_ext.c
Date: Thu, 29 Jan 2026 14:23:52 +0100
Message-ID: <20260129132352.14615-6-lukagejak5@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129132352.14615-1-lukagejak5@gmail.com>
References: <20260129132352.14615-1-lukagejak5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the unused local variable 'pattrib' and the
unreachable 'if (0)' debug block in OnAction_sa_query
to clean up the driver code.

Signed-off-by: Luka Gejak <lukagejak5@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index ac49bfbaa5bb..b61841bf16a5 100644
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
2.52.0

