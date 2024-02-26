Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA001EEE7
	for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 03:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708919804; cv=none; b=CkoFShhBmIsnhSozTKIcNM1jFToRzUNChfG2DOKSpSi8gXhzSX2/Dt/lndxA0yA71BEkbT9UWAWpL7TmTsDZ55WdjBQa2nBxNZFGdEswHa4m66rKExfHO4CbDTlG1O11xrG/S1rvfeWWEmTOMqWgFbghuUmvM3cNXWERhCt7+PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708919804; c=relaxed/simple;
	bh=xkAJUyHT9IJVaPQlnOZWTRhXRab/KfstgsbTL98+Dw8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q4HgerrIqItRelPcTz3KYtnVo1trkVHoyf66OpkwS3Kpb1Z7Mg6MvQxlv4tcQjN9I+0sIS7/SNEuGtGnP/K3mRBNN/7omRZ4KGsrdNo2ZeLEZVevIWB51BuzRBiIfa/Jfu9DG/CLMt978xx1VXMD9yb785ffHmJDTNEJ9kLVdAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=FP+UbFSF; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="FP+UbFSF"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1dca3951ad9so3921285ad.3
        for <linux-staging@lists.linux.dev>; Sun, 25 Feb 2024 19:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1708919802; x=1709524602; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgQudfHXYX2Ros6YWs5QZmighXOkmI4wP/T3q7E/9FE=;
        b=FP+UbFSFQpGY5iH+QWeZMMjvnXaOz1IArsTDTeBtuzlU5ReJlGJXTrwF6qbpifzv0p
         ongNuFtxIeWcMM46DdFno7xl7GSinfFBjWKmthrDqHaYr2GJUbaMsT3dWMQxyh5TMXGz
         sPJdRUgo3e7qfMF6afBvvqL/wjcU2bEFdIh2RgprRUiqpT25ZRX5ZWMjvp/3jhVpN7oy
         J3DxtyTuyN1FdCQaQ7Y161+GgQNQZH/fb8Dq65OUBd1DNdDWq/MoEfXOSQflm0lUfMlY
         +/Qe0uNsJkONNvpazIXQp28Wz6IcRq0LjMZbm2wWFdqp4L6FXfW79EH/rnRQP7R2d4jU
         2Pqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708919802; x=1709524602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wgQudfHXYX2Ros6YWs5QZmighXOkmI4wP/T3q7E/9FE=;
        b=Q9Fd+eZWAzHm6T6XhLsx26xLVvk7jFlNgftnQtAs/TkjBN5sNwAs5PVLuNC+nowSpn
         7VxKwYFeu8dJVgCOZTJowm8DqnlkdnY/CqJww8jC9iOAVeG0oQkju/e4BGlUJKEDqoKk
         GS6H76rbeQ4AlRaE8r8oznrlF5E4MTaRHE1eB6jI7PSe5jTK7sCStfO6eCAPVzpmY9DI
         ZCfTJwb1aBrRdl3H2McLExTmGgC7mHT8DMdpU3Vt9hkfZZxaoDX89okDnfcwG1JGMYFd
         P431hYUqRqucnF72lqfwZGKU+b+Xn4F0ye40jfzLDWermLV0xZ3U5DR3y7/L/Hoe8I6p
         +A4w==
X-Gm-Message-State: AOJu0Yz9rrmKEIUljWoGbxq+4jukez3WNgNVf+8U8gHRpQpqhmOpfYaa
	Qmh5y+VVQEKvganRsTNEtsvN0qD7zdGlYXOH9xWuQsbuXcsIDIaAMC5Iwc4L0Oc=
X-Google-Smtp-Source: AGHT+IGq5VHIZ1QfePCr9oytm5Hdu8/xcpcyImSchOSf8PrVuTZWnteSRt0h097oHPDqveaWYDWFlA==
X-Received: by 2002:a17:902:e752:b0:1dc:3e49:677d with SMTP id p18-20020a170902e75200b001dc3e49677dmr8242640plf.26.1708919802531;
        Sun, 25 Feb 2024 19:56:42 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id kh5-20020a170903064500b001d8a93fa5b1sm2897615plb.131.2024.02.25.19.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 19:56:41 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 16/20] Staging: rtl8192e: Rename varoable osCcxVerNum
Date: Sun, 25 Feb 2024 19:56:20 -0800
Message-Id: <20240226035624.370443-17-tdavies@darkphysics.net>
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

Rename variable osCcxVerNum to os_vcx_ver_num to fix checkpatch warning
Avoid CamelCase,

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index c088fb28c62c..bc08018185ca 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -853,16 +853,16 @@ rtllib_association_req(struct rtllib_network *beacon,
 
 	if (beacon->bss_ccx_ver_number >= 2) {
 		u8 ccx_ver_num_buf[] = {0x00, 0x40, 0x96, 0x03, 0x00};
-		struct octet_string osCcxVerNum;
+		struct octet_string os_ccx_ver_num;
 
 		ccx_ver_num_buf[4] = beacon->bss_ccx_ver_number;
-		osCcxVerNum.octet = ccx_ver_num_buf;
-		osCcxVerNum.Length = sizeof(ccx_ver_num_buf);
+		os_ccx_ver_num.octet = ccx_ver_num_buf;
+		os_ccx_ver_num.Length = sizeof(ccx_ver_num_buf);
 		tag = skb_put(skb, cxvernum_ie_len);
 		*tag++ = MFIE_TYPE_GENERIC;
-		*tag++ = osCcxVerNum.Length;
-		memcpy(tag, osCcxVerNum.octet, osCcxVerNum.Length);
-		tag += osCcxVerNum.Length;
+		*tag++ = os_ccx_ver_num.Length;
+		memcpy(tag, os_ccx_ver_num.octet, os_ccx_ver_num.Length);
+		tag += os_ccx_ver_num.Length;
 	}
 	if (ieee->ht_info->current_ht_support && ieee->ht_info->enable_ht) {
 		if (ieee->ht_info->peer_ht_spec_ver != HT_SPEC_VER_EWC) {
-- 
2.39.2

