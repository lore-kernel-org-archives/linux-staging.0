Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33DC29CA
	for <linux-staging@lists.linux.dev>; Fri,  7 Jan 2022 21:50:45 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id e5so4827497wmq.1
        for <linux-staging@lists.linux.dev>; Fri, 07 Jan 2022 13:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wQnTAOzqfnEo9STtUG3p3gnrWCeSeGnMweWxCdq98J4=;
        b=l3aYK2qsZES/UMTB5Dj5xMSWSGdqQggwJ3aZCUV0OcmD2G1e7ZquqML2OsMOl9sbU+
         uUaoRUQ65f9Kt72KdVV5Fk4ItZ+gf0MzCs32xgmiAakVK+eulsGry8sKqhqgi6FdBMjF
         PJy0i6/1ygrYUbixHPb9dBtPrNYa9K/hYTf2RUqOmKgX3f9zkFIv2YSjAqvG5/vSRIIf
         PwOlKo8ccAEtWHD4FyHPijdz67t5nYevsDzcNfhptq0k/WcV7WLIzBoPmLqYylX/MIm0
         w+7xv1NZUaT/uVIf/RJL60VAngX3Sc0TRtCcogE5SvLfsXa8NPaKeqwvMCbJfr35CljX
         1n6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wQnTAOzqfnEo9STtUG3p3gnrWCeSeGnMweWxCdq98J4=;
        b=qQvfqHQczidRa+g0Bcsp/+8ROC8sE+wvvt7EP1/Pd9asCTtCDk/tFc237TeuiecUZb
         BRKCt2TL7cTdxdXTGTVRnR3/iej0u+ZMTU839kKsA4Z3N707B/fUOS0j9wn2UDJoL/Em
         VF3li8hvMrd7YTj9kcV0RDyGnP4Q5xHAIjysr/5JB0OQldCu6u0evLunM0VTOnsamTZP
         qS8FZFDDCVjTiSLL88f8lc71nBNVliWVmMR6jHzYjHirDHX44rB3xuCedvJtA4li5uYm
         qbIvx5V+C9ZPQYbKgTQOa/uQbJURONeewsYZO9rzDSecbQa+iiAo7CbV9KaMU4Q9YGU4
         3aDQ==
X-Gm-Message-State: AOAM53224+qzVJWm/LI7dRw3g7/xCOhnAlNGbuO5LgY1UcTmsDi/yPw+
	a6AdjOSuuA+u0KMfjkMv+d4=
X-Google-Smtp-Source: ABdhPJz9FjU6RPQHxLJMyrC3sBYKcJwGoUxuDVqAat1O6y7hObS2LOthMSza8UlzN1X+k02m4SmHvA==
X-Received: by 2002:a05:600c:1991:: with SMTP id t17mr12546723wmq.21.1641592244312;
        Fri, 07 Jan 2022 13:50:44 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::51e2])
        by smtp.gmail.com with ESMTPSA id k14sm1729161wrn.59.2022.01.07.13.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 13:50:44 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/6] staging: r8188eu: clean up GetHwReg8188EU()
Date: Fri,  7 Jan 2022 22:50:27 +0100
Message-Id: <20220107215033.12257-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes unused cases from GetHwReg8188EU(). Some of the
cases are also unused in SetHwReg8188EU() and removed there as well.

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (6):
  staging: r8188eu: remove HW_VAR_BASIC_RATE from GetHwReg8188EU()
  staging: r8188eu: remove HW_VAR_TXPAUSE
  staging: r8188eu: remove HW_VAR_CURRENT_ANTENNA from GetHwReg8188EU()
  staging: r8188eu: remove HW_VAR_EFUSE_BYTES from GetHwReg8188EU()
  staging: r8188eu: EfuseUsedBytes is set but never used
  staging: r8188eu: remove HW_VAR_APFM_ON_MAC

 .../staging/r8188eu/hal/rtl8188e_hal_init.c   |  3 ---
 drivers/staging/r8188eu/hal/usb_halinit.c     | 25 -------------------
 drivers/staging/r8188eu/include/hal_intf.h    |  5 ----
 .../staging/r8188eu/include/rtl8188e_hal.h    |  2 --
 4 files changed, 35 deletions(-)

-- 
2.34.1

