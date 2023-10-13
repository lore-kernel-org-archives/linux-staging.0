Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7FD8478;
	Fri, 13 Oct 2023 09:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D/CKgTJP"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50307acd445so2372658e87.0;
        Fri, 13 Oct 2023 02:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697190869; x=1697795669; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R4NoCUDvuhISs5zePSgTjBOD4p4v9fCoCqCDFPnEEaM=;
        b=D/CKgTJPidIw/ZWO+6ALyP9HkwdAks4E9cAcAv2f3NRojyn503C7e0D2/Cw1QOmIQe
         Cf/ivyZJKVqJ8lXWLnisz4rXFR91miMzlvh7HfTiTAyf9foSxJRDwzLWFAnaPqB8OpR5
         /3mqy2Agzq/jWaVORLAG4gfXncalagHbNxSLUqgQYOFuLBk8l/5dP1jyjT04NZXo8w+f
         PzPnZrBug6mHlFfTQhXdOQph9vYacDYIYO6HSQluXa3mowviySmCEI4hokxQm3lpu4WU
         fDOr2IJct166A+1n65ZhfTohGjCpSs7Q30Aoga5jN/XuY55X23T9XYSkf4yenxtKDGgK
         xzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697190869; x=1697795669;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R4NoCUDvuhISs5zePSgTjBOD4p4v9fCoCqCDFPnEEaM=;
        b=nAbqGyL6B1OOaWrqk8eoy5/On1DA8mgIfo3rHzZZxutHrETac3v+EkRSnIZQjYtUo+
         olrvUXLGCawsqo8uIQXcgsXr8ggv4im0r0eC76UboR27gWKQitzLMnbK9sOOyVbrIUh6
         XgFpoopwGiiqm5UWqrmq8AbnWY8//GnOSwNADLUEOz1iK3L9IpIOeKvGwIuxQojjlQCZ
         q2SEEWAr7MbD4YA76Qto61vjuhfcu6xEliJ3dV1uDjrlVVQQZcwR55eHJqD2nbwvB2Ot
         DTsqWHjNgCnXdbLfeMOuCwUwj4wq3TgGaOte6K/3vLewi6lCZ2ZVJjjuN3J2tjoqPfiL
         AA8w==
X-Gm-Message-State: AOJu0YyNjOpXT9UsOBv9b7hRC9MhzSnDQoYHZckSxEcij4LyUAdhSg0l
	xBk247/S2iZGr1HkRGO5Lxw=
X-Google-Smtp-Source: AGHT+IFOp0mYWBcby+0X1+1TnDZ3eh8Vgokk7MzTSK966IoDpUt2Y+x3Pc3p+wADEw2n1N6PjEjzlA==
X-Received: by 2002:a19:910d:0:b0:501:ba04:f34b with SMTP id t13-20020a19910d000000b00501ba04f34bmr19743563lfd.44.1697190869138;
        Fri, 13 Oct 2023 02:54:29 -0700 (PDT)
Received: from lab-ubuntu ([41.90.69.21])
        by smtp.gmail.com with ESMTPSA id c26-20020a056402101a00b00533e915923asm11199706edu.49.2023.10.13.02.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 02:54:28 -0700 (PDT)
Date: Fri, 13 Oct 2023 12:54:26 +0300
From: Calvince Otieno <calvncce@gmail.com>
To: outreachy@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Luke Koch <lu.ale.koch@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Calvince Otieno <calvncce@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] staging: wlan-ng: replace  strncpy() with strscpy()
Message-ID: <ZSkT0pFu0VClVc1V@lab-ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Checkpatch suggests the use of  strscpy() instead of strncpy().
The advantages are that it always adds a NUL terminator and it prevents
a read overflow if the src string is not properly terminated.  One
potential disadvantage is that it doesn't zero pad the string like
strncpy() does.

In this code, strscpy() and strncpy() are equivalent and it does not
affect runtime behavior.  The string is zeroed on the line before
using memset().  The resulting string was always NUL terminated and
PRISM2_USB_FWFILE is string literal "prism2_ru.fw" so it's NUL
terminated.

However, even though using strscpy() does not fix any bugs, it's
still nicer and makes checkpatch happy.

Signed-off-by: Calvince Otieno <calvncce@gmail.com>
---
Patch version v4:
	Provide a valid description of the patch

Patch version v3:
        Correct the patch subject headline.
        staging: wlan-ng: remove strncpy() use in favor of strscpy()

Patch version v2 :
        Correct implementation of the strscpy()

drivers/staging/wlan-ng/prism2fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/wlan-ng/prism2fw.c b/drivers/staging/wlan-ng/prism2fw.c
index 5d03b2b9aab4..3ccd11041646 100644
--- a/drivers/staging/wlan-ng/prism2fw.c
+++ b/drivers/staging/wlan-ng/prism2fw.c
@@ -725,7 +725,7 @@ static int plugimage(struct imgchunk *fchunk, unsigned int nfchunks,

                if (j == -1) {  /* plug the filename */
                        memset(dest, 0, s3plug[i].len);
-                       strncpy(dest, PRISM2_USB_FWFILE, s3plug[i].len - 1);
+                       strscpy(dest, PRISM2_USB_FWFILE, s3plug[i].len);
                } else {        /* plug a PDR */
                        memcpy(dest, &pda->rec[j]->data, s3plug[i].len);
                }

Patch version v1:
        Replacing strncpy() with strscpy()

 drivers/staging/wlan-ng/prism2fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/wlan-ng/prism2fw.c b/drivers/staging/wlan-ng/prism2fw.c
index 5d03b2b9aab4..57a99dd12143 100644
--- a/drivers/staging/wlan-ng/prism2fw.c
+++ b/drivers/staging/wlan-ng/prism2fw.c
@@ -725,7 +725,7 @@ static int plugimage(struct imgchunk *fchunk, unsigned int nfchunks,

                if (j == -1) {  /* plug the filename */
                        memset(dest, 0, s3plug[i].len);
-                       strncpy(dest, PRISM2_USB_FWFILE, s3plug[i].len - 1);
+                       strscpy(dest, PRISM2_USB_FWFILE, s3plug[i].len - 1);
                } else {        /* plug a PDR */
                        memcpy(dest, &pda->rec[j]->data, s3plug[i].len);
                }

-- 
Calvince Otieno

