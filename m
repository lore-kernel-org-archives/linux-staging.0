Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2AD1D9663
	for <linux-staging@lists.linux.dev>; Thu,  4 Sep 2025 01:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756949366; cv=none; b=RNNRZ3pV280j91mH9ifQEqY+xxiMwdCQzcuhoaBmAm8On1DOcK4Dtx2T5t65oFO2dC2v2WLnvqFJ8jZItPyLPhp7442Tl1Wfh6Z8/ZSr7ETQ3O+Dv5ICk1ukrRoOjaoB7+Hcfjc477JpdopGLtgkRSfRjWl+Dqyx1ufbUPUz4B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756949366; c=relaxed/simple;
	bh=1L6YyzW3erKcj33GY/6Si2DL2c5yax3FQGavbAJ0Bgw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GOFzkEpQP5Okm0u/xLB4JN1ABEnrQGKpeC7a5xvUEHKIFH2LzK4d4ihxUcA2tClthnQ4Wu9/Auq4stJ4eVumyi73eWfL5ewiTuFp+/48M1mwCRLXd4CPESrl0sF8g7GeX2lFwkHe7W/MRX21x5WejHp0L4MI4CV+eJ7NLM6mAZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kd/Q7Xez; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kd/Q7Xez"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4b3d3f6360cso6567041cf.0
        for <linux-staging@lists.linux.dev>; Wed, 03 Sep 2025 18:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756949364; x=1757554164; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d01B01AXVKk9If9XJH5GhITUvVOiKXQj/np/FqkF0PA=;
        b=kd/Q7Xez3BKbStD4DueuDfz0mxj7AkA2hunmOHY8pyE2aySxMiaX8t9YyoaNRxhu91
         96xP4Fzlylxg6K2yFdH8lsYZzkx48OzNNAkc2Wshn+uk9KSZASu5pK2jBgOC1GlM7F72
         8NJRGnW6LoiCKrPTK/LrRIRYoGFr8niLNnhIoOgiT79V62//mNLNUQ1DbydQyzKoir5h
         MHdkLfX5GDO7u8r6Se9y6PLmGr5YtB/HKPl2/EtRBi5EUX2GYFnyrpXFn+uJ/x/3RugZ
         6xInZWVyO/ivpz+gLEcA/SB/xKK2okuS2pWzkMG5OPUVXPqMbf4qU++WOQRkDiEUu44D
         XXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756949364; x=1757554164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d01B01AXVKk9If9XJH5GhITUvVOiKXQj/np/FqkF0PA=;
        b=EwDT3CfR0HCt6650gm4Ib5COwHmuVuZTJ+d3R7qHZx1aFveTEYU21fjhp83ne5nbyV
         2slFmHi+tziU1lRjuc2olWyEuCxDWgGfNHOG9sxBIjGI6lAYjgcfnWZ4Elgva7NP4w0J
         wN19uSnyEwUpXprke46aUH+OFPJW25w76j8bctcxvzgDYGKXhEAultTD+7zR3xdPz7gH
         Ulq7/pK8UPynD9Gy0HvdANfGKg/l354Mk2prRlMGrCxdOOHD+ZJa/KYJwPr44mKVKiiU
         zxfJyO+4jWFjItKdhdpIW4Q0VNgPpQZX5V9F9YwDQLJRO6Q9MuJnq2lVT5mlFXQvdvrw
         G4Sw==
X-Gm-Message-State: AOJu0YwJOQ8ibABE8E+zes++u+jWP6ngmhP6TMVA4qAxuxKF1bGIle75
	mBtZ49rHKOMTJsJRs70W3B4BpQqKZOfRiI6NltEm8iPmN3NHC15ixJ8e
X-Gm-Gg: ASbGnctRiu8ohq0UF5somkQkmV2AaAy5jsWCPCY94Qtupi/n4tE6xKOa0rmiLHnyqYk
	G75sVUIVcowHItY6zp35rYYqyNK3ZGmsNwmiZtPYyy+k3mpsiZAtm3knLzJ4EWfmtp6/OoejmyL
	NWEFiUvzxvrhPnwAvW5nqmkJZkP56kmkdVxlTnrd/KK/bkFDVDiIyNcirbWCiz0QCkOH3djZK9W
	dYsCADT1j6uZyKEYPWWI1bubbQUTy3N0Jcx20Z/ctXXM1rPUsz/EBsXvVqdjORItqJuO1NnQ9P0
	0JCL1TG6J16fak8qLlg6hcwNtMeFqaehgsVJJthzgjxV/7b2NyjSTS/Sc/XKoaMaH6eBeCdaaHl
	m/5IbqeM4cW/LBtuK8SNX5Q9XZ74V2SGcqRL2SxoW5fNk88PwCe4=
X-Google-Smtp-Source: AGHT+IHDNa7ZJksOVETNfIHr60YU5IWFtrsWzQgmzDu0ISrjUT6IbIEYQbo5/u1SRfpfeRz7Z/LlMw==
X-Received: by 2002:ac8:7dc1:0:b0:4b3:775:ba3 with SMTP id d75a77b69052e-4b31dcd0f3dmr218186741cf.49.1756949363780;
        Wed, 03 Sep 2025 18:29:23 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b48f78757fsm20378921cf.43.2025.09.03.18.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 18:29:23 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Subject: [PATCH 16/16] staging: rtl8723bs: merge nested if conditions for clarity and tab problems
Date: Thu,  4 Sep 2025 01:28:59 +0000
Message-Id: <20250904012859.215565-7-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250904012859.215565-1-vivek.balachandhar@gmail.com>
References: <20250904012859.215565-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Combine nested if conditions for clarity and fix tab indentation in one
place to match kernel coding style.

No functional changes.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 80b4dd1e8353..4fbb180398b0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1253,8 +1253,8 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 						rtw_free_stainfo(adapter,  pcur_sta);
 
 					ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue, pnetwork->network.mac_address);
-					if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == true) {
-					    if (ptarget_wlan)
+					if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == true &&
+					    ptarget_wlan) {
 						ptarget_wlan->fixed = true;
 					}
 				}
-- 
2.39.5

