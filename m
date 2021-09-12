Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240AF3FC5;
	Sun, 12 Sep 2021 08:21:04 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id g74so4301633wmg.5;
        Sun, 12 Sep 2021 01:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LT34+O2y8jlTFIaCq6B6/Rp8/2SCwO8Z1dBB/RqrE7o=;
        b=ZbaLrC4FD3vx/1V0YKwP6kGOJvQjS+QTu7htpwg4T7cDEFVUwbEmPv6ojk6sDnGDZZ
         KZOCeQVo/8s2dSI2B1hveQo2CIEahpxsVnSoXSKlctcIFGS0FynfUqSevuWu9pVKknsw
         R3/qvQpPCqhMIJEnaEhaE+X2RILw0pecPN1Xn119e+ewzThGoyvblzRFYjlmWHPO43le
         VCxzFEjf7L7/ZDjoCi8Hga8vGCPtgBdq8Jj9r972sJeYqnE4wnnpdsqgnJTCc2XJgZan
         /4WDb1I2isOhvUZLUkzvrxs9CzCYsNrAzU2POCwhU56XCLDc89QNgjdx5pm2JfeFhS/6
         mkyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LT34+O2y8jlTFIaCq6B6/Rp8/2SCwO8Z1dBB/RqrE7o=;
        b=iZUHlDZN3175UM2UZ+hFmHfqNIcBDdYvODpzAwuNrK4sfxtFaBfr1s8QIYXa4HBdbo
         70xf2z5ocatl5t3T8cYbmhCbzt5D4bNORxt8ahnO8IsblWvEkeiS73NQZPBucNa3Dk8n
         VsgEojsyHxcTkGODoongcdFRlWq1CDIQna/oWXHv+8XuLTiUOBaFU/IhmabZFeP3PK9L
         AuTcmo8u7vEYRO0PcxdkBnahYgFFuft3s1R5yQOT4hfjbK2EZ5OPR2wN+LogkykYIWTx
         lRLsGLNLHIlKsqYdKhyBdSdEgloma2ob7hiNqk6MoL1Zqw8rvYWW41WKKnWOFQ63Kilh
         3e4w==
X-Gm-Message-State: AOAM533yojfzcoksEvoVf8/UEWFCzsWOjvv39R0aA+Vn+jGHgoTMEQZS
	ZI0wvv75Obv10+VF4Mu07u4=
X-Google-Smtp-Source: ABdhPJyqLnC1HxRGb9sUgb6iU1MmFNSzSyZOI+NhOigKON5velkaZkdi84vHFDZIyu/1TLAbWjzS8w==
X-Received: by 2002:a1c:800e:: with SMTP id b14mr5923995wmd.54.1631434862589;
        Sun, 12 Sep 2021 01:21:02 -0700 (PDT)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id z7sm4734148wre.72.2021.09.12.01.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Sep 2021 01:21:02 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	paul.kocialkowski@bootlin.com
Cc: wens@csie.org,
	mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 0/2] media: cedrus: validate H264 and H265 SPS controls
Date: Sun, 12 Sep 2021 10:20:49 +0200
Message-Id: <20210912082051.404645-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since Cedrus core doesn't support decoding all possible H264 and H265
formats, it's good to add some validation, which would reject unsupported
combinations.

Patch 1 adds H265 10-bit capability flag, currently supported only on H6.

Patch 2 adds H264/H265 SPS validation callback.

Please take a look.

Best regards,
Jernej

Jernej Skrabec (2):
  media: cedrus: Add H265 10-bit capability flag
  media: cedrus: add check for H264 and H265 limitations

 drivers/staging/media/sunxi/cedrus/cedrus.c | 47 +++++++++++++++++++++
 drivers/staging/media/sunxi/cedrus/cedrus.h |  1 +
 2 files changed, 48 insertions(+)

-- 
2.33.0

