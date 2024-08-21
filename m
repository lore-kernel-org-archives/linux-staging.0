Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721B615A4B3
	for <linux-staging@lists.linux.dev>; Wed, 21 Aug 2024 03:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724209746; cv=none; b=L4UezCyNGDu+dqQzl0Czpia1XtwW2R5bPANmhi3fgGFuYx9WP/j/I1euFOpGCa4CxErLeoIcJzPv7GRSbgohCHcuOkLq8m7HI/nHzG2y6KzIA3IEbvLry3PEzlu6MsNKzocUef6cTiQieLIRD4wfdv/PSsHLN6yI/QefT+AHegY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724209746; c=relaxed/simple;
	bh=nJcct0OpztddfpVdAVf6I4hnYTMXn6TsX8QZw3nz3a0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=vEh7R4Aq7U0q181nhtn4/PKlCyE34EIF43mE/m7OMh4TazuPnuAHraUyF3MZXeFpyCh96Mu88R8XQ3NX4Kau+q6QUKDDa38F0I0pRUBGzXxTY8WwFRsZ/y/79/F2vN1HrSRJo+pZhUFNyCrp/uBynRxI6p+dWv/F+jDCHkHkCrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=JS7iRuPp; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="JS7iRuPp"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7142448aaf9so170775b3a.1
        for <linux-staging@lists.linux.dev>; Tue, 20 Aug 2024 20:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1724209745; x=1724814545; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bkSShF0hrqe/gls8cgK85cQZIDu2x/vh6+l4HrmEaTo=;
        b=JS7iRuPpt3rSJXyV3QD9OcNVX8TfQcoOafE+Qo3c3S75TNmDum8qSAlPetgwOXyhP/
         VG44L7qpj9GgUvI5qVwbbVo7PWPH6bV/9TR9+qfoACs9xYhoDmIrB0ElZ91ltIlkRyeu
         30Nz+mveBPXCMIGqKUtINWn5LdR/BlIeR0atqFLKFPxgxFmsfDpOxw874QWYdXFi47GY
         RxFs2mwhBtQ5SoO3kTUKyt+hpNd2k6Wq8XunZ78EAtfYX2Dj0qzXUpWuiYe0i8rkKt4h
         xZfymxk4jHtyx5e/QCZB0oX3jrkwPZ60JmhBXGXQQIq6DUjL/HHL0zfTE2DZQcmbZb3d
         p9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724209745; x=1724814545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bkSShF0hrqe/gls8cgK85cQZIDu2x/vh6+l4HrmEaTo=;
        b=ZbsOdRGBJlsy8So7giXYS471sMDY9KA7UQQiMdYfZ4mOKe+bLBYZNlIyFHI1UmMdiO
         T2kkb8hTLUzY9TmR9BNsrSJ3enEXHVdcI+KuC4pkzANNAybU9TIjKpVVoxoLOPP/wqrK
         7UjoAAuLojd7TMSZMsyQe77dsJpsPfOfq+S0IUx8KFRbPBPpOorsV0znFP1qtU9ufm/n
         sNaWBTYKRYi01/8S7EtGCxuFZkh6esmiOBh8pm+7Vf/Mf47STwGqRGkFK28C9N13uT4f
         8G5ywXt3ig9YM+zgQG3ldVxGiBUeFktVTK46LRhU3O5PVrTEcWZ7vHGxrguEU2pPXQa1
         Gcjg==
X-Gm-Message-State: AOJu0YwEkDAef3Tl/o9hoNuQpC5/Zp2IdBqZSPreAkYx54tuogdJPrjg
	9660zbdsMB5YnvPsPUXmAw7ujB9n0Wpq2pNdDWdW+ABdG3oX7RNrCx0gBNGCkZc=
X-Google-Smtp-Source: AGHT+IHyIguUDs1vlY6oUjbOZZ8tJlMryYgdm279gMIwoUwcPTFtvMaTSMFfTA7dCvSXhm0ATJV6tQ==
X-Received: by 2002:a05:6a00:2ea8:b0:70e:aa7f:2cb3 with SMTP id d2e1a72fcca58-71423e6822dmr2273756b3a.2.1724209744514;
        Tue, 20 Aug 2024 20:09:04 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127add75dbsm8934404b3a.44.2024.08.20.20.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 20:09:04 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 5/6] Staging: rtl8192e: Rename variable CmdID_WritePortUshort
Date: Tue, 20 Aug 2024 20:08:55 -0700
Message-Id: <20240821030856.57423-6-tdavies@darkphysics.net>
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

Rename variable CmdID_WritePortUshort to cmd_id_write_port_ushort
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 8a1aac7e10a2..c49dd8094c7c 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -620,7 +620,7 @@ static u8 _rtl92e_phy_switch_channel_step(struct net_device *dev, u8 channel,
 				rtl92e_writel(dev, CurrentCmd->Para1,
 					      CurrentCmd->Para2);
 				break;
-			case CmdID_WritePortUshort:
+			case cmd_id_write_port_ushort:
 				rtl92e_writew(dev, CurrentCmd->Para1,
 					      CurrentCmd->Para2);
 				break;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 65b2929b7bc4..0850ae0015d0 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -157,7 +157,7 @@ enum sw_chnl_cmd_id {
 	cmd_id_set_tx_power_level,
 	cmd_id_bbreg_write10,
 	cmd_id_write_port_ulong,
-	CmdID_WritePortUshort,
+	cmd_id_write_port_ushort,
 	CmdID_WritePortUchar,
 	CmdID_RF_WriteReg,
 };
-- 
2.30.2

