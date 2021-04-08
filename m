Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EB76D00
	for <linux-staging@lists.linux.dev>; Thu,  8 Apr 2021 11:51:18 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id f29so1227414pgm.8
        for <linux-staging@lists.linux.dev>; Thu, 08 Apr 2021 04:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=i9s9BkLvRdlumIZwdRHabgMYGpHTAnHPSYT3zj0wSJ4=;
        b=Rz7Wb35MSnfgOdBmx+0oOrmFk7TaMhak5y/1PKg7A63DQqMc7bao3B4L//s4n8ViUB
         My65OmynzFNM0EP1ctF+nOY97dx7RnG0yWcpVP2/PnP+qSVHsRW2PTCt+JpM50qjW96F
         e7X0Km1r3NN7MRrafpZ3sAFD0LNoyzhiagsdpP5ZSk5GYqczy8F1cCVHPDk3PCL/co7U
         YNXHyLekJyiH/HKKbxNpVdAzgUTzJ4cue9/jfofhYGit2btwMVKhIePRBe1x/DjGX6Ca
         rqAR/1lVp05cyQrOPRTHLmY4dgXxAmF/y7synx2PzBxX32pd3ebaQ/wf9q9ne0uHCowO
         Zxzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=i9s9BkLvRdlumIZwdRHabgMYGpHTAnHPSYT3zj0wSJ4=;
        b=EaHbhFeo7Ut2+FWXI+3VUMY0S1hIJIb7tgdSTJkZ2rGofMY+rOGOigW8vKgikkp4F/
         7eCEaSu48pDi4dKsuQc8lQYI8k5I/QGhs8F13FM5TmyBhlrLmqThER+OlqwJqLMqJLAb
         6YzpSRh+wKU4Vb9fxI5PZmrQzSVfLNV9lW6lA/T+JJjwJWuh8NVsFADkXDxU/VYDQLOW
         v2TqRhnJF+CxgRHQwBoQRrTBed3OTFmWexQJ+bbaRsWHSJc6s6RqJjJngAip2mY2ZBdh
         53C+/S+1yQIcn8R2cj+3diySbG65uHHU53ZivRX+aeXU1JIHcKk2GdsfVKv3CSwy8lxs
         CxLw==
X-Gm-Message-State: AOAM5328NPD7TaRLKIO8Z7JQKbyOxGi12+tJluMZHyzL75At60tvi9R6
	q9rCTEoAV2DrRWSqy598vyg=
X-Google-Smtp-Source: ABdhPJzR3XqFhA1vwKnkhKlm5OxIy/0gKl/K1Z+6z14beckg1VSoE/A+MPHleyo6rAYfpRyqqOaMiA==
X-Received: by 2002:a63:d153:: with SMTP id c19mr7601140pgj.311.1617882678294;
        Thu, 08 Apr 2021 04:51:18 -0700 (PDT)
Received: from kali ([152.57.11.236])
        by smtp.gmail.com with ESMTPSA id c9sm22688550pfl.169.2021.04.08.04.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 04:51:17 -0700 (PDT)
Date: Thu, 8 Apr 2021 17:21:09 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH v2] staging: rtl8712: add spaces around '+'
Message-ID: <YG7uLQLGmAh97xB1@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Added spaces around '+' to improve readability and adhere to linux
kernel coding style.
Reported by checkpatch

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---

Changes from v1: No changes in the code, but only to subject description
and patch body. 
Changed the subject decription according to PatchPhilosophy and made
patch body more clearer.

drivers/staging/rtl8712/wlan_bssdef.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/wlan_bssdef.h b/drivers/staging/rtl8712/wlan_bssdef.h
index b54ccaacc527..ec3749813728 100644
--- a/drivers/staging/rtl8712/wlan_bssdef.h
+++ b/drivers/staging/rtl8712/wlan_bssdef.h
@@ -176,7 +176,7 @@ struct NDIS_802_11_WEP {
 #define MIC_CHECK_TIME	60000000
 
 #ifndef Ndis802_11APMode
-#define Ndis802_11APMode (Ndis802_11InfrastructureMax+1)
+#define Ndis802_11APMode (Ndis802_11InfrastructureMax + 1)
 #endif
 
 struct	wlan_network {
-- 
2.30.2

