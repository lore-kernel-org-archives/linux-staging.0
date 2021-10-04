Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E9229CA
	for <linux-staging@lists.linux.dev>; Mon,  4 Oct 2021 22:32:07 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id p11so17830477edy.10
        for <linux-staging@lists.linux.dev>; Mon, 04 Oct 2021 15:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Eng+Zc+HfX4OrCQY5S7dCIwJB13LaLzXgwv+0bs9o/I=;
        b=QcolBkIEDg2+Lk6ufeObq+SQa+xNNRbFfNAF5IQmvN3OuuPF5KC4AMsAUI9Xr3hYn+
         wQ14b1zBbUSEaT/m+/REbOFGQIuDjquakozT1Evc+c3XW8cJpoPrrZIFay/pv99L/UUO
         X/Zh3nE7YSXOHC0Bp9jJ+ifzsbbp/NQIX4sKMjGVzjD9rD3ScgmDOSxHBzs7/QDSvdYj
         QucZLg2GEuWbiD3A+An/Q1kjYoALJTOndXcKx/dwqSIQeyu5VuG4DYyj1VEGPpEDW+X5
         /HkIRsFb6Qw0x/DG6uPHpFMzhL/fEkaAtjuZ6RJdbtulKR5U4Yi/GL/Dhp13gC2dEbC3
         +vLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Eng+Zc+HfX4OrCQY5S7dCIwJB13LaLzXgwv+0bs9o/I=;
        b=VX+gGf/OcTkxu/CP2uUhcFv44KyH7aHHPUnWvO2MEiRa9O6WUGzrrkJZlpzs2FsB4O
         ygsYV9d9nHIa0nfhW6cgLqEvi0VtxF4/cm/B44kdo2KBooRgDKUWIbanyzsqtbmnOwfU
         ArZDumryLn6pUCKHzkcuU/EqlwQOZkZHba7muonVPmTm6S54MNSSFcsWBPTeIWLcIHju
         16X+6mnJMUl4NdUIvrr5EVnIKYS03RdYrbMZ1CQhR/2K35m1jKyPzZLs84wpzNYk73Q1
         aE5xfDVg2qHOpcZ2b2Dc0f2xoB1xUS78tcv3xFA2XLtR8IpGBooTaSPQExj3G9Sdk8vP
         sbHg==
X-Gm-Message-State: AOAM533TcZhgBYsysNSXGhkGHzTu4bPqUxsUNjedSvvZ+FeV5YpqZGOd
	2mdQrImOs/Nd7rzGs/5ni9GGhqSSIoE=
X-Google-Smtp-Source: ABdhPJzXfMnM+C83Zh2R+7b6lODQPmv9RMYWH8ZtVXm9u7lxCYTzB8u1Ichz4xBTyxnfLGkK9voIdQ==
X-Received: by 2002:a17:906:70c5:: with SMTP id g5mr20991222ejk.63.1633386726262;
        Mon, 04 Oct 2021 15:32:06 -0700 (PDT)
Received: from tom-desktop.station (net-2-42-54-217.cust.vodafonedsl.it. [2.42.54.217])
        by smtp.gmail.com with ESMTPSA id dc8sm7780919edb.28.2021.10.04.15.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 15:32:05 -0700 (PDT)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: tomm.merciai@gmail.com,
	Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/3] staging: vt6655: replace camel case variables
Date: Tue,  5 Oct 2021 00:31:55 +0200
Message-Id: <20211004223200.70524-1-tomm.merciai@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series replace the following camel case variables into
equivalent snake case variable for vt6655 driver.

bShortSlotTime -> short_slot_time
ldBmThreshold -> dbm_threshold
PortOffset -> port_offset

Tommaso Merciai (3):
  staging: vt6655: fix camelcase in bShortSlotTime
  staging: vt6655: fix camelcase in ldBmThreshold
  staging: vt6655: fix camelcase in PortOffset

 drivers/staging/vt6655/baseband.c    |  58 +++++------
 drivers/staging/vt6655/card.c        |  90 ++++++++--------
 drivers/staging/vt6655/channel.c     |  10 +-
 drivers/staging/vt6655/device.h      |   4 +-
 drivers/staging/vt6655/device_main.c | 150 +++++++++++++--------------
 drivers/staging/vt6655/mac.c         |  46 ++++----
 drivers/staging/vt6655/power.c       |  24 ++---
 drivers/staging/vt6655/rf.c          |  12 +--
 drivers/staging/vt6655/rxtx.c        |  12 +--
 9 files changed, 203 insertions(+), 203 deletions(-)

-- 
2.25.1

