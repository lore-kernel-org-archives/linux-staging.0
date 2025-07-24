Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CE92DCF5F
	for <linux-staging@lists.linux.dev>; Thu, 24 Jul 2025 17:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753377664; cv=none; b=PoRU8T5kskQM+iwc4hwWPABF+AOFU9vcREH0I3GN1x+p2VxM/MIL3Cq3ZXJ00Q/88Ue5dD+b5eeZJGZZOhTMDYsXHaHQu2gx0BwfK34P357Le217khTizntJmxEVT/J2KMbwfbUhvth1WIg8qHyI1mMOZrW50euVkLBiYOxvYNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753377664; c=relaxed/simple;
	bh=pVkAJTSajXnDUG7O+7Z+hQiUYfhJP1LPABkituOJAkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lZdSBa/iNLWtr/z2Hh7NMK1IOIa28xFcSqz9A2csmM98rSRdVhwS7W2waSKn93S2i/yu3uV9oPnzYa3FAVeQ1Tb4r77IzenJ3hmpOIzmDtiLN7pq0YUe6cyHo0d7vkJHgpfoeBSsIZc2AA+MUSh5I/loZ+01EgrzDbL6gIh26nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JVCdeo9H; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JVCdeo9H"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-612a8e6f675so2072886a12.3
        for <linux-staging@lists.linux.dev>; Thu, 24 Jul 2025 10:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753377661; x=1753982461; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RfkEUR6otL3cOkfwkcTPOtIx+HSipNHwStyAjZrqVxY=;
        b=JVCdeo9HIxsOUle6oWb9nlKuLGMbIIUI+z6YIz703eFQMhsqi0snj+kEtFvtp4FQFo
         KYIf7FC/IJ9s7wgVZDk20tP97EFAXKgdwgq2546Tneb/DP0Ghs5kgD3NF7qp9k7AzGFZ
         lwRX0NQ2B860H+jGumgQiulBIhbVgEYVFptv7R13US7llU2oBFtL+9vmLOJbo777DVaI
         g/nZrdIJQAQkVSa/99eXP3e1wmYx/aYf022iW/eezkCwVYj9cDvVqqob0697/OQ5Jx3b
         FMv/S2lTke+DHEvm2HO7Yo3v6wNOqDytjynvyIGHZhCpY6JWW3GH3gNneovERLUO5eoF
         Uhxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753377661; x=1753982461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RfkEUR6otL3cOkfwkcTPOtIx+HSipNHwStyAjZrqVxY=;
        b=BgocWWVJECTBxyozBa5AutW4KAkIqIiAZYlSOmHlPm/L6OnkfwIUnvwoELEpCWpfel
         jbdYvk9Bp7v3BiXm618PbZKMGjFp/JL6tv6mWJ0xSzq0Lx/moMJH9J4tKRZBk3W1uY/g
         ZoGat+CHWXcR7N8dYxFhArEiuxryjnJ3EGRB661XOfUOJh+GG9FTaicTm4BG2suITL7b
         WX4KI6168td8wkDybwRmIHyj7DP+20LphpA+Y+uSI3Wrwu/m99yQ2dJtLSYgQv7xnoT/
         hxq7nT7dLPzXe1SifOO1/99rV5FHU12hWW9dRuTQWiAC6AciLfyUhI4sBXs55TtFvKW7
         CzEw==
X-Gm-Message-State: AOJu0Yxgzr/D6ytm+zrmi/keQvkonY/nmmop6dqhojpz+iIdW2j+kRq7
	OzT2wHGBjer6pYsJS8O7ws7uM9py2Q6ECcKI6L17lx2v91L9l07E/qANTxItpA==
X-Gm-Gg: ASbGncubm2aN5ToLwr0pTb2QzaBt2CpbSofsjqx9e7BDurOUm5351y8Y1C1jWAFWDdO
	G/FzR+pUKBqZ9VOCAbL4BRjl3mcII3CB0q+fO1cxx3k3ndPNEmZ8xqnbTDSLiaUFxxIBP76QefP
	3NGOBfw09JLgYe9oILqYC8/VQfqsoJ9qweVJ/uoyOWmQ2oLdSIInFZ7g/Pfo/zVBkDiKJGjMI/t
	flrse4S3oPIg7eOQu4t2kxkPh2undm6WvOvhD9pJlls8fjg9ETUFak+rA+7/RS+yparwu50INwc
	2c/gqILyAOttoxqikS4zttSczh6AF4eXrz32slk8DhrvBrpbpBbsQiM0JVLXee/nAIqJurM+ZKc
	P+QAGKISOe20s/i4nXQ7JslEIinL1E+zvWOqPV6sBTtyfehTVqAQIDeW64iu4TOSK1wD7Drs=
X-Google-Smtp-Source: AGHT+IGz10/3ENO8yqJCTlC6H05i4FZFHffxVZlAZr0zy+xLaP5u9qfynV3c9/IDIqsw/FTpJYIe3w==
X-Received: by 2002:a17:906:c14e:b0:ae0:635c:a400 with SMTP id a640c23a62f3a-af2f8d4e87bmr742807166b.51.1753377661017;
        Thu, 24 Jul 2025 10:21:01 -0700 (PDT)
Received: from PC01.localdomain (094190205166.static.ipv4.heldenvannu.net. [94.190.205.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47ff42b60sm134341466b.132.2025.07.24.10.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 10:21:00 -0700 (PDT)
From: Bruce Qin <bqn9090@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bqn9090@gmail.com
Subject: [PATCH v2] staging: rtl8723bs: fix if-statement alignment and line continuation in rtw_ap.c
Date: Thu, 24 Jul 2025 19:17:14 +0200
Message-ID: <20250724172034.44679-2-bqn9090@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724172034.44679-1-bqn9090@gmail.com>
References: <2025072409-promoter-shame-8105@gregkh>
 <20250724172034.44679-1-bqn9090@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes several style issues in a multiline if-statement:

- Moved '&&' to the end of the previous line to follow logical continuation style
- Fixed indentation to align with the opening parenthesis of the expression
- Avoided ending a line with an open parenthesis '('
- Moved closing ')' to the end of the last expression line (as suggested by the maintainer)

These changes improve readability and conform to Linux kernel coding conventions.
No functional changes.

Signed-off-by: Bruce Qin <bqn9090@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 383a6f7c06f4..c652e0cd35f3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -258,11 +258,9 @@ void expire_timeout_chk(struct adapter *padapter)
 		} else {
 			/* TODO: Aging mechanism to digest frames in sleep_q to */
 			/* avoid running out of xmitframe */
-			if (psta->sleepq_len > (NR_XMITFRAME / pstapriv->asoc_list_cnt)
-				&& padapter->xmitpriv.free_xmitframe_cnt < ((
-					NR_XMITFRAME / pstapriv->asoc_list_cnt
-				) / 2)
-			)
+			if (psta->sleepq_len > (NR_XMITFRAME / pstapriv->asoc_list_cnt) &&
+			    padapter->xmitpriv.free_xmitframe_cnt <
+					((NR_XMITFRAME / pstapriv->asoc_list_cnt) / 2))
 				wakeup_sta_to_xmit(padapter, psta);
 		}
 	}
-- 
2.43.0

