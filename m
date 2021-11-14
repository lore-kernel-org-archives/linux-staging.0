Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE5372
	for <linux-staging@lists.linux.dev>; Sun, 14 Nov 2021 22:48:29 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id f18so38395291lfv.6
        for <linux-staging@lists.linux.dev>; Sun, 14 Nov 2021 14:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ukIDuU6IlT+86rCbL8zG0hZeRU+DOUqbYsBqeamrzG4=;
        b=gc7lEoxEblf+lqkcWvb1ovyp45r96q6ZXcGWz8TUEKk1dl3sAJ0cYQgCNnrv7Xfmfz
         F3dmQdq0XABP0kx07QUaVgdC152tDCGgVhxLfaDmKmDpr5EPafLtH14RyW0cc4QhVT+I
         kuf6UzBFkfcQ9GtLEBjEh4iKHwhI+e9qsFl3U1eQUgN8+DQSjbwMR7wWhz9aoIuBMFIO
         P489YXVM96jGobvUkB250f/4QF7T4xYEjdsX8uV+0s3vje7NV0XywfJsLEmBHRBiGJkX
         R/ytKrqTFhPbVHKS9URThGzwBbcsXyzsapK3uJxbzOnubcWPT0JcX9JrOMOG5QVdCRK8
         6SYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ukIDuU6IlT+86rCbL8zG0hZeRU+DOUqbYsBqeamrzG4=;
        b=rhZsOcKcn9Od6dEuR/HI+ynlYIiXYowtiUFIfTy7mWh0Vgvlo/+9KJv8ByBryvEtme
         erkJWf1Fwn8/Sh23jnFSwbLYutLVuH5xvoa052wDXCXW9y++c6A2X5fGzN8AmYB6UaWM
         Ro8Tj6FyG7WTiHnHZ8epH3AFa7dw/CsdjTzl5bjzx6dbDwMjDdvpcp81O4AyWRCIZFH3
         M9N4Axzy4P1o6rSEXxdTLIgRdsaZF+mh726GhDU71YUFphoAlIcHPe2tfePxnn4vu8cr
         0ukHLvhx2i0ZPsvRkglpk9D8I+JFfCy5EKgy0fhlTJ54I39Q/jt7jZIDvAtNVCGt/nBo
         zj7A==
X-Gm-Message-State: AOAM533BFMZWL6+2yqkms/d4Xay6E8gncoHOPOaMyfE0FlXonhA1eer1
	m78OT0PgdBSRe3kh6BHEvzw=
X-Google-Smtp-Source: ABdhPJx1HJ/U08X2T1uvRiZzPj/CNGmMlyAz/lzuqpzE2X9ZsB8VQxSKym1zKmQPOuj4OWRC2/Cr3g==
X-Received: by 2002:a05:6512:1093:: with SMTP id j19mr31596154lfg.340.1636930107901;
        Sun, 14 Nov 2021 14:48:27 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru. [46.138.46.211])
        by smtp.gmail.com with ESMTPSA id h1sm1228591lfu.277.2021.11.14.14.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 14:48:27 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Anton Bambura <jenneron@protonmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] media: staging: tegra-vde: Properly mark invalid entries
Date: Mon, 15 Nov 2021 01:47:31 +0300
Message-Id: <20211114224732.11550-3-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114224732.11550-1-digetx@gmail.com>
References: <20211114224732.11550-1-digetx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Entries in the reference picture list are marked as invalid by setting
the frame ID to 0x3f.

Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/staging/media/tegra-vde/vde.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
index 81f3e9e7e4d6..f4f65eb78d44 100644
--- a/drivers/staging/media/tegra-vde/vde.c
+++ b/drivers/staging/media/tegra-vde/vde.c
@@ -340,7 +340,7 @@ static void tegra_vde_setup_iram_tables(struct tegra_vde *vde,
 			value |= frame->frame_num;
 		} else {
 			aux_addr = 0x6ADEAD00;
-			value = 0;
+			value = 0x3f;
 		}
 
 		tegra_vde_setup_iram_entry(vde, 0, i, value, aux_addr);
-- 
2.33.1

