Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A4A535CA
	for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 04:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709008930; cv=none; b=nbhp6caMf9646dGLwys1r6AmZrAhlEn8Dvw5S/P/zgpoSYnzIuVovxWmSIBtiNSGJYFHvVyyB7agIUPPM64IYeJofwCeqD1bsQjVURc3a4/O/bKdVvoum2788XuAB8XVgQACvscOyPJpQFOUi5i/Nv4BdSNww6nYHl9s4ic1HBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709008930; c=relaxed/simple;
	bh=CGKaZ+B6qI5A0N4TuLTmN6qUCqN+1/zEo5Tk+37WnAs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G7J+ll3664LVqVg5ZUcpIiio6pfH6fCRMD7JK0JNTBlKEtMHMDAnsASg9ewTipEL2kUFp2Y9jQY+EM7D+MIJqfkm9No99nZ5n8f1vSCCipsiVmybjgYWejdpTzLZtVc8xKrMek89M1ytmo7YGbI4hhpoMeDSbXamoHNcxT9qo8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=cTdKPs7Y; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="cTdKPs7Y"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6e54d7b1167so9319b3a.1
        for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 20:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1709008928; x=1709613728; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXThe3Kif9ugpgRSAcB50yEU/4aW/OJUjbqWOYIQBFY=;
        b=cTdKPs7Y0ZNVTI75N56El7BQtVDWN5ztGESrg0haHSqaLUoPJovLFCl93Zvi1duslg
         /dL4U+tiCP51aj3BTUUSquVyV5E4qnOMl/eZ2ccT5ThtcVmuJLvkmrXBFkRawkFUta35
         HIo1A37gdjbZcHRdGF7ScdJDfNzZ3P1N5a1v33ZFLCu+kDmlhXwDr0bq+GVxnMr1KprF
         NdEnv80S00gcbSxrXtrNlcOyNr2NKbdaSLr6zHHSuL/wQ2+UIiL6gkXzV2EQf0UO2WrS
         oJpCTIDenTtlFT7E3oXyyfainJ2ghn03M9n01DBMaSsQSfD0acQkAS3yFGGc6cBJNTk9
         zGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709008928; x=1709613728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SXThe3Kif9ugpgRSAcB50yEU/4aW/OJUjbqWOYIQBFY=;
        b=vb7ArvdPBfpWeVoe9/gEVCOhJSY9gNHA4uYcMI2J/a7fWKuBFX6Gt5/0L2f/sYVq1i
         x8M8tC6c68vR/LHzwvprm4s1gYB8iLOYAozidjOrd6718uzW3mAaGuLGq10q5r/oPGgV
         KPQCTktTqnYzptGfkaITRtzn3JV2iggzjMhElk0tUncLn8ritrN6RHdu2TUNF1yZhvSl
         oQbQaYddIAELAZGQK4QBwGFvMTI5HjFVetxIcwPvPznwsQmrZ5X/Nu2MqIzaNIv7YIPX
         orocl0gKR7FhDIVlchWbHbbSPtLuzvWE7wv2aebQRJ/6hV1K1jLWQSv9zDFv7H4Po3rW
         YceQ==
X-Gm-Message-State: AOJu0YzFIpMgf9/3cY+aiBc+cvmY7gJ64uhTi6jdJiB0k4EN7Hz8KcQZ
	J4ADfn6HKyUqanFPc2zzmNDyKxnScsc0yqnVYGE218YGj20eE1OoPsJhjBB9+5g=
X-Google-Smtp-Source: AGHT+IHnx7Xn1kcjCN3aHYP7k+qRtt1kK28s9oliNQO6yXyFhv2V7Jcz9YIdBdm3gPPuQO6bGOIZEg==
X-Received: by 2002:a05:6a00:3d47:b0:6e5:3927:113a with SMTP id lp7-20020a056a003d4700b006e53927113amr4248101pfb.17.1709008928315;
        Mon, 26 Feb 2024 20:42:08 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id e30-20020aa798de000000b006e4ecc3e394sm4899782pfm.79.2024.02.26.20.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 20:42:07 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 06/20] Staging: rtl8192e: Rename variable osCcxRmCap
Date: Mon, 26 Feb 2024 20:41:43 -0800
Message-Id: <20240227044157.407379-7-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240227044157.407379-1-tdavies@darkphysics.net>
References: <20240227044157.407379-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable osCcxRmCap to os_ccx_rm_cap to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: no changes
 drivers/staging/rtl8192e/rtllib_softmac.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index b189ba220e22..c3f37e71d614 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -840,15 +840,15 @@ rtllib_association_req(struct rtllib_network *beacon,
 	if (beacon->bCcxRmEnable) {
 		static const u8 CcxRmCapBuf[] = {0x00, 0x40, 0x96, 0x01, 0x01,
 			0x00};
-		struct octet_string osCcxRmCap;
+		struct octet_string os_ccx_rm_cap;
 
-		osCcxRmCap.octet = (u8 *)CcxRmCapBuf;
-		osCcxRmCap.Length = sizeof(CcxRmCapBuf);
+		os_ccx_rm_cap.octet = (u8 *)CcxRmCapBuf;
+		os_ccx_rm_cap.Length = sizeof(CcxRmCapBuf);
 		tag = skb_put(skb, ccxrm_ie_len);
 		*tag++ = MFIE_TYPE_GENERIC;
-		*tag++ = osCcxRmCap.Length;
-		memcpy(tag, osCcxRmCap.octet, osCcxRmCap.Length);
-		tag += osCcxRmCap.Length;
+		*tag++ = os_ccx_rm_cap.Length;
+		memcpy(tag, os_ccx_rm_cap.octet, os_ccx_rm_cap.Length);
+		tag += os_ccx_rm_cap.Length;
 	}
 
 	if (beacon->BssCcxVerNumber >= 2) {
-- 
2.39.2

