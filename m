Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7183FC1
	for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 11:26:06 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id e26so1462179wmk.2
        for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 04:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Io8xO0I4IEBB9vVq6AY5ZVVzX55PtEN8u1vYr2NZxCM=;
        b=vao9VY4VlO9XySUqx4Dwg2sIPDmE1CPN0tM++A9Zhk2sSp/yic7WoIqfcjyJiSaBd4
         Fj4WNZfBIHwV8tQP+wFWfdBfF+XX2Avlt9bwkQuqXJ/MFmkGJhq7rcMJ2hvE63FVFIis
         SoL+5WXfJ4pqa7X3tySoISatx0ZVNbIw4noHEX0Ys5FVTo4KxwR2glvqOH5X5zMVrpLK
         B5TA7RVHvftMAVktGJuUea799TUpSLap/cebgejwQq+os44vJI81MVaedYBp6ZhLbbI5
         xdMVOVcFWS/lgygyWekXy2B+wXIeOCVd/5MiedWAu9TT2rUx//REjU8F4/cuFdAqnuxT
         YCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Io8xO0I4IEBB9vVq6AY5ZVVzX55PtEN8u1vYr2NZxCM=;
        b=pgF0/i5vDE0qu+qBWYsOlfjlMHKG8YYGHDiRKVa3b91U3gP8gdwwvrgF2hJ1Xk7Ejy
         HNnqnxS7u58IrPJJK4pmyNwtfOgYLYXpnrwtZXPB5Ic0IrGyyW2azSQRydpnwiXi7Zbr
         5UyEE4n9h5AH9kiK6WGjD+Crwdzjf9oiRvD8uy55t8O5Vw9/s06vVFxxUr05h/9oZ3cT
         sqH/v6/0oryYUM9vyuz2BOEv3efp1qxd0R2NY5ScqAFdj/kCdEpbUHCnyF5IwLQY6hd5
         87NkrmQSn/tuUSshzArWh500sNavgMkNm9aQ/hAEMETYXF0rtsYwbxHV0DJ5NLgLIBKd
         5R0A==
X-Gm-Message-State: AOAM530ygI8fJBhzzUxa0WWdNZyfCMYwFgFeVwfezKU9mXCpcK4wZ5XL
	7AxhSxSnQ0pQ/Fth3+y1wnY=
X-Google-Smtp-Source: ABdhPJxznOGld6n7fDomSJ5/KFFe9dG71xxXjUI/K1zYz1bvzbJ7Ql4bPBYdywubpQKRMatJFy467g==
X-Received: by 2002:a05:600c:1457:: with SMTP id h23mr22177449wmi.143.1630236365339;
        Sun, 29 Aug 2021 04:26:05 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::16fa])
        by smtp.gmail.com with ESMTPSA id h8sm15826581wmb.35.2021.08.29.04.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Aug 2021 04:26:05 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/3] staging: r8188eu: clean up unnecessary type casts
Date: Sun, 29 Aug 2021 13:25:52 +0200
Message-Id: <20210829112555.8726-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes unnecessary type casts from de/encrypt functions
in core/rtw_security.c.

Tested with Inter-Tech DMG-02 adapter connected to a CCMP network.

Michael Straube (3):
  staging: r8188eu: convert type of second parameter of rtw_*_encrypt()
  staging: r8188eu: convert type of second parameter of rtw_*_decrypt()
  staging: r8188eu: remove unnecessary type casts

 drivers/staging/r8188eu/core/rtw_mlme_ext.c   |  2 +-
 drivers/staging/r8188eu/core/rtw_recv.c       |  6 +-
 drivers/staging/r8188eu/core/rtw_security.c   | 61 +++++++++----------
 drivers/staging/r8188eu/core/rtw_xmit.c       |  6 +-
 .../staging/r8188eu/include/rtw_security.h    | 12 ++--
 5 files changed, 42 insertions(+), 45 deletions(-)

-- 
2.32.0

