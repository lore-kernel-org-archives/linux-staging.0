Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6DD7B;
	Tue, 25 Oct 2022 23:37:34 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id u2so10253030ljl.3;
        Tue, 25 Oct 2022 16:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=27VAIO94eRQO+RwOuEpnXhEC4l04Hlzg1oSuTTKX2ZY=;
        b=HXU+5uf9Cfca3x4Xl+h10Vwznw+kQ8kv0pgPkWjQV9jPXeYoLKHWA8ro1kiyqSXs5U
         7XVX4X/VXyUpZ9CqZsJZFe0JJcNh4sGGVNgCEOrcuqlXBpc3Sr1tBJsXN2IaRZqri9gy
         nGpvXW1g3AIIvcG4DXyJa6dT1kByeVTPHuDgq/tCkzrdYYimiIhxMwCyxaqsrpM8laLe
         kB7jgAthV9KQJucQB/UZmmNi3NgQnLnP7clY3K02mUaLOM5KKyKy4f0PPAm8JucV4G2O
         id/F1zntnXiS3Off+OMm75+ATLjBZLU0kutrnSqf+4FpyWxImLr7D0UYDaAoAQuL9xHz
         VpDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=27VAIO94eRQO+RwOuEpnXhEC4l04Hlzg1oSuTTKX2ZY=;
        b=l6gKJNDYrwHj1pzv6oE71ba7aRykpvjcq/gI0UoTyiNCFgb6grneW35djeXCuQ0c8x
         xkpYyLl7F4aIS715NrFnBph/WOpksOGe47wEZz+lg0wioAN0riqAP3pgYUHc+fz/N3YC
         Mjmn0DVYRtYj5Q2DoEchtAr+3Fipbl7qdK8Fss4PgAsiCxXSew1mBj1XtR3QUoMdpU7O
         iIXJQHvOfyAc53VY1TxNNtQnY3xQg0HZ0voR0T3z+B6TaoBvE01lbruGxdqKAsoTmv6n
         uX6nzTrN5d2FHWULMmkNPUJ4MqqdVPilSgTD9qymBDNTi8IIB+am+MRq+NyoDmLdXPwW
         uDwQ==
X-Gm-Message-State: ACrzQf2xA50U20NmjZ9MICU16W4+LyJI2Yv8sMBj/gYSiiVbhOXpYAws
	2pGLL1Ktr28AJnkb3VjgdnA=
X-Google-Smtp-Source: AMsMyM7aJBJclSLMtrGeBVGgE907guL4x24jScSExKWC8uCn/BsicsRuqJcKCzSQBjS5TzKykof/Pg==
X-Received: by 2002:a2e:9897:0:b0:277:fcb:f69e with SMTP id b23-20020a2e9897000000b002770fcbf69emr4262609ljj.48.1666741052865;
        Tue, 25 Oct 2022 16:37:32 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id w17-20020a05651c119100b0026daf4fc0f7sm701969ljo.92.2022.10.25.16.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 16:37:32 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH 00/17] staging: vt6655: a series of checkpatch fixes on the file: rxtx.c
Date: Tue, 25 Oct 2022 23:36:56 +0000
Message-Id: <cover.1666740522.git.tanjubrunostar0@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fixes are similar, mostly changing variable and functions names to
match the linux naming style. I had to make
serveral patches to ease the work of inspectors

Tanjuate Brunostar (17):
  staging: vt6655: changed variable names: wFB_Opt0
  staging: vt6655: changed variable names: s_vFillRTSHead
  staging: vt6655: changed variable name: pDevice
  staging: vt6655: changed variable name: byPktType
  staging: vt6655: changed variable name: pvRTS
  staging: vt6655: changed variable name: cbFrameLength
  staging: vt6655: changed variable name: b_need_ack
  staging: vt6655: changed variable name: bDisCRC
  staging: vt6655: changed variable name: byFBOption
  staging: vt6655: changed variable name: s_vGenerateTxParameter
  staging: vt6655: changed variable name: pvRrvTime
  staging: vt6655: changed variable name: cbFrameSize
  staging: vt6655: changed variable name: bNeedACK
  staging: vt6655: changed variable name: uDMAIdx
  staging: vt6655: changed variable name: psEthHeader
  staging: vt6655: changed variable name: s_cbFillTxBufHead
  staging: vt6655: changed variable name: pbyTxBufferAddr

 drivers/staging/vt6655/rxtx.c | 1062 +++++++++++++++++----------------
 1 file changed, 536 insertions(+), 526 deletions(-)

-- 
2.34.1

