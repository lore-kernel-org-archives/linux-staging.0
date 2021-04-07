Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22876D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 06:36:19 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id y16so93899pfc.5
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 23:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JLhOPBDJGtizHkxpYodDCmquLiJc74NkWzdot10Uqo4=;
        b=E4gmRbZZB3nrPfH6rYurKTZ1NVPwu4BxR2b3mFcY7emW9XBR/0Vbkjv45xhT9mrl8T
         zYg4wPEw9rY2U1GXlL+4hgbLWG3p8o4XyvxD4IRyzljbRzvwWiRsD8w/HhjrFzcooPBO
         fWbbqnMdzR0r1trJROWweJ01y+8wsvtTnpIoqzFLoW6GJFL5GNtFdCvStx6/6kfN1Kzy
         7jg1EKGuX01KvY05QJw39yvzZqKU0uD3IpTRvbQJJWcPf81aSFPEMSjNj/SoP5ZtXatS
         nQFE3APRS7YENjU+7rrMObQ8I68YILgELibvRiW5iKo0l194K2EzEbyNqx5IsjJO+09g
         3WXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JLhOPBDJGtizHkxpYodDCmquLiJc74NkWzdot10Uqo4=;
        b=H130UbrJv7KQsg+a+ZwRHMgSATnhHYXurXome6bfd16E5TOrtBf4d2YVmTmnRg4SWx
         zqi0/ltD5vISHpzoWVOfd8zGk1J8LT3DiCuvNHCAuc0FdrM7CvNrnifMhN5zsD93/Dwv
         xLT32kbXJXWa+oap+NVTHKDWu80QveuwcefSe4tQRLvExUTE0FxGwn9yrMyr6z5PHaY9
         u+i6y1B2Vf/NjVKkWkhdJFqbCANuH9CLQAegM6nVuuGVd5ulxD9vk5+O3+dFShe5F2v2
         WB6qiCvxp4BDvF5JcQmMYMv37aOGBDgLubuq1jL3KUKyJBbau9z4EB6GiUGpVy8zEO0q
         7lZg==
X-Gm-Message-State: AOAM532U1ADTXwHu/s/RbJR0yMac4L3By849/VErNlVo0YKpyzxerd0j
	bK/6UrA6S5xm5/HNxK8btVc=
X-Google-Smtp-Source: ABdhPJxEYTKG+PCtN+CeP3xplySvBw9rwgnoRIal/cf2VznSrk1EHQGqNHaq0RI9n/aVrC5Yf78uig==
X-Received: by 2002:a63:4f59:: with SMTP id p25mr1868291pgl.21.1617777379324;
        Tue, 06 Apr 2021 23:36:19 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id p10sm20128790pfn.55.2021.04.06.23.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 23:36:18 -0700 (PDT)
Date: Tue, 6 Apr 2021 23:36:16 -0700
From: Pavle Rohalj <pavle.rohalj@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/49]  staging: sm750fb: Update enum values in dpms to
 snake case
Message-ID: <16693e7cc62f84ea1ec34b7d5cbd77c4cd1965e8.1617776878.git.pavle.rohalj@gmail.com>
References: <cover.1617776878.git.pavle.rohalj@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617776878.git.pavle.rohalj@gmail.com>

Fix "Avoid CamelCase" checkpatch.pl checks for values in
enum dpms.

Signed-off-by: Pavle Rohalj <pavle.rohalj@gmail.com>
---
 drivers/staging/sm750fb/ddk750_power.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_power.h b/drivers/staging/sm750fb/ddk750_power.h
index 7002567a47d2..4756db1ccb9c 100644
--- a/drivers/staging/sm750fb/ddk750_power.h
+++ b/drivers/staging/sm750fb/ddk750_power.h
@@ -3,10 +3,10 @@
 #define DDK750_POWER_H__
 
 enum dpms {
-	crtDPMS_ON = 0x0,
-	crtDPMS_STANDBY = 0x1,
-	crtDPMS_SUSPEND = 0x2,
-	crtDPMS_OFF = 0x3,
+	CRT_DPMS_ON = 0x0,
+	CRT_DPMS_STANDBY = 0x1,
+	CRT_DPMS_SUSPEND = 0x2,
+	CRT_DPMS_OFF = 0x3,
 };
 
 #define set_DAC(off) {							\
-- 
2.30.2

