Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E773114F63;
	Mon, 16 Oct 2023 06:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aZh0IdQO"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-32d9cb5e0fcso2401968f8f.0;
        Sun, 15 Oct 2023 23:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697438377; x=1698043177; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Iiy71Ki/o2LF//sd0XBr3ccMYvSR+gE4EltrkOccHOo=;
        b=aZh0IdQO1D94IzicVJzTX7HKb68W7n6RdrIOepaDrnmzD+4VeDtdvS/tUzxME6nXbF
         i6N9x9zVhCWh9e1yUnRnpDA+Jiz13Yl37CmLAcScL5/2XehyhrOHEfcJQmbuEYDnpPFU
         aOo4vHr8VswJgeqU+jbuS65myJWEytONbAyhbOSXPmOry/DqiFh9nrzReQrZcYXZOpx9
         w5LmgimIFEGZxv1BuS/WDC5OSXF6Y76DT/wx96LLrFtIIppy3Nm8N6yBonb2dCJGecZW
         3mgPbO5xTiw+80l8yJrXkAo+R6qjhOcvXnGEt5RyKA1qLE+7XoQLR17+claeaNDTiSoN
         puIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697438377; x=1698043177;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iiy71Ki/o2LF//sd0XBr3ccMYvSR+gE4EltrkOccHOo=;
        b=gNm4495SoJzk3Gu5wcF5GleSFxNqQPXl7bOu5N3f7vDCB9gJSBc3yIe3kwPSdpmKPJ
         49IwqBmHohtqyEX4ivZH1AsFQVzOxkEgcQiPnhC2Na6MdyeDUi3qN+p1Y9KBsCvfEJiv
         tvDYfqjO6gYQFVPabCru2qDTg6JICG+zRjvUJSvDUBUuKfln3+nk81DC+UaLg1X+CaLM
         DAlYMSkGz1MUMaEo8M+0Uj4itPu+6IUucbhJGOf3gcbDxOFaeXXX4A3x+3SNIQ3eZpGw
         87SUOBZxBzT80UtPiN2AnYif2noUtdgYOpDqWRY7QU7utNhYZvQW/MJ2vHjIYbc0Sj8h
         BDkg==
X-Gm-Message-State: AOJu0YxUy3U2/c4obd4NUbKai64wJF07rc6V3p4zZmF28UAT4qnuY3dn
	xNsIjIKvhwdyzOQdbAQCp2U=
X-Google-Smtp-Source: AGHT+IGCEsbCWSUVGoDB/k1LuP3lsGqIkCWTYbQ+M/DXl+xwMSZfyOm4NmQNkTpaeB9GknAAmygOcA==
X-Received: by 2002:a05:6000:4e1:b0:31f:ea18:6f6b with SMTP id cr1-20020a05600004e100b0031fea186f6bmr27051651wrb.19.1697438376943;
        Sun, 15 Oct 2023 23:39:36 -0700 (PDT)
Received: from lab-ubuntu ([41.90.67.11])
        by smtp.gmail.com with ESMTPSA id n18-20020a5d4c52000000b003197869bcd7sm2410920wrt.13.2023.10.15.23.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 23:39:36 -0700 (PDT)
Date: Mon, 16 Oct 2023 09:39:33 +0300
From: Calvince Otieno <calvncce@gmail.com>
To: gustavo@embeddedor.com, outreachy@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Calvince Otieno <calvncce@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH] staging: wlan-ng: replace strncpy() with strscpy()
Message-ID: <ZSzapU+eKWvHVwxi@lab-ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Checkpatch suggests the use of strscpy() instead of strncpy().
The advantages are that it always adds a NUL terminator and it prevents
a read overflow if the src string is not properly terminated. One
potential disadvantage is that it doesn't zero pad the string like
strncpy() does.
In this code, strscpy() and strncpy() are equivalent and it does not
affect runtime behavior. The string is zeroed on the line before
using memset(). The resulting string was always NUL terminated and
PRISM2_USB_FWFILE is string literal "prism2_ru.fw" so it's NUL
terminated.
However, even though using strscpy() does not fix any bugs, it's
still nicer and makes checkpatch happy.

Signed-off-by: Calvince Otieno <calvncce@gmail.com>
---
Previous Patch Versions:
 - Earlier patch versions had issues with whitespace, preventing correct
 application. This is a reroll of those previous versions.

 - Versions v2 through v6 focused on improving the clarity of the commit
 message. There were no code changes in these patch versions.

 drivers/staging/wlan-ng/prism2fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/wlan-ng/prism2fw.c b/drivers/staging/wlan-ng/prism2fw.c
index 5d03b2b9aab4..3ccd11041646 100644
--- a/drivers/staging/wlan-ng/prism2fw.c
+++ b/drivers/staging/wlan-ng/prism2fw.c
@@ -725,7 +725,7 @@ static int plugimage(struct imgchunk *fchunk, unsigned int nfchunks,
 
 		if (j == -1) {	/* plug the filename */
 			memset(dest, 0, s3plug[i].len);
-			strncpy(dest, PRISM2_USB_FWFILE, s3plug[i].len - 1);
+			strscpy(dest, PRISM2_USB_FWFILE, s3plug[i].len);
 		} else {	/* plug a PDR */
 			memcpy(dest, &pda->rec[j]->data, s3plug[i].len);
 		}
-- 
2.34.1

