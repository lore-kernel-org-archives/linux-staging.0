Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE4363B4;
	Thu, 12 Oct 2023 19:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KtIvQDI3"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2c1886777d9so15896111fa.0;
        Thu, 12 Oct 2023 12:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697137584; x=1697742384; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GRG/Q+khD2cAKTgkqi3DOUxaLzalQQAE2INM+FeGIZY=;
        b=KtIvQDI3Wf+JvvCBFYdwplZP27OPIIc4F+fIyGbgb/4RuvYe6zAvnpFKUH4nKqxyBu
         elOZh3S4m3oiBBV7kgZE0V0vCxBD8BmpjgHdjvBf4X0DEYztZV4waQfqmIyem4yVYxaW
         sIkQwSSKXKv1enJDbfB520h3BTbAdpciRretPl1/5ZCrHhLmbjOeK+UgXcT92S3yenqC
         wcbswgf/VXVzjBXJgGTZaCFIn5FdXiO9bQxFCFiJquiZc+0by0vyvZiKfSfU78P/LJka
         4c+7umsIXy1xedvz3sqW+7KQV+mF9gaSrf3uHANgtJhL7d1DGmA23IHA6ZK6n3qiSvOO
         RMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697137584; x=1697742384;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GRG/Q+khD2cAKTgkqi3DOUxaLzalQQAE2INM+FeGIZY=;
        b=E6a/PrkIwAL7Xw8BeJB9sk3r5CvCnJiWuRt+qTYmVtuHNc20+5oNczdvWdsA7IkfZz
         POH8gLC1buecrF+DjVOL7KjxWhjHEsHCK2vtgVQZK+eTm1WSgjQtyLL4ZXKfx3kX9NMX
         lJSPKjw7SGu2wjDgYYcNrEjbhQ9XrY36st4ouEJSHqhTsbLB0NgxIPqBRaw34YHOeii0
         9GaeyhB1pro3QKNIcDgIsPF7Her/Dk9YVE7wfC8a3hTB2BzkfAwgZs9nEwrrEtlYvBJE
         mCnRDsjkiHGzDO/ArOCxEJepFr+AkRULYIdgHYwLd15RIOCTqMu9x/W8m0boTGqPiXJk
         G4XQ==
X-Gm-Message-State: AOJu0YwpBbGT/EKWhWJimNatLusNQsmRQTQGYY3+W41bmC4E9vhNCjVt
	2hbtK2IbWerbeVfKSvufGG0=
X-Google-Smtp-Source: AGHT+IHCatDuHoVLOodvZHyWbaPIKuEY1i2ybALWQhnXImPK6VTRXGS0KHVz0W4W3sA03WzDzP18Pg==
X-Received: by 2002:ac2:560c:0:b0:507:9745:8629 with SMTP id v12-20020ac2560c000000b0050797458629mr873868lfd.55.1697137584259;
        Thu, 12 Oct 2023 12:06:24 -0700 (PDT)
Received: from lab-ubuntu ([41.90.69.21])
        by smtp.gmail.com with ESMTPSA id q15-20020a170906360f00b0099d804da2e9sm11511509ejb.225.2023.10.12.12.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 12:06:23 -0700 (PDT)
Date: Thu, 12 Oct 2023 22:06:21 +0300
From: Calvince Otieno <calvncce@gmail.com>
To: outreachy@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Archana <craechal@gmail.com>, Dan Carpenter <error27@gmail.com>,
	Calvince Otieno <calvncce@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: wlan-ng: remove strcpy() use in favor of
 strscpy()
Message-ID: <ZShDrTH1wTmTxqlu@lab-ubuntu>
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
current strcpy() implementation.

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

Patch version v2 : 
	Correct implementation of the strscpy()

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

Patch version v1: 
	Replacing strcpy() with strscpy()

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

