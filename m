Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B2570
	for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 22:43:10 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id m11so42466pfc.11
        for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 15:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Ro3je/BBvWF7sM47Lmq+Xq0Jon+ne6ToNQmIFqDmWiY=;
        b=hEK+hFySXLu8+oYIA1hqyF75ZfrVVL6t7J7ceUsg9icsOb09sA2C+DFnpw/xi/0/Pa
         DaVrYEDOjkin5pJJV06x8hslITIFIiLhQMMO2gqHzpXFTCp+heLL0CDGOie63tJEhb5i
         CYc7JNAbLqDUzEfoK+HcClNkufN/eVENTHF21VSJHqj1ZvAGUpGQgzX3Um/JVefiDxHB
         cHN2FRBZRBLCF61HBaQY1uhs7EEHQbZ+LxrdvZBMbXu+lmOLfoiseUd8SXTCr7//mwr+
         MDGH6m+jt8ilsNXHboGO9e3apgifCrNljhMe/Pwq5vvM5IkKPSYGtsPqsBbZIRGLdAh9
         AgOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Ro3je/BBvWF7sM47Lmq+Xq0Jon+ne6ToNQmIFqDmWiY=;
        b=PjrN5dSKgCDWYY5cz7RW2tGqYmvplyJmxQTWEDZLQMX/vtM2Cg1TWv8BsInpapTV2U
         Bscit3kdFkSHEg1BVUgBpQXEpNZs1ajQ/18diXXTIuSqW6/f3TK07Gh2M95s0BiMw40O
         MvddrtAensfvTFv3PActUru29aPYKMX76ENmLC4yr32DS4gmEGzj9wViRKhK594NncD8
         EYXUTwzywWTwVdvVR9auoN3EnnxSE5XEO6G5ahPlqKO5R/SXYJq2rbF78qsgmrJxYk+Z
         SjVTraP/GIm+V3xV6GQ7O5K1JwK/+9qTOaSbfEVn40TDO0xHIYnv4PtnFuJ1YT7HGhSC
         2y0Q==
X-Gm-Message-State: AOAM531RDwn3618ZBW/tjKmUMbCFDqK+1A5WIu9gKVlUrbrUTi2Kuj0t
	xcFtxzNd1AZv3yMazpToHdg=
X-Google-Smtp-Source: ABdhPJxBJwcYeyB8UmTusLHKSMUBjiy3odcEztG2xRWtgIa5tsz4HAx2dfm3Pn35tQgOFS12HQPQ3w==
X-Received: by 2002:aa7:94ad:0:b029:1ef:2392:4ee8 with SMTP id a13-20020aa794ad0000b02901ef23924ee8mr4985616pfl.75.1617230590087;
        Wed, 31 Mar 2021 15:43:10 -0700 (PDT)
Received: from djbComp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id h19sm3338830pfc.172.2021.03.31.15.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 15:43:09 -0700 (PDT)
From: Deborah Brouwer <deborahbrouwer3563@gmail.com>
To: gregkh@linuxfoundation.org,
	ross.schm.dev@gmail.com,
	marcocesati@gmail.com,
	fabioaiuto83@gmail.com,
	dan.carpenter@oracle.com,
	phil@philpotter.co.uk,
	amarjargal16@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com,
	Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v2 0/3] block comment style changes
Date: Wed, 31 Mar 2021 15:42:28 -0700
Message-Id: <cover.1617229359.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Style changes to block comments.

Changes since v1:
	- all commit messages have changed to be more accurate

Deborah Brouwer (3):
  staging: rtl8723bs: core: add comma within a comment
  staging: rtl8723bs: core: add * to block comments
  staging: rtl8723bs: core: remove empty comment

 drivers/staging/rtl8723bs/core/rtw_xmit.c | 60 ++++++++++-------------
 1 file changed, 27 insertions(+), 33 deletions(-)

--
2.17.1

