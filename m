Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAFE1F8723
	for <linux-staging@lists.linux.dev>; Thu,  4 Sep 2025 01:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756949201; cv=none; b=Ds+rpX2mnPOCN3igUOgjaaqBmwE4R/m7kWyjf88SO9bBvKJs0jVVe02oRXDoHdMxpyI0/q4+BByHTURqpuBKA5/UKkmQVak23CzVXr/lNCnqet7luHMYZib/188Ed5j1iXL3WR05XXCEHpK9gBYaMAsq8d2Djh9PNueFhDPOWD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756949201; c=relaxed/simple;
	bh=8er5g/JdtGmDLwAxnKtTLLBjMA31RvembXwPpxkN0eY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EfRom64azk+9LVyyjN3Aq9ipQfvwj7gAPzT/uyW1j0o3YbXBIUJY6tBNoW5gvUKlC69LBoZQFTPJmN3tV11ZTrIPEumGtZBuQKRH/BtU9YTX6l40+vqREe85CYZMXHz7oXfTwzjgHXwvg75Ye9qL3f7rzTSxCz2dKBFBFqIK7wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJH6RmKx; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJH6RmKx"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-70df92872ceso4680306d6.1
        for <linux-staging@lists.linux.dev>; Wed, 03 Sep 2025 18:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756949198; x=1757553998; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vNzQSvDGcgGcsxPnJpDh3vO9RZGdTNfhmCnJqVlYiLo=;
        b=aJH6RmKxwunhscqUem50EZb5rCgoOslZfRbRgLUh8UXH1Tbk1lhIxWrmEnyQ0VJ9zo
         aPSfBCGkYGI9pA9rUsi3lGxpT5Ec1XdtxZbcjVc89wk/a6fgB22OdU4xpdHsJKSrlq21
         iWd9hs1Q7ewpzRZaDA0RvLPMJv5npFhuyhsqexBS54OrRvaMIk4MFZidUrEjFAC/Fwtv
         I2hU5U22wB9Fn7iHHzYfJfp/EQZiERwdEDjKonS3J0RQGMkcZVZQIwzmJlG7Ro4niLFd
         H2o7Z38KnjqT2Lh7AtT8jiKdLLKt5+npV1lOXjdytOquh17LwXv7Hwh9EnoTxSWMSdK7
         j86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756949198; x=1757553998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vNzQSvDGcgGcsxPnJpDh3vO9RZGdTNfhmCnJqVlYiLo=;
        b=K5wfBLuspuDIQ2JNpsUsqRaQkeepWsOVYne3wlNQ+W9O9jEAJGFEdjQQdH/Od1H5Mw
         jN7cVLVS6yBywpo3RWYcmbpCjQCiSRYo1J6p2ExexMBtOQHHLJ9cVVjRNIP0AfzU457X
         aPo2ZKtfGdMiZa5mgKuw9Af8e/5yGrwQ/eGxqfNz2lNkubxzwtha4qq5+8wd3i4IX2Mj
         6I1cqOKVfhbG+FyHCh6O5ylUWpDbIyqwq9yM0vBrcWpLyLjgYRnnGYR6Kk02noCCzX1d
         xGFMH4QWxT6tjyutYdUncuipeoMelgjrJm4mbuTgR+G/yYM5kP2F7b4dJ86537DLQXl/
         GcEQ==
X-Gm-Message-State: AOJu0YyPxgkdTEwHRCPXzdxgooJm19WCZq0N9gb+q+FkTK/by7NOE+R6
	qkbqvvk+g/+UGNsAwjKR5zLP/6oQwqPukLgbxGJAufim58OjmvaDDaKM
X-Gm-Gg: ASbGnctYGP5nt8598uW6Id4W4rGrm9j6i7PkdunfjvWFKj/IQJGmC5g0Wj3j5nOsdat
	lsKSDZfX6OkM+ONXunK28TM7qRBS0TJfQD9kPf8XwVJ12+RnDvyInCwT7mb8WphPn8WOjFHsb+l
	4DcOfFVKNazbGmzc6KZDPMTTdjKwl8U9KSe3CMmOM9zDWizUkx7pMOzC/Hz15ayF54Fy1ovZgHl
	DBaQ3RBqZabOznI9tHKnVe4KVRFj0sZRllyZy1XVgiI+oesTh+foK1dx4wkfZwR5ajh4qWTXPVP
	6oWRdxy4UEwwqYd0q/6H4bPVGhrjy5HqS/W8Rs0dkuZSa67+zsFvHCg7x1ZxLoqmvjU5hej9Va/
	K9CHyyHP/jWuKh9PfF+aKMw/3Kdfp8U5/3jywwGqUkPnCBl3b7EM=
X-Google-Smtp-Source: AGHT+IFk1TVsSCJ8A21b22SubGn1oSGpNm18Ik+70VD20c0toeBsR6n18+JwNbOelGqbb7bRZYXVwA==
X-Received: by 2002:ad4:5c47:0:b0:725:760b:d2ec with SMTP id 6a1803df08f44-725760bd3edmr58332486d6.16.1756949198595;
        Wed, 03 Sep 2025 18:26:38 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b682faf5sm38423266d6.65.2025.09.03.18.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 18:26:38 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Subject: [PATCH 09/16] staging: rtl8723bs: fix excessive indentation in nested if statement
Date: Thu,  4 Sep 2025 01:25:29 +0000
Message-Id: <20250904012529.215521-10-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250904012529.215521-1-vivek.balachandhar@gmail.com>
References: <20250904012529.215521-1-vivek.balachandhar@gmail.com>
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

