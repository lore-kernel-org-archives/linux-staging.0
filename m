Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7222C1586
	for <linux-staging@lists.linux.dev>; Mon, 29 Sep 2025 06:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759128651; cv=none; b=jp3bGzV0waZ95YmHWVtbibHlu3wkgAbGiUXfOPmliFW6DwFXwQOtj1aIrVMR3PMsCVsPpGeruRcKW1qPiNhw675/pQTdv7eX7jmSpqWpc9PB5/S69/4YUjfdN3zU4qOO3CiL0pEmSALUutMyJGYQ2ui5q7UshfzzUeTCvygIxSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759128651; c=relaxed/simple;
	bh=8er5g/JdtGmDLwAxnKtTLLBjMA31RvembXwPpxkN0eY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gfDN884eP0NoHIj5X1hZ6zuFvzcc5MOkqusA2EGFOPVCIFP0ft7xrqiHEO5DtzRKWju6/b1dNkgzaC/T5SPImd1b01mBsFvt44Dtey5nU7WkEpJPKfUO5pKozAHBSB0zWgRhaVFDNOTaV00DuzRon4KmY5H9wPC0srhSsUORLcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AnKKvv0N; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AnKKvv0N"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4df0467b510so23571451cf.3
        for <linux-staging@lists.linux.dev>; Sun, 28 Sep 2025 23:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759128648; x=1759733448; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vNzQSvDGcgGcsxPnJpDh3vO9RZGdTNfhmCnJqVlYiLo=;
        b=AnKKvv0NeAgPkhEpwCxFimH4UesV69GfbdeL65dBWuRySzwUQChj7YMI8qTUI0HU5U
         w8H+jedk4vvEnBKzYMqeeGAhFzxEUdNBHggnSUSNI+rGAF8O9SKmqBu1zx7bPXmFOUTp
         iZtB88koolNj0UuLTa1XLOKofx0oOQv1yC39VEGOIQkz/8zu5Dm5QMNyo3TaGaOm1hZH
         BfzWunRIwj4LuzS2Pg4vEwN10lvJ2MctInk0qAFI+1Y2QVpkYtSqARliZWe4zcXwDPLF
         OW3lUzMMVqqDK8wdpgJYIYyRpvxGD632ozI/mEojwPRuqojBA/Z9ZeslXCDvXNP4fY0P
         AoTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759128648; x=1759733448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vNzQSvDGcgGcsxPnJpDh3vO9RZGdTNfhmCnJqVlYiLo=;
        b=A2PHx8yAwZ/02ubiF7KkhhqFluPcU3hSEJlABkoJKpzRzqRKmpkkpiGVT+hqbkxump
         b/py/WDcDeWzHajZR5Ui+UnxV0nF3Gw6qp+Cx7Fulo+nNYDIMHf/0WTy0jbfHheNewrq
         PkeaYOm/ZaPztYwRIDeTO99gNaE4ACBqETwfU0NjRjSfFuhHHVOlhHPMhJRYztF1gR3l
         OulWp3jRPmst92uz/+HOQ53ATcLGTJ+xuFVRYEr+fj6EC2iU0SbaVAu76lB+T0kmxNUq
         02N4vVsxtsFE4hLVVe1J+s0/EY5DI15WknkZ42Kt6YTERLzRSaRWAQXmaE7edxDrgqAH
         lifA==
X-Gm-Message-State: AOJu0YzdnDIaAxV6lQTxlk10PBj+Ny00rRzpkg9tkDZ/S1MIZi0g3BE3
	hO1ieEa7VsDoq71of8X1PR79nCzIZgeme62LbdExQpbkxgBIv17Oevtb
X-Gm-Gg: ASbGnctZDzrcH5G7sX6NGnblGEd32vIKAmEHughd+ELqA/hf9mJ1KAFdBT8uE6gm5/Q
	hJbn6wc/asCgUM9xu/tuW5amuAHcf0ZC4WzQ4mmyDrdBdEjXtf39lnvN2cgLWJ+xs3IA1cLNSSJ
	qk3pogTXsO1sfe+ddGPFUgmClgiSD2hmcJ5nYUf5v4nmgJjoW364B9YeQ1pGKDKCTEUWk2jKLBx
	S6DvGrjpIElrd4+8Ir1YElo87uvuX943tgydwLGSIBQgtZPo+gERd4py8IeOkqQA+jT6z1paeAN
	J2LTldAljxCULECeAX/zhCshfXv/JmCT8BWK5YJbS8+CaQFWB0Z5kDAGocz23PtFTF35CMIV5I5
	Q1FDsW7/W2qFjOc6WCYOyDcQ9TcpA6J0Ujchm/bjxShqZdgAONFDWejpVxD+uVw==
X-Google-Smtp-Source: AGHT+IHJDdHmmS3a9PUHcJC4ws7x1A1sX+MEycaSbINCX8m8jxAVL3NxscjrVx7k3N22CtTBeQLfiA==
X-Received: by 2002:ac8:5856:0:b0:4b6:2be2:e816 with SMTP id d75a77b69052e-4da4735508amr200457451cf.8.1759128648449;
        Sun, 28 Sep 2025 23:50:48 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4db10874bb9sm69517671cf.24.2025.09.28.23.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 23:50:48 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH v3 09/15] staging: rtl8723bs: fix excessive indentation in nested if statement
Date: Mon, 29 Sep 2025 06:49:54 +0000
Message-Id: <20250929065000.1010848-10-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250929065000.1010848-1-vivek.balachandhar@gmail.com>
References: <20250929065000.1010848-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adjust indentation in a nested if-statement to match kernel coding
style and improve readability.

No functional changes.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index d05ff073af2d..a2b1e34765ac 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1254,8 +1254,8 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 
 					ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue, pnetwork->network.mac_address);
 					if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == true) {
-						if (ptarget_wlan)
-							ptarget_wlan->fixed = true;
+					    if (ptarget_wlan)
+						ptarget_wlan->fixed = true;
 					}
 				}
 
-- 
2.39.5

