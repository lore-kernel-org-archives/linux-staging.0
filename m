Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A85B38735A
	for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 18:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769799464; cv=none; b=l7odQOzQrFvKKhyepAAVhLvML7HFQCtnZFhZhT0n2TljqGdkje7OMjTP2FiKrdLpGuwm07lzt+uEu9aL2sn17mJyP3w8AJTcix9bK+fhJ0/3tI4OB5oAbQcr5Fd0gkweHTMvuiFQoUqTtuKQ67zAMuI93LrWbnhq2GNBGuNcyAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769799464; c=relaxed/simple;
	bh=FZZvYnP51QX0dNB1MW147bXp1WMORAQQSIU33mEW2yU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ku1Czi2erHWx81EBdAGZIGqjCsl+HQI6cxf28ZUg+arQMrIKdTl+muKQUwhC/kvOD6tKPqx5YrRXRyALrlJJqhLMNlNAygYfNm+DF8y9LKSW+nWS+X7wNFORR1CaB5lw8F2dkWcpRwSsEb6WSfBLeqRnnhDfHRt7rzbCTqQwyA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M7MrEWMd; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M7MrEWMd"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so32279265e9.0
        for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 10:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769799461; x=1770404261; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7q66IcrlcJI8pRbK+Fca3eWQA2yovR85OACWrbeMFzM=;
        b=M7MrEWMd4VL2rddP9tWJN1LH2/PVeK97+XTryNTLbAYLat5A3mDNed6XExb8vKCCc4
         aIUjBciVYF1q2dWJazhTgo1G1piiPkh/Q3nzmUhSR/8LVSSTeR6Ediihs6UnDyfDC3g4
         6sUw/g7bhj0CyoXCKNxEzFW0SzBsLqoH/vqq7ES0jxz2byecY7eScV/3BYhz+CK+8hrf
         kdMTAFbk7Lclot/hiNcxyJrAxwpaey5qLhcKNJhC1ToMe906wjxVSPVA8WC2iokCD6gv
         nOA/AhmMwtxY4Wa4SFeycS98pmH970jd4ao7UWWKfd0FGsQqw4V8qVy0KbpAREBRp+BK
         TxRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769799461; x=1770404261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7q66IcrlcJI8pRbK+Fca3eWQA2yovR85OACWrbeMFzM=;
        b=a1vfKwK1HC3BO38F6RG+BCgzIEaDUsDmofBpr4WJg90y+JLMFOIfPxWsBjlqs6ltlb
         es2QE/B9TLCW5msQCMEjnQk9wdaenEBm1FDA3tFlzLcDvl/00lUQKWf2/sruuXrWgiwh
         Ocf5nhrYb/EOqqtgJfWJ0j+PUG1BVRxApcrV6P1fhcDs2BCSHtDsNkScx/VMXUQZ57ga
         xswR2Sh3sctyGZ2cKENLEzC8ieqsWZreB56zuZmu7GAHj88aVnwAuYj9BRI0lf+wrrtt
         8qruRAX6n7LCF+HV3eVxj1F59EN2Bzvcp3wLuVawHMRM4mAMmkavyZ1ZcqWBypek3D7v
         ADXA==
X-Forwarded-Encrypted: i=1; AJvYcCVo1d0pXvvtghryu8lGNFrK8268Jeu0qYEdTFxWEOR5S5PlpdUvhRuY5w7lgCseqqPlyGz7J/K/iXLndHWT@lists.linux.dev
X-Gm-Message-State: AOJu0Yyyxq0qKMc/rf4h1THzdMIb7dhKiP6gE3WCTkBuv3wU5TWL8PyV
	yoEnYqK3EU0Wc/rO+6qgj9dGuSU90Vz+Ala3RFph6r992gufHvG7tu2W9Kowq5I=
X-Gm-Gg: AZuq6aK4syuGFrRgmgH7akCeEiCFFno59zazrK/JCUmHDRBnJZLKoN7Da8/PN3AJwUu
	foDqX9Fo+KkzfSKfOxflnoEkzT5jbVOoG04bGBsk6442YK9gKbcfNOytDRuJwtGbr1I60XyvnKf
	xev2DIYcydkTBZUGTw5I1GBXqAMRwa+yHgZsON9WMnwdfRqlQPKiHxh9/EN/AuAa1+P3FKotwhv
	zqhvCi/n04o565vN2C2XQqc/zkPU/ueOpDM8XLqJvan4dzU/sMD6VKt1FkNm9PuWiCTr3Drldt1
	WorbVI5Z47CbzjZtrGpD6IfsXSrKC/+G+WsIuElivfKo8J3OG/O/9b27BI9hHbQ+DbfSLxqpgCL
	AKMdR3ym0xzdqQ6ziP7VkZebsardH2rT3cBBYg8/F9cb+afUAZZQRSCD/+bVVb5Q0tPd4+KnJ/p
	NjcImYszTbXYV4E4VTRLbcyVsfv0waIwD4cefLTrl82Hd4bdoLxtb6wtW1T10wrwNOuytQG26Q
X-Received: by 2002:a05:6000:240c:b0:430:fcf5:495c with SMTP id ffacd0b85a97d-435f3a62ec3mr5823254f8f.4.1769799460921;
        Fri, 30 Jan 2026 10:57:40 -0800 (PST)
Received: from LGPC ([31.223.131.55])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10edf62sm26474164f8f.13.2026.01.30.10.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 10:57:40 -0800 (PST)
From: Luka Gejak <lukagejak5@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <lukagejak5@gmail.com>
Subject: [PATCH v6 5/5] staging: rtl8723bs: remove dead debugging code in rtw_mlme_ext.c
Date: Fri, 30 Jan 2026 19:56:58 +0100
Message-ID: <20260130185658.207785-6-lukagejak5@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130185658.207785-1-lukagejak5@gmail.com>
References: <20260130185658.207785-1-lukagejak5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the unused local variable 'pattrib' and the unreachable 'if (0)'
debug block in OnAction_sa_query to clean up the driver code.

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

