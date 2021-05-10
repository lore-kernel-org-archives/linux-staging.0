Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5515171
	for <linux-staging@lists.linux.dev>; Mon, 10 May 2021 12:46:22 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id z6so16497347wrm.4
        for <linux-staging@lists.linux.dev>; Mon, 10 May 2021 05:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MZpUv7tgjGxsXDRQniIs0eZxYD9bjY5jkBU/UVJQVj8=;
        b=KbG8JXbT2noHOgmMd8wJRapH4yPW5nZH1EiRztpC69MkRLgon2bZfP/aSKBEBilS41
         K5v1HIQei9NxtxbWzIEX8ZRTOY8s/ISaEWwh9uCZE2jmOyKCYaSpJvQXq37QbZEgKMse
         0YmMVjQutEteHLbaUmy75ccRGeePdej01d3FuuEIzovSmFL7TeaBQzdsAUiujBTjRnkS
         dUfyLcYVT1KmgGgus4jBLDamMM3JGBJk4r2rlcIDk/vrE9fCVBJQD7dilyT41EBHH6Un
         PkOXv4vYvzh1OeXj2uQRdLLQ5YD/+5kRE4otP4Mv9nIG1i73zeIEL9OyWP52jVDaFW+d
         FR0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MZpUv7tgjGxsXDRQniIs0eZxYD9bjY5jkBU/UVJQVj8=;
        b=ldE17TZDe2z7G36V6vvb/N6IypwMt9Jjo7Si0Gr3D9vX5+irE0Q9LXWCVRxGJ2FA/3
         VD6IyqZtOqhqLejYt2kQY157D9mG5IGR4cDM1Xm3T1SawCJlBBSfktXoicU6EOl0pKev
         G0Kq6RsF5ujawddY+ZDQcVBlZ6cnnLC4IPZxWb1bCho3U8W1YO1Pat7bfL5bB61v/7QZ
         bSjdsLr5XuaRhvauVSRRp1khwIbvrcgyREeczGEjp2bWgnn/IlpjZ9L7I5ZUOmioFvEl
         cogU74FMhspvk92KsQL3f97YXv+ehU/jV0O275l6weopcM0rdAOnuc1TmELgZNw9sEOj
         GB+A==
X-Gm-Message-State: AOAM531cbTFLjUqNdqyoTlDMnOAXGdiOc3XiWrDxPh6qdCEv9aByY18h
	OMg4RmYgHD9rQpNwzovcFjk=
X-Google-Smtp-Source: ABdhPJwHJ0YxxrB1WrnxtlN4cFr+nvxmbre1h5q2AO1M+TCVJHiwm+S+EaVBDIvEkjDcFLF/bUWTXw==
X-Received: by 2002:adf:ef45:: with SMTP id c5mr29775237wrp.78.1620650780962;
        Mon, 10 May 2021 05:46:20 -0700 (PDT)
Received: from agape ([5.171.73.3])
        by smtp.gmail.com with ESMTPSA id a9sm22109481wrw.26.2021.05.10.05.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 05:46:20 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] staging: rtl8723bs: use of generic CRC-32
Date: Mon, 10 May 2021 14:46:17 +0200
Message-Id: <cover.1620650484.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset replaces all private CRC-32 routines with
generic ones.

Fabio Aiuto (2):
  staging: rtl8723bs: replace private CRC-32 routines with in-kernel ones
  staging: rtl8723bs: move comments to silence 'line too long' warning

 drivers/staging/rtl8723bs/core/rtw_security.c | 69 +++----------------
 1 file changed, 10 insertions(+), 59 deletions(-)

-- 
2.20.1

