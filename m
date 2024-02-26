Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64501D54D
	for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 03:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708919803; cv=none; b=Id3eEgr7VFJS4zGNu43KT0CjwDw+sSyRdBbYfKCNfuT7imsBW8KMMYgX/brVKNUeJU2EZOtImSkZ69althUs1EwAdtDComUMejnbTFk2HtZds47MzXcH/+eue+MXk2e62XJzGDSlUh7pYgr7EGvlphe2PVDsrAy5tRnBDFwixXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708919803; c=relaxed/simple;
	bh=KC8f5tKLcakXLFJnCQDVtL5djU4Oic9YsJ5qZcyvzp8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G20KfRSV0N6pvtSotkR7J85eMS6YSlOQCgyKEZdyGq+x9vIupiQlFTmjd5dRx4dpF5aQnVnqCcY7VQXCfaZ3v/HWfoFhgCg32HtgQA/Z5Vz4HHtSAnkDlvRJWMKxxDvMefK+uwWo4mL5iONToNYOEKrnSRMZ4PNSbr73kPNfDn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=E70rbqEJ; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="E70rbqEJ"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1dc9222b337so8292875ad.2
        for <linux-staging@lists.linux.dev>; Sun, 25 Feb 2024 19:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1708919801; x=1709524601; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S2UOCiOq3z4TaNYTS3NvfUhT3Z3UJvF129xHaAOmoRY=;
        b=E70rbqEJeUILTJ52DpA3/fxEWWfXVbO/H3FdDhp9UhcIhD6uqQ/hGKxloZV6wJCx/I
         hxKZ7l5UazfNTOhUM2LVLHHS727Ycq02bazxNCqM6e/GQ1shklOdfwVi6RSo7+4a2s01
         SYMYAMPo52vYRmKx0DBmBN1L/MJgCsSlQCnAgnegBgD+nKwZUctvoMm2PRGs34eCf/dx
         UcaQbGj42nrhzR8oZvCL2/0i+Tpd34hZ9GjzqfjuhzYe+1/NOCeSagZ711UyRIjRG1RK
         N9iDKAR7pXRB8LtC5+DvwYvQbZZ8g4REiJp+r3hqNfppQECQRjNccqBOTI9pRAEhdAEI
         QCtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708919801; x=1709524601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S2UOCiOq3z4TaNYTS3NvfUhT3Z3UJvF129xHaAOmoRY=;
        b=ro8b/GY9KuwTnCtHDh9Ha15ovs1+P/kps+iFccVGsM1FtBlPl8Yha64S7aOeuBoO0D
         QXGHuCvlPqFxRRWRbyt/tkbELkSJsYN425puZN8GGhdiSLR55BX5LFvKG+QimDzKhqU5
         gCCJTgzoANnKm+Ys9pX263XOfiHyd3b55i9zhTQvzw6WPmdfreIhtsbf6butaaq6zOH1
         PFAzjpE7goW2NfoHtx6zd/6tzpSXkPzTy257Q7T3XH8XlN9MyPwx5FwhnBSp29Jrpo5e
         BJWX+S751Nvp8BeSWO3bOfjcfOH6HNOAS5PRlfqXySiyFKlTUq/GTBIynJe/kLfKGxk/
         7btw==
X-Gm-Message-State: AOJu0YzBkRv7nLTUpHY3BV1jY4KZ2rZnDgYde715lKd6bl1DQLD9eJAN
	VuhBzlnrQZXwQYrE/b+vgTjmhb14nbumAxZlBmCFvs6mSAGveCBhKmW9FYe44JM=
X-Google-Smtp-Source: AGHT+IF2sk9/Qcvi/q6Sk2DytQViKRdE/SjCWRk5v+V3gfwmLtldkF73DmJHH+T/4ms+JGSBCrSTcg==
X-Received: by 2002:a17:903:2312:b0:1dc:89fe:570f with SMTP id d18-20020a170903231200b001dc89fe570fmr6193728plh.68.1708919801095;
        Sun, 25 Feb 2024 19:56:41 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id kh5-20020a170903064500b001d8a93fa5b1sm2897615plb.131.2024.02.25.19.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 19:56:40 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 15/20] Staging: rtl8192e: Rename variable CcxAironetBuf
Date: Sun, 25 Feb 2024 19:56:19 -0800
Message-Id: <20240226035624.370443-16-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240226035624.370443-1-tdavies@darkphysics.net>
References: <20240226035624.370443-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable CcxAironetBuf to ccx_aironet_buf to fix checkpatch warning
Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 68194763b20c..c088fb28c62c 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -819,12 +819,12 @@ rtllib_association_req(struct rtllib_network *beacon,
 
 	if (beacon->ckip_supported) {
 		static const u8 aironet_ie_oui[] = {0x00, 0x01, 0x66};
-		u8	CcxAironetBuf[30];
+		u8	ccx_aironet_buf[30];
 		struct octet_string os_ccx_aironet_ie;
 
-		memset(CcxAironetBuf, 0, 30);
-		os_ccx_aironet_ie.octet = CcxAironetBuf;
-		os_ccx_aironet_ie.Length = sizeof(CcxAironetBuf);
+		memset(ccx_aironet_buf, 0, 30);
+		os_ccx_aironet_ie.octet = ccx_aironet_buf;
+		os_ccx_aironet_ie.Length = sizeof(ccx_aironet_buf);
 		memcpy(os_ccx_aironet_ie.octet, aironet_ie_oui,
 		       sizeof(aironet_ie_oui));
 
-- 
2.39.2

