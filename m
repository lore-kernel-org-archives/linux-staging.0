Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2593246AA
	for <linux-staging@lists.linux.dev>; Sat,  6 Jan 2024 05:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="KGP6S+cZ"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3bbebe6191bso312865b6e.3
        for <linux-staging@lists.linux.dev>; Fri, 05 Jan 2024 21:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1704520570; x=1705125370; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xcpBhKPXVjKfWcfCaYYKt8+x28tLO44v27oA5X8COYY=;
        b=KGP6S+cZEMwmf0FkxzTDcOx7W50s+6XEh1HeVqvTTqu3mjCZ/9tg8j1lunlVcq+zY0
         rplPlAuHAUNSlEmBLSnzJnVQXIlKlABkFiHp7t1gnxJggE3Ll+fpEz6PtTWnR2ANL379
         62tKB8Vq3r4kBURuZWMmkTgWCjbU3iEh44qvGzpG8jP5Djm/T7FJR0ZjmPNBfqdYhL+r
         BKQV6RgntnTOX/wsM6h52PG7uLZuSn9ClmxWdZ6jQFCp9zIRkZcKbpXnZni/PHtysson
         krZpJqpV4FIErg2DnI4c9dKWrEzvKeNW2dBH6ggtBnkJ7vAcNu0qqfsWQJ8x1RX10n0g
         ya0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704520570; x=1705125370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xcpBhKPXVjKfWcfCaYYKt8+x28tLO44v27oA5X8COYY=;
        b=B6gVfWnAQ6KEhgn0DwUkRhmWiUuRdPAljmJp2RaA9rFa7pdgy9EB76bhZsIpXQKqqP
         b7EfngCOh1O5rXyT+kq6pORdGe0OxLYn5GnobAIw3NMq77nIv5Xp3DzwfzlDmtYjwJrL
         A5OiqhnVkJNqqmA6o+NcQbrmjoRfKWJU9ZgCxH71ByuC4/4ATgjpOCfrY+QPJ/3Gnf6U
         k3yrUDUW2K1r9hxJVCB7myWLJNJw7s5dBdB0NXPLg1pkeKmta2MrrFFMXDYl/82G36QX
         uULfPpBcrMSIgcK9hL+ngzdfpPYdh135GYsx8BZbnrXtSloFN/lZOIx9EMApml8X3jNv
         OWxA==
X-Gm-Message-State: AOJu0Yyh6EyG/PzGyjAYNzPCGr51EtcoEGIrg7O2sGI+Bkb/jjRs0E/R
	2BSOeB2Ol0nkgypz0b1N1HdMpoLXOgkvFQ==
X-Google-Smtp-Source: AGHT+IHvdrvWpmJwR9dlWUDkGQfLW/+8q7oGljtk3GWj7thWBCKcApXp8wgBYrerP51ZiM06yvi1yw==
X-Received: by 2002:a05:6808:221a:b0:3bc:2777:397b with SMTP id bd26-20020a056808221a00b003bc2777397bmr731939oib.41.1704520570290;
        Fri, 05 Jan 2024 21:56:10 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id y29-20020a056a00181d00b006d99d986624sm2280873pfa.151.2024.01.05.21.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 21:56:09 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 03/21] Staging: rtl8192e: Rename function rtllib_MgntDisconnectAP()
Date: Fri,  5 Jan 2024 21:55:38 -0800
Message-Id: <20240106055556.430948-4-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240106055556.430948-1-tdavies@darkphysics.net>
References: <20240106055556.430948-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename function rtllib_MgntDisconnectAP to rtllib_mgnt_disconnect_ap
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 1d490704389e..6f730242728a 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -2265,7 +2265,7 @@ static void rtllib_MlmeDisassociateRequest(struct rtllib_device *rtllib,
 	}
 }
 
-static void rtllib_MgntDisconnectAP(struct rtllib_device *rtllib, u8 asRsn)
+static void rtllib_mgnt_disconnect_ap(struct rtllib_device *rtllib, u8 asRsn)
 {
 	bool bFilterOutNonAssociatedBSSID = false;
 
@@ -2285,7 +2285,7 @@ bool rtllib_MgntDisconnect(struct rtllib_device *rtllib, u8 asRsn)
 
 	if (rtllib->link_state == MAC80211_LINKED) {
 		if (rtllib->iw_mode == IW_MODE_INFRA)
-			rtllib_MgntDisconnectAP(rtllib, asRsn);
+			rtllib_mgnt_disconnect_ap(rtllib, asRsn);
 	}
 
 	return true;
-- 
2.39.2

