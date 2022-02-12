Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADCB7E;
	Sat, 12 Feb 2022 07:42:47 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id p15so27108996ejc.7;
        Fri, 11 Feb 2022 23:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EkWXkKewPoFhmQKCPIXY6OJ14gKmezWp3+CXE5li4HY=;
        b=J57KOpvuDcRiVi6fAKqtJNgiUyt+KnQ5OMPQqtLdEIlei46C6IQUi83n5m38nQc+Vi
         VpPe/5ClLJdFX0x6EZiNfd2W0a2vlvf26YHyNPcfHVH2CteBHl9BSkelXeH21NUZkmN/
         Ce3AtGY+y3wZxFztDmdLnSl/Ncvcm5z1M/6p8ijl5GE3G38CMRGCQJiW0NZQEzgUjbSM
         oQJmiwGBa/4mUdbhkz+nW8BOFyh+fUa91ww3RC56FgxcfZ7zJNhzWb/Rxaj1HoE9+66c
         NK/Fnu0JZuL5nBBNZ0Rfsg4DIQJOomjYjiIWW789YwUwoUZOHEpLCvztvdPbVuCq4lA1
         Gmwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EkWXkKewPoFhmQKCPIXY6OJ14gKmezWp3+CXE5li4HY=;
        b=tipT8mGpgghK7SPEIYeS34oQ9AaXsGFhjNL0SHYJc50iS/NIIxDsC8WXoAwSv8cnTg
         ki8pbCmJYBxYE+l2Ytxa42AbKHMlwPOPMy7Dd5cWtO3t8d48YLxXEcJcYkbDFVuNXY/D
         tVRzNlMPIJOPn2zMMnx7wxsVmJcw3tXQPo0klPLkF7CkxCaQoNojKiP8fLngzPJD4nZ/
         hOKE8TM/D60pZDzIATVgq++azyTn0emNLDoetB/ZkknMbbboqcPv7umd2AAz55RWV6tz
         plxvRQDexKw5O8cWfa5LPqCL2+EWi12CDNSgRMtDOQSJiEsxTNcEEhlchkW5TzTlz+7T
         T+WQ==
X-Gm-Message-State: AOAM530qhXN2dloah8QmOAPtEyjruvTJ8y57QZknq9Y9fKYwm0EM37j2
	eipYJD7DG/fSrRvKWc07PoM=
X-Google-Smtp-Source: ABdhPJySJr/9z9/AK53BzSB0SjeMcNIW1fPYpoxDyi0pm3Rzd+rri0GsDsaXSbzRyZh/X9GaTr17RQ==
X-Received: by 2002:a17:907:94cb:: with SMTP id dn11mr3974252ejc.81.1644651765489;
        Fri, 11 Feb 2022 23:42:45 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id w20sm1383205edd.79.2022.02.11.23.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 23:42:45 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	paul.kocialkowski@bootlin.com
Cc: mchehab@kernel.or,
	wens@csie.org,
	gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] media: cedrus: H265: Fix neighbour info buffer size
Date: Sat, 12 Feb 2022 08:42:41 +0100
Message-Id: <20220212074241.43184-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Neighbour info buffer size needs to be 794 kiB in H6. This is actually
already indirectly mentioned in the comment, but smaller size is used
nevertheless.

Increase buffer size to cover H6 needs. Since increase is not that big
in absolute numbers, it doesn't make sense to complicate logic for older
generations.

Bug was discovered using iommu, which reported access error when trying
to play H265 video.

Fixes: 86caab29da78 ("media: cedrus: Add HEVC/H.265 decoding support")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
index 8ab2d9c6f048..44f385be9f6c 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -23,7 +23,7 @@
  * Subsequent BSP implementations seem to double the neighbor info buffer size
  * for the H6 SoC, which may be related to 10 bit H265 support.
  */
-#define CEDRUS_H265_NEIGHBOR_INFO_BUF_SIZE	(397 * SZ_1K)
+#define CEDRUS_H265_NEIGHBOR_INFO_BUF_SIZE	(794 * SZ_1K)
 #define CEDRUS_H265_ENTRY_POINTS_BUF_SIZE	(4 * SZ_1K)
 #define CEDRUS_H265_MV_COL_BUF_UNIT_CTB_SIZE	160
 
-- 
2.35.1

