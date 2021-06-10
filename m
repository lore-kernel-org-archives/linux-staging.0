Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C56E173
	for <linux-staging@lists.linux.dev>; Thu, 10 Jun 2021 15:52:03 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id t6so9078755qvp.5
        for <linux-staging@lists.linux.dev>; Thu, 10 Jun 2021 08:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UlKPbQCONCFR0Rgoli4txiZUTGz7LR+dp4EBO29/Mjk=;
        b=NI4KvWJGhjQ0FDiqPE/sIVHNbz22EoktFRWlTOhSM939Dj0S0mgu4hvj5tjvhJ6q9i
         9Foi2V820qEji4woPiRRUsbQ6cnF7Id/xcE78YUFtL2HB9yyZuAKfb8OYf9rE9pn9mtm
         xjZ64ap7+n/CVQJ2c2rFRfj5Z1wFZ7TP+hk8irP+6hVbGMfUdGM6HNDp5kLIrv2y0v8d
         anl9Sl3Ec63nJgiv3EkCQTqGUJDViYy2BSGcAA7P4OgAYbWwo/swSzAZDl1WA3i9yFHL
         QGfqI9XuJ0W1waE10P2XfnOTF1f7f9146kIgIuwXZjPVkdp37UUTX4SRQUBkqsOEn6h8
         J4aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UlKPbQCONCFR0Rgoli4txiZUTGz7LR+dp4EBO29/Mjk=;
        b=lC5u8Cbzf32AbxfmcrMvIoGQgjjIWS1yr79qvXniq5StKI9AkS12nYXH5Uktijbj8W
         Z759zVZGownCMFPfemXWOYJVW9KJUpqGeMQKnWAZFZ0R8oLo/RvJcLFLCgU68+0hkcjP
         tlnn2HF+td33fcRozQiXm1EztcEZSg4Q3Ia9Ypy/W/AFDmUqRe1W7TBtXqGsM6eMrXFA
         BYuCr4affrDntWGZqeQPYMgw2Da9hohLBlbwxBFzqFsTCUScNgZ6nt4yWdEPt26LUApV
         26/ysht3vxGfTuuzTl5PB2ihk07ckbz8zRlizv1pc5+ES2siSaj6nC4ETMl2HcQqzw8b
         0sGQ==
X-Gm-Message-State: AOAM5317zCTejNvN302BEGqAefDESsGbx1hFy40DPyfIygV9zHpZQG29
	F4vpzqARFVD9iDS/4IV/YUA=
X-Google-Smtp-Source: ABdhPJxkPGb9ojisrQn3PxIFzfgNH8u8IP6ZFwBRKOkZ19V+eUfEU0FK5fShi3dsUk/+7ywTWik9Tw==
X-Received: by 2002:a05:6214:2a8a:: with SMTP id jr10mr287379qvb.50.1623340322476;
        Thu, 10 Jun 2021 08:52:02 -0700 (PDT)
Received: from ubuntu ([191.96.170.82])
        by smtp.gmail.com with ESMTPSA id q12sm2455232qtl.13.2021.06.10.08.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 08:52:01 -0700 (PDT)
From: Philippe Dixon <philippesdixon@gmail.com>
To: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net
Cc: Philippe Dixon <philippesdixon@gmail.com>,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Fix various checkpatch.pl warnings
Date: Thu, 10 Jun 2021 08:51:14 -0700
Message-Id: <cover.1623339773.git.philippesdixon@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset contains minor changes to remove some checkpatch.pl
warnings and better follow the Linux kernel coding style
recommendations.

Philippe Dixon (3):
  staging: rtl8723bs: core: add blank line after variable declaration
  staging: rtl8723bs: core: add * to each line of block comment
  staging: rtl8723bs: core: remove whitespace from beginning of line

 drivers/staging/rtl8723bs/core/rtw_cmd.c | 36 +++++++++++++-----------
 1 file changed, 20 insertions(+), 16 deletions(-)

-- 
2.25.1

