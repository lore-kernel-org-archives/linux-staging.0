Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FD04C72;
	Wed, 19 Oct 2022 17:45:56 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id u21so26364075edi.9;
        Wed, 19 Oct 2022 10:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b3qQsYa/7ZweA0u9kpHAV4Ioh1PIQ7YV+2Zy1Ir6xbc=;
        b=EF+8GxOqjD7tz5bBqhQA4A8MVrYO9BfsHFXvcqliLTVztgNGNy46gTL+cw8it3RwDk
         I/yhw3zBTCKhOcz/MgyqQTstezO7xTAkqm0DgFYQ4Tx83dsic6vwctukoJj3QKIMWym0
         x75Ep7MCrpFRgXJuifRFM79uan1zhrm/Yy7bXUf/HDFQ3dP3EMZUYM6SGW5RNUd6aL5u
         EUc/wtxvAwVC0n+0OSEmsqktGpgf6+SMfQdJgBK7Jxr4LzxOhQpW+d2LaXnc+cpxZdmp
         xqyfYl5yO4B1HRkjPdhh33z4p7MAPeFrW3wRXwICAgaTIPIVpFTcNF0U9GRU0JWpsX/e
         LRkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b3qQsYa/7ZweA0u9kpHAV4Ioh1PIQ7YV+2Zy1Ir6xbc=;
        b=z4EdcLkFilnwSu6XyAN7bg7lgyS+eu7Nv5fQMeRUq+zk1cesp8x9MnnMOu5wDeY76O
         +vhWzDAJCWlY4cnoATyfNU7BiItFIGqTgOXkmS4uRKGsk6jiW5ZKGFuwBkuJF8PGfxjm
         TxRNbd/5CScaOFsJBUABC5teWMkJx5wS6XhyR9WG61fP/VcVnWKejGvqriQLdPo6hD9w
         HzghXrNibIAxfXW3Iwvj3nqHe4ttBNXwZgl8pkZhAOQmb7rb8qaAYG4MhZfaS0ZO4daT
         d5Lwre5krG1huhYrcH4Fgw7zwAE0BxibKjVjrNfnh1isjsNmVVb6oYd1/iVA2cNUkNY3
         SDlQ==
X-Gm-Message-State: ACrzQf3rk+RJi5807Zxv2djcx763OBCLplZozuvwZjritLZf+b/OBIjv
	GrY/ifm5cPcywsDnc1fFkXw=
X-Google-Smtp-Source: AMsMyM7+C12t1o8higEU9r6SRH5hrJEdLyfeE4a3rQuBGmahnVZeQqTgOz5AVJmtx85oAd+c0bbn/g==
X-Received: by 2002:aa7:ca45:0:b0:458:d9a2:6164 with SMTP id j5-20020aa7ca45000000b00458d9a26164mr8734873edt.340.1666201555073;
        Wed, 19 Oct 2022 10:45:55 -0700 (PDT)
Received: from kista.localdomain (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id qn24-20020a170907211800b0073c10031dc9sm9218382ejb.80.2022.10.19.10.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 10:45:54 -0700 (PDT)
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
Subject: [PATCH 0/2] media: cedrus: h264/h265: Improve aux buffer management
Date: Wed, 19 Oct 2022 19:45:49 +0200
Message-Id: <20221019174551.2695149-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.38.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current handling of mv col aux buffers in h264 and h265 code is not
optimal. In h264 case, it allocates pool for worst case possible which
basically never happens with typical videos. This also prevents it from
working well on very memory constrained devices, where CMA pool is very
small. In h265 case, number of buffers in a pool is equal to number of
capture buffers allocated before streaming is started. If any capture
buffer is allocated afterwards, Cedrus gets bogus pointers. This might
cause memory corruption.

Solution is the same in both cases. Instead of using memory pool, do
individual allocations later, right before aux buffer is first used.
Such approach allocates just right amount of buffers of optimal size.

Proposed solution frees aux buffers in streaming off callback, which
is first possible occasion. I can move this to .buf_cleanup too, if you
think that it's more appropriate.

Finally, h265 patch can be considered as a fix (prevents overwriting
random memory). If deemed appropriate, fixes tag can be added.

Let me know what you think.

Best regards,
Jernej

Jernej Skrabec (2):
  media: cedrus: h265: Associate mv col buffers with buffer
  media: cedrus: h264: Optimize mv col buffer allocation

 drivers/staging/media/sunxi/cedrus/cedrus.h   |  16 +--
 .../staging/media/sunxi/cedrus/cedrus_h264.c  | 118 +++++++++---------
 .../staging/media/sunxi/cedrus/cedrus_h265.c  |  63 +++++-----
 3 files changed, 99 insertions(+), 98 deletions(-)

--
2.38.0

