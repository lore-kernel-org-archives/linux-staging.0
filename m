Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2522810FB
	for <linux-staging@lists.linux.dev>; Sun, 16 Apr 2023 07:20:05 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id kc3so5596927plb.6
        for <linux-staging@lists.linux.dev>; Sun, 16 Apr 2023 00:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681629604; x=1684221604;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UeH9tea2qoqcclHq5XTuR+lIyQ2Iiw2V+4Ly8KEi4p0=;
        b=gWMGCFrljEv5xhYJNrAFgvvt3al9oD3eeSaMWskBLyDUSHZyTGUljzDZNc0Gh6x0N2
         AsNY/dutCtc8+lhfjzD+oelsyERuST2mffdMqCCHVNUgGsz6rQ4hPQp4IcqaKm2FT8QG
         yZRI9N6P6RrlIgmMv0nl6/3ZbMTnAD8cMb4v7FXTC0pg8E5ayFUVLHgOSg9Shoo4uMgR
         CM69m/CCwUzuz9cLjP7dG8EEaNzuESpRpLuAvWUJUXELX1VMC/ccOvpwqFPd+7kuEF1t
         jif9ufVumtG6de033nZC/CZth/tZhx4vbcITu6VPzzOcGMhJLDIjyqrGoR4QWAjj8qZe
         VeDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681629604; x=1684221604;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UeH9tea2qoqcclHq5XTuR+lIyQ2Iiw2V+4Ly8KEi4p0=;
        b=HxgAcFRD9y3GnZhv1B5atW9DTi30Q8wCKMri1WjbGO208L0iRJ9SRNsTrlwqiGh12u
         Zm7VlKOVxSJ/vDOBDfpCC5nuv+2uiHP+BVh+2MwwQCCsBApgSRHOmJBA7GZYHO0aM2yX
         YzKCQDz42hPiiNH3EGlvU8dq8Zt7A7sDmHuig/+YhLezx4ORKDPMArUEP6l7IF/qp/kg
         /jWYXm6sAm89ALh/usO+otXbiADGKubn5PT3ViiJ0zxqTlygsr362d6G8kTQXmL3Cg+n
         8qp0GwSX9l1Q0D06/1mbnzsfkUBAqOAqoSFPDywFCPumHuo6Kz92mlq59xlccBdwJMYG
         9z4w==
X-Gm-Message-State: AAQBX9fmi5NETQO7dN0bD4vftVz81R63eKi49aBhF/G99/jgzkfaXSRV
	VIdbrM0jFv6shZFzQAZfKg4=
X-Google-Smtp-Source: AKy350a+Unge9hffAbLPDjXT1FWy3HTMLX8iGJJxFBttYJyHRfELOce78IUhuQdUCk9oolK1gv2xwg==
X-Received: by 2002:a17:902:e748:b0:1a6:7570:5368 with SMTP id p8-20020a170902e74800b001a675705368mr9510932plf.19.1681629604404;
        Sun, 16 Apr 2023 00:20:04 -0700 (PDT)
Received: from yoga ([2400:1f00:13:db5a:e583:1107:fa06:3a11])
        by smtp.gmail.com with UTF8SMTPSA id jm15-20020a17090304cf00b001a045f45d49sm5459816plb.281.2023.04.16.00.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 00:20:03 -0700 (PDT)
Date: Sun, 16 Apr 2023 12:49:56 +0530
From: Anup Sharma <anupnewsmail@gmail.com>
To: hdegoede@redhat.com, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org, andy@kernel.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	 linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, anupnewsmail@gmail.com
Subject: [PATCH] Staging: media: atomisp: include: mmu: include
 <linux/processor.h> instead of <asm/processor.h>
Message-ID: <ZDuhnLPczec5qJnq@yoga>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix following checkpatch.pl warning by including
<linux/processor.h> instead of <asm/processor.h>

Signed-off-by: Anup Sharma <anupnewsmail@gmail.com>
---
 drivers/staging/media/atomisp/include/linux/atomisp_platform.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
index 539b21d39d3b..d85fd168fcd3 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
@@ -19,7 +19,7 @@
 #define ATOMISP_PLATFORM_H_
 
 #include <asm/intel-family.h>
-#include <asm/processor.h>
+#include <linux/processor.h>
 
 #include <linux/i2c.h>
 #include <media/v4l2-subdev.h>
-- 
2.34.1

