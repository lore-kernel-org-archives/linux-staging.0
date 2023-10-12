Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C0B38DE6;
	Thu, 12 Oct 2023 19:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RtGRzveK"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5041335fb9cso1784986e87.0;
        Thu, 12 Oct 2023 12:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697138916; x=1697743716; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S9gOrgWsv2J6btDunJZLLHwFNG8Aa1HIXtQ4lvtTYx8=;
        b=RtGRzveK676OWZ88cHfyHon7Iqm3PhpMWdK/4sMJ/jcbh17D+zQRQ3mMV2c54L57wB
         XxxCE2ucZ1DRzlCQKzVgSFeJsDhJmv7DeaDNC1i3rRtksLFqH9rSL0KDZSjHNPsjEBzY
         KFqF2U/C/jMEvtFlJXbBeBJFgxpsEqX7wSgekpbAnhPemohOvVWiEmJw6bbv4MDBsLQp
         wYSOfYYIbmwL2M8/ZX24KR5DEZU5BeBNwumAUXyJ/1iJu1yoay+dOxwV0mWZYDsrFQpr
         qAaTEl/Dmca4ZitZJnJPoMrAXm2DVzLqNvNLFi2OrFD8g0mxSUWzhRqp3DMNKjXigT8v
         ekfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697138916; x=1697743716;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S9gOrgWsv2J6btDunJZLLHwFNG8Aa1HIXtQ4lvtTYx8=;
        b=RiLHQ9zS48NhwmMEydTMTGI+/XmnMyWFjx6A0mWbYtx6/z6v5gp5bWDlsm7UgCXAou
         UDjRJ6wC2F6IyZp3AofYNeC35ryIP+uneWsPGDtYSUdZ2AKZFqop3MB1IMKfgN9Imgqj
         S8wBFqXzdM2XYGwr9KJ41GpDeQmBedKQG9inVYwYW+cOBOHRrUxQsUFQ2AIPfPf+YOW9
         qwjIK/XJ9ILET9H92X0IVghxMuXeR9/61+k3VJJBE9cMGyVBAwavLWX2p64DZ0eNCtPW
         Ar3mCehO1CRXXpuSJRPtr82JGXwDXfzxiMisQVD8JBMZ1hhR5eWVamsRL4zMv3bhZ1OV
         mOOg==
X-Gm-Message-State: AOJu0YwWR/TXsNBUZ7plyJKkPLlcGjZqowxYSzJ1RF/ucUT0DqxeTzOX
	Wb7QQjKEcT2703CqrPbzsEI=
X-Google-Smtp-Source: AGHT+IH8kFm6q6/3YL1bP7fre04tBPI6ULTnfUTe9BdmPd7wPxPHpyyYaD6OoWfgPqoqMIRu4L3gkQ==
X-Received: by 2002:a19:4355:0:b0:505:7014:8c6b with SMTP id m21-20020a194355000000b0050570148c6bmr18569313lfj.50.1697138916275;
        Thu, 12 Oct 2023 12:28:36 -0700 (PDT)
Received: from lab-ubuntu ([41.90.69.21])
        by smtp.gmail.com with ESMTPSA id t27-20020a1709063e5b00b009a168ab6ee2sm11380536eji.164.2023.10.12.12.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 12:28:35 -0700 (PDT)
Date: Thu, 12 Oct 2023 22:28:33 +0300
From: Calvince Otieno <calvncce@gmail.com>
To: outreachy@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Archana <craechal@gmail.com>, Dan Carpenter <error27@gmail.com>,
	Calvince Otieno <calvncce@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] staging: wlan-ng: remove strncpy() use in favor of
 strscpy()
Message-ID: <ZShI4amWv7sdqfse@lab-ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In response to the suggestion by Dan Carpenter on the initial patch,
this patch provides a correct usage of the strscpy() in place of the
current strncpy() implementation.

strscpy() copies characters from the source buffer to the destination
buffer until one of the following conditions is met:
	- null-terminator ('\0') is encountered in the source string.
	- specified maximum length of the destination buffer is reached.
	- source buffer is exhausted.
Example:
	char dest[11];
	const char *PRISM2_USB_FWFILE = "prism2_ru.fw";
	strscpy(dest, PRISM2_USB_FWFILE, sizeof(dest));

	In this case, strscpy copies the first 10 characters of src into dest
	and add a null-terminator. dest will then contain "prism2_ru.f" with
	proper null-termination.

Since the specified length of the dest buffer is not derived from the
dest buffer itself and rather form plug length (s3plug[i].len),
replacing strcpy() with strscpy() is a better option because it will
ensures that the destination string is always properly terminated.

Signed-off-by: Calvince Otieno <calvncce@gmail.com>
---

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

