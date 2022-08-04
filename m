Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DB5816
	for <linux-staging@lists.linux.dev>; Thu,  4 Aug 2022 10:55:49 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id c24so5406107ejd.11
        for <linux-staging@lists.linux.dev>; Thu, 04 Aug 2022 03:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MYiE0Wz0Ij1rq07h/DGjjvFWkIZBMv0fucBm9a2zZb8=;
        b=kZFFkw8UQyzJJcJZFrr7/0f3RoTn+BvaT9mmt1CkrpMNFBjWfpLTboW9DdLUAQ4B+P
         tOO3RDx+3EBG2XvDKKwa0UGjGMXlSDGsCNa8U/Gz1w8DdfSfEBFY9PqdIbOCjanjeVHd
         xrSe0z9jr0+Kt6DwRfrB3xHc1GEDQ9P7/POGrmuf2hDBrWUz1By4mJyVb9qabI0ET03q
         UcijC1+VwFtbp9mKAFcATE/IuYdkhxeVSrZc4dRgpRNI5D6JWkdb2gEttzOqUkmxX2I/
         opPDqjbNpXX/4MhMegGQb4Fwe2DuUjzuHF3Eje6ltcGpXFNGj+yysHboODrUrRJwJLXU
         Voow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MYiE0Wz0Ij1rq07h/DGjjvFWkIZBMv0fucBm9a2zZb8=;
        b=BpOjk7pHJQvvRIE5hd3JqzdQ+lYADtJmgRs6thf8adRqlEX2OvQZ9vRx5dhpGIub2R
         nNkNjn89/aRm/TU33DeFMJ2hKPSO/xLzbBDyGF03uRgSjQP8fE+45o8p+zdqv4JNeELe
         eIccT7mJa4Bntz4pPHA5pRqo6Lhi1JB2s65fR4Sgc0ou+EP96vwbrEJ7N8vAUUz6P8/t
         VID2tfJIkZDY7OcP/yA+z84d3qyXqVzNJon7+VXeaCkeE7exxHxBpUouI6rr08r/7bAf
         HOWKTT+K+4HRHt73/5q5P7cghH5vGPONvDySglBSs4xB9Nzl9aVoSg1SHurLrpI2Cy3A
         bivA==
X-Gm-Message-State: ACgBeo1Z+yI5Jn1eGu2Ewc+DBr+XsbogIVdtAOVAmubg5ugdH0LmudIC
	o0njDmXOZyaJlYNzqIrGJtI=
X-Google-Smtp-Source: AA6agR6gFj+30Eud6y9StMXbLKhIC/bJDEgTlK0NR6xD6dYlsBhHvObVkA2EjaWCkci0Mzx3YOipTQ==
X-Received: by 2002:a17:906:6a02:b0:730:9f44:2bff with SMTP id qw2-20020a1709066a0200b007309f442bffmr973382ejc.209.1659610547708;
        Thu, 04 Aug 2022 03:55:47 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abba5.dynamic.kabel-deutschland.de. [95.90.187.165])
        by smtp.gmail.com with ESMTPSA id y89-20020a50bb62000000b0043ba0cf5dbasm510013ede.2.2022.08.04.03.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 03:55:47 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/2] staging: r8188eu: make some functions static
Date: Thu,  4 Aug 2022 12:55:30 +0200
Message-Id: <20220804105532.7532-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series makes some functions static what allows us to remove the
files hal/rtl8188e_xmit.c and hal/rtl8188eu_recv.c.

Michael Straube (2):
  staging: r8188eu: make handle_txrpt_ccx_88e() static
  staging: r8188eu: make rtl8188eu_{init,free}_recv_priv() static

 drivers/staging/r8188eu/Makefile              |  2 -
 drivers/staging/r8188eu/core/rtw_recv.c       | 79 ++++++++++++++++
 drivers/staging/r8188eu/hal/rtl8188e_xmit.c   | 22 -----
 drivers/staging/r8188eu/hal/rtl8188eu_recv.c  | 91 -------------------
 drivers/staging/r8188eu/hal/usb_ops_linux.c   | 14 +++
 .../staging/r8188eu/include/rtl8188e_recv.h   |  2 -
 .../staging/r8188eu/include/rtl8188e_xmit.h   |  2 -
 7 files changed, 93 insertions(+), 119 deletions(-)
 delete mode 100644 drivers/staging/r8188eu/hal/rtl8188e_xmit.c
 delete mode 100644 drivers/staging/r8188eu/hal/rtl8188eu_recv.c

-- 
2.37.1

