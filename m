Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DB839FD3
	for <linux-staging@lists.linux.dev>; Wed, 15 May 2024 04:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715748759; cv=none; b=WHcaUNwTtPtqKWES5ovEWB7KZAXn47xIwdQVw0BkX/O1U8s01tc6T4Y2RnUUcUU0EOxizXJnG7LwhEvxPVGXkR1GilmCVH0uvMjPBbcAfefm5cPDGBN2EI0Iq4F5YzVivu/STAoyCLfg2GwVDpgX6NRV2FC8mBGYDs90fwzM8SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715748759; c=relaxed/simple;
	bh=TEU9avpaX/N43LfNkZJD36hkEcVzdowUram2d7CoU3g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MezKarY+4PgO06m3kUQczfqprgs0kXplK8HnwBl5KTiwHNKN17tpsWeJlRnlukwZ17jGm4ucmN3fl9M/5j1LgotGICHm9kfXkSnWg3yqWVyfnF+XByjxpCGma3SUuo2MBO8YiPXBmqFbmhnPro43XFKaE/GZhtOAA06D+L7ygGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=NmFAavJ3; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="NmFAavJ3"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3c99c66a40fso2825720b6e.1
        for <linux-staging@lists.linux.dev>; Tue, 14 May 2024 21:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1715748757; x=1716353557; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvjRAcugX4Y+qbTFQbTgqGMibulX1uDB5tb1Q6bCIzE=;
        b=NmFAavJ3i5q/01/FmfCjm4qQfitZ3FkeK2KJGe/1ctIf3x3boU7dqcL4eAA8jpigJI
         bxsM/4jHL2QJM8eVlm74WzG/UiHplKYg4BSnB7hbnO3xMFxFyzeyhu/H4YudTpPTtGOY
         nwQ1CNGxa0NP8AiCE1W1s7INPKX2yfd7ilvivIhe3MtkfczHhkzo2IwXXFfMycq1GKWk
         j5FLmN+R/YfGTTNEKuJj9YxjB/zZQSe8SR222FN/PKq/IxuqBEZpkNVTdNBxeV6rP+3Z
         GnOxoQbt4AO4RBtZluPGjtfKTxA5CnZjYWDaRV9T1tBGx1PJWWoDUsuf5lwYDr17HaY7
         8NeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715748757; x=1716353557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvjRAcugX4Y+qbTFQbTgqGMibulX1uDB5tb1Q6bCIzE=;
        b=Z1q8tOPDmY2SbiQuxBNCCcpZQYFE6P+a3NzDU90MsO0KM9m2vwXIRoZpcfs+yaBXO0
         e2Vy+EvOYjUHonoKB5q9XFfCi9vhQpdHHY97tJn0wVNmts3AV/y+FNus2QZySYm9bN++
         wWu0Ly+dulspCW5sZ4/gqlzNwoBAYYc7w8bYhTh5zgdF6mcjA/Sf+x9zNadlD5DGlS85
         Ec1MRiZlGbMQvDaxNAaDq1YKNSNagim2H5ThUjlM20sKuqyH6GGwTRFqKugvkDaVOAIF
         4TVB2pTRJhHhZwXarQGe8VzyUJCdxFB6X00lu3pbSk6+1Xxe82zdMeWoIBfBfvP4zRtW
         a81A==
X-Gm-Message-State: AOJu0YwQ2EuYBF4PJt0O5CVZ1W9aBjbLTfL51Wf5/LaYCRb3QkPA0A4t
	L5iY3UtwFbWCn4tAhy/1p7dhbFaiH4RiJIW4GUno5we8HwL+eNRDPthORNS+4Fc=
X-Google-Smtp-Source: AGHT+IHXSKVG6OpQmEqKTMNFvcpSpKH2NcFI8y8VYcx2Qr+CVyvglrb+pY8R0r6g03tt0VQww6xQKw==
X-Received: by 2002:a05:6808:f03:b0:3c9:714d:cc7b with SMTP id 5614622812f47-3c997039622mr18101556b6e.9.1715748757124;
        Tue, 14 May 2024 21:52:37 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a827fdsm10135035b3a.60.2024.05.14.21.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 21:52:36 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 04/31] Staging: rtl8192e: Rename variable bWithAironetIE
Date: Tue, 14 May 2024 21:52:01 -0700
Message-Id: <20240515045228.35928-5-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240515045228.35928-1-tdavies@darkphysics.net>
References: <20240515045228.35928-1-tdavies@darkphysics.net>
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

