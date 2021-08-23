Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E7E72
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 17:00:41 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id d11so38315177eja.8
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 10:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DrNCzcVvX7cvPSUZXmD40dpydUh09OSJcRtDIAA99/A=;
        b=apI8fQsF6DsHGrbZFrpOjapUk3FN3pbrrYdxsq7o4Xti+gSDnHb+rSAyl6NH4lrvxu
         D9hwmWCjr06e9cL9Z1ZZYWR/0xiGygpUoozRCjCsVcylBPjRa9/0oTlTAwZTkg05Fp97
         f9OeiqMnzU85LAJH/8NgyQVnoVnfJckG/Di/sIoaDCIBaVqsiXvSKySJdYggKnyGuahg
         Z9vY1iBM+7u2dNOrjZNK08A4qLL1VkQ+BXIZckv9BxkJwA+jIAHRej6gVe8ZG39dX4yk
         J5kaUblQRVssYZHPfjjnpSOzIfdoFWjdrsYZXDCymrpRbKg76SVxkm9YPGBjcwA6mE4a
         VJjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DrNCzcVvX7cvPSUZXmD40dpydUh09OSJcRtDIAA99/A=;
        b=tHZzGRyxzD9ewMzi2iYuTq6efIUvMY9Au6XKPOb4Bt04bkCfFkPrf562LF06KmBb2+
         0a2r4mHMMDEOPlg+DAiHPyuGoHTqcUvYsGFRpvI0HZXVhvwsg1i8VSpFK24LZbFaxCc+
         7yeitNFgRw+c6Ki1EQcPGWN2BiVvncdaknPQQjQOPGn5I4DZCJ8b26m4aiTwq03GZToR
         n7bjlOfdcSb8JvA9CH1SLs2s+UT30nFu7Bi51voU6mmBBabjKzRHcu/UpOep1jCtoMJo
         4YR8LAHIJz/ssO9B/35O/HzLb6LTI+8BwbD3xBKf1RSN4SuH0mQDPHFYo1MnY+TmtPna
         /Ucw==
X-Gm-Message-State: AOAM533oih9RKH0TcEug/Jc13tp+HRxpeo6KudSTXNhTUb+5ErDPXaEo
	duOzkY3yQJgiSF3cABee7LrWeGfzdVY=
X-Google-Smtp-Source: ABdhPJxXSES81ybuHB4XMNvH4P6hH6kzpwbzIIeSRfcCE3o7rYth8bDR15rHycbYBgnTbdTMnlJPiQ==
X-Received: by 2002:a17:906:b787:: with SMTP id dt7mr37662614ejb.111.1629738039778;
        Mon, 23 Aug 2021 10:00:39 -0700 (PDT)
Received: from xps.yggdrasil ([49.207.137.16])
        by smtp.gmail.com with ESMTPSA id b18sm1633188ejl.90.2021.08.23.10.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 10:00:39 -0700 (PDT)
From: Aakash Hemadri <aakashhemadri123@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/5] staging: r8188eu: fix sparse warnings
Date: Mon, 23 Aug 2021 22:30:25 +0530
Message-Id: <cover.1629563318.git.aakashhemadri123@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,
	This patch series fixes some sparse warnings in rtw_br_ext.c

Changes in v3 -> v4
- Added this changelog, as requested by Greg's patch bot

Changes in v2 -> v3
- Fixed incorrect usage/removal of endian swaps and checks

Changes in v1 -> v2
- Split patch

Aakash Hemadri (5):
  staging: r8188eu: restricted __be16 degrades to int
  staging: r8188eu: cast to restricted __be32
  staging: r8188eu: incorrect type in csum_ipv6_magic
  staging: r8188eu: restricted __be16 degrades to int
  staging: r8188eu: incorrect type in assignment

 drivers/staging/r8188eu/core/rtw_br_ext.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)


base-commit: 093991aaadf0fbb34184fa37a46e7a157da3f386
-- 
2.32.0

