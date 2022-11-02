Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5463324F21;
	Wed,  2 Nov 2022 18:08:19 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id ud5so47512134ejc.4;
        Wed, 02 Nov 2022 11:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=94rmcDkdjrCGxv2Cn/WpEypZpF2kxP75q7QoZpGWNew=;
        b=ekX5hSaEueliIxmzaE5dgNJ3EX4kjNF5VY2hGEdzwx6d3+r2oOn96JfuAKDyci+QLq
         XQ+XJ2MTFjJE/IQAUbqjWsBYD7F/V8ZPEDEtiKxIohY26Ow0vpAWBSaPe0rYb2nSFXkP
         T8uyQenowxqzR2CP7+JD0AdVaxorzLxwxdaKkJdQrkK0V3nOTj85AhlV8eDaeESDIiga
         Hn1JXPIPI7UxsSSOV7SSaR0INEXUiDRrF0UrIfWbn8/bw78MfYxLB2b3+ZezMyEAYmXK
         TElTQNvengSph89HBmZT+iFMCKQcQkOr5N0lxAorn3nyzFhrv+oBkZ+21JMUBC2jYxMw
         YZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=94rmcDkdjrCGxv2Cn/WpEypZpF2kxP75q7QoZpGWNew=;
        b=UgA4YTnrB9elqNAOrr5ILnKw1dBDam3Ta7m41XMBKeGyWThq9dipH7ibJqISe6RiEG
         jgpkfs5HzHEiSVpN02UvjjJWs4w4IJcjF153IYo/UnBfM+AqVeDqTHqt79j9pKUMKsB3
         sHxQFNZ3HZsdnAFhONC3BqoLjWUcJpRkCdcZGLL5hkVJaGmjzhSaCK/R6JQioKUQO1nj
         1NUWL+DjF+q+spGAVmH40r55EtfECHAIHdutKIjc3ovvDFNOrYX2uxBlZ3oaEK7/7rvF
         gzXoGVkHp7FZ2uEnbeFVzAJnQsBVi3MXt0lddyud5DPapMmPRbFRXaZSiNK2Ny3W9JpR
         GtVA==
X-Gm-Message-State: ACrzQf00N9fVU5R0+FxQE4jJh4hIzbUIoSCA0AA/zbpYlyGVjyjXfTnJ
	4b/XJHXM1GSgaN06q9ewI7I=
X-Google-Smtp-Source: AMsMyM45xz8lKz2n6ZZKU3vArbgM/LEaLIXdVBWy0aGRkor1nOrSj43LK1IZVOfAkUEFrv2qMYLIQg==
X-Received: by 2002:a17:906:2353:b0:7ad:daae:6edd with SMTP id m19-20020a170906235300b007addaae6eddmr15139513eja.40.1667412497517;
        Wed, 02 Nov 2022 11:08:17 -0700 (PDT)
Received: from kista.localdomain (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id gy8-20020a170906f24800b007317f017e64sm5677460ejb.134.2022.11.02.11.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 11:08:16 -0700 (PDT)
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
Subject: [PATCH v2 00/11] media: cedrus: Format handling improvements and 10-bit HEVC support
Date: Wed,  2 Nov 2022 19:07:59 +0100
Message-Id: <20221102180810.267252-1-jernej.skrabec@gmail.com>
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

Changes from v1:
- collected acks, except for patch 5, which was changed
- use cedrus_is_capable() for cedrus_find_format() too (patch 4)
- tightly pack control pointers in ctx->ctrls[] (patch 5)

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

 drivers/staging/media/sunxi/cedrus/cedrus.c   | 102 +++++----
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  22 +-
 .../staging/media/sunxi/cedrus/cedrus_dec.c   |   4 +-
 .../staging/media/sunxi/cedrus/cedrus_h264.c  |   2 +-
 .../staging/media/sunxi/cedrus/cedrus_h265.c  |  37 +++-
 .../staging/media/sunxi/cedrus/cedrus_hw.c    |  18 +-
 .../staging/media/sunxi/cedrus/cedrus_hw.h    |   2 +-
 .../staging/media/sunxi/cedrus/cedrus_mpeg2.c |   2 +-
 .../staging/media/sunxi/cedrus/cedrus_regs.h  |  16 ++
 .../staging/media/sunxi/cedrus/cedrus_video.c | 200 ++++++++++--------
 .../staging/media/sunxi/cedrus/cedrus_video.h |   2 +
 .../staging/media/sunxi/cedrus/cedrus_vp8.c   |   2 +-
 12 files changed, 244 insertions(+), 165 deletions(-)

--
2.38.1

