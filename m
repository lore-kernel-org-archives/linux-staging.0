Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7E33AC2B;
	Thu, 21 Mar 2024 06:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711004269; cv=none; b=kz8lK0XwBSobntN21y0FLKICek/M4fk4qEKV8yZSh5wB1EctFi9zEkRAGOrCdx4g5vQkhRbpoqj/usEJWdpXusRD/oy1h9BcZnhWj8YW7bOyyM0bZjkC4hmGShBJYpHHiwFEYz8lyVQOIbYzV/W3cxXctrFNJumhXjPY2/n8W24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711004269; c=relaxed/simple;
	bh=StxNl/KI8IGwn9Tcx+LijsYzpaVocZlUNBEJwMkixMw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kWZxGJYN/VXxbtSI5LLHbtukRwm3y+y+a2LGMWxYYawexEY2XBwLSkZtEXaC0F440it8xg3yQA64rv8s6r+DVjuTLpYcY2qpx6iY2/Uxq59ZXW8iSlQc10Yom2kjUfyCAqYzHg5XdV5lp+M+LQlZOUlrlo9U6mr2o2S+poDNF18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nyt+oWaC; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nyt+oWaC"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dc6dcd9124bso597739276.1;
        Wed, 20 Mar 2024 23:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711004266; x=1711609066; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k2Ihr1sSb1dhBBAxziapzajvXw1Qmx1MeL7IyGGNNK0=;
        b=Nyt+oWaCxh7/jVsQpg3QyNrVEy0SGDxogqlrlzQEbK/KPu7fpi9bFEn+a/IUWDi7Uh
         6JCvFgkZ5neU8i8jB/ZxdYBfCZeCp31y2dYs/aD6CUcLFwWs2RtVmQXaZ6jYkP/x1aOE
         DJvl2Jz4OX3o3d4YGKu5zagBozc6hoQ0E5ybqKEvQqlpCON/QJD67YhQJdWl7+TVJyUu
         GMN0/Qq9F+avKZ+nc+qno5Xbc4vYDpQdSu6T4o0gETbDKLRyyY+LZLg43TG5gC3PMES+
         P0Y2rHVrQz9qLRFuv6Ch5F42X9/ho7HnnLLyC7CK34xBJkbBNrPf0aiBz5Qm3QLO/2R5
         OO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711004266; x=1711609066;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k2Ihr1sSb1dhBBAxziapzajvXw1Qmx1MeL7IyGGNNK0=;
        b=lgF6r7FOoYXc2O/1z0SL4d/wfBUnnrIzJH/0LZtcI+QBUmh847QqRm8iGsN+jHc/+z
         PnY9/WJlBLaT+M2goJemXRAFpcVxzM4UeY1v9PmIM+2YqEoKes4qMK3Jf0GteNOmMKFn
         AYQTm6DY1Ivs/IgJVRz+BHmbx9EYCt72/j/S/NigAa9VEnIduP4m/H2N8kMpT3t2T7T8
         HMmhdxysupN/23N6TVZp1w/H1UWyS32KJ+F7uK9uePllmJmX1zYrRGD6n9b5Ntzb3Ss3
         ucedUNO7fD8c55wmBXIPJgsFOvRyZYaCBSIA5oDRIV1bWvBsvTdcXXM1vcKTaUOpuw2v
         nb0w==
X-Forwarded-Encrypted: i=1; AJvYcCX7Fqsmc5umy4vxWQckTCWUDR0nqM+ZyyByXYf26mLR8vNPZitj6bz/WqDs8thLTVB6V0m8HfsEJM+iKeEQtJrqdcAxtWzAVpfMpDZEoQ==
X-Gm-Message-State: AOJu0Yy1kI3IRWNx35SBDMKVUukmbO+Ra/hzMIjwDrqGoyLKs1XbRv9C
	/PYFRYp0y7dx+nL0ijaNMZN9b/YRzJOxw0JfvZ4I6mHsKaOCB3Pp
X-Google-Smtp-Source: AGHT+IHMkKzlctySclD7YkUIPliBND2uiteo3ehaPZV+3Cjf4OSbcgCvJ32U88WkzHdk2XoHiIhr8Q==
X-Received: by 2002:a25:13c7:0:b0:dcc:943a:b99f with SMTP id 190-20020a2513c7000000b00dcc943ab99fmr919184ybt.46.1711004266279;
        Wed, 20 Mar 2024 23:57:46 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.67])
        by smtp.gmail.com with ESMTPSA id o21-20020a63e355000000b005d6b5934deesm12194200pgj.48.2024.03.20.23.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 23:57:45 -0700 (PDT)
Date: Thu, 21 Mar 2024 12:27:41 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH v3] staging: rtl8712: Fix line length exceeding 100 columns
Message-ID: <ZfvaZd92bnoZ9M1m@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Split the argument list of the kthread_run function call across two
lines to address the checkpatch warning "line length exceeds 100
columns".

Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>

---

Changes in v3: fixed the issue in v2, created the patch against
a clean staging tree.

Changes in v2: Fixed the alignment to address checkpatch.pl
warning.

drivers/staging/rtl8712/os_intfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/os_intfs.c b/drivers/staging/rtl8712/os_intfs.c
index 7554613fe7e1..1b11f8b04e13 100644
--- a/drivers/staging/rtl8712/os_intfs.c
+++ b/drivers/staging/rtl8712/os_intfs.c
@@ -221,7 +221,8 @@ struct net_device *r8712_init_netdev(void)
 
 static u32 start_drv_threads(struct _adapter *padapter)
 {
-	padapter->cmd_thread = kthread_run(r8712_cmd_thread, padapter, "%s", padapter->pnetdev->name);
+	padapter->cmd_thread = kthread_run(r8712_cmd_thread, padapter, "%s",
+					   padapter->pnetdev->name);
 	if (IS_ERR(padapter->cmd_thread))
 		return _FAIL;
 	return _SUCCESS;
-- 
2.40.1

