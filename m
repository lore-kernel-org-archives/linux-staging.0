Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FE33C47B
	for <linux-staging@lists.linux.dev>; Sun, 10 Mar 2024 23:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710114962; cv=none; b=alhwwivm4RDKo3U6FnLVsybyk8baWXcLBk6DAOFOTkqt5Z0hnoyF2O1K27UpLN2GVbIEmAoMZ0StmROz2CwDprxh0SKgw+LAlIq/mCXKBKM7HWN76b4k70KUV5wvcOJFecS8gGu5GV7nssvmAYORW0StaGnX52KyDKBTjhZk5BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710114962; c=relaxed/simple;
	bh=bweBxxz3LlZ0HmKixuMAFxkEfCgWUQfWz3S2D81EsJw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GiZRitfLfAL51x7POczReIkTtukBY3yeJhAr8WNSc+3RtM8MZR1eVJSGjr9GTyjvRIhNxd4SzAyavC/uLgdD0iXIPB1JZUvrcHvZjAjlsCe20fsp7Mi+j5oaVV+U7HVk6z64OADDvYCv0IRHbJDGoWMdyf0EnnpGA2T9rrPK8hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=gZ+0EEzy; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="gZ+0EEzy"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-29b70bf6c58so1938787a91.0
        for <linux-staging@lists.linux.dev>; Sun, 10 Mar 2024 16:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1710114960; x=1710719760; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vBTPiNFuf4aLeiCUUd1FRn8541x9xrCbKeUzzWFh6y0=;
        b=gZ+0EEzyV9UybJCnieCw1+u7SssYYliKQrLi8qpRc3JNQCSaerEj9E4Qtc8DVQ9J1V
         9gpG9LFE0PdNLnB38bXaFqs8G7nZpxKxKxrfJEkqbERw0NWxKzBLk8D3P86CAKkjYq1v
         M4eclkplpoRLkePIH/stcL1SjwAhsnOQ6jMRJyczx7yZMhcWCo5h3V0bM6MtGBkBveLv
         pcltBAWXuPve9qOWBOS23P6BkozNxSdgWcEm03N8ZDwE8UcEHbeimpuRRiDRt4Wkrry3
         OrcBOyNY8pZj8icSzNCdMHldiP5ajELfjef6cS3IjosTNaMPGyecRaGa5oOAy94fyz94
         fN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710114960; x=1710719760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vBTPiNFuf4aLeiCUUd1FRn8541x9xrCbKeUzzWFh6y0=;
        b=bsKBq4dDvat3tcoeBqMvTPgEjr6uoGk7Q13hExrLR3fO/D+ATEgnTUgVFwDA65bQcZ
         nt+nQux0j7BhbiaG+SU3O7kFZ+gj39q+INzTuknNCChixSyhD4Jm5RXfhVSXK9aORYRS
         uedVG6IhdhbXAtkPL5g9jalUfxB5csBV3Ic/ZpPEBtPa1f8UyQETWlwp02xQRwEFPnFo
         QDIGJMHBe2ZQlg3naYLdxUITG8+ba2nHZlbBJcIUqEYhTbcxetRgxgTi1EcvF/JydM1r
         KmAvM3DHFDsoZAwLSCOZdQ8YfdgR8a7UC1PmCQ/JS5yoyqMrQ+RaqafL0MPzwZEbqE5r
         Q7tw==
X-Gm-Message-State: AOJu0YyVknk98xKPEG//jaxS/K2DoyuKdINPSq5x0S4VWRspBMuDWbry
	bv05v2beCleey6AdY2sBLUznJrQDxvc7rT3kESjhJ76fQ1IG0790wq97gA3yJ2jHDFazo1I5XbY
	6
X-Google-Smtp-Source: AGHT+IEZmMmuGHF5Ga+XC93hN0IcCqDus5vAc6pEcEZMM5blm/JErY6CmFJSYnAk7cNANb0tFX9CVQ==
X-Received: by 2002:a17:90a:300a:b0:29b:2779:2a69 with SMTP id g10-20020a17090a300a00b0029b27792a69mr3712320pjb.36.1710114960070;
        Sun, 10 Mar 2024 16:56:00 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id o7-20020a17090ac08700b0029bb29ef41bsm2903439pjs.50.2024.03.10.16.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 16:55:59 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 05/11] Staging: rtl8192e: Rename variable aSifsTime
Date: Sun, 10 Mar 2024 16:55:46 -0700
Message-Id: <20240310235552.4217-6-tdavies@darkphysics.net>
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

Rename variable aSifsTime to asifs_time to fix
checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 15b0ac6e6eef..dcb78cd2e840 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -130,7 +130,7 @@ void rtl92e_set_reg(struct net_device *dev, u8 variable, u8 *val)
 			 &priv->rtllib->current_network.qos_data.parameters;
 
 		u1bAIFS = qop->aifs[pAcParam] *
-			  ((mode & (WIRELESS_MODE_G | WIRELESS_MODE_N_24G)) ? 9 : 20) + aSifsTime;
+			  ((mode & (WIRELESS_MODE_G | WIRELESS_MODE_N_24G)) ? 9 : 20) + asifs_time;
 
 		rtl92e_dm_init_edca_turbo(dev);
 
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 748bb25cbd23..640fb8abcfa3 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -299,7 +299,7 @@ enum rt_op_mode {
 	RT_OP_MODE_NO_LINK,
 };
 
-#define aSifsTime						\
+#define asifs_time						\
 	 ((priv->rtllib->current_network.mode == WIRELESS_MODE_N_24G) ? 16 : 10)
 
 #define MGMT_QUEUE_NUM 5
-- 
2.30.2

