Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A47D168
	for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 11:00:58 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id bu12so2680586ejb.0
        for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 04:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jUwAs+Gp+d+MnfN6VEmwuMCsnF7zFA19A5ZH0CNCb+A=;
        b=ZqJTGxnTo1wPbGjXm99whzWhmnNKFOnlRiwbyzhUWJTDQ9ltCgeJmQOxf2YZlWN+td
         F227X3qIKhHpqxKLDq3GPcA1nYUHpNbf0dAiiDFIHS+HsFbg9vOqOJjdQIkZQqaRFerC
         TaKcwLeIZxgl/YBEdPxruHEpUKlwZkEm1+vu2J/TBqGi8VZFVmlq7hUDmKYNtXA1t33Q
         UgJg6Pze6k4xvrcfXwBm9fJPjP7RLZhn6JhWJs8hGT3o++mmC88lD0YL/uBEIrnr/RYf
         rt1uT6x/07DKF4GvPEJukZpN8Jm/tI/CzzAkt1+sTslqUzDx7JzQ0eqrjlw1tSNjScRs
         sxsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jUwAs+Gp+d+MnfN6VEmwuMCsnF7zFA19A5ZH0CNCb+A=;
        b=B9NK7txme05fiW4Ce5NhgPELswOz/M9y8f7Vs4+IDwQJah3eTcd3pPjwx0KX2L2dKG
         ge2tps/YBXEn/TJzjYSlKeGIi/qLkSjsq0RTWCDTcig0ap7n1ilmbLG2POjrL+89Zzgw
         tOYkDKiqgPXbhU22Qbq1eW3RadsmZ43IXQ4wIchFIsA0WWW2/jW4qPiBWMA2M/rgJe2O
         S7UmTeSlIFyut9rj25maCxvz62QC5FlBLYkahTRKFPXzBks8yAz9bi2HEAW8g0ghbpgE
         ZXFKEIRKpVdjnRNk/TUkRloamUxtNe5Oy8AgWtrgg962+p9YioikC0Pi+aUtEGfpQU94
         FU2A==
X-Gm-Message-State: AOAM530pZUuruCPjnlyp7zTRvUlTDxzlsXM3yYdeIDQtAHNN0mFX7MXk
	gtpJO3x2JIjGDgZMGTMEvVE=
X-Google-Smtp-Source: ABdhPJyMSpsqGAoOnYHx+ohabMdXF2biKWKSxiXQUfCg5a13780/YbI3jxY65BjyD1QAKLgJe8MLFQ==
X-Received: by 2002:a17:906:6c91:: with SMTP id s17mr37054907ejr.403.1626865256782;
        Wed, 21 Jul 2021 04:00:56 -0700 (PDT)
Received: from localhost.localdomain (host-79-27-97-200.retail.telecomitalia.it. [79.27.97.200])
        by smtp.gmail.com with ESMTPSA id f5sm8102482ejj.45.2021.07.21.04.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 04:00:56 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v3 0/2] staging: rtl8188eu: Replace a custom function with crc32_le() 
Date: Wed, 21 Jul 2021 13:00:50 +0200
Message-Id: <20210721110052.26376-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use kernel API crc32_le() in place of the custom getcrc32(). Remove no
more used functions and variables after the changes made by patch 1/2. 

v2 --> v3:
Join two related patches in a series because they must be applied in
order (first 1/2, then 2/2). Rebase to the current Greg K-H's tree and resend.

v1 --> v2:
Use cpu_to_le32() to assign native endian return value of crc32_le to
the crc variable in little endian byte order.

Fabio M. De Francesco (2):
  staging: rtl8188eu: Replace a custom function with crc32_le()
  staging: rtl8188eu: Remove no more used functions and variables

 drivers/staging/rtl8188eu/core/rtw_security.c | 59 ++-----------------
 1 file changed, 5 insertions(+), 54 deletions(-)

-- 
2.32.0

