Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A0D313281
	for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 15:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769702252; cv=none; b=szYJcjUVRjPWQVxRqWOv+Mf21aIGXpIIztORi0Q7y5XFRBxvNFJsAjtZK0I5ZIxV8gVbaQoSgfiWW0rwUGsqDqUiSqiDKR4/6K+urdSv/iCI2imgO2VtJNEiz8UNbVgzvbNGwbVdjXplNK4OG83LSDpHsBe71cRyflVZgTVay2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769702252; c=relaxed/simple;
	bh=bUeyerzNTibRKm7wU0xU1y09XX+nLkg2/OqCGqcSZ+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CtdE06mESa3cDAIItvD2XAH7T3dVOknF9OPwqBBXie10Or6vAEhlMr8OLzGWjcLhpLnom5/Hhn46x1CKssMNBO5NKlyEYwobCdoyeDD0jXJf4npXCgNStWRvzDwPlzdk2QFk371X+3XftHEdPkPc/Y0K/iDsNwpAibKq5eErAQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e472XHyD; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e472XHyD"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42fb2314f52so723955f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 07:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769702243; x=1770307043; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbtbqJ7f8/zNbFuNHfOJLh3NY0SZ40/NTWDq64DfleQ=;
        b=e472XHyDh/RO5u7o4zWw5q9cdAWn0+60TE2JczyY1TC7bW0pt7PItDl9r4MrkOG12Y
         Q906OzLkZCM2p5J41jEzDPhiK2m/UGveVcj22VE+1oCCsc7Zl7zuFbx2THRe88PnFnCU
         ZLlHP7gyaLJJNV78OVqr9YonBrl34rUpUBmM2Wed88lT8F/mtZq2r+z83uqDmilubgAl
         Fqh4gifuWxKLT/36a3rKBGodsPGhZBxmb0e0HLJtOoehnHdcqY4/nIlH7Yhr9KkV7oWS
         UdfOnJDN65L0fHrWsLcsEpiwqdEA4obhKenmSRM/IJPbNTozJz+uHWmxZx+q4Q0FsDeq
         HpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769702243; x=1770307043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JbtbqJ7f8/zNbFuNHfOJLh3NY0SZ40/NTWDq64DfleQ=;
        b=tjpgyTvjZWI/Kkn+09roPGutfqkT8A3bm5Wic7/z5h1+1A1biAT7bUaSJ+X39a5xTY
         u/+uoRcoUtYHNzUMdH0XHCqovZrKWrtpwq70PyXKUehCGxdyURmGuuhjera3ZSx7Hyg4
         PADPVBA1PnSzUBF04MOUfufPpiUbx6qzCQTZ7cT61M7ZvN8cRGYOlc9qF/K2UzjdV0+T
         GQzIl7q6c34J61Pq5jYV/HUc49RZYnplIVqSPUcuT606BmSEvpOC/Qwjz2yNP5EGSq20
         iRgsTStvI9J74zytBa0I4/V+eRztODx0tRJ78GgG3msn5RflS+stX3RwvFNJO2FjbCGk
         7XYw==
X-Forwarded-Encrypted: i=1; AJvYcCUttw/wZenFLkMQtALJG1N9F+6ozbAqrOmmMpuwFXdWbJyH6JAKSf+ujPZHaAmBhjaZGovaGpjGP0jUiZLv@lists.linux.dev
X-Gm-Message-State: AOJu0Yx87XcstpC0TcwK8TNw2+Tjzm4HmHpkcIdFugMZ6yTpB8ehURVs
	sYJJoCBkJGnNv2kXjNUp+sgmlRAXl0t5gCyYXN/dq9jp9WPXNnHYLcM=
X-Gm-Gg: AZuq6aKquq7JPVgGtiACWREb9ATliOD85XgKCC6PfIXhx6mRF7KTJ14fAvT6zrCd1RY
	h6/S6bNGdJaOPwoTGsMnKjCnC50pmyek0j2hEzGyrUz+XCWggfQVXc93fGzAfOMDfz3HEWXN3cH
	2mpeFCCupSTRo4hP69N+g7j1tfvp4kvxiao628ehiY7lOGRt5ZlGHnyCAkTaUDS70ZFIZVYQMzI
	X/njFJ3vmscf6pDtk+0ddl/qgOwU4F9L0FwF6ctnSsU8pBoBEbK3+URRTYDT5+98Z3IjNfjxrQW
	pxK2eP8vqzZoiEFO1/h/6mWzq9eSQwrpw4lSpi1IEtcYOKK5prVgYavPH8TSbIrfSGXbyEeZAPJ
	RHEKBpS20/xs26HT6ZeM9xL4+FjE+WgcbSZ/9y5ZS02s1xgqVBwLnXHjL9SLBZBNE3LL5aCqwga
	4d
X-Received: by 2002:a5d:5d06:0:b0:435:94aa:df38 with SMTP id ffacd0b85a97d-435f3ab970bmr78552f8f.55.1769702243204;
        Thu, 29 Jan 2026 07:57:23 -0800 (PST)
Received: from LGPC ([31.223.131.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee078sm15749231f8f.16.2026.01.29.07.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 07:57:22 -0800 (PST)
From: Luka Gejak <lukagejak5@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <lukagejak5@gmail.com>
Subject: [PATCH v3 5/5] staging: rtl8723bs: remove dead debugging code in rtw_mlme_ext.c
Date: Thu, 29 Jan 2026 16:56:54 +0100
Message-ID: <20260129155654.5565-6-lukagejak5@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129155654.5565-1-lukagejak5@gmail.com>
References: <20260129155654.5565-1-lukagejak5@gmail.com>
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

