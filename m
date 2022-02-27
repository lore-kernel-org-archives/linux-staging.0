Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62D12F27;
	Sun, 27 Feb 2022 14:50:30 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id w3so14044888edu.8;
        Sun, 27 Feb 2022 06:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CrbuTWBGQGF1wKlq0XiQG6lHRZW77tNfdMa5Cg7nAoQ=;
        b=UnUTFbikRlKsnmxTJl1qYMTnJhUdXo2Mw6/A2h8+Dd22/WCwk7gDYe4mX3ebjCslBf
         n81T74uLYvpybl/0eQD8efsoQhMREqDZd7dXlJ6hovOgqBEk1WRc+GnACSxZxreZ26Ul
         BQALOopIr+d1bVjGIdzRBfKZyxmvG3vmDvkDeABERmoo0ejF+J7xP7X0XtvQyF8bmf8R
         eEv8a2wbdvnOLCZ2xd6xTwn07uPX1Me1uS5aFz8Mq/KIjdvDzhDvzhw7DOXTMbRL3Vft
         UEhAiRAZPjFH36OMoEZ7eS8QJTyEX+OBdfxuAFC002Hjmq4U+QmbXMW+txvUqAE8hleD
         SnbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CrbuTWBGQGF1wKlq0XiQG6lHRZW77tNfdMa5Cg7nAoQ=;
        b=xuXM0UUqxr6xSywZi+2kyyXnUkl2jVKYN6FaT+ug1+GW3CobppoQwi1IRxDMTjI/4z
         KZrwik2SZ64lLx9fH3aVlnPNtE71KfabLtLZJECz0E59R9fjC7MjBol1F9XU/RBdFrUM
         ariwtkHHRozTdJ2mRHclHQowJKT8Cpq+i5hRDYIZxzZRT/LjBPUlkhp6MF5OWofsiT0f
         xSmjUvGpS+ZikVg32yFO1xq5PiwPRTmeM7XSWoouODu7WLCt1u13Zf2r9lrJU3G+FqXt
         vqq7uoMWac27RCbk2AxZlWGjhT6dUGv5FvZzm+t610+KlOxOkMO700Ifih+B0k3eKUqz
         ptLg==
X-Gm-Message-State: AOAM530i8zOB47/6mvLomialAa8d5NA+Ej6f0kXf9zjX9FOqopzlYjPT
	Qq0FcrlNGrt7wq8nDxXp/+w=
X-Google-Smtp-Source: ABdhPJx9vkMDAjlbJa6ZoafcNpXzzrgRLL6r//RkTA9DQ26x/9ZskSxSIwV77psWiiCzvNT1ZYH34g==
X-Received: by 2002:a05:6402:50d2:b0:413:1cd8:e08e with SMTP id h18-20020a05640250d200b004131cd8e08emr15521864edb.276.1645973429011;
        Sun, 27 Feb 2022 06:50:29 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id a1-20020a1709063e8100b006ce06ed8aa7sm3501887ejj.142.2022.02.27.06.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Feb 2022 06:50:28 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de
Cc: mchehab@kernel.org,
	nicolas@ndufresne.ca,
	hverkuil-cisco@xs4all.nl,
	gregkh@linuxfoundation.org,
	wens@csie.org,
	samuel@sholland.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [RFC PATCH 0/8] media: hantro: Add 10-bit support
Date: Sun, 27 Feb 2022 15:49:18 +0100
Message-Id: <20220227144926.3006585-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

First two patches add 10-bit formats to UAPI, third extends filtering
mechanism, fourth fixes incorrect assumption, fifth moves register
configuration code to proper place, sixth and seventh enable 10-bit
VP9 decoding on Allwinner H6 and last increases core frequency on
Allwinner H6.

I'm sending this as RFC to get some comments:
1. format definitions - are fourcc's ok? are comments/descriptions ok?
2. is extended filtering mechanism ok?

I would also like if these patches are tested on some more HW.
Additionally, can someone test tiled P010?

Please take a look.

Best regards,
Jernej

Ezequiel Garcia (1):
  media: Add P010 tiled format

Jernej Skrabec (7):
  media: Add P010 format
  media: hantro: Support format filtering by depth
  media: hantro: postproc: Fix buffer size calculation
  media: hantro: postproc: Fix legacy regs configuration
  media: hantro: Store VP9 bit depth in context
  media: hantro: sunxi: Enable 10-bit decoding
  media: hantro: sunxi: Increase frequency

 drivers/media/v4l2-core/v4l2-common.c         |  3 ++
 drivers/media/v4l2-core/v4l2-ioctl.c          |  2 +
 drivers/staging/media/hantro/hantro.h         |  4 ++
 drivers/staging/media/hantro/hantro_drv.c     | 23 +++++++++
 .../staging/media/hantro/hantro_g2_vp9_dec.c  |  8 ---
 .../staging/media/hantro/hantro_postproc.c    | 34 ++++++++++---
 drivers/staging/media/hantro/hantro_v4l2.c    | 50 +++++++++++++++++--
 drivers/staging/media/hantro/hantro_v4l2.h    |  3 ++
 drivers/staging/media/hantro/sunxi_vpu_hw.c   | 13 ++++-
 include/uapi/linux/videodev2.h                |  2 +
 10 files changed, 122 insertions(+), 20 deletions(-)

-- 
2.35.1

