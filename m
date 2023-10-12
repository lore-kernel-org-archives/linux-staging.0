Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B051A72D;
	Thu, 12 Oct 2023 14:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AbfBunjk"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9b2cee55056so175639866b.3;
        Thu, 12 Oct 2023 07:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697119321; x=1697724121; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gsmhs5zysW4svCJevlwUFpRCfVEra9CoPzacdufXDbo=;
        b=AbfBunjkeKoPv0aRAbKhEcmuYlJtJNamTQjc3DP2luD+sTCTBQ3Bm/h/n/1teOPT7t
         6fFk5SoWMTuy6L6Vmz2luXXQ1cM14u1jhYACBS0G2zCfUWE6ghR/HoZeuEesWQ76dBdf
         hqk/1u4AJGki2hOePoXtLrx/3lROnrY/yiJOiqElxIo6omVWZ+xlNLGjWnxGPGoxa/1X
         UVcyomXTsL3s4ha0ZU7alNBD70K+yWRVRxGhJZJTGpCyAtVDydZa54UMhrMXEGOhF9xu
         33JSElv9hj8yfxKPbHPobxL0ZHR8Ns/Dx2+AiSkjCndPIn2RUwOOp/rYjWx6T9NnRsDf
         9EDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697119321; x=1697724121;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gsmhs5zysW4svCJevlwUFpRCfVEra9CoPzacdufXDbo=;
        b=GTi0uw30DRyto46jRpJFU7UE8GwyZND97Xtb/dxBZ9jcLtFjpG95SwZYjmG2zIfcm7
         nJO/0FiWWFNt29fqLhhOkC5W20bYm7GDIsR560onUv0hDLkbi1zy5y9SBeT7GG2qDvxq
         9biKvon8mBuYYtgrkOKSu12iRsYVG6uaYxyyWymFCAKEQY8Rau+U7zQVwx6ZWdUg0z48
         452XFlKhy7NtAM/C1UzyjTa6IyG7DGD61Ev0XinUrJXkWI2KCozBRxSHzifIL4L8h8Gg
         gteAJnHDbAnLs4EH/m0ZZO+YJHUtKhlY/mcAPhlRHA2WNuHOz68DzwKVDKuzM1WRMvWK
         kkiw==
X-Gm-Message-State: AOJu0Ywo+L5Bk+MQhhXILkK/2E7M/8B6j5BWIAgQou0k4P1y4MDWf1nf
	+0nFewk1ZYDxHA8U8hWVxQE=
X-Google-Smtp-Source: AGHT+IHPpME55p+kfAxxc2RLQIrajNrNQMENzl2pmL/S1Jp3OZkX4/+u0kauk7Cqpe0RQ7QMyDhSKA==
X-Received: by 2002:a17:906:cb:b0:9ae:4eb7:ae8b with SMTP id 11-20020a17090600cb00b009ae4eb7ae8bmr24299904eji.7.1697119320347;
        Thu, 12 Oct 2023 07:02:00 -0700 (PDT)
Received: from lab-ubuntu ([41.90.69.21])
        by smtp.gmail.com with ESMTPSA id o12-20020a17090637cc00b0099bc80d5575sm10980233ejc.200.2023.10.12.07.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 07:01:59 -0700 (PDT)
Date: Thu, 12 Oct 2023 17:01:57 +0300
From: Calvince Otieno <calvncce@gmail.com>
To: outreachy@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Archana <craechal@gmail.com>, Dan Carpenter <error27@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging/wlan-ng: remove strcpy() use in favor of strscpy()
Message-ID: <ZSf8VcH8JQ+L+Z/r@lab-ubuntu>
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

