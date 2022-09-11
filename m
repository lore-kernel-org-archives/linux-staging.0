Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D884B7F
	for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 10:45:10 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id nc14so14012784ejc.4
        for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 03:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date;
        bh=qDSVYJsZG02wo93ZACs1cSD7fLGxiL+UEFdO8CcreSI=;
        b=J0fd87jSFhFXz2CvTX2ql6Be9cJyI8s3pAutOye85G/Sp2nJBJDwR//84RNmNnGLFg
         HWcrU4lU42Q/Lwn8kGIpkWuNm6U1n/2URlXe2lLF15QiVpwH6s1TplnO2ea0gqabgn4e
         anfqL0DxoyQGh57Fx39oonulpsS+O5lK8rXa9jJuGaG+FUEyVFGis3XaQn5S09TfxCKH
         b4mUtN00wHJgbq6Lo0Agjne2yzwIqbcp8OGOXVefzPvccoCT8sxQpcth+yAc71jupTD2
         s3VkVce8Ey4m0c8FvopLtrs4bX2C+QOo1lzevQx9WsQjHeFUxWJqcsMjS2uLl3Me9NxM
         ez5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=qDSVYJsZG02wo93ZACs1cSD7fLGxiL+UEFdO8CcreSI=;
        b=WdRSAt5QqKJwphcs9dJZ/br0+jZA2gL0AGTlDK/IqylqldLfuxDjHrAg30k3cvTbfi
         J/LZgissWthHZ5qWMBl4ard3HbxZ/qTFcW1+6QY/FYZpsvxwkInKN5e9DBTsMkO8REWI
         uyqO2naVAJbwqlbfSztvrDV2HSRZwnHbv740NVeLYRw+YTYShivZfHrmVPzhZ69xXTNh
         onGiLbAyCxRVM0rygb7VwT2D6Oy3tvArxrga3mrQPQHEdeJRdF9wjEUfY+DTA6p+iNWd
         A9CNrzQlP5gMnYX6v6zvOdp9URvfTF7U3KvpYA7AK0mtV7XJNQOYMf+PyR4vj1vIQ0+K
         eXsA==
X-Gm-Message-State: ACgBeo3PRfyEkNndc/XqQaGbEn3O0ynq57CnmOSAy/bcOU+4PUqNh0XX
	Lc+ANx7fPKSsGrlzLcagPlc=
X-Google-Smtp-Source: AA6agR6brXxcvtDlS4t/C2PiXLs7U+sQJct3A8nrkWWlZym/D1SYRbsasu3Av0sMeqJQuo9TQ59COA==
X-Received: by 2002:a17:907:96a2:b0:776:15f3:1ffe with SMTP id hd34-20020a17090796a200b0077615f31ffemr11190945ejc.406.1662893108999;
        Sun, 11 Sep 2022 03:45:08 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id i10-20020a17090671ca00b0074150f51d86sm2817124ejk.162.2022.09.11.03.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 03:45:08 -0700 (PDT)
Date: Sun, 11 Sep 2022 12:45:06 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 00/12] staging: vt6655: Cleanup and rename functions of mac.h
Message-ID: <cover.1662890990.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Rename functions and local variables to avoid CamelCase which is not
accepted by checkpatch.pl. Remove unnecessary declaration of functions 
and make functions static when possible. Change declaration of local 
variables to shorten code and remove unnecessary line breaks.

Tested with vt6655 on mini PCI Module
Transferred this patch over wlan connection of vt6655

Philipp Hortmann (12):
  staging: vt6655: Cleanup and rename function MACvSetLoopbackMode
  staging: vt6655: Cleanup and rename function MACvSaveContext
  staging: vt6655: Cleanup and rename function MACvRestoreContext
  staging: vt6655: Cleanup and rename function MACbSafeSoftwareReset
  staging: vt6655: Rename function MACbSafeRxOff
  staging: vt6655: Rename function MACbSafeTxOff
  staging: vt6655: Rename function MACbSafeStop
  staging: vt6655: Rename function MACvSetCurrRx0DescAddr
  staging: vt6655: Rename function MACvSetCurrRx1DescAddr
  staging: vt6655: Cleanup and rename function MACvSetCurrTXDescAddr
  staging: vt6655: Rename function MACvSetCurrTx0DescAddrEx
  staging: vt6655: Rename function MACvSetCurrAC0DescAddrEx

 drivers/staging/vt6655/card.c |  8 ++--
 drivers/staging/vt6655/mac.c  | 85 ++++++++++++++++-------------------
 drivers/staging/vt6655/mac.h  | 22 ++-------
 3 files changed, 46 insertions(+), 69 deletions(-)

-- 
2.37.3

