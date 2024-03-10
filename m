Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DB43C068
	for <linux-staging@lists.linux.dev>; Sun, 10 Mar 2024 23:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710114961; cv=none; b=BJq/VHCUf32gCHKvKIZ8zEmlzb33Zeaa+Zi1Um7P45VdNVXAa8WGKlIvb/urq+cpGmi70Px1LZktH74QwXMAix1DNOmwO82ndYX1JFUBkIW2XYpMzFOR+G4u7JT877hXqXlksn+oPmMa0lIW8OirAQ30nSD/ij9Afbb4OC3u2Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710114961; c=relaxed/simple;
	bh=/7W2TBTFMXEWX5q4IZIqxcsH8VjtOr50ERYjHCmesi0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rca/AsKW/J1FCSo2pSW5DHbylENPOJb3evPHju2t/C5gFv4IgngtFP+rmexRq2oeXHfONrEVJ0E4nggicCjedd66mpejFbIutLn3uiuXNer60TmFttEQOAX+gEaEtUvhWTFRSGX27ebDS/dXCzkRi5zCdT69zb1nKIfLrg9l+Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=lMVCMbjb; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="lMVCMbjb"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-29b7dbe39ccso2566131a91.1
        for <linux-staging@lists.linux.dev>; Sun, 10 Mar 2024 16:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1710114959; x=1710719759; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SFuDApE8FQFMLl4CuhW76of50jVUBMd2o0lVaLFxbvY=;
        b=lMVCMbjbMBDuJz0e/XLlEeNxfTtnp6bw098pb0/KL1G8o4+810jIQ+r+MLflit6M9i
         2d7RPXGpF01N1BjIDJWnbxrns7RKZJsxze6Vtp1zAnOQyJX3qi43nX+mmQD1i8rj+B7P
         B1CLGfGlLqWedDSnq7cog4L8ydXn5q4YRHuZMn+opR2tZn1RrSP1HnMip3f0uIkh0deB
         gYDI5qsZ/jrSojhRpzS78z3I/fUG7grwTyBMuNoJmYgQ1J6UaWj4ey2RDrBcBGorxbhv
         +YiIuJlR94dbkFiX5eNFURuDX2GQFeP0ZG6PKyAth+wZi+bc+TboP1Mwnwq6hZKhFBGi
         /jCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710114959; x=1710719759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SFuDApE8FQFMLl4CuhW76of50jVUBMd2o0lVaLFxbvY=;
        b=d3x4grzespfRuvccSSCBrSYlvbXHmpzMMziu9cP8PCbEG+9aD171SUzZgCNjhxitCx
         qOG1nzgsZrKg4UUxNa0dl3+Eb+1lVhYxYCqz+Pi7L6QArGObVqNJMO/s+TJ7qqjyS5XZ
         r0B5wjUbSZ4DdRA2FBP+aUMUraZDpzlhc3g1HH1wO3XhIZI6JVnDwQ4sFS0GUgy9AQyU
         3Ln9v2AlRi0eD6rEn/zm92QyWOBUHv95xx+cjtxbdE5ohXYfg5PYPWiYjKhR8szOlfXP
         NGpoR8AT64Q3pcAV+f6viWa4U1uElGJ98eDoF7lGGkSvBa5pJx/wU3N1HLa/PyCna3uM
         U4XQ==
X-Gm-Message-State: AOJu0YzZ2B/oGg7Y0/a1dWbQH9iDIViRxtur68wA4CKpug7m6oUvr5J7
	Nj5x1HmfOcBEpIMiNZkFL9UNREE1yCiyUnmnJXuDeesDGb9Y54ontOjQobc9ptc=
X-Google-Smtp-Source: AGHT+IFvNR7UEMWVzVCIr634nx0mJcfHMJDJZXdKUnyD9DRq5o0Osi1gfGQWUr1Eps07OMoJ0910MQ==
X-Received: by 2002:a17:90a:fe10:b0:29a:ee6f:58cc with SMTP id ck16-20020a17090afe1000b0029aee6f58ccmr7323537pjb.6.1710114959374;
        Sun, 10 Mar 2024 16:55:59 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id o7-20020a17090ac08700b0029bb29ef41bsm2903439pjs.50.2024.03.10.16.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 16:55:59 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 04/11] Staging: rtl8192e: Rename variable Frame_Order
Date: Sun, 10 Mar 2024 16:55:45 -0700
Message-Id: <20240310235552.4217-5-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240310235552.4217-1-tdavies@darkphysics.net>
References: <20240310235552.4217-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable  Frame_Order frame_order to fix
checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index fa96a2c2c916..dd0e2931b9ca 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -625,7 +625,7 @@ EXPORT_SYMBOL(HT_update_self_and_peer_setting);
 u8 ht_c_check(struct rtllib_device *ieee, u8 *pFrame)
 {
 	if (ieee->ht_info->current_ht_support) {
-		if ((IsQoSDataFrame(pFrame) && Frame_Order(pFrame)) == 1) {
+		if ((IsQoSDataFrame(pFrame) && frame_order(pFrame)) == 1) {
 			netdev_dbg(ieee->dev, "HT CONTROL FILED EXIST!!\n");
 			return true;
 		}
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index e165f1e32e7f..748bb25cbd23 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -343,7 +343,7 @@ enum rt_op_mode {
 #define IsQoSDataFrame(pframe)			\
 	((*(u16 *)pframe&(IEEE80211_STYPE_QOS_DATA|RTLLIB_FTYPE_DATA)) ==	\
 	(IEEE80211_STYPE_QOS_DATA|RTLLIB_FTYPE_DATA))
-#define Frame_Order(pframe)     (*(u16 *)pframe&IEEE80211_FCTL_ORDER)
+#define frame_order(pframe)     (*(u16 *)pframe&IEEE80211_FCTL_ORDER)
 #define SN_LESS(a, b)		(((a-b)&0x800) != 0)
 #define SN_EQUAL(a, b)	(a == b)
 #define MAX_DEV_ADDR_SIZE 8
-- 
2.30.2

