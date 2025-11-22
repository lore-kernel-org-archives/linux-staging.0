Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F82D28D82F
	for <linux-staging@lists.linux.dev>; Sat, 22 Nov 2025 17:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763833576; cv=none; b=Z62HMlB7w9/Vdq6aLubsieJR+SN75+XcHul2WdkWzap2jrbTWdy9DCGYh0Quy7urP2m0ctYjVjZsgIQlZpQSOKKOyBY8dgESq6f/nkGCmILQHjPyIe9jgsI1UZvlpqbm5EKyYwB5idm+ONwQBKKMzERY2Js09m5KHWBRMf6LHsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763833576; c=relaxed/simple;
	bh=cpC1LEWWa2gxwbaSOO4EMuTVlGuvKC6DsecGI3j2hbI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AoC5ArzXXDq1rURAXEk7C0En9JOe3FBbqA0lmD472Lbmf8YFIosOe2zRI6Bzwx+l4SomaWQD2BpsrXlAPUMomnLjc7jzMj3pLER/Y3paJu4TE/3JrorB7BN5tYpyC+8kJwynSsOPuOWhwl77b65JAoqYoyElZs3TSaHNxxmp0Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lTY8pboH; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lTY8pboH"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-295548467c7so35948075ad.2
        for <linux-staging@lists.linux.dev>; Sat, 22 Nov 2025 09:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763833574; x=1764438374; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+C+5JbnNEtRzLTc+Dw5Knlrj9bR0dzDta5VOLCOrZs=;
        b=lTY8pboH4W7ktBLEkXM0znQpulHdYIRpTeK+MLdJyL3VC5RYRmXMIDQzeENlvJPBEJ
         hwra1qkWnIdQKRcE5MOdIPQNtqTZ8eYQdNq3UP1p+z9oljH0Ys9JgWWY4DiWghwGjzqV
         N7hNyUo2BEk6CRGjRxi/Xficeq8RWSnW3phmIQ4tNk3dkP2J9t2zqT5Ez5V717vZBy+9
         VC9kJyRLF9QsdEQJkTXhnvLbZ4jE0qMSHhy+E490YuFBwI35dawt15fymCk0xsLW+9+0
         hpa2csi0WBzi1ESQeQmhOdmS2zNHqdlihXkGOXTX5a+C+P62J3xaTl1JsdPQ+lJjzw1D
         Nt4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763833574; x=1764438374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q+C+5JbnNEtRzLTc+Dw5Knlrj9bR0dzDta5VOLCOrZs=;
        b=SPwt+yh7G9os6cnCaEz21PLVHkud3gZmUhTIEQd9/6sRz3xsITGFgAhI8H9r6OZAH/
         1MRDdHVvlxAfieUjWsRx99nva3VJD9T4haoalYjzxRHac3qQn1O5sqoF8e+6fHMsZkD6
         wkA23avdwl6rt6/LBlFXU0I0sEQ+KW2kU79cM69WitWYXv29p9eLRDbPDhWp/p/6U5tM
         4LTAeXsOp54Ckk3DdG2D6HAXFUBAU+cQo+6GIPQW6QqOcMwILmks0ryGy3W3U9lQqzwu
         kinELVPErvgnSyzo0arwWWufTAf7laTMn0mzzJ3zi7Ud2Qns1IXE1XpFDXvIt5Adfacb
         30dA==
X-Gm-Message-State: AOJu0Yyo9lrfSZb07hq4uE6VJUTgImtiG3wP/QbgLk/WsUilEsVrZdwp
	LARMPeZgwhlDFSUNR7DSMk6cLRMzj7/sJljaQRyCFueDEbcZSjW2B27b
X-Gm-Gg: ASbGncuMd77Xc5j8VN1aNC+3uTemCzQbHz19ewy6RVWxzilIkQX9Hk0W5UO2Qt8yr1Z
	h7SA8ymV3Ms4AHJjiEKz7VgqIx/iIQru6TgtoHXXUzdYDeRENh1S/wWvYZA4UKriH5FQErV9fkJ
	mTSXvdxQfBFGOZG4kRMo1kiPzdzrJhKlisCwP+MG7phQu8rNb6+Yt+Bm+IOHYB0WWn28VGiB/Cz
	crXxITO1H9oCYzPNPuwWNEbQtzwyol+bdojqoTIR0cp2jIy5sSVWi5LvQ6G4t7Tp6FP0xpuLeja
	MIbBlpfw12eAhRaRMwrxEqdu5/ccgB+nTeb1IO6/nFQs229y5TOQILIHZzqHZO6ZcV2EnMn0shw
	2nbvrRLtd7arkIh1evNY6lOmMPQ37mDzOee1wAIZw6HPrH9lPMvrCHgojCvXR83tjYwNoA3Zffq
	TAdX+KzWhjQ+GdzsPSmO4rJp+AV84E0+zUe5fZH/UYJmgDG9uZV6AcFaqVYvX1ANub24PELSXci
	GcgnrwGSG1d+9n8dXg=
X-Google-Smtp-Source: AGHT+IEKxtdwocd42UUdonOPfaZx89j1v4AcDfur13IE+AIwy4xKDfgaCuHHazlq6ph13PNAAPGuiw==
X-Received: by 2002:a17:902:e548:b0:295:fc0:5a32 with SMTP id d9443c01a7336-29b6be8cb38mr88782895ad.3.1763833573873;
        Sat, 22 Nov 2025 09:46:13 -0800 (PST)
Received: from CyberKunju.localdomain ([103.92.100.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13a80csm90186085ad.35.2025.11.22.09.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 09:46:13 -0800 (PST)
From: Navaneeth K <knavaneeth786@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Navaneeth K <knavaneeth786@gmail.com>
Subject: [PATCH 2/5] staging: rtl8723bs: replace FIELD_OFFSET usage with offsetof
Date: Sat, 22 Nov 2025 17:45:52 +0000
Message-ID: <20251122174555.215109-3-knavaneeth786@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251122174555.215109-1-knavaneeth786@gmail.com>
References: <20251122174555.215109-1-knavaneeth786@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace usage of the custom FIELD_OFFSET macro with the standard
offsetof() macro in drv_types.h. This improves code readability and
standardization.

Signed-off-by: Navaneeth K <knavaneeth786@gmail.com>
---
 drivers/staging/rtl8723bs/include/drv_types.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index dd9018aa4ee5..47cabf8707f6 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -173,9 +173,9 @@ struct registry_priv {
 
 
 /* For registry parameters */
-#define RGTRY_OFT(field) ((u32)FIELD_OFFSET(struct registry_priv, field))
+#define RGTRY_OFT(field) ((u32)offsetof(struct registry_priv, field))
 #define RGTRY_SZ(field)   sizeof(((struct registry_priv *)0)->field)
-#define BSSID_OFT(field) ((u32)FIELD_OFFSET(struct wlan_bssid_ex, field))
+#define BSSID_OFT(field) ((u32)offsetof(struct wlan_bssid_ex, field))
 #define BSSID_SZ(field)   sizeof(((struct wlan_bssid_ex *) 0)->field)
 
 #include <drv_types_sdio.h>
-- 
2.43.0

