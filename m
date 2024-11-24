Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B74B660
	for <linux-staging@lists.linux.dev>; Sun, 24 Nov 2024 20:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732478996; cv=none; b=eEBrtlNKlpPRw+7GjIa1GvSzkTLaHYqtygE9jDCjQsB7f01gMa0y+MrckTeMHLxgI0Nn0ilY896l9lxs1lMX4g90OQkZGnah0Bmjbnv+g7jJDl6MGsHXRDeYjzaJvjDd+hLXEW40Hwcg8EHrCgmkqMcoelsWZA8tCuwHEVKRrRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732478996; c=relaxed/simple;
	bh=hlqPQuS8ofAYpPfraJUnreUPZH3D1P/2FWLM9df7BTU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ewlLzUsmx9yRiV1syulH92wAKvl6u3++GBLyovCW6jhDLhhYogK54EppqQaKMZKsaCgWIEqnXaQvVoLIY5Dcbfq2bDsv4kahCHwUpG57fjsYYWRqbSmKLABmY38zIpvtNgkkEaClz4yFRFR6W5Lr0foNvObWzw5xqvdSWahxVBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XaOJsehy; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XaOJsehy"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-724d8422f37so2559669b3a.2
        for <linux-staging@lists.linux.dev>; Sun, 24 Nov 2024 12:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732478995; x=1733083795; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Garqcydm6d6hOSEnkqfwcQpL+EyitpGGI+ocpotqa4c=;
        b=XaOJsehymb/Zfqj5g26i26RlFPCOkG5C/SJIds8BLvPb34e3JahXZFeDvNcIsbKldC
         3A9P/kea+3H5sXnC8SPmDsPN+fDjXjMImzXA8AfwouPaxDYSKwTovRBtZeyrfe2RluLt
         xmJ4/S3sYeSP0xEnOkIW5+0hJV+hWRBgDATaOm+MUZtfuJI0FoqsWJt7a4LbJ37R4Cgp
         4wVC3Aez3PDwTvlkHV9+XgshLoVjqYelJ0r/0RmJWWPiIX3n3A8Ylk/r93yyEaE+A0tp
         0MPmzqAmeFQR0l9SnDLiVqoyKjQfdpwlfopjfVpIosQmUjYMYjVCYt7f4X3Jn33oLqMZ
         +ddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732478995; x=1733083795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Garqcydm6d6hOSEnkqfwcQpL+EyitpGGI+ocpotqa4c=;
        b=tjyMGp85IaWbfAp+D4K/zvc0Nd1+APa9Esya1UOAmzcreIlW1/eFNC4RFZPajf3m7k
         PMO4HvBPp7K0D0sN02Hbj6yyFsuSZQoEMkQVXsVY6PFd/WaTkL4K0asqxsay1igrrJU9
         sz2GRcr3yCEW/FajF5XCup3ch+xP7eMXcyi0Ol0DX06i+iIX+Jsw/xmyJERwqQcQpCO9
         7DeSfxQV4ZBjvyaivdyjc0UkBxjQxPKqwHmxw/gtH1DThwPZKF47xKCEGFWoyTTiaS7x
         7NDRA7Up2m75pAo+H3imknkF6XEt/9B2FRqXdAZuRdRgar56ljralj170RJ7E1yWBFzw
         poXA==
X-Forwarded-Encrypted: i=1; AJvYcCVQOg+GNrVa9JaBZsTd1kPPkAmc1+/511JijHEUlSFmMdGrGyZtyMJiv3A0IPcZIHv76S/1UoAu5llscb2S@lists.linux.dev
X-Gm-Message-State: AOJu0Yx84fprVOvea3cHuLnD/BZ/jPamrBAt9+eMgoI9xyLIegLv5g49
	+KNsaGOpTGOahxLhwAfluTZ1oWISWsG3TkJ7ObxBkujVEziqC7eLPtr4vaD8
X-Gm-Gg: ASbGncuckkz4j7Iwkm43Q977i7osjlvtPAyYvv5V1c837MkxPw90uCvONNAwyxHPHCt
	+hx4QO221UNIvgK8jiavs9Ii1MoOfkZqc6a7/A7R4MrK8E6yfa0oLSALb8Za+cuHZ1OGPOIxsXk
	h+4YjZbI2cfHipWQVA7oq8tmp9XwRQBNDBlxuEZS/DHLlnHmKQj8amfViwNwYtSLYExqqKxWTFf
	CsybjZshvObN0KC8hmWAOSFrL05UwTdUXMhUhKxFSxTEBXIaecU3GceNq3fwq8q+UyXmRG5Fg==
X-Google-Smtp-Source: AGHT+IESq8ReY8EvXIJVDV9iY0yFrIx8i65dKaW8cXabuqo6IeLRwhk4vuvzztkiAP89nQfKLe74FQ==
X-Received: by 2002:a17:902:d4c4:b0:212:f64:8d9f with SMTP id d9443c01a7336-2129f7c1228mr157928095ad.32.1732478994603;
        Sun, 24 Nov 2024 12:09:54 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:4c64:81ec:7409:107a:a63b:a3da])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dba22afsm50280195ad.73.2024.11.24.12.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 12:09:53 -0800 (PST)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: fix broken code when cflag is used
Date: Sun, 24 Nov 2024 17:08:22 -0300
Message-ID: <20241124200934.156252-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
---
As noticed at [1], hal_com.c is not compiling with -DDBG_RX_SIGNAL_DISPLAY_RAW_DATA due
the changes at [2] (a few statements were not replaced with the new struct).
A little discussion was made at [1] too about how useful this cflag was or if the
code under the cflag should be deleted. I think there is no harm to keep those things
as is since we can easily fix the error.
Tks and regards.

[1] https://lore.kernel.org/linux-staging/f61d8272-4af3-40d6-a333-e7731c3fc5ae@stanley.mountain/T/#mffa281a89e67c609db9b125878d5b8d090776812
[2] "staging: rtl8723bs: Rework 'struct _ODM_Phy_Status_Info_' coding style.", commit ec57f8641fbca07bbb61a75bd4760fd7aef86860
---
 drivers/staging/rtl8723bs/hal/hal_com.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 95fb38283c58..63bf6f034f61 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -906,7 +906,7 @@ void rtw_store_phy_info(struct adapter *padapter, union recv_frame *prframe)
 	struct hal_com_data *pHalData =  GET_HAL_DATA(padapter);
 	struct rx_pkt_attrib *pattrib = &prframe->u.hdr.attrib;
 
-	struct odm_phy_info *pPhyInfo  = (PODM_PHY_INFO_T)(&pattrib->phy_info);
+	struct odm_phy_info *pPhyInfo  = (struct odm_phy_info *)(&pattrib->phy_info);
 	struct rx_raw_rssi *psample_pkt_rssi = &padapter->recvpriv.raw_rssi_info;
 
 	psample_pkt_rssi->data_rate = pattrib->data_rate;
@@ -919,8 +919,8 @@ void rtw_store_phy_info(struct adapter *padapter, union recv_frame *prframe)
 		psample_pkt_rssi->mimo_signal_strength[rf_path] = pPhyInfo->rx_mimo_signal_strength[rf_path];
 		psample_pkt_rssi->mimo_signal_quality[rf_path] = pPhyInfo->rx_mimo_signal_quality[rf_path];
 		if (!isCCKrate) {
-			psample_pkt_rssi->ofdm_pwr[rf_path] = pPhyInfo->RxPwr[rf_path];
-			psample_pkt_rssi->ofdm_snr[rf_path] = pPhyInfo->RxSNR[rf_path];
+			psample_pkt_rssi->ofdm_pwr[rf_path] = pPhyInfo->rx_pwr[rf_path];
+			psample_pkt_rssi->ofdm_snr[rf_path] = pPhyInfo->rx_snr[rf_path];
 		}
 	}
 }
-- 
2.47.0

