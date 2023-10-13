Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D3A10944;
	Fri, 13 Oct 2023 08:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lP555A1q"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5815818406dso1006781eaf.2;
        Fri, 13 Oct 2023 01:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697185602; x=1697790402; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=reNApFY+y/nEKBVj6jhBlvKWFZlo0eMfbeufoLG6DlY=;
        b=lP555A1qkgSU4s9F5Kqw6JDk5vuTffBYTYMW9BAM01f+42wI8+qbbuQ3XpYn4SiDsc
         WvvY+4+r7Q31poh7xahz86jRydF1sjvXhgDB0fIQkRVVS2d6R2QcpQUVS2r0VXc7m6bG
         5hGZszJKyknCrDxowRWTg4+0Bply1Woa0KyTI+YA+gf038I7VZLa2u4mtPhv2pqFQ2nK
         SZlmpqnsKy32+cXMMTK7OPtLFnoeveidUQ4e7zHzGB7M7dXoApqL3sOZHqYIgO50kson
         0ON9yUmbM1Llf5sWPxtjO0GXT9z5IGQ5X5Obg5IHUMyqmiVKxLJUF3toc4dxkQYPB93l
         x2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697185602; x=1697790402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=reNApFY+y/nEKBVj6jhBlvKWFZlo0eMfbeufoLG6DlY=;
        b=R4BlLS0/2vWjesNeuIiifQxVpUHcn8oXOtvJcZ/ZACE9MKHRvk2dSqob5QRukL8Vxd
         eXHVlXZACWcmJmj8D+a+wQj1mSohQAop1h4C1Uo+y7nutadywzSmQRiZMBhaOONK2BR5
         uyegWpH2o5GmKbsvSB6M9bb1O9zP5GtbXQja2zUyaXjpXaCaYrTwWVYkR18v5Qj4esjQ
         AMPP1PVtyAKyNQVYuabDZ5xabcukyZRlJEEA44ydpDkNj8DdcJEVeKq/j/a7TAM23y4K
         SHahTyhr/R8xOt5K4Dx/wawlcBMFyNwGDUcNAvg8itIBs1wzCbfU7ERrP4Hnld/s7DFY
         J99A==
X-Gm-Message-State: AOJu0YzrIrPcdt9P444we+rg3tPiHddsKRXaHjijtEZtS9EXatqV0/3X
	dDJEXI1tNtx3zkUvWZFo8bWTwd589cO4JQ==
X-Google-Smtp-Source: AGHT+IFJ0JbVkvyz/thqzxydud/CFNHx7HeOr8BQImJa91r60A0h/JVF35oVVJSTifsTu3ApY7l3Dw==
X-Received: by 2002:a05:6358:99a8:b0:141:d2d:6da7 with SMTP id j40-20020a05635899a800b001410d2d6da7mr27248704rwb.17.1697185602682;
        Fri, 13 Oct 2023 01:26:42 -0700 (PDT)
Received: from Negi ([68.181.16.134])
        by smtp.gmail.com with ESMTPSA id q25-20020a62e119000000b006933866f49dsm13506789pfh.19.2023.10.13.01.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 01:26:42 -0700 (PDT)
From: Soumya Negi <soumya.negi97@gmail.com>
To: Jonathan Kim <jonathankim@gctsemi.com>,
	Dean ahn <deanahn@gctsemi.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Soumya Negi <soumya.negi97@gmail.com>
Subject: [PATCH 0/2] tty: gdm724x: Fix coding style in gdm_tty.c
Date: Fri, 13 Oct 2023 01:26:33 -0700
Message-ID: <cover.1697184167.git.soumya.negi97@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Checkpatch.pl raises 2 warnings in gdm_tty.c. This patchset contains 
two patches that cleanup the code as per the Linux coding style & fix 
the warnings. Patches can be applied in any order.

Soumya Negi (2):
  tty: gdm724x: Match alignment with open parenthesis
  tty: gdm724x: Add blank line after declaration

 drivers/staging/gdm724x/gdm_tty.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
2.42.0

