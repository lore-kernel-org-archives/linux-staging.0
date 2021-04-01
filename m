Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12E670
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 15:07:42 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id b9so2158814wrt.8
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 08:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kB6b35TkKeBEpWPgQVDGgf20f9VdNcsRCGKE/IEecDU=;
        b=fiYgqtRbuHkAOIB9pENfmYb9zlD+pRfCDLUG+YkieQk7mjFtH6p2GAAQdasUBiQbp3
         wnmiNcXg21EjkroMnjElV7BTQhJZOliEG2w4cPWVcs1i4vIrP1+x7eEV98xAo/82ZaR4
         kTWtiQ+NG5fyJQUBBa1X06X5D2kSadWkTSIppl6bEZnOc3vT7sp+TL4xD0NyQzm3wIwX
         oL8ziPJfasSMRa9W6DXxQ49thzeIQZQcCWzqFs9n7cU/CxYGu5mP/7D/iiGviNGt5JH+
         BnA3bea56LqRMbGP8OPETfZR/GCuFE1Mw8GaClX9W377R/PvhvpGLl06kyjLkJoZ5TXg
         rlUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kB6b35TkKeBEpWPgQVDGgf20f9VdNcsRCGKE/IEecDU=;
        b=NYb3WSJVoh2TBQH38YPzqnVihmFnlAsDy+wU522JsgJa6ZUKsunOgR/zeCq4tq+1V3
         sA/dlwk4ZXNLKLW3L62C0vl/yYF02VcT5Oi1H+kjTvqeYVgId9GSOHpj7b/3c3LCBTAC
         VVyOtG/+avtCef6i2f3uJottcMTpmyU0ahZXILSJQfCRX4tk9ClHKGsCkEKdbt11QBsu
         coyBPY57UjFv0B781uoMxsRdrymDXwPylLrl2IoTM4y+d/gYcy5fly2h8GWQI3IIIzf9
         yG82AoQsrxfRB5u8/VhwnmcmPqIymxiTcb44QDFJ4xv1xOfFDwx473HZly09yMEKmpg8
         f5Rw==
X-Gm-Message-State: AOAM531Oo2wMjJqsFWaWJ8l3d8+V9EXiouNt3TAMGiJxTHreExFoAAC0
	G//yzy53NFAQ1Lp19YD8BSY=
X-Google-Smtp-Source: ABdhPJz1D4q12Th4EbfW7VXcWMjQP+Xt/wwiD6MDbLhKfM9AdssdVhAjfndQNkZQmjWOcZfdZhWBHg==
X-Received: by 2002:adf:f54c:: with SMTP id j12mr10303387wrp.264.1617289661280;
        Thu, 01 Apr 2021 08:07:41 -0700 (PDT)
Received: from bcarvalho-Ubuntu.lan ([2001:818:de85:7e00:a182:b5f0:9f7c:c891])
        by smtp.gmail.com with ESMTPSA id n8sm9710108wrm.70.2021.04.01.08.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 08:07:40 -0700 (PDT)
From: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
To: laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com
Subject: [PATCH 0/2] staging: media: omap4iss: Patchsets cleans up in iss.c
Date: Thu,  1 Apr 2021 16:07:37 +0100
Message-Id: <cover.1617287509.git.martinsdecarvalhobeatriz@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up checks of "Alignment should match open parenthesis" and 
"CHECK: Lines should not end with a '('" in iss.c

Beatriz Martins de Carvalho (2):
  staging: media: omap4iss: Ending line with argument
  staging: media: omap4iss: align arguments with open parenthesis

 drivers/staging/media/omap4iss/iss.c | 48 +++++++++++++---------------
 1 file changed, 23 insertions(+), 25 deletions(-)

-- 
2.25.1

