Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F4A6130;
	Mon, 24 Oct 2022 20:15:31 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id t25so2107385ejb.8;
        Mon, 24 Oct 2022 13:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1fBlLJXdA6H7C7X3qALVt9OFqOQbonL8kspTcSbYe8A=;
        b=YPJ3jwQsNmm9WLt/GBkLWWRa6lFn8eahlu81M8lp72RvYGLMe/rQjA2qPa5v1u4tT6
         90ivSVYqP66OxTklswMOTjjr9ecvUkAP0NUIauygidG6sWAb1j1q05ALUBQxKfn0aTu5
         2S3QwjiaKOaIMvBqG9wc3wTVwidG1wG8FEuhFE+iEE2VUjwRX7c+FY1I7Xdn55PK08z9
         i2ufSZEQzWz2r7uSmuMUBEkFRjVqHQY1evrOLHZ5Fk2qSSqIk/Jn+sTiLw0wQLqe4tal
         36VZBHwYk13cnxp/sU7GMLV7E/HHAvlWE1h6zbYbhyPiwxfyyLicgnWx9g4h+13XZg8z
         xLMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1fBlLJXdA6H7C7X3qALVt9OFqOQbonL8kspTcSbYe8A=;
        b=T9pfy/TxfoLhQ93rHnCFiSOLDQXLHErmV0mPoEMek3/hmXvmUOi/guadTztBh375K8
         M7kskJ81oPdnW6TNhlNDORGPnu5UOteuiupJbb1skDi26DB3BP+5HbkS0b521DPcN4tQ
         7VgD+6+dDGrbxNPJeApBSs9orYmM7XWYGl3TovELRIyPy6ajDYdFLr6aGv7Vk6sq1Zms
         ZNBTIjvuhUZQfy+7xl5aRu84y+bG/1GuLUxJ4vJganllCzIKT1re7dmr8driptxC7f7m
         k+gfIaKfkk+5/wNSQa2BWL4eDebuV2keBan/9afjqI3aYILsIeC9N3nXEE0BFe3ihgr/
         kPeg==
X-Gm-Message-State: ACrzQf0pATbTzslAF9w68aXWqAbmG2YTACTIiMTq0b0HFdWtx76Z92tt
	2jr5m2EuG/HYgsTGxMT5SZ4=
X-Google-Smtp-Source: AMsMyM6Tfi2MudIbF6SuC3N6qkh7fPJgYp0ed+IaKSyzxHBs7xvcwSqolHobZJoh1xVju7+sSEmzxA==
X-Received: by 2002:a17:907:7e87:b0:78e:2dc3:945 with SMTP id qb7-20020a1709077e8700b0078e2dc30945mr29430002ejc.326.1666642529414;
        Mon, 24 Oct 2022 13:15:29 -0700 (PDT)
Received: from kista.localdomain (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id op7-20020a170906bce700b0073d638a7a89sm332023ejb.99.2022.10.24.13.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 13:15:28 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	paul.kocialkowski@bootlin.com
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	wens@csie.org,
	samuel@sholland.org,
	hverkuil-cisco@xs4all.nl,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 00/11] media: cedrus: Format handling improvements and 10-bit HEVC support
Date: Mon, 24 Oct 2022 22:15:04 +0200
Message-Id: <20221024201515.34129-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While my first intention was to just add 10-bit HEVC handling, I noticed
a few format handling issues and a bit of redundancy in some cases. Final
result is that driver now sticks to stateless decoder rules better.

Format handling improvements:
1. Default format selection is now based on HW capabilities. Before, MPEG2
   was hardcoded but some Cedrus variants don't actually support it.
2. Controls are registered only if related codec is supported by HW.
3. Untiled output format is preferred, if supported, over tiled one. All
   display engine cores support untiled format, but only first generation
   supports tiled one.

I hope this makes Cedrus eligible for destaging.

Best regards,
Jernej

Jernej Skrabec (11):
  media: cedrus: remove superfluous call
  media: cedrus: Add format reset helpers
  media: cedrus: use helper to set default formats
  media: cedrus: Add helper for checking capabilities
  media: cedrus: Filter controls based on capability
  media: cedrus: set codec ops immediately
  media: cedrus: Remove cedrus_codec enum
  media: cedrus: prefer untiled capture format
  media: cedrus: initialize controls a bit later
  media: cedrus: Adjust buffer size based on control values
  media: cedrus: h265: Support decoding 10-bit frames

 drivers/staging/media/sunxi/cedrus/cedrus.c   |  97 +++++-----
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  22 +--
 .../staging/media/sunxi/cedrus/cedrus_dec.c   |   4 +-
 .../staging/media/sunxi/cedrus/cedrus_h264.c  |   2 +-
 .../staging/media/sunxi/cedrus/cedrus_h265.c  |  37 +++-
 .../staging/media/sunxi/cedrus/cedrus_hw.c    |  18 +-
 .../staging/media/sunxi/cedrus/cedrus_hw.h    |   2 +-
 .../staging/media/sunxi/cedrus/cedrus_mpeg2.c |   2 +-
 .../staging/media/sunxi/cedrus/cedrus_regs.h  |  16 ++
 .../staging/media/sunxi/cedrus/cedrus_video.c | 166 ++++++++++--------
 .../staging/media/sunxi/cedrus/cedrus_video.h |   2 +
 .../staging/media/sunxi/cedrus/cedrus_vp8.c   |   2 +-
 12 files changed, 225 insertions(+), 145 deletions(-)

--
2.38.1

