Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6AA3BBF8
	for <linux-staging@lists.linux.dev>; Sun, 28 Apr 2024 23:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714345278; cv=none; b=vB35bJIfq6fUW4UX2jlRbBCE1vgUShkSnDBgZqNa67pBTnCNSu4WMAz0rJnNj91uGxhnUzFymNwWyXiq8mrIl7GyV0Sc7ijD4UARMAmsl7td/VveD+FOAhkBPp4k2RBv9MmMLuMYWiWsuh01xN826IHPC3HzLS/ze29fOvVc81A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714345278; c=relaxed/simple;
	bh=RPSLZBQ1MeEJKoB2Xj/0zC+pBhTogLhHUxLxgc2kXJo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IA1EhnIKy9Qq3707gKZ56UiBKjL9JViv5LE6sn20bfku6SFRfy0yBdlnZevAaV2FzRlXDAkK4WFSQKDmwQiKoKVE8oHwwrJeuULyxt0tXx0y8GfkzgaNL+38WeerYkVSSqKfJFzhnjhT0J24p6GAHARItQ2/LyxKWCIz07f3h/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=PGcwDr3o; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="PGcwDr3o"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ac1674d890so3449310a91.3
        for <linux-staging@lists.linux.dev>; Sun, 28 Apr 2024 16:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1714345276; x=1714950076; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pZkXwXrzxvU1FhwauQRCc2N6ZVAq4y5Wr93P+/dn7+w=;
        b=PGcwDr3ojSTsq0jntvgIM/+9DwSPDaPowfcuedNApdxFzRaC5lWW+u/wvR7tzR7oGn
         HGcMiYLWmaBS4JNfgqm0BWWyK7wowTRTMncYpbG2PGsRqadBkCP5wEOmhu5zussmlWwG
         j5ghaOZ9fGpPsz2KT2RfN/TYKhnTNYzjgvgEh873FvOtK3RJU07Wz0tEuLhPrlsCZk9z
         6JagQViSwB/TGldUiI2ukWvapL2TkxN5e5Ypo6O5NseXeCaVcXB0vSOGPQ2ehPZMYcMe
         sk1qfBShFOnG9UIGm1F3VzLWh2hNXpU/ZURPkhoAchiILuIkCQ9Cb9M7Qqa9gNZFxSZp
         o0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714345276; x=1714950076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pZkXwXrzxvU1FhwauQRCc2N6ZVAq4y5Wr93P+/dn7+w=;
        b=xTSmBkkelv35TUpdcVVdJ+B/CYNwEjCTsQgKdvjbz5GVKxuUM1nyCzniVlynsJn1w5
         b7exn46JWExUkAYGDLP7vQ7yBJrjYulyGcDqxAVM3CNRtB77ukpZCQyXZBolfwFRKXGo
         XqxIfbYupdzjS+Z0e8UqHPXRCeRUv+/gV0LkKQOkGOBSILjVnDyQWA3DcdcwbmYbu5Gg
         yZQUEfmeEm4KkQuHOZDawlQerlTcS2ESAbIBYhe3Eoz8h/gfgszRZb3y5hGISwWBpITX
         y9dkotD8LLmTI8AV0k18zsR2KlP05iKw4kVRfHz5vOHARv56oZ3l8zq3gdVBAxalHOva
         5Wjg==
X-Gm-Message-State: AOJu0YyT4RSRp1tQNlGaSiJ6f7JeVlp3sgid6e9M9iVYShU/U13QCpmX
	Fru9ETs1Ya9KTo8i/rg3qIOOBoTTdGDHh6go2eIIXckHHPP1MXw4Jg3WiU6EDvf8UMMpye9oH6P
	8
X-Google-Smtp-Source: AGHT+IHplNZD1AVkefkHTdwYtekFVtk57nirYWDiSEwl5Io6IDzWc3KipvwL+gu1Ga8lMqZdsUTO6Q==
X-Received: by 2002:a17:90a:628c:b0:2b1:d11c:ca21 with SMTP id d12-20020a17090a628c00b002b1d11cca21mr637186pjj.40.1714345276722;
        Sun, 28 Apr 2024 16:01:16 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id o16-20020a17090aac1000b002a27132ac02sm17860864pjq.2.2024.04.28.16.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 16:01:16 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 11/18] Staging: rtl8192e: Rename variable TxSTBC
Date: Sun, 28 Apr 2024 16:00:59 -0700
Message-Id: <20240428230106.6548-12-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240428230106.6548-1-tdavies@darkphysics.net>
References: <20240428230106.6548-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable TxSTBC to tx_stbc
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_HT.h     | 2 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index b9f50d195b13..bd66df620793 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -30,7 +30,7 @@ struct ht_capab_ele {
 	u8	green_field:1;
 	u8	short_gi_20mhz:1;
 	u8	short_gi_40mhz:1;
-	u8	TxSTBC:1;
+	u8	tx_stbc:1;
 	u8	RxSTBC:2;
 	u8	DelayBA:1;
 	u8	MaxAMSDUSize:1;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index cf3536fdefbd..d51a0daa9196 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -262,7 +262,7 @@ void ht_construct_capability_element(struct rtllib_device *ieee, u8 *pos_ht_cap,
 	cap_ele->short_gi_20mhz		= 1;
 	cap_ele->short_gi_40mhz		= 1;
 
-	cap_ele->TxSTBC			= 1;
+	cap_ele->tx_stbc			= 1;
 	cap_ele->RxSTBC			= 0;
 	cap_ele->DelayBA		= 0;
 	cap_ele->MaxAMSDUSize = (MAX_RECEIVE_BUFFER_SIZE >= 7935) ? 1 : 0;
-- 
2.30.2

