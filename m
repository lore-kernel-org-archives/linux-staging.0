Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E4D2C859
	for <linux-staging@lists.linux.dev>; Wed, 12 Jun 2024 03:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718162561; cv=none; b=s66td5ItIS/knK/Ki/PBIhM0cUPsla0mympRK/bA9RrM+yB5yygTA7X5c2AvMkTof4nYogY/7L/cl4sjLrz2GrFUQtJhiYVPoTYyTzyhT7jHdWQq06lnpDAjQZRk0EtlYBxQ1xH+PvmQ8BMUlhtIuvZh3UJJkyRqT25DPotGMyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718162561; c=relaxed/simple;
	bh=jZscMWxL7wrIFx2GZ4mN7wJ5/mjd6vwOTRZBjWSLoBc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CZ/if1z+aZcyJuGZHT5cYWPWBC5VHq14d6U7GWCM0FDq5PK//nsm9E5qz/gUgrqdCK8upB+kTG1zrWYrd2n0YPHZ8LHqA891itgu9YOzYAs4dwOz21OiEqTaUL6dehKeNPkOSoyMuR8XGMDQJJELK4s87KnZ8RlbzUHYhmOuAzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=lEG6QyC1; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="lEG6QyC1"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5b97539a4a5so3505503eaf.2
        for <linux-staging@lists.linux.dev>; Tue, 11 Jun 2024 20:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1718162558; x=1718767358; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3pqpAJUhbdkefnBX1dLZjdOSci96N6yUXA1/JKUCTg=;
        b=lEG6QyC1jakA2YwbCWT347Hr6r4/E/1RGpW6pfM5CSquMYQWKHKJJ+EJGw+4xFohVW
         0xPyPYWrEMKF/PEpFIktJ71d1ldKZ3bVsj8ywY55XpBb0Mg27JvU/vu+w2XU9katbNWQ
         jYU6vTUSo8BP2WUo7YIonrgWit81Ie62lNK35roRQx5n5UMzb3reSA3bcKsJdEmK8asU
         CTg+0Z336lacQmqhEzDoktyF4EEONeQ5chounO9I5lOCHjErX/Jv0RpUhG2iFfPnG6JG
         xbCSelR55yFqGrFjaD+vdNSQilb5UQgABNrUbGbP4IwDIAuWzLiFy6ik8uDHVYvh529R
         gsog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718162558; x=1718767358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3pqpAJUhbdkefnBX1dLZjdOSci96N6yUXA1/JKUCTg=;
        b=eW/d4BJekxuF0qOSmfkvt+f9JmbPH/N5MV0oVAURCkYaziXUJUFnm30Kfr5R9qrtd8
         FwqZBsLraGFvNQmJSCAFvDIwXAtQUE+OhqGXGxUqwmhybuurVXSL4lPl6Ih4LPh7w/qA
         EGwl7hBa+vrdYwyT99e7WZGj+Bgq2QDAB9/AYMpt7XnPyoTR+Lx66lINqNMZAY/PUbRc
         0RCjg61p5cYic4TsKsPCbYImwQyXUNBOzJw+K8SAIRAwW40vOETfNlWb9DSJsMgJIejR
         U/3FF9otaM88nAhqcPLARPRi42Gu9QXARtAxoLWpOrVdCG6Rk+h5nBd7SIibQCoUasu0
         q3+A==
X-Gm-Message-State: AOJu0YwT5tTr4jvs38iTD7JPPXa+Z3C5HlvOZwn95nlc5M35b+P2o1bP
	XVvRtzGk/SPdicXc2BniRG75NU4ItsJHZRtmg/tuPu3ng33spS6EPB2mj4BbP3zf0QIF6P29ilv
	62CQ=
X-Google-Smtp-Source: AGHT+IGqui4QJBWV32iB7YGIW6z2TauZoN4z1bETO7wduWaByH9ah0NJvmU1zTHqXN4T1LrZQN3/jA==
X-Received: by 2002:a05:6358:8419:b0:19f:3ade:eb78 with SMTP id e5c5f4694b2df-19f69d866c3mr93468055d.28.1718162558054;
        Tue, 11 Jun 2024 20:22:38 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6e8e8a84949sm5635411a12.32.2024.06.11.20.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 20:22:37 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 06/24] Staging: rtl8192e: Rename variable bRTSBW
Date: Tue, 11 Jun 2024 20:22:12 -0700
Message-Id: <20240612032230.9738-7-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240612032230.9738-1-tdavies@darkphysics.net>
References: <20240612032230.9738-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bRTSBW to rts_bw
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No Change
 drivers/staging/rtl8192e/rtllib.h    | 2 +-
 drivers/staging/rtl8192e/rtllib_tx.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index a305848dabd5..0131765e451e 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -119,7 +119,7 @@ struct cb_desc {
 	u8 bRTSSTBC:1;
 	u8 RTSSC:1;
 
-	u8 bRTSBW:1;
+	u8 rts_bw:1;
 	u8 bPacketBW:1;
 	u8 rts_use_short_preamble:1;
 	u8 bRTSUseShortGI:1;
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index be8de6703e5d..8c9072538688 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -376,7 +376,7 @@ static void rtllib_query_protectionmode(struct rtllib_device *ieee,
 	tcb_desc->bRTSUseShortGI		= false;
 	tcb_desc->bCTSEnable			= false;
 	tcb_desc->RTSSC				= 0;
-	tcb_desc->bRTSBW			= false;
+	tcb_desc->rts_bw			= false;
 
 	if (tcb_desc->bBroadcast || tcb_desc->multicast)
 		return;
@@ -447,7 +447,7 @@ static void rtllib_query_protectionmode(struct rtllib_device *ieee,
 	tcb_desc->bCTSEnable	= false;
 	tcb_desc->rts_rate	= 0;
 	tcb_desc->RTSSC		= 0;
-	tcb_desc->bRTSBW	= false;
+	tcb_desc->rts_bw	= false;
 }
 
 static void rtllib_txrate_selectmode(struct rtllib_device *ieee,
-- 
2.30.2

