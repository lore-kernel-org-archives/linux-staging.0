Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5887E;
	Mon, 31 Oct 2022 14:44:01 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id g12so19613684lfh.3;
        Mon, 31 Oct 2022 07:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2lKadDZkcrZY+mBoo+J3JnRJGkskmKs9cjQkiel3sGM=;
        b=mBBMvP91Xmkn6K5qBGVyEILzaAn5KIkGShixlUXwALpTb3uX9+NYN1upHeZtb4NZdg
         1YHQWtIq6Jj2UWRPty/Ce06X1EyKjIpdWBVPnuhxxKFoCVMBU/IrqqM339Mg6xYzra8e
         cgNGZuLyL6uMdPZubO4lgUh3y80/yrJB53mWON4wstGfQ5zzg5AVuwH+TIF3ZUu9Dec8
         gob3Ust2j/2GL+GoeZheZdFVmFrHsGYIBMr9GGK+w9Oq6lIDdXD4qKMqedAD95Kd6BXl
         +RQ92+FCp731L64K9y1a1J7hGRg8i0g2YRxgov9LlUxtnvb3N2Kj+gKD/6/8bFMqVl1k
         q7Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2lKadDZkcrZY+mBoo+J3JnRJGkskmKs9cjQkiel3sGM=;
        b=7ZihuN/tSraD7Y+8qt3HJJqmBMk0tVvz/eCrxEotrsw8OFmynAwIamevgLi+Sx94g8
         c79bv8tGFAJrKJcUwNddVmEwCH1IrNYLg6tQV7cnaa9mTV51gGjkdryqdmVhdYpJ3WFL
         jlvo9By03z3yWcwOvNceZnv66jHqp9kiOb7WEN29YlpxlAwoKJUtmPHfpypsWcHoSpQX
         kydu/nCt37TrNxhYdW9JYfFdKXzGndFWhqAyILhtclbkwd1FJ8zYKaspPuLAxI80UUG4
         3dnDiGdPEaH4K0Xjb0ewonsziBbPAMGTruUIRCuctKNA52vaKfDwkICoQzMuSM/3A2br
         a94A==
X-Gm-Message-State: ACrzQf0b4+jnXGof5F2bD95q4AxCc5nG5KJAi/aBNCoAwTWMSzy3OcJk
	aH17XoWOm24vHsS+Dikb7lASOR1V7KE=
X-Google-Smtp-Source: AMsMyM6qQ9vzT88EZhBSFHbtnUIKUFmgv4qNmKjKYLynpGSqlr9JNStxjgy11rhMPt60rEuY7ntW0Q==
X-Received: by 2002:a05:6512:2983:b0:4a0:5745:f7ca with SMTP id du3-20020a056512298300b004a05745f7camr6196994lfb.116.1667227439363;
        Mon, 31 Oct 2022 07:43:59 -0700 (PDT)
Received: from elroy-temp-vm ([20.240.130.248])
        by smtp.gmail.com with ESMTPSA id 7-20020ac25f07000000b004a050ddc4ecsm1303457lfq.125.2022.10.31.07.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 07:43:59 -0700 (PDT)
Date: Mon, 31 Oct 2022 14:43:58 +0000
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: [PATCH] staging: vt6655: change variable name wTimeStampOff
Message-ID: <Y1/fLjJmma28LudO@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The Linux coding style does not allow CamelCase variable naming.

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
---
 drivers/staging/vt6655/rxtx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 1e5036121665..9bdcf2337235 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -54,7 +54,7 @@
  */
 #define CRITICAL_PACKET_LEN      256
 
-static const unsigned short wTimeStampOff[2][MAX_RATE] = {
+static const unsigned short time_stamp_off[2][MAX_RATE] = {
 	{384, 288, 226, 209, 54, 43, 37, 31, 28, 25, 24, 23}, /* Long Preamble */
 	{384, 192, 130, 113, 54, 43, 37, 31, 28, 25, 24, 23}, /* Short Preamble */
 };
@@ -130,7 +130,7 @@ static __le16 s_uFillDataHead(struct vnt_private *pDevice,
 
 static __le16 vnt_time_stamp_off(struct vnt_private *priv, u16 rate)
 {
-	return cpu_to_le16(wTimeStampOff[priv->preamble_type % 2]
+	return cpu_to_le16(time_stamp_off[priv->preamble_type % 2]
 							[rate % MAX_RATE]);
 }
 
-- 
2.34.1

