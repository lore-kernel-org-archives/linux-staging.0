Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5186F3F44EB
	for <linux-staging@lists.linux.dev>; Wed,  7 Oct 2026 11:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791374081; cv=none; b=hVpT4xgopluTPDgkxV+506IMYNbVOoYgnAnEwHQtE7haGz5JKHiLxjr7OevRX66G//+D0Hc/nCGUvKfNHeN9ugtWNOehzY+OK7abz+eykwT6s3ruAwJXGM0O56PoQaMUY/qPJjtEU9gAc71rfUvklgFB77LCXHrOvYou5+NXQlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791374081; c=relaxed/simple;
	bh=yl9oglKIS6N4vQb8skzgFPlLHgV+tuWg/BoitUlDKRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iqMz96yBrQzaEL9keWtHhJFGOVqfXdyxPiNqZEBQde7oppoS7QrqhDn1LfTLPAz7cdwQLCgIpqoxSfssjLv0VGiW0Qud0Ct4lSErRYYWfSC7nu7AZIg7OdqUmKYHJcAC7nTy1gYZ5PWfNEY9sdo9Q5VC8i/nyjCX9zaB7GhEBZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=irXnnvPv; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="irXnnvPv"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso2786950a91.3
        for <linux-staging@lists.linux.dev>; Wed, 07 Oct 2026 04:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791374066; x=1791978866; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H6N/y0p0S9p3UrlhI/DdMbp7UhhJ4fOflMevrjORLv4=;
        b=irXnnvPvr7J3jQIFZt5PxxAuaJ3GJAozemn7s1FLbiMoPXJUyhzgMCo0vowlPB6zDk
         C4ufHuiCD8Dl83zX1O+qG+ZSN+Y9A9yH2eHBQBcp4sapwxjLodm1+pGjsheNWlbJ+wNf
         yx4qEg2yAz9qsh58PJPheebl+Z8BRRLbDBZQHXEIwqxv5sISBshVTbAMD1qCNutb5G0k
         VYqL97bK64r6qBRu3/Ot+n70zNitNxdrrJDFqW9vbaI+VQgYpJ3EOyR4cPY/dUmZrt0x
         9Sh885Nww0qC8Jyf1/7bMgHKntlUQ+MnozOZMTV8KiT8a1VJL+49bD3eT2/NYOgYQAoI
         79wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791374066; x=1791978866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H6N/y0p0S9p3UrlhI/DdMbp7UhhJ4fOflMevrjORLv4=;
        b=nXlo0QB764IMe/RVplrc1IxVQ3csaN3BPpKHaIWFA2fvKJZMQ+XdPJ41vYjaf5eJmc
         vnNWp2MVh29jfnLxzP5GpxxyOs8mNi3m4+VBwW86nrlOJCImEHFxbw3gfINLUCv0hQCQ
         fkxtm1b11Vdl5zdP4sn8mpislAypS42zB7qXCdLOwgnsMLjq263OUTYCYp4jJxtfznEu
         QUUw6eenH1C915oHRWSL06149du2vHP15Wmh2Dvk+mQ5aJ57fzNeIByB8NBy8AoVHZn5
         D5h3p+kMj5EYZ3rT8mo72gwriJLPDg8ubRaBAwvaJvHLc58cbO0XfqgfpnkXO88gK2VR
         12bw==
X-Gm-Message-State: AFq9FYLHOZEcbqWZFDvo4YZRkF9DIGCjdMJQaPeFytrK4OElCn39IoZD
	SDm5BuFSLVXmn64zgqylj5Tb1Rcgb8hzCHjYTLKrUgPHTC8LUlo03Su+
X-Gm-Gg: AYBFou1LVieeeNUJylk3LYXw4Ydh7WYp+o+Vnu182K2u73Yb+wZSVAoXCDHDNrBfrxc
	9E8AvvyjT2FvuMnaV6RxivCMLljtsO8dBKp5FYOrL56rpWDOKDKsD0EZR66Hlkj8fpMF9ElxKRm
	9smq8ZA/C9nFAZUGYgC+TU7lIxxNG1/qCoGxys7TpsoOpQSz/2ux+WoCcdUWbl5K7MemW2XFru4
	PvyVuIxfvtSYaCWmDHaZGYD98t0O8ejOOwfoqaa7T+IJdjpk7iC62mQYYKOONzwAsuSs9bL129k
	itPr0ZtZ8RQfizh9ot4j6fyIsaRyZt+agkB9kOcEur1toz9u/r4vSDViTf5i1g4X58mU2cLBd+K
	Yxx4Exk1mSZpuwZlYH48xE46RwQcUzdPaQXC3AFhZxFkHrinT/fO8sDq9D8kWGs1xDwbcPCJ31I
	waTK+YKYf7YHKLC0L8n/M/M9PdI45pnCEOZbTdM04lrx9XL09vbs+aOplsSSMbMSRX3Wo7V3mKb
	g==
X-Received: by 2002:a17:90b:5608:b0:3a7:bf13:5ff9 with SMTP id 98e67ed59e1d1-3a8a17f8533mr1715155a91.13.1791374066463;
        Wed, 07 Oct 2026 04:54:26 -0700 (PDT)
Received: from host ([103.103.208.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89b625d01sm4160128a91.14.2026.10.07.04.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:54:26 -0700 (PDT)
From: Pranav Desai <contact.pranavdesai@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pranav Desai <contact.pranavdesai@gmail.com>
Subject: [PATCH v3 5/6] staging: rtl8723bs: use u32 for payload_length in rtw_security.c
Date: Wed,  7 Oct 2026 17:23:41 +0530
Message-ID: <20261007115342.1121742-6-contact.pranavdesai@gmail.com>
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

Replace 'uint' with 'u32' for the 'payload_length' parameter in the
construct_mic_iv() helper function.

This parameter is passed directly from the 'plen' variable in the caller
functions, which has been explicitly typed as u32.

Signed-off-by: Pranav Desai <contact.pranavdesai@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index ff8af1a29b22..8b67985f6e06 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -631,7 +631,7 @@ static void construct_mic_iv(u8 *mic_iv,
 			     bool qc_exists,
 			     bool a4_exists,
 			     u8 *mpdu,
-			     uint payload_length,
+			     u32 payload_length,
 			     u8 *pn_vector,
 			     u8 frtype)
 {
-- 
2.55.0

