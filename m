Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D0D70;
	Sun,  6 Jun 2021 08:23:33 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id ho18so10416674ejc.8;
        Sun, 06 Jun 2021 01:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N/vOnbubwerL0nc4R2J7xmAJRI2agwwqe8FU/KvYiSg=;
        b=RkOuCWPUM3rS/puvGGtl+u6x/466zVzs6idAXCdCzv/oxKqF3p4g4BPEqIRFs4kv7+
         n+huszyyrKlaX8ULmfxtaYiV4+viKf+yPqV/GVS6jrJieDVHmHzDqfQuRcnIOvJ3wzku
         ZTbPdxB4LecEptg17ERwrQksLz/2W8EqqZmzXMt4pvq4Id3js1i9H7fe4A9YaD9/WSSB
         FcSH1RwJJvOaiSQoZT4+GfTKRMFR3d9dPo/xbsJTTQKfrt37YTvpwflseGJbCjmbk4B8
         UF6pslpmrctlSgTo15cWjq3sfi9Tf172+Ngv84Qx5ogwQAtxhB2AcLucKm775Yc8KfHS
         KLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N/vOnbubwerL0nc4R2J7xmAJRI2agwwqe8FU/KvYiSg=;
        b=o6CFc+bKlYr2UOY5TGBiklGK1rBiwSMhb5guXz5Wrl6m9h62P5Yp0RMhCIENDULwVy
         Dj9iJnEc4OsSxznfGtq+/Nxdm1EO9/JifNbojMGUJTO3BH1sOs7wtT0Oeuvjnx4jGoyT
         qQjXFl9pR3duH43aY2G4fhOigkf6hko/RE9+M3a/PCHa0PEIE/8upqRzmbjA4OUpYFTQ
         aDZRUJsuMLNuDdV8DofOoleDYME4v36qVhQitzyjhZR97waTQVEVVGtl/12yw4KyOMwn
         3bPqNfHGO6uJHcEC6oH9VhKKxkaoJtHAD0ET84im4soFLXndL/7MG5ALYcePUuWQxOJ9
         mTwA==
X-Gm-Message-State: AOAM532Z6cCQ/Bw5LYDRhM4XKRwIDJcDQwBHX0uo6Ge+2JZjlS4H20qo
	tfxKabemUcVh2+rGGplBg5E=
X-Google-Smtp-Source: ABdhPJyAALTJE+uOjrSqsQrGA4Ld/5qb+yfFGBo+PZkaanH7pQiMtJjPAWsx+PCTFw+aTBgaJKjFug==
X-Received: by 2002:a17:906:d1ce:: with SMTP id bs14mr13030518ejb.183.1622967812482;
        Sun, 06 Jun 2021 01:23:32 -0700 (PDT)
Received: from kista.localdomain (cpe-86-58-17-133.cable.triera.net. [86.58.17.133])
        by smtp.gmail.com with ESMTPSA id y1sm4945908ejl.7.2021.06.06.01.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jun 2021 01:23:32 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	paul.kocialkowski@bootlin.com
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	wens@csie.org,
	hverkuil-cisco@xs4all.nl,
	ezequiel@collabora.com,
	benjamin.gaignard@collabora.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 0/2] media: cedrus: hevc: add support for multiple slices
Date: Sun,  6 Jun 2021 10:23:12 +0200
Message-Id: <20210606082314.454193-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HEVC frames can be encoded in multiple slices. This short series add
supports for them. First patch adds slice_segment_address to HEVC slice
parameters and second patch implements HEVC multi slice support in
Cedrus.

Question 1: HEVC specs talk about slice_segment_address, but "slice_"
prefix seems redundant in our case, because this field is part of slice
params structure. Should I drop it or leave it?

Question 2: I made slice_segment_address __u32 but __u16 might be
already enough. Which one should it be?

Note: These patches depends on following pull request:
https://www.spinics.net/lists/linux-media/msg193744.html

Jernej Skrabec (2):
  media: hevc: Add segment address field
  media: cedrus: hevc: Add support for multiple slices

 .../media/v4l/ext-ctrls-codec.rst             |  3 +++
 .../staging/media/sunxi/cedrus/cedrus_h265.c  | 26 ++++++++++++-------
 .../staging/media/sunxi/cedrus/cedrus_video.c |  1 +
 include/media/hevc-ctrls.h                    |  3 ++-
 4 files changed, 22 insertions(+), 11 deletions(-)

-- 
2.31.1

