Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671B815AD
	for <linux-staging@lists.linux.dev>; Sun, 13 Aug 2023 06:36:13 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3176ff39a28so679874f8f.1
        for <linux-staging@lists.linux.dev>; Sat, 12 Aug 2023 23:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691908571; x=1692513371;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iAp8IH/ejNOzSqs7fVJ3DvtPd2O55r93cKi0HL+ps9o=;
        b=LBXul+/6h1uDHtU24UKkxdZOzdP7tNKYOlBG2lAGBDML7nKi/w79XvTBqoF0LleNr6
         kvddoaGcULzSdic29hryuFP6w8fC8FmlSreldHXE3I8nzcvvI58QqvGSMoGVvShfoCH6
         uKGRndRXtBZEICDLmF98wKkJty2o4qAkYEstcl1VxdtCuN4n8QYopx/zTH0xyIIZd2ii
         JfylbLx1WQLSBifJmBoAIX/6e396arwzVJGSYX8TV8QYNJO+yH1rXheAqO2nL8vWRFin
         sYCjVv+NsixJEkaH5BnouOmHtKj2Fzq84eau7CsbpCX9g0b8YJBttybK/7YiuzPP94sM
         c9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691908571; x=1692513371;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iAp8IH/ejNOzSqs7fVJ3DvtPd2O55r93cKi0HL+ps9o=;
        b=Dxwa/SxGbJoZdOPJ5IgIzEWxO/dY7Ke/+3gbvwoc10iLbmmXvlzUD0KM6zxzBVx5aF
         3PNkwjwPgL8GRVQqgRDvl9bIByAjR9JHlSDZiSoqAyqAcavIm1jdoHX9T9QVd4eXhIyS
         InKz5bgb+E97UNeVf1Zop73esaie7IXhAaNT5ySyXyY5/UuBY8vtAPTU9MPzc3D1GtAW
         TKKjcQnNIrIvJ+Mk3xmSDxVpVV2VQhXsd/KoKfu/NXHITGg39nsKTzNrFNUukVTlhyTo
         XQLsLE1ze+0tIuRvQ9I21aTBH0Uu+B9+f4LBIzUrxuyh8eEWM3jd0XyX8TfLH0fKqxLR
         Ue7w==
X-Gm-Message-State: AOJu0Yxpovd2ww2xbZk5LEL6gJBXjleaeF1jZmOgD8r2CWotPz4IZwOd
	27G6gAC3kmwOG/8jcy+dhMk=
X-Google-Smtp-Source: AGHT+IEKRkyFsND5DhjhmOR5+JiawzMz5YzCdog02G1y44akb+5STuKUAug+FuL4ydqF7f37Z9FpLA==
X-Received: by 2002:a05:600c:1c07:b0:3f7:fb5d:6e7a with SMTP id j7-20020a05600c1c0700b003f7fb5d6e7amr6300717wms.0.1691908571182;
        Sat, 12 Aug 2023 23:36:11 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id 11-20020a05600c234b00b003fbca942499sm13229328wmq.14.2023.08.12.23.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Aug 2023 23:36:10 -0700 (PDT)
Date: Sun, 13 Aug 2023 08:36:08 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Remove unsupported mode IW_MODE_MASTER
Message-ID: <cover.1691908402.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove unsupported modes IW_MODE_MASTER, IW_MODE_REPEAT, IW_MODE_MESH.

Tested with rtl8192e (WLL6130-D99) in Mode n (12.5 MB/s)
Transferred this patch over wlan connection of rtl8192e.

Philipp Hortmann (4):
  staging: rtl8192e: Remove unsupported mode IW_MODE_MASTER
  staging: rtl8192e: Remove unused function rtllib_start_master_bss()
  staging: rtl8192e: Remove unsupported mode IW_MODE_REPEAT
  staging: rtl8192e: Remove unsupported mode IW_MODE_MESH

 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |   4 -
 drivers/staging/rtl8192e/rtl8192e/rtl_ps.c    |   6 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c     |   3 +-
 drivers/staging/rtl8192e/rtl819x_TSProc.c     |  14 +-
 drivers/staging/rtl8192e/rtllib.h             |   4 -
 drivers/staging/rtl8192e/rtllib_rx.c          |  26 +--
 drivers/staging/rtl8192e/rtllib_softmac.c     | 189 ------------------
 drivers/staging/rtl8192e/rtllib_softmac_wx.c  |   9 +-
 drivers/staging/rtl8192e/rtllib_tx.c          |   2 -
 9 files changed, 16 insertions(+), 241 deletions(-)

-- 
2.41.0

