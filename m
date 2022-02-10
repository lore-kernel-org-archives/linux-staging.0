Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828282C9C
	for <linux-staging@lists.linux.dev>; Fri, 11 Feb 2022 00:06:55 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id w8so6685787qkw.8
        for <linux-staging@lists.linux.dev>; Thu, 10 Feb 2022 16:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=kIxNsx5t66aCekxGiYnzItzLDmvgCurjGzLHlKM8kmo=;
        b=kUPI1caTAiBqAVK3q8DnKRacUz2Uib6Hme9P7gr7i8kQ+e8TDEJqGlFb9zgPToD7X4
         N+9XO0XYP2mYbZz74uZ8ryyWvq1dnX9hrT17tCXcrSr4PANCJ/G0mRpk/gSmP6hwaIA4
         tSW8lv3cVv4eh0Fc3r/J6QFoUcItqKb2tIQyxE/nf7iYijX6DS2RQXFJKqGgFPMhUCS9
         Dqf5xuMhdzQRvnaBkiEGdwqac4utkIFoMdIFFiXveNwGxaUBDmRdbQNyiyVPpzaVTcFz
         igRbWOfbP9PGIw7H/TiCmFN2ibo8AOWyYEUvfZNJ2d6hoCz97qFC1FNpcapXfbvgCC0D
         Dc2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kIxNsx5t66aCekxGiYnzItzLDmvgCurjGzLHlKM8kmo=;
        b=EMfqB6JpXK3DVOCsTnlB5AFmqt2NK5FPCQR/YH7zSLYxwvfAsg960gtemipS+KnIh9
         J3h6jyiNrUd1yEizU3vGVPgbBuENxnshZIvoJxdUHBa2fp/wD6H2CJBAXgsqPXa6XBnA
         BTIokDEJ3H7Mbkq6koMb18fNGTpfx+2Ijvwkn1FhO4StnTZVRCW8d34Jh5x83yA4BUMR
         Hs+z/EU9qSQ50FI3y194Noo9jUWAOlcVvrYUR/kgjNicrfIEOgSwWd90spEFOtqSYqWI
         UKIqaCTx67lweIQZH4WalFCYo81M6KFtk4+z5DoslXTL+siMKjdWhspfVBSGUQMCMFx9
         AmHQ==
X-Gm-Message-State: AOAM531NIoXWlgVaFb8lRfr25d/PBuIr1zyP9jRSwPVR32C+hRwKTcm+
	MrJncUzogDZOf3t1tFBeps0=
X-Google-Smtp-Source: ABdhPJwXNB8AH9WzcydC3nOV4kHShzA6P4syYry2xqBz+Iro1F4pn0IXPMbEY20Ct9c0HLCgx/xhIg==
X-Received: by 2002:a37:851:: with SMTP id 78mr5100598qki.617.1644538014344;
        Thu, 10 Feb 2022 16:06:54 -0800 (PST)
Received: from localhost ([12.28.44.171])
        by smtp.gmail.com with ESMTPSA id v5sm11133965qkp.70.2022.02.10.16.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 16:06:53 -0800 (PST)
From: Yury Norov <yury.norov@gmail.com>
To: Yury Norov <yury.norov@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	David Laight <David.Laight@aculab.com>,
	Joe Perches <joe@perches.com>,
	Dennis Zhou <dennis@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Nicholas Piggin <npiggin@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Alexey Klimov <aklimov@redhat.com>,
	linux-kernel@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 34/49] media: tegra-video: replace bitmap_weight with bitmap_weight_le
Date: Thu, 10 Feb 2022 14:49:18 -0800
Message-Id: <20220210224933.379149-35-yury.norov@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220210224933.379149-1-yury.norov@gmail.com>
References: <20220210224933.379149-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_channel_enum_format() calls bitmap_weight() to compare the weight
of bitmap with a given number. We can do it more efficiently with
bitmap_weight_le() because conditional bitmap_weight may stop traversing
the bitmap earlier, as soon as condition is (or can't be) met.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index d1f43f465c22..4e79a80e9307 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -436,7 +436,7 @@ static int tegra_channel_enum_format(struct file *file, void *fh,
 	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
 		fmts_bitmap = chan->fmts_bitmap;
 
-	if (f->index >= bitmap_weight(fmts_bitmap, MAX_FORMAT_NUM))
+	if (bitmap_weight_le(fmts_bitmap, MAX_FORMAT_NUM, f->index))
 		return -EINVAL;
 
 	for (i = 0; i < f->index + 1; i++, index++)
-- 
2.32.0

