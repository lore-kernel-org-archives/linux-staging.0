Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCF2168
	for <linux-staging@lists.linux.dev>; Sun, 23 Jan 2022 18:41:38 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id t18so13472890plg.9
        for <linux-staging@lists.linux.dev>; Sun, 23 Jan 2022 10:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IkNrFbXH9gY1KIOKy+h9o3LQcC7Su75w6LGwm4LKjaA=;
        b=EaNO/dASy+lPZWlcOtxF1hC9GdUeB2iS8umkWOWTX4v3h315YhPaRibVAi7vXbbHWe
         dZQi44B8tyxUoVsiF1ho0iJZOHCw92Invp1s1Jngv0T8L+0c7uqMPEEfpdlpf7wsR2hX
         def6pyngVUbofEtQ0onarODYce0lr6EcewlHKAkg7wW7/E/IkNjJ29EwgZ9JC95dqfwt
         HyYjjJh6C7hZd1XozPUerv73BbBwkDAQaBq4LR4A9muS5E19XN+FHJn+gDMMIIQ3OCVG
         BFULBqru13piNITxvIlEYH3XteGH1vToU8U0ADIfL8v4GWj0g5Y1FVAMkzSf8zEQusxa
         sUQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IkNrFbXH9gY1KIOKy+h9o3LQcC7Su75w6LGwm4LKjaA=;
        b=Qn8IpnF/mFXm+2NCcIx5qX8QZk8o4OWi8Pm9iCX8voJj/ENBRdRs+u1QZAj0Wg1irK
         aiTv53jINZhYr9HRUYbyDalwZ17c0wf9k8fd1+YWFJ1lVweXDte66gKUqeGNcprTfCI+
         coADZuULOS5DiWJyyEdXDdBVJF9Mw6MY0xhSxUvsCiwtpnl45lEAOVrHi6koOkHZyzsd
         +bz7YyaxpOtFlx2IVJr8fuCCplDMmWfASbL8zcnOC8Eiq2q6r9+eMXGYyGw/nTjI1bE3
         CTbfNDl9Ssxv80yNy+aZuvxOOyjJ9vvKUi6DVtic78DZ0vn6xF2l5OuE5qnHl4GiKOuw
         1rTQ==
X-Gm-Message-State: AOAM530/eRMd+QsrYmoekwHGOYnVlUKqFh1974w1ui/pbnuA3MQBr1Ol
	6zsGOUmy3gtjusHRbHHoD84=
X-Google-Smtp-Source: ABdhPJzWjGjT87hpyuJ8zxGhbFECmd1/Zcro15HLI2qS1pA/4gjZkUJUdMuLJwg9rhA75s0Tv2Dbgg==
X-Received: by 2002:a17:902:c40d:b0:14a:96a4:1044 with SMTP id k13-20020a170902c40d00b0014a96a41044mr11869369plk.50.1642963297601;
        Sun, 23 Jan 2022 10:41:37 -0800 (PST)
Received: from localhost (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id ms14sm11163509pjb.15.2022.01.23.10.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 10:41:37 -0800 (PST)
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
Subject: [PATCH 35/54] drivers/staging: replace bitmap_weight with bitmap_weight_le for tegra-video
Date: Sun, 23 Jan 2022 10:39:06 -0800
Message-Id: <20220123183925.1052919-36-yury.norov@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220123183925.1052919-1-yury.norov@gmail.com>
References: <20220123183925.1052919-1-yury.norov@gmail.com>
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
the bitmap earlier, as soon as condition is met.

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
2.30.2

