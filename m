Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1346160
	for <linux-staging@lists.linux.dev>; Sun, 28 Aug 2022 06:53:02 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id fy31so9657070ejc.6
        for <linux-staging@lists.linux.dev>; Sat, 27 Aug 2022 23:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc;
        bh=jIUU48Dd4qUtx9eZL3yBJdTbWv5LKVxR1bts7DnjVSM=;
        b=eJDImHW3c1xRk5N/B3BTwzrFI3SQMOE/ydI047zviTnnXVtP+ffDsv0GMvqHNMWnks
         bbqDCfmfvWAZlV0GQOZsGR2h5hUNweOB2v/Sn+QXEaz2WQRpsHhnZkXB11O1BaNeLct1
         OMnBhmb97gwPAbvCBJ5X82X0dUDjtcB2f8btIjIz95QHTNVwnDPuBgemG3kpvYr8bgEO
         yx79QWuIidlzS8homorVqP2jOjJ3SpMjtfwr0n+f4oM47SpuVfE1Couwa9ZnwDS3Ur54
         StCmWAiOmJSeBBFTG4GX7/QM4sFOjYabiMmrHHqCDvkiVBf19pW8yAyQfrJhhY/dZ6RS
         pAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=jIUU48Dd4qUtx9eZL3yBJdTbWv5LKVxR1bts7DnjVSM=;
        b=3VScEdKIMsIFfzhgGaaO10Qhba1yjn5TRVbYnXqwqyoZgeujZuQWy7n+O3uZBqM0eJ
         BhuZhO3iSgf/myj9n34dMLLzOd18M7JqMAL1MGjvbYcqOnHMAyBzXCwkb+5hSIu+gSD5
         LNDyPcmPICs/jLfJRXTBR2tx4d02fUpb/wAdULqV/Z+0H72UhNNuAFVKj8+FcV2R0NYZ
         07xbVedcxtCEuSMBvEiQwV0wOawW1osL2lqiC6WX3VVUcqD9Td6T5aGM4QloFt6rPNVz
         HoDIZQ4lsS/uEXNOTC79zfZlocw33G4GOONRcyaVpQE15bv3u01imioZqjjONZfGlpc8
         itpQ==
X-Gm-Message-State: ACgBeo1Xu5iEPZmOLGhq7Ag8+01rk1zvU2juwtcUjkArfhauWz4hDm5m
	TBetNg/qXAzRyhmeiG9a0fs=
X-Google-Smtp-Source: AA6agR6DGVAPaSmHx2JPLX5QqOr5Os6f+n+XvaQEpm21S07k20uhdkDCVwNXz3lACj8XvtFrmQycsg==
X-Received: by 2002:a17:906:7315:b0:741:5b1b:920d with SMTP id di21-20020a170906731500b007415b1b920dmr2273739ejc.484.1661669581106;
        Sat, 27 Aug 2022 23:53:01 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id g2-20020a17090604c200b00731803d4d04sm2854853eja.82.2022.08.27.23.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 23:53:00 -0700 (PDT)
Date: Sun, 28 Aug 2022 08:52:57 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/9] staging: vt6655: Improve coding style in mac.h
Message-ID: <cover.1661666677.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Rename function and macro names and variable names to improve CamelCase
which is not accepted by checkpatch. Delete unused function declarations.
Delete unused functions. Convert functions to macros and make them static
when possible.

Tested with vt6655 on mini PCI Module
Transferred this patch over wlan connection of vt6655

Philipp Hortmann (9):
  staging: vt6655: Remove declaration of s_vCalculateOFDMRParameter
  staging: vt6655: Convert macro MACvSetBBType to function
  staging: vt6655: Rename function MACvSetBBType
  staging: vt6655: Rename macro MACvSelectPage0
  staging: vt6655: Rename macro MACvSelectPage1
  staging: vt6655: Replace macro MACvSetRFLE_LatchBase
  staging: vt6655: Rename function MACbIsRegBitsOff
  staging: vt6655: Delete function MACbIsIntDisable
  staging: vt6655: Rename function MACvSetShortRetryLimit

 drivers/staging/vt6655/baseband.c    |  2 +-
 drivers/staging/vt6655/card.c        | 22 +++++++----
 drivers/staging/vt6655/channel.c     |  4 +-
 drivers/staging/vt6655/device_main.c | 14 +++----
 drivers/staging/vt6655/mac.c         | 56 ++++++++--------------------
 drivers/staging/vt6655/mac.h         | 26 ++-----------
 6 files changed, 43 insertions(+), 81 deletions(-)

-- 
2.37.2

