Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF4227706;
	Fri, 24 Mar 2023 22:09:57 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id v1so3161127wrv.1;
        Fri, 24 Mar 2023 15:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679695796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=USbTBCYF1HNNMAtJA9NJ2/IOkLBi/b3sc9VKyACjb4c=;
        b=fwge5bR6v99Y0QrwnYlMDGT4ggqNaRSow5YTBUA87SFirsX8WsC27jw1z+grW1ZUUp
         8XgoK0yIxNwisvl0T3XNo7EAlXinSXlDf5dglMGKCUxWyjjodhp6KgZUaWRFi/JalP2z
         kjnXuDXYiLhPlCS41duSULPiR80P5Hs0RIiMzeXvHHSK8SwpdAhcFvRbviZJ/W80cz6A
         EuTOi8LRvWnHKyCoSEignwN6q/IVwjCvMLw116d8EuopfqIUYU1G0rHd2P1AZAwETzDQ
         b5f1kHHX07zDJp2qsYdTye/FFGGKN9IqYjpHlBY9cPqc4sqCYzCHASBjXOT4+XaR06nB
         zXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679695796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=USbTBCYF1HNNMAtJA9NJ2/IOkLBi/b3sc9VKyACjb4c=;
        b=jH2NtCJR89PLN2CTyaLXbeCNrotRv4Z0MhWx2zsNxc3xUtqzP2gfYqebWiRZlZLbNZ
         H62nb24wizyZ64CfveA7z4inQa4SnICYChHI69QtCT0n1nwi5S89tG0xEbuxeSlvRjjc
         NbX9jM1XsX3ShE6hHXgghUIdC5fj7PA7Icz5w03i65DnY9UUdw+pkZGhqmQfbD5DrWoF
         YPYbs2dWayffiwMVjSN55QCyo9V/QEwnZ4j+zp1xkql2hvyNWqP+PTZ8fPZR8BmGFT5k
         Aui1L2SB2QpVAPSQNslz2z71ATcGOBd8SASBK21+wrR0CzGvIi5+QAfhJFlkZwbhzKvx
         BpbA==
X-Gm-Message-State: AAQBX9fCqstpCeAoGqjQLzK6AzQL8wzfZgSze15rJ64sUgh0iAdz6/I/
	tK4Oz3FNWxwKssbOnKypGh/VW2nszjvUPI+7
X-Google-Smtp-Source: AKy350b8zE0a7H4cpIO1knYUDPqHWz0Bzsssq9krcM/qr+iVi98Yqf+coYq6web5QM6fEaKc05PaNw==
X-Received: by 2002:adf:e44f:0:b0:2cf:eb86:bd90 with SMTP id t15-20020adfe44f000000b002cfeb86bd90mr3626034wrm.63.1679695795784;
        Fri, 24 Mar 2023 15:09:55 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id x12-20020a5d650c000000b002c5544b3a69sm19201736wru.89.2023.03.24.15.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 15:09:55 -0700 (PDT)
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] staging: rtl8192e: remove extra blank lines
Date: Sat, 25 Mar 2023 03:09:47 +0500
Message-Id: <cover.1679695111.git.kamrankhadijadj@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix several cleanup issues reported by checkpatch.pl in module
staging/rtl8192e in file rtllib_rx.c

Chnages in v3:
 - Changed the description of all patches in order to explain 'why' the
   patches need to be merged.

Changes in v2:
 - Resent patchset with the correct email address

Khadija Kamran (4):
  staging: rtl8192e: remove extra blank lines
  staging: rtl8192e: add blank lines after declarations
  staging: rtl8192e: add spaces around binary operators
  staging: rtl8192e: remove blank lines after '{'

 drivers/staging/rtl8192e/rtllib_rx.c | 73 +++++++++++-----------------
 1 file changed, 29 insertions(+), 44 deletions(-)

-- 
2.34.1

