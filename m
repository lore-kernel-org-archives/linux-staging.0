Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D11E335577
	for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 14:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763390438; cv=none; b=YMqjCTAzoF5NIT/eDq1m4oH/M+zNKYeJ8gITUFiU1ymU9M+uJakipJVJCuiQe8/LKOr+6zl8iQQN6AKt5XdX6k6jeocoLpYIL7SaLQpJCb7yM3sYrG22SLYZfaYkYs7lv/zFyUeq24LLCSm1VG5wg5Hct4lNVLxJzKDZrc+kZco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763390438; c=relaxed/simple;
	bh=eimoQ+FdKA9+pxE/MGHkV1aEQJ4Aum+o/HO4FuPQDW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zcd2atOaskk/X09qTCuZXujLS7zIgH6p8eDfSeK9lAuewga2SsFOgorkWFpXNUZaeh16fW4CCYyr5CDIWme2OEE0qk0lB6ptkRt84saJhVdhQrNPbcmjJ+OIA0MHBa+204UNdg0FJ9bkEU71RD8v39fofJnPpiY7vbjE9EZTZgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TPe1j02L; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TPe1j02L"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47790b080e4so15637385e9.3
        for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 06:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763390434; x=1763995234; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJB2FqiO6SGFfYYapjgo9o+2feU29SxCG7Fhx4LKfdY=;
        b=TPe1j02LGyKvfu5vNR9/3sOhzcSE6jCBqQFINuOrHyEzVEVJpW5ILGp3mgXczzONuE
         LzkyijhDwX2UTwt7U6Lhy6/ZtgUXocJYaKuY6UTYUj8O6lzRt26tv2cwqZ5CBXEofxfX
         0Jy2N+qPIgJLmgW4EyGXPkUxlSvOf9oAhRBF8cObDbhQrpThoktlPj2rr0pJg2dVXU9u
         HzUpwltdTNnagT0ardqe7eFiwVMinOZCd50UAaAqZ9Os8EQqFAGIHJ6QKKkIVfRIUCZt
         MsNCtGLRZwKNnhA2hqv5kJe+0efvcjrljbtB+C/xSdrkrbwbmyRpOaqRQBVyc2UJw3HG
         GJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763390434; x=1763995234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZJB2FqiO6SGFfYYapjgo9o+2feU29SxCG7Fhx4LKfdY=;
        b=uTU+PstTQDNeLoMaOMnxZ1SjzlhTqODjySFQ8D90ubeWysrVCInjVELi6K9WuBBa3o
         C8N06UNhNGlljaV9dX5Bh5VVyEz3D7auSTP5qfPCjZ8sMff5AvwxKh6kDYcj/ngBSw22
         82QjiWKT+V/0c/AUuxY4VLaKbD7TFkAR46uTnwbZlVFjR+vOpPEExDTXOAOewVXWKN8D
         6C9naH5W0O1EbSP/pO5UYGjkHelBkVTh9eGNJMHONoJGnvRJ86/ON+HyPaNUxhOZitaJ
         yw5aCjp6RO2LeLv0Ttw01Dd1QQGrUxTzSPut5kqxDRoh+i3fdA08dgGmIR4E3gwkYkTf
         O9hQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqlqlwFD3rlr76Z+MU233kL2cFKMfYGf9oWKUap5jUCIu7IwUzGOJfflbGX44lrB/BANsKfZisFEQSQOdT@lists.linux.dev
X-Gm-Message-State: AOJu0Yzj8AZM8uc4zeXtqxxug6XcS456odjujSammuAaozniXjdb4KZY
	fNCDDzLT2/YKxBNyik1CJEBvKoZINHxNnt+VLp+2WXUdFKfWqtn+2InB
X-Gm-Gg: ASbGnct7Qp0TrMXr/nzpksq3gbbB8DEYxIqEkomAiJxC/yRoqJi2kxMKG/10FLuu0sA
	TN+WhlqzJMnO5EswbE2H3fmFocRdzJgrn+sdLnMB6PLIe1eeH8oJ+9zAp1P1Mw25qTYDFq09Vno
	WuI+w2QbpNBGE+wTHZa7cFLmOBOQnCX4svgPEuXGjY+7d1nIAk+jJRIX0qzyap+bwTML8g+VNkd
	HI8IwhaBx8De/21L1QqgpAzbkgwEslFkrUtnd7w6zuPBLtua4PRogHLYgwiPJKDquDpQTZIB8KB
	ib8XqmvLb//1PyrtCFyGWXf4KB9vK15rzDLf6x0hASfxBG18KYlRNBcAfU6y2amd0PKgonH0KRN
	O25WMGOBuB00BZlf1hUImCqmJlpwvvUlxExWXlpzjFV6ziWg7L5x4ApbMxODmDeFJaP3fBWscgU
	sJs/vQYJbum+uVwRuv8lcvcfmsDHM=
X-Google-Smtp-Source: AGHT+IET/L3J+QYHxiket2aQeo32G4hu1ru3eL3/lY/cNs4Z6XvnWh8uMVYVGGR6Y1EJjCps4scrKw==
X-Received: by 2002:a05:600c:3587:b0:477:5897:a0c4 with SMTP id 5b1f17b1804b1-4778fe59a00mr110607835e9.4.1763390434298;
        Mon, 17 Nov 2025 06:40:34 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f206e2sm26788218f8f.41.2025.11.17.06.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 06:40:34 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: johan@kernel.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH V4 3/4] staging: gpib: Fix SPDX license for gpib headers
Date: Mon, 17 Nov 2025 15:40:20 +0100
Message-ID: <20251117144021.23569-4-dpenkler@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251117144021.23569-1-dpenkler@gmail.com>
References: <20251117144021.23569-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part destaging the gpib drivers we need to add the
WITH Linux-syscall-note to the SPDX license in the gpib
common includes as these will be part of the kernel headers.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/uapi/gpib.h       | 2 +-
 drivers/staging/gpib/uapi/gpib_ioctl.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/uapi/gpib.h b/drivers/staging/gpib/uapi/gpib.h
index ddf82a4d989f..2a7f5eeb9777 100644
--- a/drivers/staging/gpib/uapi/gpib.h
+++ b/drivers/staging/gpib/uapi/gpib.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 
 /***************************************************************************
  *    copyright		   : (C) 2002 by Frank Mori Hess
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index 1cfee6b44ac3..d544d8e4362c 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 
 /***************************************************************************
  *    copyright            : (C) 2002 by Frank Mori Hess
-- 
2.51.2

