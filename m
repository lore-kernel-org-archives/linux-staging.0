Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2422D77F5
	for <linux-staging@lists.linux.dev>; Tue,  7 Oct 2025 09:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759828424; cv=none; b=Bqw4Q6Eyv6xGtky3ApWsmA0kuqwRfwGsx0WMAW0cGMpDjJ4hNUpCT77i4ba6ju/EiUjOlExn5ka/pj7kjat4orHbIOSray9FFsJX8a1bL9nQ3Ih0AsKP9jems3M7fHwmXNyQaF6y4cyVJTtnnrMl7zEnQZ4RT2KOKx8C8qcHn1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759828424; c=relaxed/simple;
	bh=W3oQ3to+FMnGQ9BafXS2UUWpjBiT0ItRQvarpFfldVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EbRD0cyJGJQbTv1XapbvZEJqMXFioKWcRGxANtDRPEg9twuODAxf0953nx5oYrlN7aDYxLXDIxmtUoKPUhkEhRCry92lRZ5wOjGky7rIPbSVFEMp3bMaYB4GWIbL7N4GxidX6RQx25nFGHb1thz6YPtbzUJc/4cI+GowzQFRTGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q93xjFBt; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q93xjFBt"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7833765433cso7300076b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 07 Oct 2025 02:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759828422; x=1760433222; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ok8Kw/gCdmxhaSwkgke7jAlluYrp/WVGFRTxV/5g2XY=;
        b=Q93xjFBtnw4Os+v2NdXOT5HT/l2H7b5ixza/bTzIy5Sv9e08tQXV3qtOVaOUqX/ouf
         xlKL8rmJr51xFMIVIKynwXypjPQxoaijdhBO2X45PbnI28mbKT7E09ncy9q3DoUbpE1s
         amFuDN2nOeUd9SvHf5cn6jZt1rfNYuFpG7XxtHpMmMcIIgifS+X8ZuyroxAOfLXsXxtr
         aSLH/3YAXFEmRfIprBmDdFMLPA45+ly1cvAycvFA/G4NlDQ9URfumJUfp//65TDFwP3n
         LDsJSETb4W0RMnfSJYehPgSz3oQ5LjXTFPdg7jQkygbAYu85pGywLVxgt2fBcWo+d9MM
         Va3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759828422; x=1760433222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ok8Kw/gCdmxhaSwkgke7jAlluYrp/WVGFRTxV/5g2XY=;
        b=NP7eF8DH1Z7qZyDNgnl8rQMBBYo/gcnRf5MOZVC4HCrDBk+aoPRpI5M3cykNTTsu7b
         YK7nuzfe7q8XyK38+9zDE2G8ooSnIrI7Oja0G8gUKmHUiS+DjRe+MB4+3dICvyHZfGov
         CDH3DfWg4l1hcLGgKI0t3vuH2kPTpQ9Sz1uwXhyuWqQMagS8CCmb8/cfUqD5nutkJ0zg
         gIMmkkpZuWlMFcu3BhkTw1mOI3tYWq1AEer8eRZxixHUu83OF6TSX9N27xaaCDVNzOEm
         MPk4zj4l5/A0hRWDuSDlhkYZKJ1Cj1G06UTrP7dy9/lpGIwJgUVWjm6P1WuLHRsjoG1z
         NAZg==
X-Gm-Message-State: AOJu0Yws3yZ+qxJZLzCOiwpBfN8cH+HI1ReAmsdBu7UpoQhtHRiB9aII
	9Cz347k9WFv9xBGHTFt5kmhysAz/4rxF+hR7gmaADaFvV2wBP1sBfwNY
X-Gm-Gg: ASbGncsGrbmnnbdYQrlBlyuTTAtdxrMEgptQYXmFVXU+f8XYe+3GPdff4Dlbq6ilU1E
	41dmdaGoh8HYhFAfcnnYvGsnAe/Sq2pQqx4D7luWjzA5TOc3Fa5UFi1b5X03zLTHuL1tG+jGjYN
	lEmRQpMh2LAvc4S9HWTdfSdzl0Zw/UcM/8p8FCcb0E7Joa1fHr5Xc0vmhWROE6POlmZEjN5qeLn
	aWSLAjoU9v07cG6DPF/kTakIZK4qaHtYkMWByGkNHN2iGveoYm6Wxi5h048mp6TXLVTNlbRTBNT
	paGAQeNYI87gHwMMGE5jPrzvurbuJ8ax4HHKCgSC9VYpHM72zmr7+PNiMQtSXrw5o+o/P1GrVVb
	SW71PWNPFG/MvLLG/YWGdQilWP+XwvLBoltb/zst2YL+FBpGaOauLAPm2r9Ow
X-Google-Smtp-Source: AGHT+IHTfTG/o9nNH2EXHwmE6IspdXH9kK4au+zeXCw0++u3/oxx7BOX5ELRWAH42ociywdxWodTYQ==
X-Received: by 2002:a05:6a00:399d:b0:780:f727:7958 with SMTP id d2e1a72fcca58-78c98d32d6cmr18866770b3a.7.1759828422376;
        Tue, 07 Oct 2025 02:13:42 -0700 (PDT)
Received: from Deathstar.anonymous ([172.56.42.228])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01f9cda9sm14941784b3a.13.2025.10.07.02.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 02:13:42 -0700 (PDT)
From: Rohan Tripathi <trohan2000@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rohan Tripathi <trohan2000@gmail.com>
Subject: [PATCH v3 5/6] staging: rtl8723bs: add spaces around '+' operator in rtw_ap.c
Date: Tue,  7 Oct 2025 05:13:02 -0400
Message-ID: <20251007091303.491115-5-trohan2000@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251007091303.491115-1-trohan2000@gmail.com>
References: <20251007091303.491115-1-trohan2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes instances where the '+' operator was used without
surrounding spaces. Kernel coding style requires spaces around
binary operators to improve readability.

This is a coding style cleanup only. No functional changes.

Signed-off-by: Rohan Tripathi <trohan2000@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 4cd9b7a74313..121b9db76711 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -1445,7 +1445,7 @@ static void update_bcn_wps_ie(struct adapter *padapter)
 	wps_ielen = (uint)pwps_ie_src[1];/* to get ie data len */
 	if ((wps_offset + wps_ielen + 2 + remainder_ielen) <= MAX_IE_SZ) {
 		memcpy(pwps_ie, pwps_ie_src, wps_ielen + 2);
-		pwps_ie += (wps_ielen+2);
+		pwps_ie += (wps_ielen + 2);
 
 		if (pbackup_remainder_ie)
 			memcpy(pwps_ie, pbackup_remainder_ie, remainder_ielen);
-- 
2.50.1

