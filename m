Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510F6EC1
	for <linux-staging@lists.linux.dev>; Sat,  7 May 2022 18:34:17 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id v12so14072074wrv.10
        for <linux-staging@lists.linux.dev>; Sat, 07 May 2022 11:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KQVod+LIsL2dmZvlmndlBF3HF+IRF2gal3cYOuUcsuc=;
        b=gg9+N19hUZK3SAO4/zkjI2MpjxT8l7+NWmXgp6ZIrrIliOLEmfkhEp2njPbvxW3HXP
         5RgqjdntbRCvqxXSjgpS+N5ncB0a90TkZ6dNXFZWXjnLWBhYYXyNmRCJ+Nk0VSfbtJqr
         4kOXP4DctvbayOMWwdeeGvriYKLxnTuIhhNCNdmVzPuFIvBK17CEXew3eeS91z0lw7Nf
         6bX0YVuf76r+h7/ybhvAyjBK+QBMQv3AHK+KzqxP9iioRPziS9Dh6d1MkIPBoBo9bvyh
         uYqreKxigjgO+srtGQaFVZIa7A+jedUVZlQ+qw2j/8HgVQkn3dOVdDDdHYVXLpDiUsxV
         bMdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KQVod+LIsL2dmZvlmndlBF3HF+IRF2gal3cYOuUcsuc=;
        b=ayfoXziEzdkYKk7T45VXudPVEvEUogy/6x9t0uKAyFmdENbG8B+z4YKLtcgaw5eYHU
         6zxkMBJ5XLLRUjC2zzQ9NbDOZ9mAPRxXcDGATH6k6eLbmO6O/cCxesONarvfn+ZHUJQ4
         a1C7z4WC2uGbpsFXgILs5LrdIlqGjgudNRlJVCtQrLpEosF8oZuTIZzuEdlgPGmAemVu
         wZ1nnxJVms3FLquG3N2ID/uc6m/6dD1wHDKlIoqzKbg8jgGktnOK3jyt8Pc/QapqN8dF
         HzqDm6wQrqkmxhHBSzZm9BIGfOC3Cea+5dgYUwF07/2iIzgHuYC+1lczAkuHsKGeNKyW
         oD0w==
X-Gm-Message-State: AOAM533pjXWThzM9U2U+x9wifFRZk7N8m8c01oSUNvaOacloQ/TYUgjt
	FD9ydHTF+jPPtZkEVG/r/Uc=
X-Google-Smtp-Source: ABdhPJx3Q40DD0GCOXiXnFeZWHGSMIzWaLXzzWc0Le3e9YjapKmr+0+wCmccOvPBxyqn0axEooEe6w==
X-Received: by 2002:a5d:5846:0:b0:20c:7407:5fa1 with SMTP id i6-20020a5d5846000000b0020c74075fa1mr7368426wrf.116.1651948455622;
        Sat, 07 May 2022 11:34:15 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id n18-20020a05600c465200b003942a244f4esm11726417wmo.39.2022.05.07.11.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 May 2022 11:34:15 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8192u: make const array queuetopipe const, reduces object code size
Date: Sat,  7 May 2022 19:34:14 +0100
Message-Id: <20220507183414.26633-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Don't populate the const array queuetopipe on the stack, instead make it
static.  Also makes the object code smaller.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/staging/rtl8192u/r8192U_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
index ce807c9d4219..2ca925f35830 100644
--- a/drivers/staging/rtl8192u/r8192U_core.c
+++ b/drivers/staging/rtl8192u/r8192U_core.c
@@ -2537,7 +2537,7 @@ static short rtl8192_init(struct net_device *dev)
 	}
 #else
 	{
-		const u8 queuetopipe[] = {3, 2, 1, 0, 4, 4, 0, 4, 4};
+		static const u8 queuetopipe[] = {3, 2, 1, 0, 4, 4, 0, 4, 4};
 
 		memcpy(priv->txqueue_to_outpipemap, queuetopipe, 9);
 	}
-- 
2.35.1

