Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A05B3C473
	for <linux-staging@lists.linux.dev>; Wed, 15 May 2024 04:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715748775; cv=none; b=ZuUEANe6nSA4IOjrVFbV5Ksx29mXi1VSNNcJ51vf9uE2RE37YS7vK6PKZSogcSGKeufkomB3FsSGn0hhjiG/sDruNrrww/kjGY2YAyWx1MYUwI/Y2iLUUcjdl5tz6hIK7u/WW/ytqiLC4DN24I19MexVvh8JmdNTj/djQOSmaj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715748775; c=relaxed/simple;
	bh=lsM+ZQowe+rsl+rWKUkQhSYNrTZ45i/m86XkMVVCpfc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gLV1FgvwFQ0JtToUq3Ea0G7ERsPgDannEmYSytgfThIeC6s6aySM/hseha0CuVJA9HmuzvBVeKmZ6CcXnBt343vFtf/HKImbFI/Ci7PpN9YbK+0RMxjHC3oJVBe2l3w7Ih+4KDadJftPKbiqqNw6buA9JTAYIR0Ci5WE8RSIW5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=cKhZYJ9v; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="cKhZYJ9v"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6f45f1179c3so6010710b3a.3
        for <linux-staging@lists.linux.dev>; Tue, 14 May 2024 21:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1715748773; x=1716353573; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11MP8Alwq/xW6QpxNU4+RBkBTJftX5h6ydB0LOzhUSE=;
        b=cKhZYJ9vw4e7CgSgqDXOwDrKBvm1KbpJxqspauKwHux6T0HMfet+QFLGOQBxCswsD4
         hr1QG1tfG8TW6i0QZZL2bwndndx9iQ1r+qxZa/UO68Zu6VHjVReDg4BR4iE4QkR44sAA
         JXMDgZV0KWA/p12cQ3v9fqPme/+Q6M5QJj+8mbAjZDbFMqRXplYNZnIOL1GECtdaVFq1
         Rcc+JxesdHMTNYhqYKYRxWC7OB3+O4Fsaoidn//ZhKTVzUjHHTREkrdumqvlePhQKDb/
         jrmDQZ9fmnY5RE6TDYwMtRp/Lt5FSZAddP1wFh5eKv/RHOJKF0ej0QfbgKPEgEbsP2GN
         ioVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715748773; x=1716353573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=11MP8Alwq/xW6QpxNU4+RBkBTJftX5h6ydB0LOzhUSE=;
        b=fsQ+xNlvHADRCNLQaWUC1QNVcc5Mx/YXDzgY4JyrJmNvZSh5s8bcbVA23oaBQME/g5
         KXelJzf1DlSSkbmssJOPV3KcV853bMiIrrSPV1JwXiVzbVB4bWHcZOCkH6VjQWsS1pA/
         Fo51r9Z4TL7gyISjylDoPDE9nbKywcFcniD23e6NqRa3+me5WovaZeiejhTHa3MYqgF+
         oVfvVQsNWRgoGu3HzOh4Su3Ludwss05kgeP86ZQDXZOTvAig4XlAbN7YzHVaJVsNLOmA
         fdujqlZjRQKe06cxRsgqNhotnnvT/NEj6nnDYJa+rOcvkPLnKKFWb8toyj/ULFJRovF5
         /PkQ==
X-Gm-Message-State: AOJu0Yx6N0MwDm3DHmTUWDOzv39igTBp1E37Lb4Fi27VienRIJG1yGQv
	fxiPSkvS6shaCFv6sMlAWTbHbgy9AcrNrwMxJnciO0JqXE1floU7BnBkPHYjkV8=
X-Google-Smtp-Source: AGHT+IH1vMAWtTmaD+ju68xRIOdV0x6M6MQx+zRFjzS2mm8lKrYLLrNzqMXVXkeUtMrSiKT2Yidkqw==
X-Received: by 2002:a05:6a20:748e:b0:1aa:5b05:7926 with SMTP id adf61e73a8af0-1afde1b0209mr16415956637.39.1715748773321;
        Tue, 14 May 2024 21:52:53 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a827fdsm10135035b3a.60.2024.05.14.21.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 21:52:53 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 27/31] Staging: rtl8192e: Rename variable CcxRmState
Date: Tue, 14 May 2024 21:52:24 -0700
Message-Id: <20240515045228.35928-28-tdavies@darkphysics.net>
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

Rename variable CcxRmState to ccx_rm_state
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib.h    | 2 +-
 drivers/staging/rtl8192e/rtllib_rx.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index b88c7cd399fb..ca69bb0965ba 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -913,7 +913,7 @@ struct rtllib_network {
 	bool	with_aironet_ie;
 	bool	ckip_supported;
 	bool	ccx_rm_enable;
-	u8	CcxRmState[2];
+	u8	ccx_rm_state[2];
 	bool	mb_ssid_valid;
 	u8	mb_ssid_mask;
 	u8	mb_ssid[ETH_ALEN];
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 95dde1938874..fe72149aa81c 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1813,12 +1813,12 @@ static void rtllib_parse_mife_generic(struct rtllib_device *ieee,
 	    info_element->data[2] == 0x96 &&
 	    info_element->data[3] == 0x01) {
 		if (info_element->len == 6) {
-			memcpy(network->CcxRmState, &info_element->data[4], 2);
-			if (network->CcxRmState[0] != 0)
+			memcpy(network->ccx_rm_state, &info_element->data[4], 2);
+			if (network->ccx_rm_state[0] != 0)
 				network->ccx_rm_enable = true;
 			else
 				network->ccx_rm_enable = false;
-			network->mb_ssid_mask = network->CcxRmState[1] & 0x07;
+			network->mb_ssid_mask = network->ccx_rm_state[1] & 0x07;
 			if (network->mb_ssid_mask != 0) {
 				network->mb_ssid_valid = true;
 				network->mb_ssid_mask = 0xff <<
@@ -2347,7 +2347,7 @@ static inline void update_network(struct rtllib_device *ieee,
 
 	dst->with_aironet_ie = src->with_aironet_ie;
 	dst->ckip_supported = src->ckip_supported;
-	memcpy(dst->CcxRmState, src->CcxRmState, 2);
+	memcpy(dst->ccx_rm_state, src->ccx_rm_state, 2);
 	dst->ccx_rm_enable = src->ccx_rm_enable;
 	dst->mb_ssid_mask = src->mb_ssid_mask;
 	dst->mb_ssid_valid = src->mb_ssid_valid;
-- 
2.30.2

