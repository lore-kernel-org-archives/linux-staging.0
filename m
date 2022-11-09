Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978CDEC08;
	Wed,  9 Nov 2022 18:23:20 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id a13so28433939edj.0;
        Wed, 09 Nov 2022 10:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q13vsaMlttFnHcmHzSd2rfmI43tzlpK2zme9JkAVuSg=;
        b=nKKT1C/VpEpRbWpnN2+YCiAl/gZ1YKnvqcf67NVQB5Ut1XejflJICh9nVvt40dxaj5
         KDLTACBCD6P7R1IFuVbWR3mXK40g7hjAlEp9XcoSQ1ITTz4no7tAxWuxmF3MM6q7Rdk4
         yDRVUgiFdO1W9MDDSYtriuzmXfptPfhoD7/YA9gYy6gchfA1e976hiRDOdMtKclKTp3R
         kBD/+7jBGwYZA+NvR1pIYx93O83Av5K7+e+735a0VLQrRN/YMeTy4RiK6TUmkam2ECs+
         sO3cC0DbQH6HAyuaHig7aPz0luA9XNVzt6V1jS25XJo0oM1Uhuf7Zkev7toOOdodpytA
         L8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q13vsaMlttFnHcmHzSd2rfmI43tzlpK2zme9JkAVuSg=;
        b=dd6uluVWf38NURg9kHF9sHjqAyoVwQpmRIJP3qwrlGACiD7EX8FtlhNgvEBZtURM1s
         BhrrHuT8qRj0C6ApsXSXiJHo0yDXPdEVnbIsQlehy7/M2FAk/8wX0pb1e+Oiaz5BLtlH
         /5RfrGG+x0SUr88MvpaOOnG5P2PHiQdNHFynTkVsz6tQcf8jOz3XnXd3pRTZeiZm3eiY
         dHQyYOISxXWhh9Zt5irvQkBx72dO0KU0KiilrFKVZRmWKBLgK8vIr8g0uXWPUxqzy/l9
         Olzl7tCMvz6aYe5pQds8ju35YTRJBkgo7/jKqTljPciWX+xVXyHRVxzEJyGdue1FYFjC
         utVg==
X-Gm-Message-State: ACrzQf1ElD5HfjGkTSVDK/qglFv/NhRFscAkxZsb5q5QOwBrlnxF2HD1
	MEME5cpNsZacFkocoZ3oJXQ=
X-Google-Smtp-Source: AMsMyM6jO4KjnlD76vFX0SB4na7Rv9kIwHENFhdNoZo+yOh71FzVGFtQeo02cPD4sgF5TbMNmdJfig==
X-Received: by 2002:a05:6402:2751:b0:443:d90a:43d4 with SMTP id z17-20020a056402275100b00443d90a43d4mr61910508edd.368.1668018198782;
        Wed, 09 Nov 2022 10:23:18 -0800 (PST)
Received: from kista.localdomain (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id gj26-20020a170906e11a00b007a0b28c324dsm6029400ejb.126.2022.11.09.10.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 10:23:18 -0800 (PST)
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
Subject: [PATCH v3 0/3] media: cedrus: 10-bit HEVC support
Date: Wed,  9 Nov 2022 19:23:06 +0100
Message-Id: <20221109182309.2475221-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is continuation of previous series which improved format
handling and fixed 10-bit HEVC support. Format handling patches
were all merged, so this series fixes/improves only 10-bit HEVC
handling.

Please take a look.

Best regards,
Jernej

Changes from v2:
- drop merged patches
- rework HEVC SPS control handling and capture format reset
- add new patch to relax HEVC SPS restrictions

Changes from v1:
- collected acks, except for patch 5, which was changed
- use cedrus_is_capable() for cedrus_find_format() too (patch 4)
- tightly pack control pointers in ctx->ctrls[] (patch 5)

Jernej Skrabec (3):
  media: cedrus: Adjust buffer size based on codec
  media: cedrus: h265: Support decoding 10-bit frames
  media: cedrus: Relax HEVC SPS restrictions

 drivers/staging/media/sunxi/cedrus/cedrus.c   | 31 +++++++++++-----
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  3 ++
 .../staging/media/sunxi/cedrus/cedrus_h265.c  | 35 +++++++++++++++++++
 .../staging/media/sunxi/cedrus/cedrus_regs.h  | 16 +++++++++
 .../staging/media/sunxi/cedrus/cedrus_video.c |  4 +++
 5 files changed, 81 insertions(+), 8 deletions(-)

--
2.38.1

