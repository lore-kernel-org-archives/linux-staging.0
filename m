Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE5410787;
	Fri, 13 Oct 2023 11:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZGaKbuy4"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-323ef9a8b59so1897994f8f.3;
        Fri, 13 Oct 2023 04:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697195746; x=1697800546; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Y7uEVqUrEURc3ZtGGE61OjpL8fZ0dLhHQyaODvbtbs=;
        b=ZGaKbuy46Uod2A0t9kelwZI4c4v0S471119wBlj1i2VnUTq/SNgWVG4cDzNotFEgHf
         /xitc/7d+BZMgr7cir2j0hilR+0IQmS/UBX+fM9TXeMOJCMrH/a53s8+PPlCmLc5g9VO
         5gfUaj9Endut7lcy2rXMAhZ/p/+evkwkOueDyXKjmyf42WbV0XG9FVO0cgfDQQE3sUG7
         QVks7wwoL5BadMEumsiaitq3XzI392eddSvU8cQGgHdL9Dzjh+bq8T/sJxK5AIfl+zHL
         8hPvctoBYSyyhIRrcGrkMCwjty2pFrA44BmQ1apK7zwsp+0czoQg+SvQ+1gTqJbhg68c
         wHtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697195746; x=1697800546;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Y7uEVqUrEURc3ZtGGE61OjpL8fZ0dLhHQyaODvbtbs=;
        b=jSA9tSrs/xNzUpkZEz56TMrUOpFE5eUKuGaP4/0DJUb/VYvWZD4RsB5RKS34Ih+OuL
         qG/G/2jg06WAyeOY93LeyUYtH4YG/9LxKGEh1nnu443m6ANsaKY0yZWRCLDG09wFeUrn
         mClTcytZMb0blL1dBo0aBCD7bigtdapdpDdVN0tAEUv8EO14HqB4DfSLq9H5kwfGjSXd
         LT3gSIuj37SlFWppEM5TniwmxbE+AuoOqBaDOQoLqRavOriKrva0Tjzrm83xJUliwhcv
         kPVP6kkPiYaqWx5O5aatBphVUtKx2g3wDZAKzj7NoXHPitAA/bv+9C6+f8hVf72KAkCn
         MC/g==
X-Gm-Message-State: AOJu0Yxq729VBefwG/EScX1lLy+yssAcC8gORensJkUmJCmgwiYI1OOK
	7h7zvWRRwPZwkeWPh2ND9iY=
X-Google-Smtp-Source: AGHT+IH/E2wWroQcSwavcN+ZGUhQhN3/JMVXVSG3V+tPq8XNrcMOgQENxa9lj0uOmFV+ihvRnQRhpA==
X-Received: by 2002:adf:dd82:0:b0:324:84bc:d59e with SMTP id x2-20020adfdd82000000b0032484bcd59emr21494976wrl.22.1697195746279;
        Fri, 13 Oct 2023 04:15:46 -0700 (PDT)
Received: from lab-ubuntu ([41.90.69.21])
        by smtp.gmail.com with ESMTPSA id o9-20020a5d4749000000b0032d9523de65sm3282882wrs.48.2023.10.13.04.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 04:15:45 -0700 (PDT)
Date: Fri, 13 Oct 2023 14:15:43 +0300
From: Calvince Otieno <calvncce@gmail.com>
To: outreachy@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Luke Koch <lu.ale.koch@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Calvince Otieno <calvncce@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6] staging: wlan-ng: replace strncpy() with strscpy()
Message-ID: <ZSkm34Sy/n2yxBqi@lab-ubuntu>
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

Patch version v6:
	Remove extra whitespaces on the patch description text

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
                } else {	/* plug a PDR */
                        memcpy(dest, &pda->rec[j]->data, s3plug[i].len);
                }

--
Calvince Otieno

