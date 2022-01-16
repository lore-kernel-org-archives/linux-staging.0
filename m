Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713642C9C
	for <linux-staging@lists.linux.dev>; Sun, 16 Jan 2022 00:17:33 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id i65so6292419pfc.9
        for <linux-staging@lists.linux.dev>; Sat, 15 Jan 2022 16:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=i5Ou1yz0idejycfR7awkotrdd+23zegzIC5dA163t+g=;
        b=C5xIzSsYHtbu7OniZp8jIhBTCOP4jfnCYmsCECiOhVGiIQa6rlPxtG9GDijeCLsVc1
         zm2HHKyH99R8KmUFDrIWgBFT5R0DIN20reWU510G6ZE+xVkawmTAbz/mUQrBY0PTRIdb
         ItIuDYKGzuypBSvLhtZAnxNbGy8JEwRfMBHcshnREOWzPsWz7NV8dYV/D/kemuyW7g7K
         KLLOKMvHPDAMM2we0BGAADrswgS9YTTXnwzGJ15vq7LMlnoca8OKukPvrfwKlhHBXUa9
         IdhzZHgUyiwVsiYO8fhwhU0KhZ8c6s66F13uTF28GP9KXRk0GTFHFAlracR3/NbGK/hf
         LzRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=i5Ou1yz0idejycfR7awkotrdd+23zegzIC5dA163t+g=;
        b=B8yr2fuyHe6tiiiA5o9LKYapQJQhZONkb4QZIEd7uOkSOAtZLT/YyNEeKovGaY1SvX
         MYeBtQsqziBExt9FvtS5xxvchYuH4tUNBmm84iMb1qBCEDfdQe5J6CLZZZOEk9V9ZbJZ
         UEemJxuLgmus7n3A/xAfg+8cwa+0E5wVZb8g/iwJ6MBRxmwu/zJ4oCHkDsKS+dSeffvT
         zF/KNMsXGjlO8eQbam3rPiUbd/iu1MBoNaCQspOiPz91IkjM2F2PQS9D6wXyiwQlFeuy
         p1pmXtXMppH7P+EWMIJm8XBycb6eYQEcnXA1qxHPgs370zfPhJXKdtjpr8PuXpgSluq8
         o1Tw==
X-Gm-Message-State: AOAM532XcbfOzO55mfbMyv48JG5vsmf2aV0888GdizSVQ/N0KNOvC0Wq
	vBlVqFPioireWHW1pcYwGFw=
X-Google-Smtp-Source: ABdhPJx1T/5+V8yBIGbZNJi6n1OOAef69v3TsxufKcksJI4HtJurA1JQMvyO9xEzoTjOOQoDjeMUzg==
X-Received: by 2002:a63:3c07:: with SMTP id j7mr13313957pga.60.1642292252870;
        Sat, 15 Jan 2022 16:17:32 -0800 (PST)
Received: from mail.google.com (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id r26sm7661951pgu.65.2022.01.15.16.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jan 2022 16:17:32 -0800 (PST)
Date: Sun, 16 Jan 2022 13:17:26 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: gregkh@linuxfoundation.org, paulo.miguel.almeida.rodenas@gmail.com,
	realwakka@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] staging: pi433: validate min/max bit rate settings
Message-ID: <20220116001726.GA22699@mail.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

RF69 chip supports different bit rate settings depending on which frequency
modulation is used. Failing to correctly validate bit rate can lead to a 
silently failure and cause packets not to be read/sent.

This series changes the order in which the rf69 chip is configured and adds
max bit rate validation.

This series depend on these patches as they change the same set of files:

- https://lore.kernel.org/lkml/20220108212728.GA7784@mail.google.com/
- https://lore.kernel.org/lkml/20220114221643.GA7843@mail.google.com/

Paulo Miguel Almeida (3):
  staging: pi433: fix validation for min bit rate supported by the
    device
  staging: pi433: change order in which driver config the rf69 chip
  staging: pi433: validate max bit_rate based on modulation used

 drivers/staging/pi433/pi433_if.c |  8 ++++----
 drivers/staging/pi433/rf69.c     | 14 +++++++++++---
 2 files changed, 15 insertions(+), 7 deletions(-)

-- 
2.25.4

