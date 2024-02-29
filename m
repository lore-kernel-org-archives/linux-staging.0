Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0C9376FE
	for <linux-staging@lists.linux.dev>; Thu, 29 Feb 2024 02:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709174621; cv=none; b=k5JOpw5fRv5LAR03OjMZpt3SCQaOwVLJ9y47+SMaMiK81P0bU1Jk7KDHrnJa+AIdjlEOO6vzhKYsVYB32KBDs0kbTqek11cQJyz3/RazIN+f1NqZgaw0ocxAXf+zAC1Cki7Wp2Gp6jCRhlktcsPBX0ZNwj2krjJR9esCTXZuR3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709174621; c=relaxed/simple;
	bh=TtPGBk36XpX3CmVxUVDkkA32ftSJsHAWNhFPZRbIGyc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Pm8VCw2ka8XWtXxdX3ltmupFancig4xlimImdPhu4S/PvgXEod+cXdmeyp0aRd37sXY1q+PQuCIUMZl2NH+R+Y3J1Ww7zLtTKGsD14BJ6GdAAMLJx6qCKZPlJMDH3Rk+I/4kmftCpEK6bxYiKH2tKno6hki/rrlLlE68FjHTeEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=idHhUMQd; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="idHhUMQd"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3652731b2b7so2037065ab.2
        for <linux-staging@lists.linux.dev>; Wed, 28 Feb 2024 18:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1709174617; x=1709779417; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FhfHq+TB9JfA9EoJNMTx1D1THIHV8qXBJRS7zjeQSzA=;
        b=idHhUMQdf7xn+ErQgAxNC4Dze5bDpvdkcfp4vZrq918SRlyIf0AGMGoUmTA9UrhXn0
         vFEvBV38Oj2tG6M1knN/xD54uQ2H6MR10g1LoFgrfWua3Dq5RPoLwjv/vC0ISXSKWVXV
         Fvi+2o78izj717qbpGeSgloroN+kerBP8QKcuEr0z+m2ADAaJ77lbUBlIp2a/lFBiZwu
         psv2H2LK/CX8mtXZ17I6n+qmFKTydFUswvIPHOIyLjLbEQyGeqimJly86QyYWWMPuf+V
         m+KE7+bEf+tuzGwvdfequUZi7rZItmGnPBelnyOmQbGaxjBW93cyAdBveYP7j6jW1BP6
         YdkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709174617; x=1709779417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FhfHq+TB9JfA9EoJNMTx1D1THIHV8qXBJRS7zjeQSzA=;
        b=HMcgMHT3x27Zabjs5dzzu0pEJhakfCuGV9OBncCKhMIoMnaBpkkzUhsNkIwEaWT91P
         oDQJlEi7a+EqabT6MGhbu3PMSn1DvqUgXLN4iiO10AokQjrSz6577Iefa8BcLcNefbQe
         TBwu1R0rfepvO4JjHoE9H9gzo4lNwIwVDt69Z7HwXxXHVCkvF5TbLc+u2Ncq/01gKEX4
         VVcX1gngpl7Hx7d22D2ZAfelf3LvXoXzfG2rwJ0/Kd7sTroeGdnWYF0lZEHUcTMkyfmt
         RbprISHWllYSNWyxKTyT3hiYRn7mfmFc6B/hveRJUqi8zDEcz3Sqm1CwK2nrFGhjtb3a
         +RPw==
X-Gm-Message-State: AOJu0Yy/zBjHFsGrPlB67u8TY/7kX94qlBHP5ruhh+FZhF2duLVI+Rb3
	FQFM//17TPK9UUd1VeZTwhxMopKY82w47nPlrwQ2hTlXnCcjB4NZE0whMJlbZ6E=
X-Google-Smtp-Source: AGHT+IGQbkvRl6OZuvq4uMmwaSFBD56Nt80clHOrFAY3/gMfyXFQ//BdYzsq4OM/TELdk50TDDwuxw==
X-Received: by 2002:a92:d988:0:b0:365:8513:b6b with SMTP id r8-20020a92d988000000b0036585130b6bmr1130962iln.29.1709174617086;
        Wed, 28 Feb 2024 18:43:37 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id u23-20020aa78497000000b006e5092fb3efsm141504pfn.159.2024.02.28.18.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 18:43:36 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 5/8] Staging: rtl8192e: Rename goto OnADDBAReq_Fail
Date: Wed, 28 Feb 2024 18:43:22 -0800
Message-Id: <20240229024325.453374-6-tdavies@darkphysics.net>
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

Rename goto OnADDBAReq_Fail -> on_add_ba_req_fail
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: no changes
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index c0006daa75ec..a3a2fe72d644 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -251,13 +251,13 @@ int rtllib_rx_add_ba_req(struct rtllib_device *ieee, struct sk_buff *skb)
 			    "Failed to reply on ADDBA_REQ as some capability is not ready(%d, %d)\n",
 			    ieee->current_network.qos_data.active,
 			    ieee->ht_info->current_ht_support);
-		goto OnADDBAReq_Fail;
+		goto on_add_ba_req_fail;
 	}
 	if (!rtllib_get_ts(ieee, (struct ts_common_info **)&ts, dst,
 			   (u8)(ba_param_set->field.tid), RX_DIR, true)) {
 		rc = ADDBA_STATUS_REFUSED;
 		netdev_warn(ieee->dev, "%s(): can't get TS\n", __func__);
-		goto OnADDBAReq_Fail;
+		goto on_add_ba_req_fail;
 	}
 	ba = &ts->rx_admitted_ba_record;
 
@@ -265,7 +265,7 @@ int rtllib_rx_add_ba_req(struct rtllib_device *ieee, struct sk_buff *skb)
 		rc = ADDBA_STATUS_INVALID_PARAM;
 		netdev_warn(ieee->dev, "%s(): BA Policy is not correct\n",
 			    __func__);
-		goto OnADDBAReq_Fail;
+		goto on_add_ba_req_fail;
 	}
 
 	rtllib_FlushRxTsPendingPkts(ieee, ts);
@@ -287,7 +287,7 @@ int rtllib_rx_add_ba_req(struct rtllib_device *ieee, struct sk_buff *skb)
 
 	return 0;
 
-OnADDBAReq_Fail:
+on_add_ba_req_fail:
 	{
 		struct ba_record BA;
 
-- 
2.39.2

