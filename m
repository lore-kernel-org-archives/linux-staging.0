Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591586D1B
	for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 08:18:18 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id w6so3454335plg.9
        for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 01:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2kCf9usHbQVqNC8f9TMv7s7ItULCXlHodiSiSF2nw00=;
        b=tHEBKtEPeEPTZBKx+FPRkTwHOZIKAnZZHwUfLWfNOcbPTZD/xa7w09Q2DapUuzrUJr
         vvmg0dLTNpm5RVsIxxKh7Jk20Hmcky5y8KYgnjjPsUlAe9se1rJEnhHY5XIH8BoFnW6w
         zT9l0Ke253ktQThU96Kx3EJlkMDo4iQFjqoacWHnSXYFBfl8vt8M+Y/Y6s38O6bcmhpr
         knd5lLYu4vJ1+q3cUileSx2+xP9zJqcMyyhH7XCknWlCeEneHaJqX7MmPxzrnWydhQBo
         GgJliDjkQCawZN7peVidSEa60NO1LjGxV619ahEEB/DD9K1MvBE6m1YYtygrFn1H4DOp
         Z8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2kCf9usHbQVqNC8f9TMv7s7ItULCXlHodiSiSF2nw00=;
        b=Cz3ikJtx2I+zCnf37lq48fB8KksgIthZfwn2j57BcMiB7dnQZcOPc45NOLtSXYxjQB
         VQZ/j4HP5U0ziYDHusyB2ZrdJ2sDG+UtQcK4Je7Qwt+tPu9ZDejfHj+E0i123rgQFYTB
         HZOxHJZ+6ejTc+B9k8x7tyC5jEkk5v4b3y0StyV91faLGD29kF9T2xw94SnZ+kuLXpgU
         wtGtTgDG9QZ00Tsw8FVvYrkUtAX9saSBX/GEcnXKy4ZXoBG9O6aBcCgsH27eDWJtNr9P
         bkeDDkwlqBFIgMcDNXpc2tFnc+AkWAL34Klg/xxhytTAQXhPlzQundAnatxkrQwLr4BJ
         CUqg==
X-Gm-Message-State: AOAM531V7wzJpr24g0fIUT6LAahQvEhwZnf8ND5OEZAqHjDa2IfjMzyf
	Wd7DWMy0S9RmaMdgvhykB+k=
X-Google-Smtp-Source: ABdhPJyUqp0ax9CCNYoObUzBBwuxVr0iKJRPRfGprzv/2OC77ECKxk6USdnFxYDduv9/UgFZ0GiQTg==
X-Received: by 2002:a17:90b:1c8e:: with SMTP id oo14mr14013967pjb.108.1629361098034;
        Thu, 19 Aug 2021 01:18:18 -0700 (PDT)
Received: from xps.yggdrasil ([49.207.137.16])
        by smtp.gmail.com with ESMTPSA id gb17sm1531129pjb.26.2021.08.19.01.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 01:18:17 -0700 (PDT)
From: Aakash Hemadri <aakashhemadri123@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] staging: r8188eu: incorrect type in assignment
Date: Thu, 19 Aug 2021 13:47:57 +0530
Message-Id: <6fa4a97fd0c2f0e3be6066ab6f059097e8cd29af.1629360917.git.aakashhemadri123@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1629360917.git.aakashhemadri123@gmail.com>
References: <cover.1629360917.git.aakashhemadri123@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix sparse warning:
> rtw_br_ext.c:516:57: warning: incorrect type in assignment
    (different base types)
> rtw_br_ext.c:516:57:    expected unsigned short
> rtw_br_ext.c:516:57:    got restricted __be16 [usertype]

*pMagic expects unsigned short not __be16, so remove htons and cast
MAGIC_CODE as unsigned short

Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_br_ext.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index 14b2935cab98..600a38330579 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -513,7 +513,7 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
 
 						/*  insert the magic_code+client mac in relay tag */
 						pMagic = (unsigned short *)tag->tag_data;
-						*pMagic = htons(MAGIC_CODE);
+						*pMagic = (unsigned short)MAGIC_CODE;
 						memcpy(tag->tag_data+MAGIC_CODE_LEN, skb->data+ETH_ALEN, ETH_ALEN);
 
 						/* Add relay tag */
-- 
2.32.0

