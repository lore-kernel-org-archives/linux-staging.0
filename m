Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55A55F
	for <linux-staging@lists.linux.dev>; Sun,  4 Apr 2021 11:10:58 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id o10so13608665lfb.9
        for <linux-staging@lists.linux.dev>; Sun, 04 Apr 2021 04:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=RWPDQxxgV2nTCNL1FAYclu9roEAzSAdEQg2xga59ELs=;
        b=Z0Z5Y+0DJmoXupHa9zQfPZT3kCZ4shfboOOlC58PCdOUhtjmsJDx/nI3uHa99/n1Nz
         ZkKBDPyQZl1ZmIehGFxtGs6b38Ktn/TttjCGlt36dNBvEuZydjuX4OwjGtUV1b64wfl+
         YXVWjiw57CPZ85SoX1pHp9JxDKoBqQ/aN45bvoKqFT224liyy2Nbu3jLP60l2RURwRvn
         kp2vjF+9HekaHBqsdFz5oQVrh9jr4dz7ApPD9VO52VfR2IPhWllfsmQfOn8dCB8L4IEb
         VWuOTvZQdfKUcLe9XPgpbc9GRLmzkdiXxyR6LsLv78D3aAzN5MSSIU+MSrC6IR3YAOrc
         VYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=RWPDQxxgV2nTCNL1FAYclu9roEAzSAdEQg2xga59ELs=;
        b=Qc40lPJWp9uKEe+j3wM0ZgP3Cq1PiSIcX3u0+iC4s/TxwJ3+j3ypf3l3OiZfOBF6D/
         u7ZivoYJSkgMZ+7eo2O58DI4apFox/7mlh7qMWR3MxeOGXfS9haK5dLyr+Shc6toeK25
         /yw75YgkrLmLZh6kp831jRR8mcCtLDu+VDgpGcxJ+pVWgYwmA90Gihp5FcL1BDN8YsJQ
         JNuvlQw890X1OeaZgYekBqCaqdggjpyMxzph8Io3tM3NKwlfDaiYkN128fabTyK5w+MK
         3VI2VXAyBCxn7SqZg/hpY9eMaNeKFltjjVhpDdAUxstFSte1bpOSqPvxpABuNhtxstKo
         JrMg==
X-Gm-Message-State: AOAM532ugaXEQ/tWOYok5qOY3sX7VrChxbdI54wSC3SF74H5Fk4OKOi5
	gK/pBi/c5qVGF1AN+ZcHJY8=
X-Google-Smtp-Source: ABdhPJzVjmPkRcr6H6lgc+7U+TNzNsYW6ZhZshonW16IImKJlv6D0zR9/s+zoD/jHVvUX1Ie5j+Xcw==
X-Received: by 2002:ac2:5a5b:: with SMTP id r27mr13957725lfn.255.1617534657168;
        Sun, 04 Apr 2021 04:10:57 -0700 (PDT)
Received: from zhans ([37.151.32.231])
        by smtp.gmail.com with ESMTPSA id i184sm1412263lfd.205.2021.04.04.04.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 04:10:56 -0700 (PDT)
Date: Sun, 4 Apr 2021 17:10:55 +0600
From: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [Outreachy kernel][PATCH] staging: sm750fb: Remove unnecessary blank
 line
Message-ID: <20210404111055.GA22626@zhans>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove unnecessary extra blank line to improve readability.
Reported by checkpatch.

Signed-off-by: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
---
 drivers/staging/sm750fb/sm750.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index 1b3f5f649c52..23eefd019ec9 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -64,7 +64,6 @@ struct lynx_accel {
 			   u32 x, u32 y, u32 width, u32 height,
 			   u32 color, u32 rop);
 
-
 	int (*de_copyarea)(struct lynx_accel *accel,
 			   u32 s_base, u32 s_pitch,
 			   u32 sx, u32 sy,
-- 
2.25.1

