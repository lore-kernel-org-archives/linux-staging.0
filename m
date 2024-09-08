Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C67183CDE
	for <linux-staging@lists.linux.dev>; Sun,  8 Sep 2024 19:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725823608; cv=none; b=T1YQ+MxBbSAG6E91aRh8V7Tat0jAkwMwAzCuOfQX8o8rWXzBYeftnzZz30EILELBPFAiJzMCBTADGxmq3PvUvfujpZZqe+GE6X+i/LAtojUaHyShRx8BfjZWMpDtQBhXb6E3oPsMoJlVCbjIb9uTKQDnycROI+lqYjMIMjr0Bbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725823608; c=relaxed/simple;
	bh=GNDbS0umag34Ow3QhNqy860zt7/gRMadMUGvB79LHYA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rvLhiVQBcfSEZ+wignWBKsZ+/ZP5KhiWuJknjMsPOQvmZfv7A7FkggR2qIsfYfVarulbCD9KsRsiLHpwSaFPqTTBpo9p6qRJO4q9PPQF1cW3oGkQapzC3urHc+7C2Gg2g2DcKfvGo4TrtnA783XP4GL+43a7Sa4rpSHOgqsCSFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=EkePji2p; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="EkePji2p"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7c6b4222fe3so2469945a12.3
        for <linux-staging@lists.linux.dev>; Sun, 08 Sep 2024 12:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1725823606; x=1726428406; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tqCCIR0Jh0d9TyP+sguj0pDsMoKfiPe8e6/V/reMWic=;
        b=EkePji2pui4qJTjDzIfNaZolh3EVSElamno7esFXP/a3vDbxbkFQe610djGeR96h4z
         6fp1DJkX9dyrcDPtP0lLRhL8x9wWbZ1TLWmdudPpZnTA+8viRAG5stYTt/sOGXyb+4AY
         ebT0e2q/ySyzPpxPZzWU9f7n/RXMUIbTVZIuR/sZG4sSjm8oR1vB+0/Zv/Bk6O/pbr+z
         vqpMxcozkjCUWpQauvL2lKGh0eplYFEOSNV7UV3OH0DpC9avmimnW8MGF52swcs9f1Et
         xM9oKxPJcqyiNIj3AaZnMTbciB5HMPdELEwmFSVYmkkEPm6kX4HQd2jlHjKtvBI4R7vA
         MMUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725823606; x=1726428406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tqCCIR0Jh0d9TyP+sguj0pDsMoKfiPe8e6/V/reMWic=;
        b=wvMOQGldlWL70w2eR/ibTjMinG6ESmlxiHCD+66cwYbbQqUQ2HFyTSAVtPTZiqz70D
         7BRMveMIH4arOBTwTzfO2gsXCrFlnVcDiNzy5pPwytNfAjWS5f/QWJwXzcG7KJ97pO1N
         QtvCvTGChWUGJ6oPS9C2iVjR7okxBPIa6DSPgmoX7Men7XzLMxsRbmH1es19/o0k8Yr8
         wGnF3V7wViHPf3gVP/me30l0TehMYJ6PEmHNGP4gyt2Z+qi0J4jhVZwBVn18wbBnsbWz
         PU03IK3gNEJXWewz23UwMBAqeLV4oeNidzJDHJ4wxVD0zwD7WwsJX0LV8Y2+zBc55f3x
         J1QQ==
X-Gm-Message-State: AOJu0YzKLnz086rUjWWLaT9X47u5+NV6ZvX1Z42gXt3HAaw2QboYmgsF
	OwuDyRFLcKZXDgoIMkWwayW+UWqixorGlF4cAkn/B23oSajIRqxSkoViZ+mejU0=
X-Google-Smtp-Source: AGHT+IFf+CJ+L/oMeqQ3S4xbOCAFT6SydeZF6Pq1lh9SCPpH4CJrBlA3KlPQrllXs236WcvdDi8ryQ==
X-Received: by 2002:a17:902:e543:b0:1fd:8c25:415d with SMTP id d9443c01a7336-206f058c6bbmr148199455ad.36.1725823606155;
        Sun, 08 Sep 2024 12:26:46 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710e1b085sm22703305ad.36.2024.09.08.12.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 12:26:45 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 12/16] Staging: rtl8192e: Rename variable isEncrypt
Date: Sun,  8 Sep 2024 12:26:29 -0700
Message-Id: <20240908192633.94144-13-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240908192633.94144-1-tdavies@darkphysics.net>
References: <20240908192633.94144-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable isEncrypt to is_encrypt
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 76792268629d..5ff3fab72589 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1726,7 +1726,7 @@ void ht_set_connect_bw_mode(struct rtllib_device *ieee,
 void ht_update_default_setting(struct rtllib_device *ieee);
 void ht_construct_capability_element(struct rtllib_device *ieee,
 				  u8 *pos_ht_cap, u8 *len,
-				  u8 isEncrypt, bool assoc);
+				  u8 is_encrypt, bool assoc);
 void ht_construct_rt2rt_agg_element(struct rtllib_device *ieee,
 				u8 *posRT2RTAgg, u8 *len);
 void ht_on_assoc_rsp(struct rtllib_device *ieee);
-- 
2.30.2

