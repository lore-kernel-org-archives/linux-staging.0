Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830F52C1594
	for <linux-staging@lists.linux.dev>; Mon,  7 Sep 2026 17:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788803025; cv=none; b=Jup72fv2c1PWCIUmvfk/+3+vIu3+MDUO6y1vZb2Un2laMapLu70Mkzc+YcN3LqjBtrMT0zI7fDoIizdslRbrBPkjc7QVR9BH3AHSZlA/zM5sllr5OZKK2DFHnmyQYYpP6ixr3d2BhbasoGIhPUBlnRMocu9lLGhzhzg5UpF1Zjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788803025; c=relaxed/simple;
	bh=x+aRmv1uzKFMDzNb841Pd/22HzX15lnoHZUO8bPn3MY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Dp4YqGpSVUt1Kg2X6tft3eXuOsYS5d0Yo84tuUg8uV0yDV37puxgu/Ddpu0fcM50+9w1DWLXtn/6Su7Qvhl051Hcr8H90d6SYsDL0vDZDX62f0uWRoxCquCQJ35sSqH4RREEFiG8hTikBkw10tIBqWZA9lvk3qYtNxNgtMcom7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=McIraWro; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="McIraWro"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-398d2b28acfso2720298a91.1
        for <linux-staging@lists.linux.dev>; Mon, 07 Sep 2026 10:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788803024; x=1789407824; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jPptSOFPd1YFuqNTBBXLHO7Cp2RUkJdcOa3PtkfzDYM=;
        b=McIraWror8wxReU8/aL8DaHwJ1Mosb6jjyLsIW100w1THLkJSbOU+Yhps9TQmuJpMz
         EC3vCQ5dHuPMnpfd5ULxV3zFhUjfmgqi8oxr0zXuj+GK1LhnFp/uR5WmmI5Uw60qwwLv
         /RBbLHyH+DBjkAtfNCCezQ/WRgtl/8BytWhUy5cRjZXN4dCEuX9qJ2Tv/ZT5kLEgA64b
         fsSFML0bYbDlmO5rRcVvfXugvADW3PzT9tLFJhmm1zcffjNP71tj0mvNc9+X48LY7ppz
         J6Vmd3aiN43ByihIZ7PLURstRY4dYHHK3beLDcmmHKrUlKsfUTBETVtU91OQOQZbOLh2
         8R1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788803024; x=1789407824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jPptSOFPd1YFuqNTBBXLHO7Cp2RUkJdcOa3PtkfzDYM=;
        b=owCHQ28/jLUOoS8NOTEitUaEAE/4ZhPtF9dktzQSM2p+QLiRPimO60VWiZN9b5zm3z
         VH+jB40tOrQlS59u/GJXhsSYWL7VK65NNXQQ4SRxlQfMTzRQfWL0k6rg5O7PW2moY/4I
         Eohr3GMburlKcMS5Kdk3DHWyZWmPjCSeAlkBkRGsDrKcVlVKWpsiH3yoCouwt9wO3PFa
         D+7ZPlCOaYqE3qkVxxg/jQW6WrqJA35oOnRnLo3xEUb2OPWy1n8vHVw8XxGU+gr0XSar
         7QIRYvULddStQLTt7qPTX9srxU29PZaTIYH4+KYXi1jXs418zYbzDktFhxrUQCDmLqnC
         IgTw==
X-Gm-Message-State: AFuF++nmWTNrPNoOi4ALh3mP4EHL1fEruEtxEhBLm8LqQmGpOCVUUM7R
	vScRguMrWE/lBlwkH64dWL299531ZNpVnanw5tUurIkQlSHa8xII9tHYzYItJg==
X-Gm-Gg: AYBFou1CA34tDBPC3/qN4JlL37+LYz73sSTNjAb38jwDzYvMoe5rHJU9YQH7opqDEq9
	/05o4Z7JvKndADKjBkzKWE+rvazWbdUmVE8JpD+1QsDINI1upmZixbPbWaHARakOL7QXbmwwjYr
	hGuLpr8JpggIMRfHxJ9lsnWY0UgAG3d57rStfgNGuMjAAfsie0R785PkFfUhvLNHf6IrtM+gv5d
	5cJDuheOKB9rHhjqRhaSTOE35DV0log2PpP05VsHw6ZcCigYS7a2Hs8+ARWZq+BQ+MN5ARlECK+
	93zJbplLls4pnSW4F2/zLew7TnSeN5MEKYlfTCARtNaZU/JnI4eZ3uY91+ccEzp8Hhknzc+EvW7
	vnUlnVayN6VFwqk6m8nLOdIjeCbfBmj5wk6QTZxW1TmBCZIEJIY/cYCXsYMFyBBeOAuuMq89oo9
	+1N8w7I9AaFWsxPfuu3KhH0zBaEoTFoUPt3LSBGX3dMNcwTE11kVk+gnfabP3471U3iyzZf9w=
X-Received: by 2002:a17:90b:2e4b:b0:398:a145:5d3d with SMTP id 98e67ed59e1d1-39b26151b89mr37573091a91.6.1788803023802;
        Mon, 07 Sep 2026 10:43:43 -0700 (PDT)
Received: from TestUbuntu22.. ([67.169.161.65])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1433171a97esm27431320c88.12.2026.09.07.10.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 10:43:43 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	guojy.bj@gmail.com
Subject: [PATCH 1/2] staging: rtl8723bs: remove commented-out code in hal/ header file
Date: Mon,  7 Sep 2026 10:43:09 -0700
Message-Id: <20260907174310.5924-2-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260907174310.5924-1-guojy.bj@gmail.com>
References: <20260907174310.5924-1-guojy.bj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove commented out code in HalBtcOutSrc.h

Signed-off-by: Jennifer Guo <guojy.bj@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
index 36b0f429dd4c..0583a7aaa974 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
+++ b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
@@ -81,7 +81,6 @@ struct btc_board_info {
 	u8 btdmAntNum;	/*  ant number for btdm */
 	u8 btdmAntPos;		/* Bryant Add to indicate Antenna Position for (pgAntNum = 2) && (btdmAntNum = 1)  (DPDT+1Ant case) */
 	u8 singleAntPath;	/*  current used for 8723b only, 1 =>s0,  0 =>s1 */
-	/* bool				bBtExist; */
 };
 
 enum {
-- 
2.34.1

