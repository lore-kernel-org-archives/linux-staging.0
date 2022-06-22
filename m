Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF8010FF
	for <linux-staging@lists.linux.dev>; Wed, 22 Jun 2022 04:53:06 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id a14so5446369pgh.11
        for <linux-staging@lists.linux.dev>; Tue, 21 Jun 2022 21:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w9EQSFAmGXcDrJ+8KvwBniXihEiKbTD4fg4mnulBGQI=;
        b=Xyw17Y3qjDWE4vSIypgVuX9bQ9sZi6CPLD/Eza5LjkapM9acZyPli1ynaA+DQqjY3W
         gCaa3x5cCo72VpFySOF11t2rmt3ZC0vdlEC0R19XbxF+K6WjE0ACpW02nrk2sh2PXXoj
         4IvRXROrmPT2QrRjP9nwE4UBcs9YPpeIBr1Jr81P4JtcyLF08eabIKBGV/rvGEymEJIw
         YvZZ1CWDLKePA9yF7s6q16jZXogr/d822xmifGs+BYmgGVvFvP+LEU4RzcG8U4QxkpFD
         eop6OC732YnW9bEvcGPf4KjThJGn8vGEUtpFPn3iFJILwhYl249Ir01uFanQ8bvyLCpJ
         YAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w9EQSFAmGXcDrJ+8KvwBniXihEiKbTD4fg4mnulBGQI=;
        b=cAkpiy4ZKS7y8PZLHkDMWAElRQfB8qHy1ZF14wQsRW7IWnA6xkrXjZ9BsMMWTsOUtF
         852UMVsy67XPUA7QFTlAiTxoHte2r7DXLgfFYogBHoA2C9wIBXWeHpNJrfEm6gZtLhW7
         lf9gYDlBwH/Gl4QHsHZaOh8dIt3GYbQZk1FxxANzFMog1lf0u6gkUz93+l8iJJgKKT7t
         uzRaKdzDmtWk65N1ARMXXmDmLZEdDMqd4gD4+T+iksj7XUp86CotHI15yxPLvIpO8lXy
         6IcnrCTzv9qY8TnvlB8K28z89vmWO4mQprTKwLf9CahqX/dr+w8uYm+DcG3HQvuu6/Rp
         wdXw==
X-Gm-Message-State: AJIora9YuBiQPMj0pVKiNZDikJccDvHVNIoJv++MdQ22ZZK/NSU6iobk
	d5uiziMTCGmWZqAovtU+nz0=
X-Google-Smtp-Source: AGRyM1syBzoM+gI6UQ4DBoZL4CiYhlBCCwEeMwNtoGMrlP28Ob7tqNkCvtNhsP1WfsODlFIOVOdNig==
X-Received: by 2002:a63:e114:0:b0:3fd:97a1:7a5 with SMTP id z20-20020a63e114000000b003fd97a107a5mr1336117pgh.178.1655873586539;
        Tue, 21 Jun 2022 21:53:06 -0700 (PDT)
Received: from localhost (c-67-180-87-133.hsd1.ca.comcast.net. [67.180.87.133])
        by smtp.gmail.com with ESMTPSA id b193-20020a6334ca000000b0040c95aeae26sm6791013pga.12.2022.06.21.21.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 21:53:06 -0700 (PDT)
From: Chang Yu <marcus.yu.56@gmail.com>
To: Larry.Finger@lwfinger.net
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chang Yu <marcus.yu.56@gmail.com>
Subject: [PATCH 0/5] staging: r8188eu: Fixed some coding style issues
Date: Tue, 21 Jun 2022 21:52:29 -0700
Message-Id: <cover.1655872968.git.marcus.yu.56@gmail.com>
X-Mailer: git-send-email 2.36.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed a few coding style issues as per checkpatch.pl and kernel coding
style guidelines.

Chang Yu (5):
  staging: r8188eu: Fixed a function declaration coding style issue
  staging: r8188eu: Fixed two brace coding style issues
  staging: r8188eu: Fixed two whitespace coding style issues
  staging: r8188eu: Fixed comment style
  staging: r8188eu: Fixed some blank line coding style issues

 drivers/staging/r8188eu/core/rtw_recv.c | 38 +++++++++++++++----------
 1 file changed, 23 insertions(+), 15 deletions(-)

-- 
2.36.1

