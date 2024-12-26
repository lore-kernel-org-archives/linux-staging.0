Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07D41DFDE
	for <linux-staging@lists.linux.dev>; Thu, 26 Dec 2024 13:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735218046; cv=none; b=fAxyTVKlwQ7KCA6KuL4mUlcuLyfowgyijAKhk+7EuTsPIsJQMHTEs4Q2Pbf6tkHIPNkQakcn5UIHEi/EqVkVe6uvItX4nMXfjlfjPh/mIAR2XtUzMxD0Yw0lK4j7C+21Swh15LtwEYlTPvkvMElPgyCWmfs4zSK1DsTmEZKjI2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735218046; c=relaxed/simple;
	bh=So07i7TsRc8MZo97SNl3OBIKdmzGjmYOs15PooVy7f0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=haqoHA7rp1V8lszHBaA6dByVpW4BxMBAiaesh/5iKbLHRiManu1dpiO4sCU85hTngbbYNC1hnTNGpQ2z+U5D3j94M6+NApj7azOom7Ow/SLJ0H+IiK96darny+G9cXzEQRqCQBlt17olPjDa07tqC0xWtTP7NAXEO2Ndh8lObn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mEDjLoIi; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mEDjLoIi"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21644aca3a0so2516215ad.3
        for <linux-staging@lists.linux.dev>; Thu, 26 Dec 2024 05:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735218044; x=1735822844; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hhd15APbcYRqWh+wXaifbceYc7BmeJiVjQiC8yBJW2Y=;
        b=mEDjLoIilgTnY7UMdddLr35c9fNh7G7iVegawfLW2tYsOl3e8741xPZctojWcEeNjt
         tyL7I+qA/R1/eSiqxMHHHsUL0FzibzjmRrDXbwMU3U/i3kxMIO4Gunxt3HTu8bk3H27f
         kPv0u6+mUz8QTSpyyf6CuO+CiAVh5oP6i3Bd/5byY1RXSIVVUzhaEMhDTMK5i69OxIrJ
         rSzF6imgFjTVaNzt0pE3CjUvpp5YQF8/RU348wN7FLtSe05pCeGY1J9Mnae4jyJxIWVu
         hpwjbQ4awjWtQEl38UMisd4spPH+cjUcuEvHWjyLG2V/w4IgNfT0AwCxk+04zrAvBGp6
         myAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735218044; x=1735822844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hhd15APbcYRqWh+wXaifbceYc7BmeJiVjQiC8yBJW2Y=;
        b=tjjYiKH88lL8ENo/Ttna2WRfQxpoxnVHjtr53zI3CL0cz9LZ7XIeLJN88aJcmp8Yaw
         oe7ZczaUMALVKlCshGE6DS3GZLoAVqWJpdSsZPCEp3Un4ntXKKUOwcLSFqpIq5YH1S2J
         PIauMFe/jVoUZ24QYFDjRNSDznnkvVgM0Rd97oWqHpAx5ihDWNsY4ZgQhLJ0fxfLr0Vm
         K+KVCwFGwC49gqyiTVqarDjpGFAL6t/6wSzmqRh70Y24e4Eyl7F8h/DAz2RKuTiu+cyq
         /W357aiTgJ18aDnE4aj1fOOIT8zL0cLQdWzzKD3Ed9GuZPLol5tm+rTHj/GSsNTrsmBE
         wmfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmGpAcH/tdQ/GRCaz4deWEVn6cGeCX0JQQ19uGq4dWNS5I6K2iuu+/paZXmvEd4TvVUUt0Z7GN9Ky7tLbc@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0KQn8t8WRd1jn0LvmtRarb1Gzd2D8gtVdIuwGHx7XLD8qCJE7
	l1CiLk42r6mV4UKwlIVJZ1tMH/sfhag6gVNoXSKVV3FnKRhMCnRW
X-Gm-Gg: ASbGncuDKb71CJRCbtkMk86jSClLr/dFzrqKf8lwww/nalPN7GBs0nLNkVKoN2wj6Ri
	z1/ajUdBt46vyAgXTg+T+yMOHPXkYCh8yOtS0fq/RtRvigmM9BYnnN8h5rrV0usxHHXf9UiecSa
	EGr44RgUwkO9VOhs1HMn6FUKCu6jFdORneddizvodm75UKEL9lFRVWsDd5tjlKm//6Yt3Aq03a0
	WNFg1whsDjLRsfrvLV61D+xViYzHRcDdHa8euhzB2FbQjPwwnn5WipIFwbMBonSJmzAzV3tpg==
X-Google-Smtp-Source: AGHT+IHyIDpFbtxum2F/FGPlN0OSHNr+7TGpsEQg9dIcrsecQPNRV8FG6NvY3FrlzIr+AdNxjMj9WQ==
X-Received: by 2002:a17:902:d4c4:b0:216:2d42:2e05 with SMTP id d9443c01a7336-219e6ea19b2mr377219755ad.22.1735218043773;
        Thu, 26 Dec 2024 05:00:43 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:5ace:1ff:7a15:c610:5444:2ccd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc96e764sm119364385ad.62.2024.12.26.05.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 05:00:43 -0800 (PST)
From: Atharva Tiwari <evepolonium@gmail.com>
To: 
Cc: evepolonium@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Meir Elisha <meir6264@gmail.com>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: rtl8723bs: fix network selection in rtw_mlme.c (completing todo)
Date: Thu, 26 Dec 2024 18:30:24 +0530
Message-Id: <20241226130029.1394-1-evepolonium@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

this patch fixes the network selection logic to avoid selecting a network
with the same ESSID as the olddest scanned network if it was scanned
within the last 500 millisecounds

and please give a specific value for "new enough" on line 481,
i have estimated 500 millisecound but inform me if the value
needs to be changed

Signed-off-by: Atharva Tiwari <evepolonium@gmail.com>
---
Changes since v1:
- Changed the "new enough" value from 1000 millisecounds to 500
- fixed some styling issue

 drivers/staging/rtl8723bs/core/rtw_mlme.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 5ded183aa08c..6604619d1b99 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -481,8 +481,11 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
 		}
 
 		if (rtw_roam_flags(adapter)) {
-			/* TODO: don't select network in the same ess as oldest if it's new enough*/
-		}
+			if (is_same_ess(&pnetwork->network, &oldest->network) &&
+				time_after(pnetwork->last_scanned,
+					(unsigned long)msecs_to_jiffies(500)))
+				continue;
+			}
 
 		if (!oldest || time_after(oldest->last_scanned, pnetwork->last_scanned))
 			oldest = pnetwork;
-- 
2.39.5

