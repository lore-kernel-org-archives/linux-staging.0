Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F621CD31
	for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 03:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708919962; cv=none; b=udv49kNIWPA8Fr21KTZS8XMY5xKE4nA5oZGp+qvx7tmU40hfN5n/U8MBLQw0Vfd72rD6yobro5cGtXYfnY1xe5c9vzEMFNdKIRWnkoxhhGxlPNVAyBTrjbiNADVthHycLTDbsUrJJQGbrzE/R74OISlu48rktxuRsoNzbgX4ms4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708919962; c=relaxed/simple;
	bh=XMhOdgnSD6GDUy09AMGDG/6abedE0Ur/5K9wiwhXNEM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gEKjzKfVFBiv8u9UKmOXN2LPFWF4oUz5Xmu2tl4RHV3xBFNt53fZFaHiOtf13kpUnYIj0P2eiOPQJ4pdOE6rO3WznwZyvUjqboGLpilI9ZY80Wy4Uad3UZSyryFgsxOcJf8jjUJLj8tO7fmoUu79uOKCTFq6L2lMAXmTPEOaW00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=jQh35wJu; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="jQh35wJu"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d95d67ff45so15310735ad.2
        for <linux-staging@lists.linux.dev>; Sun, 25 Feb 2024 19:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1708919960; x=1709524760; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JV07OOKtBhvvjlkzVTWXYYy+Q8Ud6DjYC8gS8WRZRDQ=;
        b=jQh35wJuWWhPBTJQgfXHMFUCJ40IruMZlmdfvPi3/PyyL71wFwk0p+TV6Xf/dzCpm+
         MjBGwEOQfbV0TXGa6D58GqW041huMZPw8TGXyDdaSF4Owxw3fEZcV13iFnUjCzBRqKNS
         p5S6MDhWMmFPqU3xMXiEx4elJvkVD6sXVQUiWrxA1j6/aM8Y0nTeS0wNttBb0or1PWi/
         P2BV0wankHyy8wpfX3N9H5lapbTCQhf2OXtN4ylgdLIwhmrR6TaqA4gpfu2RHxhykLYH
         FTb0Nc7DNwv5tBghuAcA/2r7huU/50It1wavyDFQQl76y/GVh2WajD95wpm252tOfcov
         xInw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708919960; x=1709524760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JV07OOKtBhvvjlkzVTWXYYy+Q8Ud6DjYC8gS8WRZRDQ=;
        b=COpUhzsE67WuZV0N2XoHglqa85prBv13Hq1jlur23DiHvIO9sGHTEun0LapaXSzeYg
         dwhbNzxffxnQNshbKbRWbyDJGon59pX3r8XQXyk2xULPe+ZmHVWY62psdDKZ3TNKeLK3
         8NA7B4E+Vr+f33JkWWKfph5NWvMXbLAlaUtQSoLdA6BkKElFNckECEL2AxrV44XYFvok
         E1eHV6WVqUTQXggQnHApcejklmgru0G6mCP/vJpATtyOyXV0UA6NF/WRGbe0kFQQY5lv
         TeDq9dEmZh+k4uCw7b+fD1eBsaG8eNyj81yfze4yiXgBL5ZFVMFeKGMW7ydm+CMbWyyZ
         9vDA==
X-Gm-Message-State: AOJu0YxNJ8VLug+laqejkRxUlnz0EZdYzNeOqahBYUvkwzS0nyjkPXhL
	vyvkjn/UIpn21BFRmBcgggS9g3cN/78OZcK+Wo2ARTThWomwzmsiUVNWaMULHFQ=
X-Google-Smtp-Source: AGHT+IEeD8vJpMRL9cED8xvAZ0LEBa2sDmKEmqhf/4yxpLXCJL1Bb6gx+sfqCxT8D4Go3e9OShm/Zg==
X-Received: by 2002:a17:902:ebce:b0:1dc:156c:a864 with SMTP id p14-20020a170902ebce00b001dc156ca864mr6143522plg.4.1708919960334;
        Sun, 25 Feb 2024 19:59:20 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id iy13-20020a170903130d00b001da105d6a83sm2893426plb.224.2024.02.25.19.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 19:59:20 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 1/8] Staging: rtl8192e: Fix 5 chckpatch alignment warnings in rtl819x_BAProc.c
Date: Sun, 25 Feb 2024 19:59:08 -0800
Message-Id: <20240226035915.370478-2-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240226035915.370478-1-tdavies@darkphysics.net>
References: <20240226035915.370478-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add tabs and spaces to fix checkpatch warning: 'Alignment should match
open parenthesis'

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index bd1d86e0323d..c06633867641 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -254,7 +254,7 @@ int rtllib_rx_add_ba_req(struct rtllib_device *ieee, struct sk_buff *skb)
 		goto OnADDBAReq_Fail;
 	}
 	if (!rtllib_get_ts(ieee, (struct ts_common_info **)&ts, dst,
-		   (u8)(ba_param_set->field.tid), RX_DIR, true)) {
+			   (u8)(ba_param_set->field.tid), RX_DIR, true)) {
 		rc = ADDBA_STATUS_REFUSED;
 		netdev_warn(ieee->dev, "%s(): can't get TS\n", __func__);
 		goto OnADDBAReq_Fail;
@@ -277,7 +277,7 @@ int rtllib_rx_add_ba_req(struct rtllib_device *ieee, struct sk_buff *skb)
 	ba->ba_start_seq_ctrl = *ba_start_seq_ctrl;
 
 	if (ieee->GetHalfNmodeSupportByAPsHandler(ieee->dev) ||
-	   (ieee->ht_info->iot_action & HT_IOT_ACT_ALLOW_PEER_AGG_ONE_PKT))
+	    (ieee->ht_info->iot_action & HT_IOT_ACT_ALLOW_PEER_AGG_ONE_PKT))
 		ba->ba_param_set.field.buffer_size = 1;
 	else
 		ba->ba_param_set.field.buffer_size = 32;
@@ -338,7 +338,7 @@ int rtllib_rx_add_ba_rsp(struct rtllib_device *ieee, struct sk_buff *skb)
 	}
 
 	if (!rtllib_get_ts(ieee, (struct ts_common_info **)&ts, dst,
-		   (u8)(ba_param_set->field.tid), TX_DIR, false)) {
+			   (u8)(ba_param_set->field.tid), TX_DIR, false)) {
 		netdev_warn(ieee->dev, "%s(): can't get TS\n", __func__);
 		reason_code = DELBA_REASON_UNKNOWN_BA;
 		goto OnADDBARsp_Reject;
@@ -433,7 +433,7 @@ int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb)
 		struct rx_ts_record *ts;
 
 		if (!rtllib_get_ts(ieee, (struct ts_common_info **)&ts, dst,
-			   (u8)del_ba_param_set->field.tid, RX_DIR, false)) {
+				   (u8)del_ba_param_set->field.tid, RX_DIR, false)) {
 			netdev_warn(ieee->dev,
 				    "%s(): can't get TS for RXTS. dst:%pM TID:%d\n",
 				    __func__, dst,
@@ -446,7 +446,7 @@ int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb)
 		struct tx_ts_record *ts;
 
 		if (!rtllib_get_ts(ieee, (struct ts_common_info **)&ts, dst,
-			   (u8)del_ba_param_set->field.tid, TX_DIR, false)) {
+				   (u8)del_ba_param_set->field.tid, TX_DIR, false)) {
 			netdev_warn(ieee->dev, "%s(): can't get TS for TXTS\n",
 				    __func__);
 			return -1;
-- 
2.39.2

