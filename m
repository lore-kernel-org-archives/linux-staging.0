Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1ED81494AB
	for <linux-staging@lists.linux.dev>; Tue, 24 Dec 2024 08:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735030262; cv=none; b=oKZBCh6T4lF64C2ee0PcE5Q0GpjtzTRBu6uB5Rg9Ns1R31NzAawxvZeBhp9qXtYfIsPBTsdg6RBb7FZNArJBvl2liVzqs7XslsRKo8J8RxY5g1F4jwR2p4zN045QfNDKPY3qxMGu3eMTlG6GgfiW0W4iP0o24Q/1u8EltFXh7/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735030262; c=relaxed/simple;
	bh=X+mZ93ngTaM2XF36TsfdNV3dsZT32YnhrJznnY0wzxQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tQyFZz9BoHN1B2r5AlW+Z8o2CpPQ6b2SNpexo0/XnLY5Jxcv70DEGfT1ydONWq/NDsL4xWnNWK3tiL86OaH+AeWQJohKSc9V1c8+TIlVFyHTsVoUnoJcAre6idDlhkMmwkhV9YTHLPQF09FGKkcNAR0aFHlFMO0+dh0dX8pEyPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eVj0Cgjn; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVj0Cgjn"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2f13acbe29bso5053884a91.1
        for <linux-staging@lists.linux.dev>; Tue, 24 Dec 2024 00:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735030260; x=1735635060; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pFaAhG/V1/HrY9oik5GMlHKl+zhkdejR0kTjHoEnx0c=;
        b=eVj0CgjnFHFa1IIOOutWZIBkDXpRcWgoreuQ1JU6IyjbMFc8nij/sbLxpHHQ3c5Ycj
         f+FhQCv+FrixBDIKvxVVCJY4XPqRjf5odAE8d81OvBhH+31KLwvv1V2Gj+rnjmzxAZgf
         54AgnBWJCVXMrmIpj7NCIlW9i8zypHXJHng+mPXqCGRiRWBHGI+16I6MIHd7jzISyb6e
         oZXhp0GQh7oQafX5rHIPVyL+pKCKbpDfYUuyxCrY3Zpg+up/t6vX3MbROIEO+4BHgJ1e
         +7RrCKJBxhtD3f+dwBDraT8QBNCR5pJvv8Z11kqSaBkWjPo2BfYaC+9Ihts8Xt1b7HFD
         Ri0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735030260; x=1735635060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pFaAhG/V1/HrY9oik5GMlHKl+zhkdejR0kTjHoEnx0c=;
        b=gZjmBy6O4dxJHoH9rOlvlQmKZgM1G0ZwVjTc5R1k9CIvfPuhv/rSpXDXkifOGRDxBX
         g7A3VRqt9ljqVb9HEPXCx8C+38D+MleckJTuyCVmlNJMb/Xn6YYL1PApNZHwh1E3f25i
         TzY9Qk8u7plpnFCBayWSrNp0i8Rp/AmFy33mwVcFAi27ljuHVh19cm0WMiuXgMY9D8UA
         fh/ORpLZXyNpzfgaz8qBObff2E+aVmCE1Kf105ZFAVixZMUX4YxRg0BLssVihu8MUi/8
         b8af94e57XPfVjm/KanP4fiUvbO1Iz5z4q03kDOQ/Vjy5P0Sli9wATl5A1Y1eBGhQegf
         S83Q==
X-Forwarded-Encrypted: i=1; AJvYcCWvo4rg64xGcU6cymEnnjIQRccw7vmCUvFXRX6VUnh7ERJZEHxHMRNNtJwZBGl5yq4VNN8y/o0cEMozda/+@lists.linux.dev
X-Gm-Message-State: AOJu0Yz15IeYfOCbXy5qR3g5XDwYIzSr7yEPFR3XAuihJd8PIBioC7Co
	GQfmRzoXwBwC2Sobar0Clg5TA9kRP8Etnf7slUVhLxt0OxgzI5Y5
X-Gm-Gg: ASbGncsu4W6gKeKtxvjqz5pZqRp741FnqFZCv6H6wa/FxhXXmHDHrrecAbxKicYUluY
	1XIwZiUKvn9hCc8KcdEZJQyNpfRr7sx0doGIBQhCsZElxi7yN/I5CKSWgpmGqp+OKlAiSvSeNaL
	13ca41rFx2eTHrabuU11n7RLXQPcJySk9k+99uRkh2S2GaVHwDNsjigQQr1OXapwPxQlAPnlXfv
	rO4mXqYTULJ17Z7/PSzvBSUkIDL/cm/YuVySm4IAJYTRvaBLYYLz/1o2ffr7GSuQJevN29ciQ==
X-Google-Smtp-Source: AGHT+IHTFzzCAFMgryuHfIbVboE065/VKtWokfxB6FEw4z68RgQT6/HsIeJp+4K+QS92vQVrwDTCkA==
X-Received: by 2002:a05:6a00:6f4a:b0:729:1c0f:b94e with SMTP id d2e1a72fcca58-72abdacf751mr18252194b3a.6.1735030259774;
        Tue, 24 Dec 2024 00:50:59 -0800 (PST)
Received: from localhost.localdomain ([106.208.149.105])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad84cfb3sm9236221b3a.89.2024.12.24.00.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 00:50:59 -0800 (PST)
From: Atharva Tiwari <evepolonium@gmail.com>
To: 
Cc: evepolonium@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Meir Elisha <meir6264@gmail.com>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: fix network selection in rtw_mlme.c
Date: Tue, 24 Dec 2024 14:20:47 +0530
Message-Id: <20241224085050.61133-1-evepolonium@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

this patch fixes the network selection logic to avoid selectiong a network with the same ESSID as the oldest scanned network if it was scanned within the last 500 milisecond

and please give me a value for "new enough" on line 481

Signed-off-by: Atharva Tiwari <evepolonium@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 5ded183aa08c..06db4f8a7e24 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -481,7 +481,9 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
 		}
 
 		if (rtw_roam_flags(adapter)) {
-			/* TODO: don't select network in the same ess as oldest if it's new enough*/
+			if (is_same_ess(&pnetwork->network, &oldest->network) &&
+			    time_after(pnetwork->last_scanned, (unsigned long)msecs_to_jiffies(500)))
+				continue;
 		}
 
 		if (!oldest || time_after(oldest->last_scanned, pnetwork->last_scanned))
-- 
2.39.5

