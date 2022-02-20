Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C7B5CB0
	for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 20:46:46 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id u20so15038653lff.2
        for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 12:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h4NNgPeseVQ7zc/okpigZG8JuoYTIL2ZK7mVcAwhCj0=;
        b=TVEYLvhADpy6TUhdB4vzPnPjsMHti8s/g42gFVHYAWkWn1CjkM5S1GG2AFeeVtd1jM
         wdH3DVKPn9bdiQyQU0Jhn3m27Iv3pm1XL96esbgDAfy6v4hYeAbQuVGnZDuGrcS5DlXu
         QGUL4aa3Bfce20gK8t1v7XrwaFpJ1CRb3Nq+Za1ypMbIC/UnDrisZsWCMNdDlmuyUk0B
         kKAu9N89i49A9670p/H0lrS/cm4Mczc+7JMVgw2XNAgRQ2EBvmltNexCNM9yemoAmiqH
         XzGtYxzdjYrUBqodAXm6pwC61Zh6IxXDpeBfVF1yB//L88+EetgGL7OazJnCHGKJJHTe
         aaJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h4NNgPeseVQ7zc/okpigZG8JuoYTIL2ZK7mVcAwhCj0=;
        b=r89D/hx5btfkMu4+/l5JLVGPZ/jttY81vTSzkNmOeyH+BNjT94AhG74ZzLtWEo2W9v
         Emopk1vQLrKzVJpBiboGcH+cxtV8PB1LpFNOkMWHwhd7VO8pjXrVNqHp4thej0Yt6UoM
         JkLanisQOu2cAhzm6PqX7c6V/mERv45kIWWUkwdYPVWqApCaTZwxvkCtBfR0HDOxWgza
         kjD6MmSCKhT9EhL359nc5hLciarv/h7pVwvEVzbnFPbKJ7k/zRAFvdIKj5DXrIXibCOs
         njhvRLCrQWVacKbQwxHD6pp7eimPpEah81ko9Gq2rjFzBPO/Y8VO+ilroWlyuRwOWVlC
         kb3A==
X-Gm-Message-State: AOAM531t8g5ci8hyNyl39sfmTRDrP5WmLm1WoXdkHKQX8yOzJnX3HUWq
	92351Xjgnd+lseU7fulT/c3EXMp6XZY=
X-Google-Smtp-Source: ABdhPJzshzL+KSV2yLT9MUX88yqjVxdxMGn/JUgPJDkWdM1MTgyIa8QKiAAeyt5yqld8hrhRS2cVjg==
X-Received: by 2002:ac2:5de4:0:b0:443:5b80:d4c4 with SMTP id z4-20020ac25de4000000b004435b80d4c4mr12044367lfq.373.1645390004777;
        Sun, 20 Feb 2022 12:46:44 -0800 (PST)
Received: from localhost.localdomain (109-252-138-165.dynamic.spd-mgts.ru. [109.252.138.165])
        by smtp.gmail.com with ESMTPSA id o14sm913955lfo.117.2022.02.20.12.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 12:46:44 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/8] media: staging: tegra-vde: Bump BSEV DMA timeout
Date: Sun, 20 Feb 2022 23:46:20 +0300
Message-Id: <20220220204623.30107-6-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220220204623.30107-1-digetx@gmail.com>
References: <20220220204623.30107-1-digetx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

BSEV DMA timeouts if VDE is downclocked by x10. Bump the timeout to allow
DMA to complete. We don't support freq scaling yet, this is just a minor
improvement which may become useful sometime later.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/staging/media/tegra-vde/h264.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-vde/h264.c b/drivers/staging/media/tegra-vde/h264.c
index a46c648a26c6..d8e5534e80c8 100644
--- a/drivers/staging/media/tegra-vde/h264.c
+++ b/drivers/staging/media/tegra-vde/h264.c
@@ -135,7 +135,7 @@ static int tegra_vde_wait_bsev(struct tegra_vde *vde, bool wait_dma)
 		return 0;
 
 	err = readl_relaxed_poll_timeout(vde->bsev + INTR_STATUS, value,
-					 !(value & BSE_DMA_BUSY), 1, 100);
+					 !(value & BSE_DMA_BUSY), 1, 1000);
 	if (err) {
 		dev_err(dev, "BSEV DMA timeout\n");
 		return err;
-- 
2.34.1

