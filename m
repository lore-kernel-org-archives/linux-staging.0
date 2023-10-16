Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B8D347AE;
	Mon, 16 Oct 2023 23:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PBR8vv0t"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5a822f96aedso43621737b3.2;
        Mon, 16 Oct 2023 16:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697497252; x=1698102052; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f7PM/qoXzVs0Ox8v8Qh+A2b6z9ZGf3HGoTdxvDT9A8E=;
        b=PBR8vv0t7rEr+zh2OjNEw1ACsVJ7ADObAVnXeIy/TuTvF9rHLKKPzq7CIaSB067n+P
         WugrsswTtAiaeXVHWkAjePwdh7KgSdpnoK3qE+dP/qq6BSdaa4W9zE9ZpJH4EYVbsS6X
         S0EpFlgMEOnQCcmQPNk6/fMzkUNjd9ImUvGUsjXadlSpgSTvG1mmaHj+1ADqMtaCxYsL
         nd83gfQj5qej/5Ehsas5QYK7LN7Av4rCBynHqlV0NN2lIqNSI47UAAwcMomX12IlsgYP
         pSYWzX6cHRB3YHn0yZ3RSU1fO2+z2LG9/oBXVeoVNWA63A3LQPLVae3ME7SEugBQr/ph
         HTWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697497252; x=1698102052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f7PM/qoXzVs0Ox8v8Qh+A2b6z9ZGf3HGoTdxvDT9A8E=;
        b=tgGqIJpZQy34q1yObl/76x3XpZgsWeJFGjDwMqZ1xM5QUdgr0udoelv9uP4+vMfLbl
         eyEajCLBzH6lNUj9LkwTJ0Cb2gSs6I5pYUPOz2y/09gBc1u21EfgPuy0tr6TC7suy8LU
         u4OiJ4DIPM45qpm74fl2wcyLsEHlIvb9PZ6R+YhHNriAhWusvwtrqeJqLf6wF0NLQIe0
         pJgCfwmvjf8P9QHxbzzcNn13cAZdnzTDNkPn27rTXh6Jj5eAgkQ+E65FNzkNK2kymcWY
         U97RMoXxTbjldLdbP3+yD2iDfRdQ5CuEkuO4xh+uofmlXmdmpb12bLW3z5TtFl4pWtqm
         BvDQ==
X-Gm-Message-State: AOJu0YzTObBqT2uLiT2bDWiRU1p8jIntNMN1oX3gpagXn1MQNH1yURR1
	+7oJYFjPIsDElKioHIlGerc=
X-Google-Smtp-Source: AGHT+IH+dQdqLPosZBc+wnM7MHs/JysF+hbCzToiOyXWRhMUnsAXYdSL3y5m2cOCqIcF35tG/BZ2CQ==
X-Received: by 2002:a0d:d40d:0:b0:5a7:bf2b:dc27 with SMTP id w13-20020a0dd40d000000b005a7bf2bdc27mr673624ywd.14.1697497251983;
        Mon, 16 Oct 2023 16:00:51 -0700 (PDT)
Received: from gilbert-PC ([105.112.31.148])
        by smtp.gmail.com with ESMTPSA id d77-20020a814f50000000b005a7ba08b2acsm103979ywb.0.2023.10.16.16.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 16:00:51 -0700 (PDT)
From: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
To: forest@alittletooquiet.net,
	gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gilbert Adikankwu <gilbertadikankwu@gmail.com>
Subject: [PATCH 0/4] Rename variable bUpdateBBVGA, byCurrentCh, byCurPwr and byBBPreEDRSSI
Date: Mon, 16 Oct 2023 23:58:53 +0100
Message-Id: <cover.1697495597.git.gilbertadikankwu@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the variable names adhere to Linux kernel coding style and mute
checkpatch.pl errors.

Gilbert Adikankwu (4):
  staging: vt6655: Rename variable bUpdateBBVGA
  staging: vt6655: Rename variable byCurrentCh
  staging: vt6655: Rename variable byCurPwr
  staging: vt6655: Rename variable byBBPreEDRSSI

 drivers/staging/vt6655/baseband.c    |  2 +-
 drivers/staging/vt6655/channel.c     | 18 +++++++++---------
 drivers/staging/vt6655/device.h      |  8 ++++----
 drivers/staging/vt6655/device_main.c |  8 ++++----
 drivers/staging/vt6655/dpc.c         |  2 +-
 drivers/staging/vt6655/rf.c          |  4 ++--
 6 files changed, 21 insertions(+), 21 deletions(-)

-- 
2.34.1

