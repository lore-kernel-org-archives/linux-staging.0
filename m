Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219B571
	for <linux-staging@lists.linux.dev>; Mon, 10 May 2021 13:19:37 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id x5so16588327wrv.13
        for <linux-staging@lists.linux.dev>; Mon, 10 May 2021 06:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mYmyfdN9IRbyb1UDqQtdljWba9muih00OArIPxbSCPo=;
        b=mAhAk99Xq5F1y+Ub8X6v5P2fu1+97AFrQZLfMByYFJg0Ua6FXjj+U3NFg165q6G3Tr
         XgKu0p7I3qvT4kkMf4kyYywPnlSp/OKS6A6HccXqyXNv6LWSPui8WyiO7gNk7bf6cxZ8
         tDMzgj+/9TzTeg02aTNkmL+0hGYjTyIfKMm3zW7XYkQZIfTINBGtOw54WpsDTIO+oi4T
         KYXJeOU7RWPVGW2/TLDXhgbYqKow3ZOltJcGiGB+hyhE3/AEV1TkTSpWW68kJd1Qqzsh
         tgCBK+m7kh5+B06iHFAMLykeb4OrKbl0TtffBZ7FJtomlcuS8BZ/47SrTYWh/xOoHqDB
         XuGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mYmyfdN9IRbyb1UDqQtdljWba9muih00OArIPxbSCPo=;
        b=MxiOK3ghFsSsnyPZKFCNQ3Ae6JHvVyzbYqWGlKqw1/G4EK78rU2iVatxOC457fasXb
         8DbczNTdTqKFOosy461y1mNdmCapnRv4wx8tYscIV/Rwqi80tMWcr+l39K7QUtJJjByk
         nGfZc7Kf4f7rDY9BxiM0+niGBM2HkJWKZmCKvOTPVn/xmimeiAeM1mooEfpHbvNdE9bz
         LI4rFHYBvkg3Q97mhPtCXy0ubY7qjJzv6dgxQJpVfMea/GR+jRcpTxs2l8kcI325KIjy
         ngWVLXEkDCQdeqyZQozRCo1/zbR9mGi0GjB6+G2lrJ8e3utkouP53HCJE8cp0fev0xOn
         sfFw==
X-Gm-Message-State: AOAM533LL5p3S6AGYFNF8K2Bh4Y2CuKJx2e4ZKYKDRhoLgPAXosFI5WF
	aTcOgcFtvKqHTmE+wHq2S6k=
X-Google-Smtp-Source: ABdhPJyAiJ3qBNdMiYw0WcPY1g+C1NTLb8VPhIZDexuVfakZIhEQ4BekXqBFhz8R7k9rRpeXkAunLg==
X-Received: by 2002:adf:ec02:: with SMTP id x2mr30360138wrn.35.1620652775635;
        Mon, 10 May 2021 06:19:35 -0700 (PDT)
Received: from agape ([5.171.73.3])
        by smtp.gmail.com with ESMTPSA id n2sm23230677wmb.32.2021.05.10.06.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 06:19:35 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] staging: rtl8723bs: use of generic CRC-32
Date: Mon, 10 May 2021 15:19:31 +0200
Message-Id: <cover.1620652505.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset replaces all private CRC-32 routines with
generic ones.

-------------------------
Changes in v2:
	- Patch two remove comments instead of
	  moving them

Fabio Aiuto (2):
  staging: rtl8723bs: replace private CRC-32 routines with in-kernel
    ones
  staging: rtl8723bs: remove unneeded comments to silence 'line too
    long' warning

 drivers/staging/rtl8723bs/core/rtw_security.c | 67 +++----------------
 1 file changed, 8 insertions(+), 59 deletions(-)

-- 
2.20.1

