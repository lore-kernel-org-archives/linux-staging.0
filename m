Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F2472;
	Tue, 31 Aug 2021 09:49:17 +0000 (UTC)
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:4cb:a870:2d6:5982:f5be:998c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 268E21F42FC8;
	Tue, 31 Aug 2021 10:49:09 +0100 (BST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org,
	mripard@kernel.org,
	paul.kocialkowski@bootlin.com,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	hverkuil-cisco@xs4all.nl,
	jc@kynesim.co.uk,
	ezequiel@vanguardiasur.com.ar
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH 0/2] media: HEVC: RPS clean up
Date: Tue, 31 Aug 2021 11:48:58 +0200
Message-Id: <20210831094900.203283-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series aims to clean up Reference Picture Set usage and flags.

Long term flag was named with RPS prefix while it is not used for RPS
but for mark long term references in DBP. Remane it and remove the two
other useless RPS flags.

Clarify documentation about RPS lists content and make sure that Hantro
driver use them correctly (i.e without look up in DBP).

Benjamin

Benjamin Gaignard (2):
  media: hevc: Remove RPS named flags
  media: hevc: Embedded indexes in RPS

 .../media/v4l/ext-ctrls-codec.rst             | 12 ++++-----
 .../staging/media/hantro/hantro_g2_hevc_dec.c | 27 +++++--------------
 .../staging/media/sunxi/cedrus/cedrus_h265.c  |  2 +-
 include/media/hevc-ctrls.h                    |  4 +--
 4 files changed, 14 insertions(+), 31 deletions(-)

-- 
2.25.1

