Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC075F
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 09:07:26 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id z1so1098230edb.8
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 02:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hqKqZ9iRjRyPN9EH543S80Z7tugSlkFDhD8jKubgWUg=;
        b=nhcWAEMQZyxjL9hmCvp2KiPL79BTZowgTDPY5mOzLS/XL7saV1FpBP4DR2CHMXRp6d
         ujvaLn+yiTQZC3jjnX1PVCRFCrClZ55qh2GQbEuqtVnGfU2l0SZBpyjqKCGng1YpGm3D
         7rj3K4S9f24JRDo5e9CUGMj6A/4FTwBpZwWXcS1oxb44N0uVaoCf2m3XpCEBDY2/xS3c
         OGw1DhrOe5Zz2szMgvg1lrXJ68NiT9NGeLzCmgUo3zVY0ArKT9S/3dDJYrCSZl4DXbdN
         Ay67zgPWbZkI+71Iq7/QKzt7wl6ncUyr2h07VKw7vcNVLGTkeyqx7p37wrYJXzg/1Im6
         dKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hqKqZ9iRjRyPN9EH543S80Z7tugSlkFDhD8jKubgWUg=;
        b=kDvmvVna/H9rTkA66oeD6oT/mjUknyAey/Wtstm6WMgG566uuKOlauHdVUYAiy08Vf
         t94/OxabeR+Rh81TE/V/lBJaW2P6UeqstevVN0YWHLku58IBfxhiHrbTeukly47v3A61
         gqXyyWTT3eW59EMEB4NwYPr79gLGtL/6hR/8R+UaywVWUIxW3vRiSNZ4DaF3Rjle1dOJ
         KY4wK0ufUPDC8Q6UCHxABY1O4Br+7f+Rtq85tbHtaEK5Z7V7WcVnSjr8ex2u/g7cdkV/
         sXk4fyj4anAdm45aRPGn/kTtYSRaF9f9keJXBhTclhtlG7vEYsxUD7X7uIEKBnhXjHyf
         j0iQ==
X-Gm-Message-State: AOAM5321ytnbxUwrzwtyLVEfGA30kIXXor+Vm+/7Xe41FdRnPWhpVXuT
	MX3XUvgTRryH0ZvVgMPYT7k=
X-Google-Smtp-Source: ABdhPJzSSeVqMygi6cvv+ZRKLABJ79m178dLdquDaM0/vdzN98AWriWp06vwoafhOmKXu46DmtBT2g==
X-Received: by 2002:a50:9ea7:: with SMTP id a36mr8846379edf.174.1617268045446;
        Thu, 01 Apr 2021 02:07:25 -0700 (PDT)
Received: from agape ([5.171.80.247])
        by smtp.gmail.com with ESMTPSA id u14sm2444999ejx.60.2021.04.01.02.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 02:07:25 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v2 0/2] staging: rtl8723bs: replace private macro with print_hex_dump_debug
Date: Thu,  1 Apr 2021 11:07:20 +0200
Message-Id: <cover.1617267827.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

this patchset replaces RT_PRINT_DATA private macro for dump hex values
with the kernel helper used for this pourpose.

---------------------------------

Changes in v2:
	- removed the do-nothing macro declaration as well

Fabio Aiuto (2):
  staging: rtl8723bs: use print_hex_dump_debug instead of private
    RT_PRINT_DATA
  staging: rtl8723bs: remove unused macro RT_PRINT_DATA

 drivers/staging/rtl8723bs/hal/hal_com.c       | 13 ++++-------
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  | 22 ++++++++++++++-----
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  3 ++-
 drivers/staging/rtl8723bs/include/rtw_debug.h | 20 -----------------
 4 files changed, 22 insertions(+), 36 deletions(-)

-- 
2.20.1

