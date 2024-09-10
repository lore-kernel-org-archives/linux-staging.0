Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3094F17B4EC
	for <linux-staging@lists.linux.dev>; Tue, 10 Sep 2024 05:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725947830; cv=none; b=JbunPYTh3Fiez0koNNZbB81BqSyJSv3Rg0j8w36YdwQrYlfVyiZM3khPPstfj69DsKU7985J1jj76HNKY/GMkx5BZUZxgn3gOnSr8Msvyz4OdlnGhEOp5WiiYfQVCQWMEb5xG2biynP8lGfagwHA53EveEVNHUXLwGS6C6/OWjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725947830; c=relaxed/simple;
	bh=harbIYjXIZwZ3f9EI2mZbHpqQsWOwp5H5uP9TKWqfmY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sHWkOvTBTqTGXDLIuD5pJ13TAkFz6IRYi/G2qfkWgL1mzUyw19L1b0uIQ4h1YDNGP2wmVpbVQtIq0Nfmka03wYh8TxGqeAhUyPbE4uIgUju/o2moY45ch/NenQmFOpIONafzaswP3VTMIJRlGd76dz3GtnaUUilWtQ80ORgPp5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iu1K5lEO; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iu1K5lEO"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5becfd14353so4837406a12.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Sep 2024 22:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725947827; x=1726552627; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MkRMGz03AT/YTFzfsR/jm+HeaG3fV/KjabHJTPqNwHA=;
        b=Iu1K5lEOIKIlCKIAmvGy+WwOZaJqoetAXDnnrdgH70Q7RpbqWwzG4n7lWj9FN2sVlt
         VJTJyVw4iLRP+6+t6f7LJGN1hqoKjpmujx4JEfDn7EIyr99/Wrjk0iQiyyvYjkNLx9a9
         Y1nN8SfslWt2ocnwQnc2wFMwICEEsgmOwfif5ML6IbNhyMIlMLA0aCAtRWNQpnwb3Qf6
         Elcwo8SZQgYEoo+IQnpOoLveBc9S/HhXT8SUlqj36HP/2kEi26Uy7QGVaJphlnhP8h6B
         H/ykookme++g84S8GsMFy3DlsxuKwiX2R3nE/DLCSWQmWf4CVDXd+TUXiChfIEtXc6Rb
         nmXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725947827; x=1726552627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MkRMGz03AT/YTFzfsR/jm+HeaG3fV/KjabHJTPqNwHA=;
        b=BzrSU6WCEjfHj7fhG+ZQMotqsKYK3+QExw5+saU3rd0ttBV3IXlSxvNhsI0sq5obkT
         ugrto+HZ2y3XOoAGBSa8+mTlOjzIL8wtXs/lgHEWXibu7TgJT8pTgz+tSglyg1qML0es
         vccTQWBXHE62H433TrRPzPGcuZA7oupyopj0Q3NcbGkWKp9+Jdyt8JbetN+DH02RWH38
         YJ4V4X6+UTntmAxkude7u2VN+tpD8mB2nCz402bKk+V5TevVq6nmojgRcacm+UuxdqOn
         0BctLYgl+pej1W9qzK9ngMfddnWYB1HmKA7czyFoF6Ci7uBl/rSDyEIXrcAcABNVwdaj
         lRCg==
X-Forwarded-Encrypted: i=1; AJvYcCVOsCgwUskuTyH5J5oPf43OOL6slsbKbk8x+/55fA3X+qaKGV3X5W7SRCZoKjTrHf5YWuCeU2br0jX/V+Um@lists.linux.dev
X-Gm-Message-State: AOJu0YzwRBEetl19BecYfXrYbcqNfRRU2+R5tdLGicjRtT1f87JyBrai
	C/15kwldvKkv2XjZDYC5HWURo9fyBq4zSBVyxtHQipTzja5unMiy
X-Google-Smtp-Source: AGHT+IELoHCk2IUFrT/OdX5Le88nXVMstZNV1Q3L4CqyFVIMScSVaRJU0d8a2Tkg2j9qkRsHdOuEQA==
X-Received: by 2002:a05:6402:35c4:b0:5be:e01c:6b5c with SMTP id 4fb4d7f45d1cf-5c3eabff535mr5954007a12.4.1725947827522;
        Mon, 09 Sep 2024 22:57:07 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p200300c78f2a8598b80c2d4e9a813f29.dip0.t-ipconnect.de. [2003:c7:8f2a:8598:b80c:2d4e:9a81:3f29])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd468fesm3851492a12.39.2024.09.09.22.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 22:57:07 -0700 (PDT)
Date: Tue, 10 Sep 2024 07:57:05 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 04/11] staging: rtl8723bs: Remove unused function rf_reg_dump
Message-ID: <b66d915668366258523095adf388acef945dc0fa.1725826273.git.philipp.g.hortmann@gmail.com>
References: <cover.1725826273.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1725826273.git.philipp.g.hortmann@gmail.com>

Remove unused function rf_reg_dump.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_debug.c    | 11 -----------
 drivers/staging/rtl8723bs/include/rtw_debug.h |  1 -
 2 files changed, 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_debug.c b/drivers/staging/rtl8723bs/core/rtw_debug.c
index 5354fdd11c9b..33d27680a276 100644
--- a/drivers/staging/rtl8723bs/core/rtw_debug.c
+++ b/drivers/staging/rtl8723bs/core/rtw_debug.c
@@ -55,14 +55,3 @@ static void dump_4_rf_regs(struct adapter *adapter, int path, int offset)
 	netdev_dbg(adapter->pnetdev, "0x%02x 0x%08x 0x%08x 0x%08x 0x%08x\n",
 		   i, reg[0], reg[1], reg[2], reg[3]);
 }
-
-void rf_reg_dump(struct adapter *adapter)
-{
-	int i, path = 0;
-
-	netdev_dbg(adapter->pnetdev, "======= RF REG =======\n");
-
-	netdev_dbg(adapter->pnetdev, "RF_Path(%x)\n", path);
-	for (i = 0; i < 0x100; i++)
-		dump_4_rf_regs(adapter, path, i);
-}
diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 7f96ff66915f..f70da9cc66f8 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -9,6 +9,5 @@
 
 void mac_reg_dump(struct adapter *adapter);
 void bb_reg_dump(struct adapter *adapter);
-void rf_reg_dump(struct adapter *adapter);
 
 #endif	/* __RTW_DEBUG_H__ */
-- 
2.46.0

