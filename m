Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68827C
	for <linux-staging@lists.linux.dev>; Tue, 29 Mar 2022 10:38:07 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id y10so20149923edv.7
        for <linux-staging@lists.linux.dev>; Tue, 29 Mar 2022 03:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rQgKzNISqArDY7LULCiNgr15+k+211SoiUzs0z+KaHk=;
        b=UafYkExBfrtQOkXs0hiJM5CMmnfNeMYqVP9WjVGEnnYq+gIQ3xdUWTxcy/UMuNABxN
         8fOy8AAvQlkGODvupjseBTyoFNfY41656+6Dv5N+h3UI4mrkHKy+r8C0b8y/1aE61UHM
         YSxkkPuYQA4GFSzaWkjCEY2IfqOExj/vJD54dWbqNlHlei076q/v7lodTN1YOoQtJqHQ
         IEcvF3s/eknTjgcjt2RHSLwEHIsxqeIZNVIhso/nmf4IdoKhGPDUtqNpbJEG7mCsySlM
         rGX1m5UZlppE2qqfI5wfyosT12B7RpiI7zSPQBSZfc0SAMVDmIg3JxdaS0d8AvHiuVw4
         /Avg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rQgKzNISqArDY7LULCiNgr15+k+211SoiUzs0z+KaHk=;
        b=FjUFSDSE8sKQ87cEghSI1bGqC+9FtsTVlL2buD5k6s+x/LEJiV+f/EIbTbRsn6Xm6F
         I04CO1mN+45er3Fb9Q9NQQWhOWHqh1pkW9Ftyw4v0Q3CUcQRwxlSeI8Xy3IGx7rMYMfr
         qOThurS6zgj1Ar/lBI3QQJTddr36gakPr5GfZy3Q9oWyHSr671ghLW2PVooxagMXR+p6
         P3cPsHi7CWl4YW8GDEp0KN0UQZcpsAd53knCULBDIf6o7q935KZNIGQ4zcPFTUvNMqQp
         AbB+Bco+l5Ik49UfMa5/nd9hUBwlvtW4OtaiCU3uvP5b02ydV7sDb2ldMpPupyIR3/tx
         z1EA==
X-Gm-Message-State: AOAM530KO9U7cXYI85/52TeZSITN2MVWta0JPf1lYxkvLhc+j/e2kTaP
	eKpFQarSxr3kQzJG4g8Gjj0=
X-Google-Smtp-Source: ABdhPJy8d/gjPOB0IPI+Kq7Zf45dYINkXtS4XeQL8gIcXyfg86a5K8JVNWNO4bhu8TAyEtmaUG3eHA==
X-Received: by 2002:aa7:cac4:0:b0:418:85b7:adec with SMTP id l4-20020aa7cac4000000b0041885b7adecmr3641052edt.231.1648550286161;
        Tue, 29 Mar 2022 03:38:06 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id qw39-20020a1709066a2700b006e03017d60csm7058151ejc.54.2022.03.29.03.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 03:38:05 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/4] staging: r8188eu: refactor two small functions
Date: Tue, 29 Mar 2022 12:37:52 +0200
Message-Id: <20220329103756.6740-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series refactors two small functions to improve readability.

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (4):
  staging: r8188eu: refactor rtw_usb_bulk_size_boundary()
  staging: r8188eu: refactor rtw_inc_and_chk_continual_urb_error()
  staging: r8188eu: convert rtw_usb_bulk_size_boundary() to bool
  staging: r8188eu: convert rtw_inc_and_chk_continual_urb_error() to
    bool

 drivers/staging/r8188eu/include/usb_ops.h | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

-- 
2.35.1

