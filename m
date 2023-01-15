Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9EE46B5
	for <linux-staging@lists.linux.dev>; Sun, 15 Jan 2023 20:19:18 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id qx13so5328900ejb.13
        for <linux-staging@lists.linux.dev>; Sun, 15 Jan 2023 12:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x4G80CZkEtDJ5S8nHN2azZRr/qBNRSSzTfZc/Vq/ilM=;
        b=iuJpBybHuMlWTqaA2THUY8UH5zLu5bYXFfK+MLnSqBqQD3FXmHnRU4KYn5oryl75iA
         i/YpfDS2JFjOtTZQEjKK6IlZxrPtdnshy7X+gUfy7r1erDLO7//+FyTUoKA/mrk8CVD1
         FLx8C55Mp49mEtH5ssB7D5EZTQWB3lmzjnnh0iNQzP2A1FvrThv2Zvqtas1n8S4xwT6p
         LW2bz9JG5v3BksIOqJxfqVsCeumGBAfZ7y5t4bVujV+5QE6IvwA2OH6juaquALx5KRkI
         w0JbaRYVQro8QC7JlhNwdwg98z7YP5nEQMJUm4yVipBiKQm3dATpiPtI80W2rFbYgIyy
         rt2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x4G80CZkEtDJ5S8nHN2azZRr/qBNRSSzTfZc/Vq/ilM=;
        b=izAmEmF7srIa9UfG6MiTNJSgaRXm8gyxQboDcoxitM2pvNhbv/v9cBpEIzGsXzmIMv
         sHEoWbBk2N0v+4kM8FdfL6r2cqG65BKJWbJVKlz3PDQY0hyQXGzVYNXwrIh8wYk4TtRl
         B/yBJZs5wW/d4Sj1gRmYCdU7y7dAvG+5N1rIv3MmSWLRU6vgCqT8ve5RNn4cKFTBcmrx
         ZOKeX8yNKSw2DjaQ3EZzpSUWNP17Q1coykWVpPGXkGIeVuwh4zJ001pvEaPQvp4qDcUc
         8gBIe8WAFtZdl2B4e5lQDXZY5vCqtw8P/Uj0xrwvUMIuQgLh7kFdR5HFNcO80cqttLQ4
         xTWA==
X-Gm-Message-State: AFqh2kqz8ETrkRvC1eVRzAF+qYc1hX38Y6MFnSDxkLxvmhB9QkcOehF0
	BfnSqNHgWI2DlESeE+o3hsE=
X-Google-Smtp-Source: AMrXdXvWkZnCqKSawa+yWFdf6lcM288lPoTwtYAOjylBJu4j+yCdv+doI5wXP74gEclActakL9+xmQ==
X-Received: by 2002:a17:906:d109:b0:870:839d:224f with SMTP id b9-20020a170906d10900b00870839d224fmr362331ejz.4.1673813956454;
        Sun, 15 Jan 2023 12:19:16 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id c23-20020a170906155700b007a9c3831409sm10966129ejd.137.2023.01.15.12.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 12:19:15 -0800 (PST)
Date: Sun, 15 Jan 2023 21:19:14 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 00/10] staging: rtl8192e: Rename variables from r8192_priv
 start with bDynamicTx..
Message-ID: <cover.1673812849.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Rename variables to avoid CamelCase which is not accepted by checkpatch.

Tested with rtl8192e
Transferred this patch over wlan connection of rtl8192e

Philipp Hortmann (10):
  staging: rtl8192e: Rename bDynamicTxHig.., bDynamicTxL.. and
    bLastDTPF..
  staging: rtl8192e: Rename bLastDTPFlag_Low, OFDM_index and CCK_index
  staging: rtl8192e: Rename Record_CCK_2.., Record_CCK_4.. and
    DefaultIn..
  staging: rtl8192e: Rename rateCountDi.., ContinueDif.. and TxCounter
  staging: rtl8192e: Rename bResetInPro.., framesyncMo.. and
    nCur40MhzPri..
  staging: rtl8192e: Rename SetBWModeIn.., SwChnlInPro.. and
    ThermalMet..
  staging: rtl8192e: Rename CrystalCap, EEPROMLegacyHTT.. and
    EEPROMCrys..
  staging: rtl8192e: Rename EEPROMTherma.., EEPROMAntPw.. and
    EEPROMTxPow..
  staging: rtl8192e: Rename EEPROMTxPower.., AutoloadF.. and
    SilentReset..
  staging: rtl8192e: Rename EEPROMTxPower.., AutoloadF.. and
    SilentReset..

 .../rtl8192e/rtl8192e/r8190P_rtl8256.c        |   4 +-
 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |  92 +++++------
 .../staging/rtl8192e/rtl8192e/r8192E_phy.c    |  52 +++----
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c  |  10 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h  |  60 ++++----
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c    | 144 +++++++++---------
 6 files changed, 181 insertions(+), 181 deletions(-)

-- 
2.39.0

