Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB734168
	for <linux-staging@lists.linux.dev>; Fri,  7 Jan 2022 10:36:56 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id y16-20020a17090a6c9000b001b13ffaa625so11578721pjj.2
        for <linux-staging@lists.linux.dev>; Fri, 07 Jan 2022 02:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oUHot36Td8cDg3pJLYKw4P/pk/V4dAoQaKwkomqmQSU=;
        b=ZNopCICcNCT3iDv8ljgfUUyWG9dYT4uwzYwLW993ZojUVlhFE5wGliKGih0mRSyt62
         612P8I2461IZMWL80m16wQ6ULcNWfKPucE5X6Q1HdzaoG+VOJy+tyhTLPL1q8rOL41xH
         2uGdXpMOZNchAhQs1jLjofGuMI87nNOm/3f+aGnCCIdk6wenJ0ZJJZpyugyqNa5toYyM
         5OfbSanEp0X9kgVMTQt6sdfZ2hQ4adpgxPdd9wZDqq4JVy7ITZuTt/a/MEIlt+UieqYa
         laYdqu/T+3JK5dfQF4wukF+2FoW7M2jAiE/KqQe02oIMiHKvJahPD5XhgznYxvjkNpQ3
         SNKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oUHot36Td8cDg3pJLYKw4P/pk/V4dAoQaKwkomqmQSU=;
        b=tTE+7JpRDvNelxL88kde8IxHeeU80wfWkwKg53Mev+SIPaDhTstQX942lNwhWRjfrO
         qIKoZRTnMDRSrcCyshbZiSEvlq04kghjBzkVyPb5e4RMwBgcoW+6iaWRTxV5u9zZOkOQ
         Vc2VvCeCQ8Lwzc3W+ouFFNwOTuGo5iK+r/Cq3wuRUj7so7EDRw1rXL/EdKqC9FKV5gnk
         4jaP1TLwVkwv4I/WB19/l2Hc62kiBGA9Lnzax/UjghJk7IKr10jV2zeI7FL/Q+Nyskbm
         QWYdHxibYwR4I6r6PxPLPFmL87F3RL2moVaEv6ai/7gqIz+hiFL7xUkIMx490gUEpzEa
         Twiw==
X-Gm-Message-State: AOAM533XpTQBPvhmvDVX4Ma8jqjHXSh22W3cwxsQsHy6u62htiqrGKcB
	aC0hLIcF6Hb2vghu+Ff/c4A=
X-Google-Smtp-Source: ABdhPJxOYh4MYVRZeXclKlukMvF7rVvfCEjEl7csRKdZTnf/8FJglPuLr4dzu6RYEJhNFbuuhIjU6g==
X-Received: by 2002:a17:903:244e:b0:149:21a5:6033 with SMTP id l14-20020a170903244e00b0014921a56033mr62400622pls.37.1641551816417;
        Fri, 07 Jan 2022 02:36:56 -0800 (PST)
Received: from localhost.localdomain ([171.78.146.184])
        by smtp.googlemail.com with ESMTPSA id i1sm4464156pgk.89.2022.01.07.02.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 02:36:55 -0800 (PST)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>,
	Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] staging: r8188eu: remove unneeded ret variables
Date: Fri,  7 Jan 2022 16:05:39 +0530
Message-Id: <cover.1641551261.git.abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset removes unneeded return variables in ioctl_linux.c,
and also converts functions that always return 0 to return void.

v2 -> v3:
- Remove returns at the end of void functions to conform to coding style

v1 -> v2:
- As suggested by Greg, change functions that always return 0
  and whose return value is not used, to return void instead.
- Not removing return variables in rtw_p2p_get2 and rtw_p2p_set
  as they may need to be used.
  These functions call other functions that do return error codes
  (mostly -EFAULT) but are not propagated back.
  I'll send a different patch to fix this.

Abdun Nihaal (2):
  staging: r8188eu: remove unneeded ret variables
  staging: r8188eu: change functions to return void

 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 145 +++++++------------
 1 file changed, 54 insertions(+), 91 deletions(-)

-- 
2.34.1

