Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0506D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 06:46:01 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id ep1-20020a17090ae641b029014d48811e37so771313pjb.4
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 23:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RBA5zwvxY/1ia+fk/xzK8YHrNKoUOfjiRKh/7CEC92U=;
        b=mrhaeb+T/SIIYoEllcrxGKc1jjqGpydgzecq43Imy5Oy7UD1xJ5ZjVKZeucTjR1y9R
         Ch4axRbbD7Vw6VxFryHw1vLmpG5gx1N5yBeJGUV98gU5IGUDPbwFdPu1iE+8h9R3vAef
         BT1kHDDwzSzRYah8JADtv2j29ecgHdIciHmBH0n1eiAmnNuPuhPsDkHNTa7dHVYPllW2
         uAmNlzbfP+Svr0nJNes8kHeIHn2oIDiiX1atR9JX44iDjZbycsleENnVTAOdWp0t0Lwp
         LVNgNHk9w4DOZAHO7yp2/vNwk/CZjd2XKtszXWCJM2yQIs0orE4yCEE3Nvrc80H6orEE
         s9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RBA5zwvxY/1ia+fk/xzK8YHrNKoUOfjiRKh/7CEC92U=;
        b=IlGhxWh4Ie1nY0ufujfCC5ySYrQXE9Xw0Z2co9ZJvW/6Hm9cIej1P+WAlvBoT7luXk
         qvhsDrAqAQsXwmZF5CsF9SYVv/QkOfHG/5dZzJM2QCegojmiogTxdnrxAvGvU556cvWA
         P3kcsoenApZxu5s/hC79w8aOHap3nJzBZ0XuMmE7kDPtr/pVmssmidw4JxvoXQZXmgbA
         U2TVdYRty3C8oVxjRVemtLFbSbYxpPK0OIRxYAG8ywbQ+XDRDxOhQRFj8myRsSVZw/S6
         Z6S1jxmcBGAYwDJzVRAF22mbCZ443crDyeGeQ120f8JUSpNVv0Wx+icJCepFRZJWZ/4A
         HKwA==
X-Gm-Message-State: AOAM531QmQOvhoUbyLYtU8ZXrttsKvhLR5PkRSutky1+eqCYwQ7PNps0
	Awkij+1QPKOon23ywakS4E0=
X-Google-Smtp-Source: ABdhPJyv4gfR0TnKChyY15jeg2ZsvS91QJc36GgO+qjGtG7OfaTaQ0WlLPQ5uAOEYQEjtLrODErihw==
X-Received: by 2002:a17:90a:bf91:: with SMTP id d17mr1854424pjs.138.1617777960944;
        Tue, 06 Apr 2021 23:46:00 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id k4sm2732908pgm.73.2021.04.06.23.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 23:46:00 -0700 (PDT)
Date: Tue, 6 Apr 2021 23:45:58 -0700
From: Pavle Rohalj <pavle.rohalj@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 38/49] staging: sm750fb: Rename function
 hw_sm750_setColReg to snake case
Message-ID: <4ecf65873d119290ba1173e2a1665b91fdaae9d6.1617776878.git.pavle.rohalj@gmail.com>
References: <cover.1617776878.git.pavle.rohalj@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617776878.git.pavle.rohalj@gmail.com>

Fix "Avoid CamelCase" checkpatch.pl checks for the function
hw_sm750_setColReg.

Signed-off-by: Pavle Rohalj <pavle.rohalj@gmail.com>
---
 drivers/staging/sm750fb/sm750.c    | 2 +-
 drivers/staging/sm750fb/sm750.h    | 2 +-
 drivers/staging/sm750fb/sm750_hw.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 8e803b580a71..62c9a8c5de8f 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -545,7 +545,7 @@ static int lynxfb_ops_setcolreg(unsigned int regno,
 		red >>= 8;
 		green >>= 8;
 		blue >>= 8;
-		ret = hw_sm750_setColReg(crtc, regno, red, green, blue);
+		ret = hw_sm750_set_col_reg(crtc, regno, red, green, blue);
 		goto exit;
 	}
 
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index b46d13134f76..71b4ce05f4fe 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -208,7 +208,7 @@ int hw_sm750_crtc_set_mode(struct lynxfb_crtc *crtc,
 			  struct fb_var_screeninfo *var,
 			  struct fb_fix_screeninfo *fix);
 
-int hw_sm750_setColReg(struct lynxfb_crtc *crtc, ushort index,
+int hw_sm750_set_col_reg(struct lynxfb_crtc *crtc, ushort index,
 		       ushort red, ushort green, ushort blue);
 
 int hw_sm750_setBLANK(struct lynxfb_output *output, int blank);
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index 410f726b03e9..7eae56b74a2b 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -372,7 +372,7 @@ int hw_sm750_crtc_set_mode(struct lynxfb_crtc *crtc,
 	return ret;
 }
 
-int hw_sm750_setColReg(struct lynxfb_crtc *crtc, ushort index,
+int hw_sm750_set_col_reg(struct lynxfb_crtc *crtc, ushort index,
 		       ushort red, ushort green, ushort blue)
 {
 	static unsigned int add[] = {PANEL_PALETTE_RAM, CRT_PALETTE_RAM};
-- 
2.30.2

