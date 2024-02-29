Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B3D381A4
	for <linux-staging@lists.linux.dev>; Thu, 29 Feb 2024 02:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709174620; cv=none; b=uK5/8PZGjyinKIphrcypmndDX/Ek7cYXt6NTVWZYiGG8XgpNg2y+GReQsgGqxCxEtkt+kDY1KbMHvFAaiZyS4oDmSiRer7+4AakYrbGOfYoasBOm2bEgCQ6YVaPkeCI4lHwGfyHVaCv73tpmvICeQ/CRBPPd69QFjTk8Z1APvow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709174620; c=relaxed/simple;
	bh=cMCQopxYgTxYu/0amwMiu8cgPaQ+iKgRIdpZaTrEX2g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uIu6XUj6VMBLkJHZXc8hUorTWrPY+EZfSUloq62j9K4K5R6AkUd0oX+w0W8AypIYJTv0WlbDWzg1rHRoHFkNJ9GU7/sKYVhTzfh+PKUIIjmpq9ZrpGzsiaqOfc/F4eZecmZyEiywzH7skfl0JJRXh0y4jF28zngOmIBDJde4HfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=jom2jM5W; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="jom2jM5W"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e572dbbc5cso354254b3a.0
        for <linux-staging@lists.linux.dev>; Wed, 28 Feb 2024 18:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1709174618; x=1709779418; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1SNh7/XczwlcyfoaJTDElDItVS6jS2b6ony9kQsRUro=;
        b=jom2jM5WUzmNwb9A5fUQw7qzUwP9/Olo1yjtCGO+5F4fyQU+miEkogBew43c5lmUYN
         xkcknn7bRUE4DGhdZqKr4LTQxiUDf/lNCLZuQP67BiExKsgNlAFVEaT8UEE0rLYMTxDg
         4mqVRnDjVF4HIJcWwPGaSwhvOgDx/pLm5SrBr+a06Ch75alltTzBTElrrW6yqAVq3s1L
         TtVCsiLqSEkWrOkr/ScdpIL2WxIvmacFmVDHWYrf9el3aeDD2W+Bt/cbQtZGCrZL/1s+
         bfw0mWVXT/N1HuG4P+GROp/VVbmDKIbMs3y9ENL+jl9pNrsGZSpjo0GM9I+K9Md3C2+z
         28gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709174618; x=1709779418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1SNh7/XczwlcyfoaJTDElDItVS6jS2b6ony9kQsRUro=;
        b=kRYoTgn7DfT0KrtOg+eVeAMsyZCNV+jO3MKLj/L8XrP2+Cs3UbmM+VDelkgeSmX+Ge
         5hEKSyzG8bNvP4LZjLvKea4G/9rD40u9esRyymqQo9CBFAJJxLlEyuoO9Dedm6MSX5q0
         2370iFiHu/y0+E7EpV2Wh9+6DLVQ49/+uAb/D7Yf06rOC+vcypfB6kikUWrD6KqJtXOP
         uMUFWS1TdFoe8zXUSi4dGKNrUr+ADFd0nop3xki4wP69sOp5OBgXrrXf0X0Iqnsve+N/
         u9yvTsgDotn/V8I3vzcblwchK8BhFIuEgqC8dBbi802ZbOxJxHoaa/sCvKiGbUJwaHyt
         W1Iw==
X-Gm-Message-State: AOJu0YyODhIwbxtjZMVIYLX3xH576NZ6zHbAtKswViP/sPGlny5MdEdo
	hWB51xvQipPsPFHoZDbrhEZVBNXhTmv9yLLk5F2CZkN2HWS/dsJrPHRIbIJDxuw=
X-Google-Smtp-Source: AGHT+IFsh139gp84sHUup4ne0/pwHtdEtWANtNZz0UyWr8AIPlsZpo8fAZ63XIJ14ye3oYU8wy91LA==
X-Received: by 2002:a05:6a00:22d0:b0:6e5:9688:8025 with SMTP id f16-20020a056a0022d000b006e596888025mr115514pfj.6.1709174617867;
        Wed, 28 Feb 2024 18:43:37 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id u23-20020aa78497000000b006e5092fb3efsm141504pfn.159.2024.02.28.18.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 18:43:37 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 6/8] Staging: rtl8192e: Rename goto OnADDBARsp_Reject
Date: Wed, 28 Feb 2024 18:43:23 -0800
Message-Id: <20240229024325.453374-7-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240229024325.453374-1-tdavies@darkphysics.net>
References: <20240229024325.453374-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename goto OnADDBARsp_Reject -> on_add_ba_rsp_reject
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: no changes
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index a3a2fe72d644..0581ed1e9ed1 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -334,14 +334,14 @@ int rtllib_rx_add_ba_rsp(struct rtllib_device *ieee, struct sk_buff *skb)
 			    ieee->ht_info->current_ht_support,
 			    ieee->ht_info->current_ampdu_enable);
 		reason_code = DELBA_REASON_UNKNOWN_BA;
-		goto OnADDBARsp_Reject;
+		goto on_add_ba_rsp_reject;
 	}
 
 	if (!rtllib_get_ts(ieee, (struct ts_common_info **)&ts, dst,
 			   (u8)(ba_param_set->field.tid), TX_DIR, false)) {
 		netdev_warn(ieee->dev, "%s(): can't get TS\n", __func__);
 		reason_code = DELBA_REASON_UNKNOWN_BA;
-		goto OnADDBARsp_Reject;
+		goto on_add_ba_rsp_reject;
 	}
 
 	ts->add_ba_req_in_progress = false;
@@ -358,7 +358,7 @@ int rtllib_rx_add_ba_rsp(struct rtllib_device *ieee, struct sk_buff *skb)
 			    "%s(): ADDBA Rsp. BA invalid, DELBA!\n",
 			    __func__);
 		reason_code = DELBA_REASON_UNKNOWN_BA;
-		goto OnADDBARsp_Reject;
+		goto on_add_ba_rsp_reject;
 	} else {
 		netdev_dbg(ieee->dev,
 			   "%s(): Recv ADDBA Rsp. BA is admitted! Status code:%X\n",
@@ -371,7 +371,7 @@ int rtllib_rx_add_ba_rsp(struct rtllib_device *ieee, struct sk_buff *skb)
 			ts->add_ba_req_delayed = true;
 			deactivate_ba_entry(ieee, admitted_ba);
 			reason_code = DELBA_REASON_END_BA;
-			goto OnADDBARsp_Reject;
+			goto on_add_ba_rsp_reject;
 		}
 
 		admitted_ba->dialog_token = *dialog_token;
@@ -384,12 +384,12 @@ int rtllib_rx_add_ba_rsp(struct rtllib_device *ieee, struct sk_buff *skb)
 		ts->add_ba_req_delayed = true;
 		ts->disable_add_ba = true;
 		reason_code = DELBA_REASON_END_BA;
-		goto OnADDBARsp_Reject;
+		goto on_add_ba_rsp_reject;
 	}
 
 	return 0;
 
-OnADDBARsp_Reject:
+on_add_ba_rsp_reject:
 	{
 		struct ba_record BA;
 
-- 
2.39.2

