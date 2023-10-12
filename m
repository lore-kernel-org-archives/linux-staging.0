Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64AC28EF;
	Thu, 12 Oct 2023 05:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lNSAALck"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-9adca291f99so81706866b.2;
        Wed, 11 Oct 2023 22:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697088472; x=1697693272; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ozg712u+fkxOtQ1gw/5043+BQ9WtYWW1ZFVe71DFuYA=;
        b=lNSAALck0WoFO64VRXlK/EeMzEdQEU3214md23V2r/XWxf/V5NMXMBnlgZbKbhxp4w
         BcuJwVxW7s2ETmsSxFog2wPjJnr3p+ZMhj0cQFm2em5jIVnZu9CPR1/IwXZ0iC+/0O0e
         /LTnkx/ngaNWrDdmZEbTjwdsbmE7aJM4uxc6axUGWqJjiVXfstQdFgGbWhFdRNekpDar
         j8iJbhLnZ2zwrwirlevK6IA8vqAo2WhVXle1WBaD7CdVoTcmjwoOnpSP5yJOEqon7Ze3
         Fh+l1HnvaRY697mZ47l/dxfQK1pG+lxkMqVIWdNPttjb7JBHjPqdrA44vmabIwL3gmE/
         sKiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697088472; x=1697693272;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ozg712u+fkxOtQ1gw/5043+BQ9WtYWW1ZFVe71DFuYA=;
        b=O2Bs/zAm9ijsv7pgmLgRh0uyUFFSBazYvIujksxXbRo4WkbXi5M5AbVAUY/F9u9JRZ
         T08nOel74uAQffzkGPQAB/znBx2YOGKFLE+Ugaz+ZkqVfgun1afKrXBEylVdrZ3SHW7A
         9mJi6HwdmvqZl8KxDpelIxje5NOF3vnJip3b4l5H4YrqtfybDopN7Q0KGn/Xn0EWnyCS
         3ArmGAYNQUqo7mVf4YzodHnx+5SWFeR8qGjqWAhmZwbvzIezws7F41V+/SNKJLNWO8S3
         zH/GZAdr18+NpbWm6D0Mn4XpXY8cWuNky0pG00IKUD82OhMgJtlS7JYTiEDNSJdhKhIt
         ayuQ==
X-Gm-Message-State: AOJu0Yx1yTSSxyoGGpTyQ3om6XLGvOu2OCxAu+qx1QZcJmKBQe8JFpad
	8oyXdiKwDOyZmHWQBCyD55E=
X-Google-Smtp-Source: AGHT+IF5tYUPLGypOey9huLbPekHSPE+pf00HCsiwFtXUpe7IaMbQweFfXQemW7Ol5j6nK+4EEqVqw==
X-Received: by 2002:a17:906:328c:b0:9ae:4776:5a3a with SMTP id 12-20020a170906328c00b009ae47765a3amr20714283ejw.39.1697088471826;
        Wed, 11 Oct 2023 22:27:51 -0700 (PDT)
Received: from lab-ubuntu ([41.90.69.21])
        by smtp.gmail.com with ESMTPSA id n17-20020a170906379100b009b957d5237asm10516169ejc.80.2023.10.11.22.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 22:27:51 -0700 (PDT)
Date: Thu, 12 Oct 2023 08:27:49 +0300
From: Calvince Otieno <calvncce@gmail.com>
To: outreachy@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>, Archana <craechal@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Simon Horman <horms@kernel.org>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging/wlan-ng: remove strcpy() use in favor of strscpy()
Message-ID: <ZSeD1UojAgrsOh16@lab-ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

strncpy() function is actively dangerous to use since it may not
NUL-terminate the destination string, resulting in potential memory
content exposures, unbounded reads, or crashes. strcpy() performs
no bounds checking on the destination buffer. The safe replacement
is strscpy() which is specific to the Linux kernel.

Signed-off-by: Calvince Otieno <calvncce@gmail.com>
---
 drivers/staging/wlan-ng/prism2fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/wlan-ng/prism2fw.c b/drivers/staging/wlan-ng/prism2fw.c
index 5d03b2b9aab4..57a99dd12143 100644
--- a/drivers/staging/wlan-ng/prism2fw.c
+++ b/drivers/staging/wlan-ng/prism2fw.c
@@ -725,7 +725,7 @@ static int plugimage(struct imgchunk *fchunk, unsigned int nfchunks,
 
 		if (j == -1) {	/* plug the filename */
 			memset(dest, 0, s3plug[i].len);
-			strncpy(dest, PRISM2_USB_FWFILE, s3plug[i].len - 1);
+			strscpy(dest, PRISM2_USB_FWFILE, s3plug[i].len - 1);
 		} else {	/* plug a PDR */
 			memcpy(dest, &pda->rec[j]->data, s3plug[i].len);
 		}

