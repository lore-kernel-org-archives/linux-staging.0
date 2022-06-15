Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4318F2903;
	Wed, 15 Jun 2022 20:44:57 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id n28so17868658edb.9;
        Wed, 15 Jun 2022 13:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tp4oIh2zYtBi2+RpvWEIz+CScSVPRmmdz9pJqOF/be0=;
        b=frLOPTAHpOW6WM+y8qwoZMCwMS51iwCN9CSULQFC+7vgTcnCxnQHN9Xby4N7qbkAdo
         LGs8h+xgkrkDVPqB7yJTZgIDNimJ6khTRoo5I3kER5tqQRN5I0wvjkU9wzFoNEoQz5eV
         dg+yMeWxL5qd97o6PEsS9YeeV5pkWyIAfP2B5ChFUC0wvfX1H+j/8BPMYmSUiEg0IBAM
         Bfhd7JN8oO7Q/TSmcUVQtBCfupH0MYL2QQnTyjlFtYiYlynHBzLA2J4cD0TOFtI3tKcb
         07QmU1885KJnriYYcPA1mn58jFG8K1ZdEzpq4dJTCy4CZmP9LAZWxPzLt9B2GETu7oOE
         cVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tp4oIh2zYtBi2+RpvWEIz+CScSVPRmmdz9pJqOF/be0=;
        b=gRgaQ20XIyKHcN3k5VIn+9OxWupybqK1m1IEqULEWpchqSgKh2cXZ7GG7z/6N0v2qm
         p0e8NF2h64kJNlxOF1HwCOG8MlzsnTfokvmTlZhMLlTjhYmDmfqBkizYNNxtVLtGXB+U
         hN8LGdnHpGxwrYbLfmV1fGdgGewLl90OYAKT64NHxs1NLHGEdJ8cVRmD7VQzQ0c7MWzm
         1YYmVF3Bl6lhFYgCFIyc/CwUav6nYNGh57t3bJgwj/o4N+cb7eWT92o2JYy/B7TRLPXl
         E5tWNTlr367ariRkGQmyEie8/TN030M5lEIwx6wvM/LTDp4cPJbxtM+wsABbyv57/j3o
         LGLA==
X-Gm-Message-State: AJIora+xgmecCV15x4vJCbWhDtwvME7mLAhFQeDrdbF+CgVVaabZ59vT
	NeV5tN3CvPFCUrEG5larSog=
X-Google-Smtp-Source: AGRyM1uQSv1o4AubDZMBfsKjQPuH2QynVWB1oxR/lAPoCnd7YAvz8HbUwnIEOBUBdtfG4T0zFOerdA==
X-Received: by 2002:aa7:c457:0:b0:42d:bd18:4ef with SMTP id n23-20020aa7c457000000b0042dbd1804efmr2116460edr.112.1655325895465;
        Wed, 15 Jun 2022 13:44:55 -0700 (PDT)
Received: from kista.localdomain (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id h16-20020a1709060f5000b00711d0b41bcfsm6777291ejj.0.2022.06.15.13.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 13:44:55 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	paul.kocialkowski@bootlin.com
Cc: mchehab@kernel.org,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	hverkuil-cisco@xs4all.nl,
	benjamin.gaignard@collabora.com,
	nicolas.dufresne@collabora.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] media: cedrus: fix HEVC decoding
Date: Wed, 15 Jun 2022 22:44:34 +0200
Message-Id: <20220615204436.137377-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.36.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After detailed comparison of register names to vendor library I noticed
that one register has completely different name. After some testing I
discovered that it was misnamed and used incorrectly. This patch series
fixes it. With that, 3 more reference bitstreams are now correctly
decoded. It is also possible that this fixes instability issue I had
after decoding such bitstreams. Running Fluster test suite very often
locked up my board, but after applying this fix, I never experienced it
again. It might still be completely coincidental, but I doubt this is
the case.

Note: Patch 2 clashes with HEVC uAPI destaging. In current form, it can
be easily backported. However, there are few users of Cedrus HEVC and
skipping this fix wouldn't be that bad.

Please let me know which way to go:
1) wait for destaging, send rebased v2 and not care about backporting
2) merge before destaging, but v9 of HEVC uAPI destaging would need to
   be rebased.
3) something else?

Best regards,
Jernej

Jernej Skrabec (2):
  media: cedrus: h265: Fix flag name
  media: cedrus: h265: Fix logic for not low delay flag

 .../staging/media/sunxi/cedrus/cedrus_h265.c  | 29 ++++++++++++++++++-
 .../staging/media/sunxi/cedrus/cedrus_regs.h  |  3 +-
 2 files changed, 29 insertions(+), 3 deletions(-)

-- 
2.36.1

