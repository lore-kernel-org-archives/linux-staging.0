Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FC525C706;
	Wed,  9 Apr 2025 09:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744190062; cv=none; b=c5Fc3Icro+/BcIXsGMGpZKBNQ4GomyYJ4Dkz/4lyKYP3SykSsVSdJSVZSkH557cfRGbC+26Ejbit8TccW16fLc4Ye4T+TaALMFBRFslm1sGiWpCTBptoEOG3mh/RUnV7CO/AMyPvlOAc4DUTCJsLW3ENvN8WncjCy6H6pDAdHlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744190062; c=relaxed/simple;
	bh=KPrSjQFz6RDMLvo3Gr/vxAHo3CF4mjppfNm8W6oMQVw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NQvw6PK77nyOGLTiU7bc+tN83SZraIF7ACLYJ4WpLDnR3cQAD6Bi+m8ZN54ESt2Y2B/zbEu361x9KPJHH68FNJX1nqgOl9jt4ndUHlDhoSaGdi+EeSQDbPRuOXQW45CNhSDch+I7YzYaiq+9Gs1K1h/CFfO7LU3t3WfsiY2l1gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lgbwXZd4; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lgbwXZd4"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-476a304a8edso64294911cf.3;
        Wed, 09 Apr 2025 02:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744190059; x=1744794859; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LuSuDtNF61PvgQQchQkid6uP+93V9BVfdt5rCLmmpzU=;
        b=lgbwXZd4RI83/YlShqbQS1UnApFMledV2Dza764468bjqJ0TZtz12V+ED3rRJd/fBw
         ApxyvbBYbsgfKpV3hDtVIllXLRw3TX7PeRDGHBWadBLWzYPe8C6CthRUvDacf9ymAXl6
         79jQqtsVPEcDWPokY/DkiBpY2V977yUp0OZByevukrbLmwZk1LtvM7BIZ7f2jlIr3Qqc
         OuIG+ip7caDgEh6QjLSrA7QaRHX9bDbG8PQB5JfwMD23mZxyVCOKH9E65cfh/m8ihoMw
         JdU5bjFT2b6kZNDIV3IwTCUWW/KMooPimETlWVrj8mgMo4FtWTDTNAtkwiVt+9cpqgqM
         tt6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744190059; x=1744794859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LuSuDtNF61PvgQQchQkid6uP+93V9BVfdt5rCLmmpzU=;
        b=wZAP4Z6D5syeJpEnh1ENHslT+VBqIOGwziFIGA8co4Smenlut0wNb6pjtw/LXHxgTk
         QaAhqa/DrDXrMmhd2etxJVGa+2MAh9mwXDlUG+QENMvHI4TqoZiRpGMT/Lg4FicWp6x/
         aeUg+jrJ7e5uK/oHMypYwUTIiqk7En+nftK8e24F9zkuwrYUWZib1XVPngEDqws/ltdB
         pDa5y4oXj/c04l4uB5JKSyumJTWshDdHY5QKHfXl7gnVFo9Rd0LaKm8riHC1QA/TcVRC
         S5PaEnkUU0F7Khb8Bmhl9Rg7xCGzVvXEnpY9YwLwIOp6HZxhV2R53jXkzij9LAdz2kgT
         oV0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXzBNlau+M13UkF8CJp3DISFL1DJsHQUTHqwHbNiYlnaUkumIxsta8GyZHN4SiRwt7f1p2u9Yt8BYtpHPZi@lists.linux.dev
X-Gm-Message-State: AOJu0YyKR88T6ju+MAcSQ9blFnrdw9M8XPYQTCcoHNR1AXDh2cIZdw/V
	Q7UhkDikhUDxjukxVGlJPb69pFAXLdAs630MraZO43ZtA8BYF8Uc
X-Gm-Gg: ASbGncvpoLj791UQd66K2pQiqOa0uxr5UhosqT0njnNVmE5+mOSDTj8PmbjEwDF2yYt
	zt5dgEzF03U/1Xy89OOJfFqcnyxtf+quB/Rxwx4ve1e6Am3hQn+thj87q3WLwLlVk4O7P7+HOy1
	2vVNJdc+QmwefG5AS/iHzL8Jr8maiLfoq+cMkjP9zo0DHjqTJ4DYcn3QV/hfAzsCItLz+EVHV8u
	xi0DfT00TPtexVP/YTp2QDsgJeerB1ns75kV3rx3Ty3BLEAavCHKFTymW5BqpJ1a+smxuxP8DRa
	iWiKfvVWcd0tgyQe+FW6zx4DhsiOmVZ50G435Z35llKqCw==
X-Google-Smtp-Source: AGHT+IHROIfff9EygQflh2Ny77Q7Q9H1hfUvsrr1DY/l79I/KwXjFhlSR1X4Vw9Pm8MnS2NAuG8V5A==
X-Received: by 2002:a05:622a:50f:b0:474:e3e8:1a58 with SMTP id d75a77b69052e-4795f2d0919mr25813461cf.16.1744190059511;
        Wed, 09 Apr 2025 02:14:19 -0700 (PDT)
Received: from ubuntu ([105.112.112.184])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47964ef728esm4631941cf.73.2025.04.09.02.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 02:14:19 -0700 (PDT)
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
Subject: [PATCH v9 0/2] staging: rtl8723bs: Improve readability and clarity of sequence number wrapping
Date: Wed,  9 Apr 2025 09:12:53 +0000
Message-Id: <cover.1744189500.git.abrahamadekunle50@gmail.com>
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

 drivers/staging/rtl8723bs/core/rtw_xmit.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

-- 
2.34.1

