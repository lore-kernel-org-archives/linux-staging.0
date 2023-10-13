Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20925111B0;
	Fri, 13 Oct 2023 10:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zbdlu/Jz"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-9b2cee40de8so388432966b.1;
        Fri, 13 Oct 2023 03:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697192484; x=1697797284; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QrZvb5Q0DoAOQSgSrWjje0teuv1ya0EsyrCeefTKeuE=;
        b=Zbdlu/JzX/zyHzVAszhpQRwKElSe87GF9u2OmjXxtWK+7Jir1kmsnKZ4QXo1Q4epC5
         Z0od/qzgYXS0h1Uroqi0Vg3kvQzZLo6IZmYNUzjgHxrZ0FOkETK85eCtvYYnl9NtxzZx
         MmkfWqYYY/XbWgwD4nJNQ2QEg6yUKmgCs3+06F/eqw8mFURZ33lTxephBXouqrHsGAah
         M/HtvJDS+bLDjMX4jyjk7tS0mv06+QTk2Evyg4QrH0qqOotdePC1l48yg4LLTGQ9Y5/U
         NGwi9/R8fWbn3tFOSa3EvQ9bfxPq3LhSiWUVq4vmHQMprqud7xI8FQ8/pAyvLbnZQuCX
         oRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697192484; x=1697797284;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QrZvb5Q0DoAOQSgSrWjje0teuv1ya0EsyrCeefTKeuE=;
        b=r3U4Sod484f0ET758j3SOtixjp6zwRON8TvV5Gg09tnhqeLqDA62d+5jocFCQhuR32
         G+RTjvJ7+t8nin9M6Lw2r8E6XUlStv51ydheRx7mKsfoGumWCu95v2uCqXpv/+U7YNA2
         AY5bRC8gQDK0T0p+Srl+1+crqsmrIMouUMiCRhWR3VJnIUFTjIDvTjd2Df/t9wG1ySgP
         wE/LHi4A+28bGwmAzGqG+YXIxB+Fkxbgpqibal+LJYJ1jX2WM7DN3eVCgvKS5AE8c9zh
         ILtl2Ut2k21iC/cDrrVvvvudjEb5+CQcpNvOSyS683rUzFfJt4408uhoGSMmDtoKLD5D
         mRZw==
X-Gm-Message-State: AOJu0Yx9P6aWuAXQGgIvdfA6bZjgQggnm40qcWtNHYnEXrdNpKfzVbJg
	e7oWRUoi7NDNLmdLfG7xgmo=
X-Google-Smtp-Source: AGHT+IH40FtbB60bhKPE1bOKZwEEmHU9uHks8tyaJZuLZ75QgWbZP6X/jIa188vG6YI/EoS/CBsFlA==
X-Received: by 2002:a17:907:9306:b0:9bd:a66a:a22 with SMTP id bu6-20020a170907930600b009bda66a0a22mr874520ejc.15.1697192484138;
        Fri, 13 Oct 2023 03:21:24 -0700 (PDT)
Received: from lab-ubuntu ([41.90.69.21])
        by smtp.gmail.com with ESMTPSA id ci24-20020a170906c35800b009a2235ed496sm12395302ejb.141.2023.10.13.03.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 03:21:23 -0700 (PDT)
Date: Fri, 13 Oct 2023 13:21:21 +0300
From: Calvince Otieno <calvncce@gmail.com>
To: outreachy@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Luke Koch <lu.ale.koch@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Calvince Otieno <calvncce@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5] staging: wlan-ng: replace strncpy() with strscpy()
Message-ID: <ZSkaIYGqAg5xJakY@lab-ubuntu>
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
Patch version v5:
	Removed v1 patch details from the revsion history

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



-- 
Calvince Otieno

