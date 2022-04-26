Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744797E
	for <linux-staging@lists.linux.dev>; Tue, 26 Apr 2022 20:02:22 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id p4so8065599edx.0
        for <linux-staging@lists.linux.dev>; Tue, 26 Apr 2022 13:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IcyuOtlGkrHpiyVRHzfMUPq93LO4hiMR0wu0sGE6h1A=;
        b=i0jSI/MY02miYxjMbMT0TKDysQ+XAl/mRs6m2SDrlO6CLHPV2YTVkef50KHzGzo4zj
         vTPtP8t/Aq05A+i8sSc6Ob8qgfLnVOYq6MqUDHFsRgkehZrJ9mH5o9KF3YJMaMgvRcH1
         frbTqFkXHoExt+KVvbyYAG/xvApSxI66p25tloqCYkhzQ4EfTl6UgjuYf4AN603u8qJI
         n36Gp7EQVPZPFtNYHeF5y57vb5UCGucuC4j5ga9OMhS6d68wOVfCo951ZaxQvSOliu+W
         dwlmYjZMq4TbXQZuxes2XWp+LNNO3xWSNbSXSqvQyQCL9VkInliHJci93ma/dNAD+yzA
         R/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IcyuOtlGkrHpiyVRHzfMUPq93LO4hiMR0wu0sGE6h1A=;
        b=IEWPBIBjnX0kdlrnWELzVJ1s7BWrJ2Txdo6vTcEd2oFC01LRL6/gfhYVR7iZtqTCLR
         UScPtrDUSzxbwg2ArcTyAGIo/sBMuvLu996XPNGbTthiiEA5NO+g+KrnMYrUZ8WfdkYk
         5/W8tctHy8L2r3vQnPioeVx598uIVRtCuLnvS7A7Y8e6bzZrW+6gGm1QLYR/JXZhpNgy
         2813CjD/Gd8uDtR5BDAE7fOxzCtiJD6OYDIFzbKSSNmJNqlHSFvY220ynitX2Q1iRRN9
         9/KpBF5xh2BQifuKEduQWLQwwOScjQFET983CqamjaaXemKipqgdQGZFjcTTw6lDO+eH
         dXuQ==
X-Gm-Message-State: AOAM531ZLORhkOc1mZ4d0bn05VQ6eOvDsCKhmupicgfoccHgZQu2tzA6
	jfs0+a2VDsWaVbdGvs3o1aO5H0CwgyKpiA==
X-Google-Smtp-Source: ABdhPJxRQiA+UJ8cidWqFEJAN0lTQ1uxCUTB7bCP3hQSs3eEw8GAF9Y7bhfG7xoGhKsBQdwAbbyWVA==
X-Received: by 2002:a05:6402:d5:b0:41d:6518:86e4 with SMTP id i21-20020a05640200d500b0041d651886e4mr26407725edu.322.1651003340826;
        Tue, 26 Apr 2022 13:02:20 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a074e9.dip0.t-ipconnect.de. [84.160.116.233])
        by smtp.gmail.com with ESMTPSA id s11-20020a170906284b00b006e108693850sm5312576ejc.28.2022.04.26.13.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 13:02:20 -0700 (PDT)
Date: Tue, 26 Apr 2022 22:02:17 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] staging: vt6655: Replace MACvReadMIBCounter with
 VNSvInPortD
Message-ID: <50cbf7b87759dbfe023554fc42a499dd923b7f8c.1651001609.git.philipp.g.hortmann@gmail.com>
References: <cover.1651001609.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1651001609.git.philipp.g.hortmann@gmail.com>

Replace macro MACvReadMIBCounter with VNSvInPortD and as it
was the only user, it can now be removed.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
V1 -> V2: Shorted and simplified patch description
---
 drivers/staging/vt6655/device_main.c | 2 +-
 drivers/staging/vt6655/mac.h         | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 08b955c71b3c..7cceb57a5139 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -1042,7 +1042,7 @@ static void vnt_interrupt_process(struct vnt_private *priv)
 	spin_lock_irqsave(&priv->lock, flags);
 
 	/* Read low level stats */
-	MACvReadMIBCounter(priv->port_offset, &mib_counter);
+	VNSvInPortD(priv->port_offset + MAC_REG_MIBCNTR, &mib_counter);
 
 	low_stats->dot11RTSSuccessCount += mib_counter & 0xff;
 	low_stats->dot11RTSFailureCount += (mib_counter >> 8) & 0xff;
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 4c6739862188..74b45e1f0963 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -684,9 +684,6 @@ do {									\
 #define MACvSelectPage1(iobase)				\
 	VNSvOutPortB(iobase + MAC_REG_PAGE1SEL, 1)
 
-#define MACvReadMIBCounter(iobase, pdwCounter)			\
-	VNSvInPortD(iobase + MAC_REG_MIBCNTR, pdwCounter)
-
 #define MACvEnableProtectMD(iobase)					\
 do {									\
 	unsigned long dwOrgValue;					\
-- 
2.25.1

