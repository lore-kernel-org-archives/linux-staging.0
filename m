Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9326D10
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 06:43:38 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id w10so6785200pgh.5
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 23:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qFLPg7mZDXW2+QgSTwSk0nVCNAL/L9QDEUI+JqqFX3k=;
        b=mT/mUn7WmUIME4GnBmCZDyfX4zs6Bm6ohDT27mTk5sndsJ7EnOZQ7klKCB/g909puv
         uyusQntZbxLgSrr/+dFpa8tAX6RBUqMCciTeiWL9Qw165iKf5o31jJTdvwfiAlcRVWQ3
         OHEchdISJQ52hUxRg4KgfaFBe0K3MoLdd4EkkNHZVnEYYVab6kQ5EeGxc1iRt+UScqNF
         tSubDVgI7VeWKzKXFEQO+HOLhsWo01lrNoal28Cd/ayNyNq6RMIxb6+jJmJ24XFwmCBa
         zbp3avkBtTjbigntRHWsp/RjggErHM4bg83IMROKbnlrqJbgVPn4m0O/U9UQbI4ydauH
         0mEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qFLPg7mZDXW2+QgSTwSk0nVCNAL/L9QDEUI+JqqFX3k=;
        b=EPmgDrzSpQoV7GV2RyHISMokMUCgdI2hOfogatMNGt84CwAl4rsq2YX4I+3juZm2Z7
         0ZS1c1HBnhLhH9z9dG7CcUGk4jL6KitiTAVs55P8gT28bO4K0piC6oHpWMxYOxiU9lBK
         YWSB2BPofgAdO5geyeLGt8upZLPPRbSrWPjxjv2W/m26fSboY9+Q8686jQit4xC4RqL7
         /qS/fwGQfFBJo7EtHSgaDg5me9HjsLO4GaNZkTk/RDNBze3Vz1esW4ScNVQJGi5lN/hM
         o2sDN7fet2r0p+KNjdjCzi9GThRKNFLRlWBWHGp5vK59EjWf8FrdR1N4xZaA5rJXlQHU
         Xi+g==
X-Gm-Message-State: AOAM533OL+FRIbj+aoZIQAfuwmv7usGgU0cNNuYxEfIVdUbK7GwQ2DqG
	cw5/A8CZa9Um/O77ldyQ4gs=
X-Google-Smtp-Source: ABdhPJwOqNX467U2gyXYnZ7HmnsGJu0HLQzRCxRCYJua+3faT0g0IMb6lROPCAKfblaoO8iLfgb1Rw==
X-Received: by 2002:a63:dc57:: with SMTP id f23mr774017pgj.294.1617777817858;
        Tue, 06 Apr 2021 23:43:37 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id gk20sm3035930pjb.17.2021.04.06.23.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 23:43:37 -0700 (PDT)
Date: Tue, 6 Apr 2021 23:43:35 -0700
From: Pavle Rohalj <pavle.rohalj@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 21/49] staging: sm750fb: Rename function write_dpPort to
 snake case
Message-ID: <ed10428746cc0d22256876ab5c11bb1d4c798669.1617776878.git.pavle.rohalj@gmail.com>
References: <cover.1617776878.git.pavle.rohalj@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617776878.git.pavle.rohalj@gmail.com>

Fix "Avoid CamelCase" checkpatch.pl check for the function
write_dpPort.

Signed-off-by: Pavle Rohalj <pavle.rohalj@gmail.com>
---
 drivers/staging/sm750fb/sm750_accel.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index 4327bda871e1..4ad2814b5b54 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -28,7 +28,7 @@ static inline u32 read_dpr(struct lynx_accel *accel, int offset)
 	return readl(accel->dprBase + offset);
 }
 
-static inline void write_dpPort(struct lynx_accel *accel, u32 data)
+static inline void write_dp_port(struct lynx_accel *accel, u32 data)
 {
 	writel(data, accel->dpPortBase);
 }
@@ -396,12 +396,12 @@ int sm750_hw_imageblit(struct lynx_accel *accel, const char *src_buf,
 	for (i = 0; i < height; i++) {
 		/* For each line, send the data in chunks of 4 bytes */
 		for (j = 0; j < (ul4BytesPerScan / 4); j++)
-			write_dpPort(accel, *(unsigned int *)(src_buf + (j * 4)));
+			write_dp_port(accel, *(unsigned int *)(src_buf + (j * 4)));
 
 		if (ulBytesRemain) {
 			memcpy(ajRemain, src_buf + ul4BytesPerScan,
 			       ulBytesRemain);
-			write_dpPort(accel, *(unsigned int *)ajRemain);
+			write_dp_port(accel, *(unsigned int *)ajRemain);
 		}
 
 		src_buf += src_delta;
-- 
2.30.2

