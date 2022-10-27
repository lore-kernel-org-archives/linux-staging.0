Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D2CBA4E;
	Thu, 27 Oct 2022 08:59:31 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id p8so1384759lfu.11;
        Thu, 27 Oct 2022 01:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pb7xGr5fuIL0NtgblTv6xk3hHUrL7glkJIQ1IQxfKe0=;
        b=enich8yCz31jib5vDHT9by/WtYR4B4iKdU6w4TTVNlj49RLa8wr/6n3Pjn7SUjk0oo
         IVT6UtzWHHOl/kT+zmyYgftGd4nCa9G5XxjodwnRsoaRxQm5OT02MA+YxsxO+00x7kqa
         cRwV5noqPv0o3KF6pH/avpDQrVdbCyzjYsIUL+/gVbqOthl1YT/Aj4UIsmbhshfngltc
         O98j77Kfo65lHchFeAeo/cMmt3HuLmo0EmsKa6CX1TRZnBhpTVSoT7kdK/2Vh9LPwHQ2
         5x+l6ymRVyrMiyEri8OX1/I0M/4ZxyZVSTPwUaLFV87Ba+bqbmvbX1Z6ZCUQKjzYgWiI
         pdBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pb7xGr5fuIL0NtgblTv6xk3hHUrL7glkJIQ1IQxfKe0=;
        b=rHheDJN92QIC5Z3T7n0/o2VWn6tSleeWxLBVMh0LYQ6HUo3uXu0896PNCiOLraeBm6
         5BIEnKvvGdUSRkRltF+96KDEaJ3RXHq2F9Btk/rM2+om0LgcN/K8KfIToHOKkjk66rk9
         qy/VHQGUjPUC7C86Jpn3es4BV/TDno0mKLKu6XPnI9lz9+5X++uquvUDHfcajLRcEEz0
         GObkJdhNyCHEBTEFvs0p8VnV4L/Htt91SmFg091KSwLyzGptpTcy5pqRD016n3Qeptdk
         N+sby//pDIo4uyWB2VONBx6SlqxY4S/jit0VfnRhqLp9sCI0v+oZA0LM/JfZcijAnNz6
         mtRQ==
X-Gm-Message-State: ACrzQf1+ypVHof4UZQkoivXR2baU7KwrNW3DaUXJO5vevU66upEMC20v
	JnV1tIHFVoLwr8Fysrj7zC4=
X-Google-Smtp-Source: AMsMyM5zyPFvWw0yWMbDDHUcS6QNUOYuNPKchL/VrnkY4IrnMTJnHGz7Sv3s30wQDPGNxBcBqfX4gg==
X-Received: by 2002:ac2:4839:0:b0:4a4:4f4c:116 with SMTP id 25-20020ac24839000000b004a44f4c0116mr18204807lft.51.1666861169593;
        Thu, 27 Oct 2022 01:59:29 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id m3-20020a056512114300b004a050ddc4ecsm109892lfg.125.2022.10.27.01.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 01:59:29 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH v5 0/6] staging: vt6655: a series of checkpatch fixes on the file: rxtx.c
Date: Thu, 27 Oct 2022 08:59:02 +0000
Message-ID: <cover.1666849707.git.tanjubrunostar0@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <20221027085902.HvhgJ4TfSo95yj5ha-KyczUoC2I-3DKqBQIDwd4uDmg@z>

The fixes are similar, mostly long lines splitting. I had to make
serveral patches to ease the work of inspectors

v2: fixed a compilation error found by the kernel test robot and
recompiled the code

v3: tends out the error persisted in the second version. this version is
a correction of that

v4: did some corrections as recommended by Greg KH

v5: shortend changelog comments as recommended by Greg KH

Tanjuate Brunostar (6):
  staging: vt6655: fix lines ending in a '('
  staging: vt6655: refactor code in s_uGetRTSCTSDuration
  staging: vt6655: refactor code in s_uFillDataHead
  staging: vt6655: refactor code in s_vGenerateTxParamete
  staging: vt6655: refactor code in the rest of the file
  staging: vt6655: refactor code to avoid a line ending in '('

 drivers/staging/vt6655/rxtx.c | 542 ++++++++++++++++++++--------------
 1 file changed, 324 insertions(+), 218 deletions(-)

-- 
2.34.1

