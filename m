Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3391B15C157
	for <linux-staging@lists.linux.dev>; Wed, 21 Aug 2024 03:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724209747; cv=none; b=rrafoO9YVrQ1g6OSApdV1NIVeP7gEQDG66PUEZAJFVKEoj6epfIdf9GNz0nCOP14aEqwwGWRQci65HeBrYTKfl3pk6vaXpiYG10Uw4voFymqtaPyFnsEBpGITCPDFKkAyAl7tvyokbWYxqjB4N24NKMCjM1rVGkOSp2K9rjeX6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724209747; c=relaxed/simple;
	bh=orq4AOpe2A4MAVmAmJWoBbmSVKM15piDP70UVzCBGCY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RRC+ssGfjgWJDW/I8OOJ7Y8ZS/KFXKNe7v8x4AC81gGdonESUIQrQOMkjRdM6xQgn2Lgm4awlhDT++xEewcvQCtkvKKrDWwiWcMzcp48evPqufSAKLJP0G1SmQ7larKXQApgXNXYQrJEDR9/LmV6sGPgM+LNsjf8nThSsFk0dWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=mEJ5QXUy; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="mEJ5QXUy"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3db12a2f530so4047096b6e.1
        for <linux-staging@lists.linux.dev>; Tue, 20 Aug 2024 20:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1724209745; x=1724814545; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AVBGOBsFjhhHQX6+UrHG33RkHi2SZZr6hZZuy7ptMZg=;
        b=mEJ5QXUyOh1dpFNELco8x+RMLSgHlT8DRlFbZ6D+xsp7D412Y+DGn4aV1m7dm2tabI
         PV/U1CQ1eDKBj1eiYhYOnymWFLBt//K4gI4DvTYg5OCV8VZW2+BZL1Sr+5k2xbpB48+W
         nJq1Hk3x5ziiloyXINY3C+xAYNb1ui+hCqpy906JcogQlt+BN3a2K3h1nLtE7wvXvFpa
         ibM+sjonb6l+M2z9ocQY+hMgd5ZOHcBPXrLi1HJRyyHnEITzgZuS1m+5oKeadaO9pkAC
         6RCk6fSZq0uDbjpLGlFMftiZ+A797P1tqZn3VFdRxYVIzfr1hKq0HeMFW59H5tMylMEX
         5hMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724209745; x=1724814545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AVBGOBsFjhhHQX6+UrHG33RkHi2SZZr6hZZuy7ptMZg=;
        b=wK3ExpF0QWaa9WeGlsgirDXal37P082vdG7xw6SgUS6BttgAaYFpwL9svFM8AS3E02
         SgVmSCYOx6RNkSF979yefR3mrQTixV+p3SPZbUfPrTXHXhREbFByCgwtD6gzhmPUqY80
         xVRelCe4hQ0CqThFpyVYC11RmPpPn5XmsIO+kOn4rCELk/4Jtjd0FStuGeVwxV0uptRJ
         zQzn5ag4c2yv6pHkjNK2rhM0dr/pdVZn+1BLFUYCwsMi7WBCwRGNeZyzdDeEgeHVQXnJ
         /mTMPTgObfMofaMtnZeWFzk5cXYkg/WYMX8cJINX2VXjL9WpG+1F/U0tfQPputgf3tfT
         +FZg==
X-Gm-Message-State: AOJu0YymCKpTi3I8s+iLvjSt5DMkCWjHFprgk2Nr2UrSHN5iRIOPbb3N
	sAhbL3X9g9QVNaweS9BmeVHUhijDGprPhNVzoA3glitLQHBvLVWFwiSev4qiYts=
X-Google-Smtp-Source: AGHT+IFG2vtbi33lLjwU/yG0Oi+F22M1hsLLaxAG9l65XXErsGpslWlqApqGEGFA3jK+JlUW5qYoFQ==
X-Received: by 2002:a05:6808:2105:b0:3dc:16ca:d9d9 with SMTP id 5614622812f47-3de19d34adamr1157324b6e.46.1724209745191;
        Tue, 20 Aug 2024 20:09:05 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127add75dbsm8934404b3a.44.2024.08.20.20.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 20:09:04 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 6/6] Staging: rtl8192e: Rename variable CmdID_WritePortUchar
Date: Tue, 20 Aug 2024 20:08:56 -0700
Message-Id: <20240821030856.57423-7-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240821030856.57423-1-tdavies@darkphysics.net>
References: <20240821030856.57423-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable CmdID_WritePortUchar to cmd_id_write_port_uchar
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index c49dd8094c7c..0e8ca8bef00d 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -624,7 +624,7 @@ static u8 _rtl92e_phy_switch_channel_step(struct net_device *dev, u8 channel,
 				rtl92e_writew(dev, CurrentCmd->Para1,
 					      CurrentCmd->Para2);
 				break;
-			case CmdID_WritePortUchar:
+			case cmd_id_write_port_uchar:
 				rtl92e_writeb(dev, CurrentCmd->Para1,
 					      CurrentCmd->Para2);
 				break;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 0850ae0015d0..fe81cf9aa862 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -158,7 +158,7 @@ enum sw_chnl_cmd_id {
 	cmd_id_bbreg_write10,
 	cmd_id_write_port_ulong,
 	cmd_id_write_port_ushort,
-	CmdID_WritePortUchar,
+	cmd_id_write_port_uchar,
 	CmdID_RF_WriteReg,
 };
 
-- 
2.30.2

