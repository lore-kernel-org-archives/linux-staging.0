Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C84841A94
	for <linux-staging@lists.linux.dev>; Tue, 21 May 2024 03:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716261446; cv=none; b=LkMmMqLJx3tjum6GRaaF/ylE/+tms7dl4AtFTsPq5mm4Rr9PJYhqTVVfD3BygRXx/hIsjWH1Fs4yrG1yVR/zMv4ZToetzDQRvSr8oj+XtUA8GtHOKI3yJu3CAYUlEuSUXb/hiJ3/49lASlj9n1ivTwW5d+j2UEKzNq4TSlyX/NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716261446; c=relaxed/simple;
	bh=bI19xLqdq+sgsz+YkllY+DoyTJRW1HQq4KyU3VNBrWU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dRrZ9ynmLU8BgUL25yLMl/E9Cd4UimEArJcbRNc7lR6zOBb+mEEi/tIovWPKJAKN27JTP5o1jhnPetCa3vIiBcqHHbnllRLA//W/q/n91DK4+8s9ezxwkrp+tVIENaBjJvLxAespwA4BKbVIVk+/HE48Jlq6CVM/TA+iSz6vP+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=kGvLxFk1; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="kGvLxFk1"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1ee5235f5c9so92616405ad.2
        for <linux-staging@lists.linux.dev>; Mon, 20 May 2024 20:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1716261445; x=1716866245; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmiNsN9OzMbofrVzRzK+lEWu2/pKW/vMoZ6Rvo+XamI=;
        b=kGvLxFk1Esz01f7YQOP3xX8hGIxg4rotZ+TbWelGROdKe4tRRQEMvXGjlm93MuW95g
         4sMzBYln9TR/5tM0OoJXDCXlPdM0aGs1F5Bd5pNdlgx0q0FJUtF4TEQLNi2v1OBve/33
         Frw3IgPf+7wkmtfceRG5BTQCjrKXjAKSSk1fWbzoa2NQL4H99Q7vxA7ORfuUrqBtGup8
         tRsvK6fintwwnQODFJY8+uI5b8X/dRc4kyf351wGlkg5FNS4I8dv7KJV3zrRaix7UbOV
         xn90r39QplJf2PsZH+1l64GRxX2Wog82qhB4Wk+0G9brCirNMuGABiJ/MoTHXF5pQ/qq
         TMbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716261445; x=1716866245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bmiNsN9OzMbofrVzRzK+lEWu2/pKW/vMoZ6Rvo+XamI=;
        b=LM90DQ34FRifhX14SPbrD+/5fJUYLi/Rg813OPeLez4x6BcNRphCSWpHFi4c2NXQzz
         Vymcn4n5MobsIabV0/TOI2S55Q7ckip/W/Cy0RBpbH+ngZ0kFvocSZ298tLP96mGdq6G
         FY9iGdq6EDrWKk7JSCXFbm62WHU9MoAyNKX1WuS4a/IbWGY15KKd5+/4S2tUwms6TjKQ
         d7GRf00XfR4AXU+9x6TrrqyIRxVILVk9RSSaGNfW3QO7QdUwaU/Bc7SUO7ZR5HwwS43f
         e0GtzhfL/U8x/DrEvjFk80spAHoaP0RcInzpmFAReufMA2I8BZIkHo8qZYjHyLXVX0Cw
         bC2w==
X-Forwarded-Encrypted: i=1; AJvYcCWCr4TJrsPpDOve4uKmebWFPJcVmIsYPvcthxXVjG8NV0hyl+bASzNTySW9AuYmZmS6WOckIOZbOrioC0e6hqOlxcSFFyXdFuZjTixDEQ==
X-Gm-Message-State: AOJu0YzuUbuIFooN6OnTlCEtNxLz6m1M5xtA4+OohgQ9hZdcH050g/A7
	j6SaBYBw41R60e2K6cnFCc/S56v1MalNDy+sYcMEo3kF2pJRfT5c68a3C4IA2fA=
X-Google-Smtp-Source: AGHT+IE3jqKrq16VRelIbjkUBnYCDLJ7AALRudo5VhnkqCTTy7hEHxidb8UlPEdHQE1Ym5H06F/23Q==
X-Received: by 2002:a17:903:2986:b0:1f2:f090:b2c1 with SMTP id d9443c01a7336-1f2f090bb1bmr77662935ad.14.1716261444846;
        Mon, 20 May 2024 20:17:24 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf31a93sm214885415ad.134.2024.05.20.20.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 20:17:24 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 04/31] Staging: rtl8192e: Rename variable bWithAironetIE
Date: Mon, 20 May 2024 20:16:51 -0700
Message-Id: <20240521031718.17852-5-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240521031718.17852-1-tdavies@darkphysics.net>
References: <20240521031718.17852-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bWithAironetIE to with_aironet_ie
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No change.
 drivers/staging/rtl8192e/rtllib.h    | 2 +-
 drivers/staging/rtl8192e/rtllib_rx.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index cae4df481397..40ec29434d68 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -910,7 +910,7 @@ struct rtllib_network {
 	u8 hidden_ssid_len;
 	struct rtllib_qos_data qos_data;
 
-	bool	bWithAironetIE;
+	bool	with_aironet_ie;
 	bool	ckip_supported;
 	bool	ccx_rm_enable;
 	u8	CcxRmState[2];
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 1cae6d6efb96..d4dbf8052c30 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -2090,7 +2090,7 @@ int rtllib_parse_info_param(struct rtllib_device *ieee,
 			netdev_dbg(ieee->dev, "MFIE_TYPE_AIRONET: %d bytes\n",
 				   info_element->len);
 			if (info_element->len > IE_CISCO_FLAG_POSITION) {
-				network->bWithAironetIE = true;
+				network->with_aironet_ie = true;
 
 				if ((info_element->data[IE_CISCO_FLAG_POSITION]
 				     & SUPPORT_CKIP_MIC) ||
@@ -2100,7 +2100,7 @@ int rtllib_parse_info_param(struct rtllib_device *ieee,
 				else
 					network->ckip_supported = false;
 			} else {
-				network->bWithAironetIE = false;
+				network->with_aironet_ie = false;
 				network->ckip_supported = false;
 			}
 			break;
@@ -2345,7 +2345,7 @@ static inline void update_network(struct rtllib_device *ieee,
 	dst->country_ie_len = src->country_ie_len;
 	memcpy(dst->country_ie_buf, src->country_ie_buf, src->country_ie_len);
 
-	dst->bWithAironetIE = src->bWithAironetIE;
+	dst->with_aironet_ie = src->with_aironet_ie;
 	dst->ckip_supported = src->ckip_supported;
 	memcpy(dst->CcxRmState, src->CcxRmState, 2);
 	dst->ccx_rm_enable = src->ccx_rm_enable;
-- 
2.30.2

