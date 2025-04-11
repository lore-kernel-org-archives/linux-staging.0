Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBEC27F4C9;
	Fri, 11 Apr 2025 19:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744400482; cv=none; b=AvJi/i+iqCcAjx4pumtADsFNJcbS3kdgfW9xOr7rKoi4wDKiQhPjf/CZwDD5ikwT2CTEKHG9L9Ecwwz0qgvMYZXoyBews9Pogh3oYPn3KsMIsTRfiUtEDDlcrO3AznSeZHD3IulmkHwEPHjXElTha1AO4bcKBNjbWxCTlUv7+jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744400482; c=relaxed/simple;
	bh=d4sYTTDLbyYeWKPHtORx1pdOLAkRGQVbUduJ4gMmTTE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fAaqGjnn5HSx8VUfacAxAXKf8f3l2vkEl4eSv+Q7mf4HPKBIZ5RkIa0dPGa9wjyg5FyuRynu0NGxv++5oz/e1BBKU+O6Wx6QW7X6L0LN32y7U0MrxRSfjWJu11al25QDpzSxeMfJNMkKK+HU+rjLmhqusxDiGOYEDw8gb25bn1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BFtSqyuK; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BFtSqyuK"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5eb5ecf3217so4260802a12.3;
        Fri, 11 Apr 2025 12:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744400478; x=1745005278; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1XTE4UiVxoOqY3iuQcM3viCRnNdByGl2a9srDreM4Ug=;
        b=BFtSqyuKKwnMySLwTmBiteOuYRRMobUlcwEW56HIZawhfbTIKHoogU0oFrf5YzT46N
         rGZfM1DINKvO8bdJaXZdv0w/jNooBOh19832FBklrKexLOgpZ22zrckiWX3TOGgmd1Pi
         TJL+t3bSHvhV3VOEm3lfOcvGDuIFp+NBoZHwzBCMPMgqxu4G+y3IXu/lpvbv5mSRoJrf
         TgH4/ZS5OY+pZDBuMK05gYHxMPe/TorhVK2yGI1MlejzSIdN+EPn5gYjcSmJxUCn+MnF
         9YZejtUNb9yyabMWb6j/bekLKyyQWmU6cD3ycWhzAaKL5nPKwsAnIGsX/4IG5yb4Lx1R
         1s4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744400478; x=1745005278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1XTE4UiVxoOqY3iuQcM3viCRnNdByGl2a9srDreM4Ug=;
        b=v24iLE+8CPNIuQf/WGxxqmTLESbuL46aS3Ay4/WT9WtFPszSp9Y/dj5xSu9Bt2PIFH
         /SKjMlyg3X6I1wAnHrIGz2+ow1SJJ9ypOzwXCTpKr2mI599qKOtLkeD6XTMeWITbgSw1
         3mVjht+Mrb6rWovZYDodMUmh0n5vm4eKcaHR1r/1ejlDnvlEVNlYif7Xm9a9+ILuQdX0
         Go2xu6lICBXvoC487PDB+E9wqslXlWozCnsCDvpOrr+akkUs5OJUR4YedKdZ9HlzD7PC
         t8YLO1pYey1riwhEOj956locWbcOSS3ViknPMB8zLiVjpWgdckYx7lrjsAhXQqba7JEc
         zveg==
X-Forwarded-Encrypted: i=1; AJvYcCV2U5SpG9+R2f54JBgd0bwwKXHxw7/yDmGAnoze4vP4KKA5zulT2TKXK5E18sALsyVe3Q/vyYlSN+WcDwAr@lists.linux.dev
X-Gm-Message-State: AOJu0YyRqcxzmB4IKzgY2JiR4nP/fQymNwX0rsAyoAuCzcw/VRwN6LJF
	6YG04/ljFxGwoEn3t0YrVsScZJX7RupSwCgeJ//fsfBdePDoJ72P
X-Gm-Gg: ASbGncu9DWvWy2Z6EnTys7Oix/waLeat1HwcPYSC7fDmacJdYVwfJv7XfwIQ3BHHRc6
	TijBGyqAFNKTExrNiri5/0nQBGkQhesTYxQf1y39T7H6QcYYAIEznulHDxPzcJD9bQaii1b3xHw
	LJhM3Hjbd85vuR/6RIs+GkfFoNnAikyA6vpi7cSn4Op3cN6n4mhnY2n/Mad4R+jA+hrdq2/JqcJ
	xcPwU65WgMwhrOfAqfaOnsKghjgbjovcQ1mL6BVOIjeTREShmpOI2akUfBxosZD5XunY5YSGASB
	tDuebVAl3mTt46bX4uQc8HPrVFl3twsx378W3n00D9nBqw==
X-Google-Smtp-Source: AGHT+IGzSMrzJvLKnG/jYkR1F0xu8pl1o3+7OHwTbyykOFgEtjIjwBW6rl9qA+eGGnTiEkiexg2xwA==
X-Received: by 2002:a17:907:7ea5:b0:ac2:b1e2:4b85 with SMTP id a640c23a62f3a-acad3456e28mr373610366b.3.1744400477780;
        Fri, 11 Apr 2025 12:41:17 -0700 (PDT)
Received: from ubuntu ([105.112.122.132])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb4070sm493672866b.102.2025.04.11.12.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 12:41:17 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev,
	julia.lawall@inria.fr
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com,
	dan.carpenter@linaro.org,
	andy@kernel.org,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH v10 0/2] staging: rtl8723bs: Improve readability and clarity of sequence number wrapping
Date: Fri, 11 Apr 2025 19:40:22 +0000
Message-Id: <cover.1744399612.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patchset adds spaces around binary operators, breaks long lines to enhance readability
and provides clarity on sequence number wrapping by using a modulo operation % 4096u, in
place of the bitwise AND(&) operation & 0xfff.
The patches are required to be applied in sequence.

Changes in v9:
* PATCH 1:
	- Added more converted cases found in the driver to the patch.
- The Coccinelle semantic patch used to find additional cases in the driver is:

@@
expression e;

@@
* e & 0xfff

- The bloat-o-meter tool was used to ensure the sizes of the binary
files before and after the change were the same.

- $ make drivers/staging/rtl8723bs/core/rtw_xmit.o
  $ ./scripts/bloat-o-meter rtw_xmit_before.o rtw_xmit_after.o

This showed identical 'Before' and 'After' size values with a 'chg' of +0.00%.
Changes in v8:
* PATCH 1:
	- Added Reviewed-by tag to commit message.
* PATCH 2:
	- Added Reviewed-by tag to commit message.
Changes in v7:
* PATCH 1:
	- Added blank line to enhance readability
* PATCH 2:
	- Changed `power of 2` to `power-of-2` in commit message.
Changes in v6:
	- Modified cover letter BLURB to reference newly added line breaks.
* PATCH 1:
	- Added line breaks to long lines to improve readability.
	- Changed commit message to include the information about the broken
	  lines added to the patch.
	- Changed subject line title to also include the newly added line breaks.
* PATCH 2:
	- Changed instances of `& 0xfff` to `% 4096u` which were now in the broken lines
	  after the broken lines have been done in PATCH 1.
Changes in v5:
	- Converted the patch with the subject "Use % 4096 instead of & 0xfff"
	  patch to a patchset.
	- Added a patch to add spaces around binary operator.
Changes in v4:
	- Corrected patch to use '%' instead of '&'.
	- To ensure this change does not affect the functional
	behaviour, I compared the generated object files before and
	after the change using the `cmp` which compares the two
	object files byte by byte as shown below:

	$ make drivers/staging/rtl8723bs/core/rtw_xmit.o
	$ cmp rtw_xmit_before.o rtw_xmit_after.o

	No differences were found in the output, confirming that the
	change does not alter the compiled output.
Changes in v3:
	- Added more description to the commit message.
	- Removed blank line in the tag block.
	- Added more patch recipients.
Changes in v2:
	- Changed the commit message t a more descriptive message which
	makes it clear why the patch does the change.
	- changed the subject title to include `4096u` to show that an
	unsigned module is used.
Changes in v1:
	- Added more patch recipients.

Abraham Samuel Adekunle (2):
  staging: rtl8723bs: Add spaces and line breaks to improve readability
  staging: rtl8723bs: Use % 4096 instead of & 0xfff

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 6 +++---
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 9 ++++++---
 3 files changed, 10 insertions(+), 7 deletions(-)

-- 
2.34.1

