Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F851F16B;
	Fri,  4 Apr 2025 00:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743725024; cv=none; b=AmVZtQRfUlQ82q/g4f/4oZLlhrsfyEjoL8Q1AOefJplU8mhRFulT+w0+0Q2WHJQbahmfXRrngOS6tH1h4kcrwbRTZRiquRHDJzk2Qe6+RNQNldou6k975hjY3uld92Xja1IBQnv3YL4i3Hnfaq5ZVp2729Tod6MEcblzbTmb43s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743725024; c=relaxed/simple;
	bh=dtP05FHtqtvQksRG4fyIfH+IqNwLnnDIsaTOwYM/UfA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PtbKkWECMqNXV2MtFp/33mZROUZg6GGeHLNL6Ow3U4vTeCxcG4/8yEAsJUs94LnvH5bMRfd5h922D4/DfE/yAP9DFTolBIg+JZ4CUdWXI8KMUiE4r51iIf/DrV5DAsERth/O0ilQv+CA+A1hr3LH0/CQqn/rLAJ27i8iLwQoqo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZTItK5rd; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZTItK5rd"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6ecfbf1c7cbso24561786d6.2;
        Thu, 03 Apr 2025 17:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743725021; x=1744329821; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VrN/5nI85Iyzwu4Kb1tuLw1B0s/WKF1jD8cGe7yneTY=;
        b=ZTItK5rd/1cEG/ewtYY/KLKekilro70EH5D0H6vA4HHE9/UFoKe8bUbZT22oAMUpMh
         m/epV9t1h9+gSSZRgjKi3NagbScCytfVBnf8sf+9+8foUixao82GlMFAM+HG9C+cil80
         JAOn5TRZ8B1RQNM40VulK639FlOHBqLDH6iFqNPgPPPbioeRPlaeTPyX1/xuezIbUM73
         m7/w3D/iQkChGhjIgGCxTUwJu/7+jAAGqC9pnRwyY/+9J0McEUYOhfCXbWTH3tTR1A3u
         KJk3SDhwPzgln8SvIEgo18tQFYqOhEbiwOlO9EQjW/dkyUt+riVACMJPVKWoF/nfoNnf
         /AAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743725021; x=1744329821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VrN/5nI85Iyzwu4Kb1tuLw1B0s/WKF1jD8cGe7yneTY=;
        b=q2hn7CxsYm82MjBP7zjsq591Ph2TkBqlGibbd6R/rSTLLIyjISefZzKgXFu6hYFgXN
         8Qq4uvZrLPKrfI1wk9v6+UNybpQKqrDNf43rXDAnOCInljcRinI4Ta2NM1nNcM1bE+bA
         85ZKP6vek9LAhmNVFpHv1XzLRy14N93JiJepNM4P7v5Ok22FOAl2UWS3dYs5oCv3mPw1
         loflU24eKiEjcjKCynlx3vD9hYlmHgBAn01RTYRstgjLiwi/zgRC5vxDpq3Bm5ZfLfEq
         R39SMs9Bfo6ATuM4OeNSyJ6mOXnseAt9Cf2ApeB6RmjS3P8l00lOtsYUjBxiDgq4GkcX
         efuw==
X-Forwarded-Encrypted: i=1; AJvYcCWtQE5eqcPU+SLNFMr/LmyVNfo2YxrfW87MwEFs3/jK1AKs5q2CemitpzuT7qCUg6pK9Eqr35jroWocdP32@lists.linux.dev
X-Gm-Message-State: AOJu0YyUQ3CvAdQ5FoHkj43PMpgnQaqVOKW0DAp+Ly/93o7deL1sQFuw
	e0gbUw+OFlBE0vXccJafNahBwVAinwHZqN9IAPAA/dljOhIn90zQTZ9Ialfi
X-Gm-Gg: ASbGncsK/pYCqOKUqO9peuwb7l00PTrYo+b9iZLNKUU/oNgJuv/BcSa1VW3JdzN/ypY
	gs6PRA88gmjVFR/yv9jB2ClNi81MsrmU4+cdHe3DiUPLoCm34St8ALjgA2k/azxuBFFfNXerCMk
	5le/55MJsTDcSb1gumZjoMV3ij8kagTwn8gWHVw4xVs4OSywLk/AJu99+vMx4GH5e84sHufmYcw
	Itv3NIMYhEWa+f+XmUNT5sqXPIBPy/J94TO3L0GbImwn9L/XSQ8IaeX7MOwlApwLHTJTMU14aGu
	j2hlbqomyo4seKbAm7LfkdsK6sAtPTkMgY4sEJbXzNmG1baq
X-Google-Smtp-Source: AGHT+IHiHvrlSqEA3SAeiWQICnDII+gHiXqvB+ajtAoY3IvBEGYCIz3BvU+epIVNYDdzpIDfQaMFkA==
X-Received: by 2002:a05:6214:cae:b0:6e8:c713:3220 with SMTP id 6a1803df08f44-6f01e7723ecmr24275666d6.36.1743725021350;
        Thu, 03 Apr 2025 17:03:41 -0700 (PDT)
Received: from HP-650 ([105.112.123.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f00ec8dsm13736986d6.28.2025.04.03.17.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 17:03:41 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev,
	julia.lawall@inria.fr
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	andy@kernel.org,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [v3 0/1] Unnecessary code cleanup patches
Date: Fri,  4 Apr 2025 01:02:19 +0100
Message-Id: <cover.1743723590.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patchset modifies unnecessary duplicate NULL test on a
value in an expression, when the value has been NULL tested in a
previous expression.

Changes in v2:
- Suggested by Andy Shevchenko.

* Dropped patch files for media drivers from patchset as it is
not meant for outreachy applicants.
* Added full-stop sign to text in commit message.
* Added space around binary operators.
* Made code more breadable by adding a line break.
* Replace bitwise AND (&) with modulo (%) in expression.

Changes in v1:
- Suggested by Andy Shevchenko

* Patch for drivers/staging/media/av7110/sp8870.c and
  drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
  is split into two different patches in the patchset for use
  by the different driver maintainers.
* Added subject title for each of the separated patch.
* Patch 1: Removed unnecessary curl braces {} initially inserted.
* Patch 2: Unnecessary {} was also removed for v1.

Abraham Samuel Adekunle (1):
  staging: rtl8723bs: Prevent duplicate NULL tests on a value

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 58 +++++++++----------
 2 files changed, 30 insertions(+), 30 deletions(-)

-- 
2.34.1

