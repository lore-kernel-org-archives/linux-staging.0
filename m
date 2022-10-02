Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D299B7B
	for <linux-staging@lists.linux.dev>; Sun,  2 Oct 2022 14:35:54 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id sd10so17684368ejc.2
        for <linux-staging@lists.linux.dev>; Sun, 02 Oct 2022 07:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=bc5eiXxNF6lAuSNI8nCdi3lf1DQ5k+XIN3ee4g+RQ7o=;
        b=fVoHSgG5614hcdqS185DfH52igj/BcOJSSQ0enSfLX42LacIpTQWU8rPW50NqLE0io
         PTYSH7sCOA+E4D9r+1srs+HsCCZTMi8Y32KswLCwoDhstW0RjAmwk3RvIcGM3/3XClEu
         GGzKrnBGP7T9II+jEvaU31NoHSQ4jMz+S9Rveesyu9RInqmph8fLsm5aVWzZf+rTXDjl
         exJZ4WLanG8CR6v5+CGpMBKBHURSEHjEP7Hfc1Iwc6cS2q7IA1d/ZcVCgeuxluF3WPK3
         Lliw5sHW1q9uQ9Tj/ghBr484EXLsLh3MYlzaWxvjzc7dznlDCLrDkCRJqEdNi+6F1lCl
         PQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=bc5eiXxNF6lAuSNI8nCdi3lf1DQ5k+XIN3ee4g+RQ7o=;
        b=dhkNju75oe9L2PTyLnSUM0xXKjuv1z7JBC0AFrQaVxBgKCTIIRSDgk21diDDr4wv37
         KJ/0fAgzvY+b0hIw8vnI6ez7s8a65lzWWzet+CC6Q9zVFtCDITw0yyjCvk7dqqAdDOBB
         i1RlMB1XsNmXR3btT+YtY4gpicTaQGtGxKXIaBk5wtuQ+bAHbCZ+sBI6NCHZGkhlUmXo
         ex8LTSQnI8OWhc7eM9Gw3W62NQgEUOUx85b4QFPFPpo0zsecm+gzPNee+6IULU/DNKis
         L3V8eT4isBmJ2CO1hpl+lS/uQNDmy+N4r4ZRAwTRQ8oitxuGQtlevEUshMCurC5pPmFc
         9KOQ==
X-Gm-Message-State: ACrzQf2kxRbkZd/JYhhb3Pg3swTkBO5MlMF7EMSitgqCSUnK9EqKbt/+
	s6RjbJiGinEcJjqmmotcw0w=
X-Google-Smtp-Source: AMsMyM5IOqGjIuKeoADZ6+lyLE1jB++RQhqZJarLSc4VeOzyyxevvrALA0SeJ3G4J1Hma0+p1X1+UQ==
X-Received: by 2002:a17:906:4fd1:b0:787:434f:d755 with SMTP id i17-20020a1709064fd100b00787434fd755mr12224992ejw.356.1664721353151;
        Sun, 02 Oct 2022 07:35:53 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb59.dynamic.kabel-deutschland.de. [95.90.187.89])
        by smtp.gmail.com with ESMTPSA id 17-20020a170906301100b00731582babcasm4082334ejz.71.2022.10.02.07.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Oct 2022 07:35:52 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/2] staging: r8188eu: convert two functions to void
Date: Sun,  2 Oct 2022 16:35:42 +0200
Message-Id: <20221002143544.7974-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series converts two functions return type from u8 to void as
part of getting rid of _FAIL / _SUCCESS.

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (2):
  staging: r8188eu: convert rtw_reset_drv_sw() to void
  staging: r8188eu: convert rtw_free_drv_sw() to void

 drivers/staging/r8188eu/include/osdep_intf.h | 4 ++--
 drivers/staging/r8188eu/os_dep/os_intfs.c    | 8 ++------
 2 files changed, 4 insertions(+), 8 deletions(-)

-- 
2.37.3

