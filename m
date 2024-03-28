Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A1D7E798
	for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 12:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711627973; cv=none; b=ORdFgHxScHpHr+SHZmkWpregq9w0gin/A5xH/vp5oOQPHthcwjhgQz/sPs9XoQxxEd8Z1bAJ0/DyLGCHrfYye9+cxKGM+dzNW04hNstK0e79eyynJA9q73pRjWiyReaD4FsiDE4dgCj3oVkysYr9P7zYWxy93SeS9/5T8h2jngs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711627973; c=relaxed/simple;
	bh=eQPwDOS/et2gGh2U5lbLbgdW+2Fr6vfgAdlGcEfpeUU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A5w/hQAbJ0iHJlRmNWb1ac2LdTq4uSQSUdPPxWq64K/nxZxJhdD+vzYJf7NOkk2Y3ehYQ+RdIK7zHOJtkmO8DqyxGwrCHJXBV4cC5jGEyH+fhdFvw5WGiNtyiOS/TDuMlCyLzrFIgQ+r7PdS/NP0wilazaknh8ugWZbhafxIybY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HaMdgo8a; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HaMdgo8a"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d4886a1cb4so10399731fa.0
        for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 05:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711627969; x=1712232769; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IHDJ6rlEEebln0ELZLhFxdjJ4IMCGnn3th1c8YTYOtw=;
        b=HaMdgo8aKY0iQ2GfBgvU5NKvta97zixBrt3aGKeb5qCLhxx9NeuoSGcDzkGUC98Ym6
         QFxBcyNRpLrNfQm+PpgW914cdTs4oWEtEVikvPAWfkBVp8XjWl/nyzYN34u3wJsT4X2z
         7ozm6dk0zZuhjuIAuAczkOnoGMDQ6TI4rn/fsPkSvzz17mRj6UBdPmEed6djAqQYWqfn
         RsO638SG9YO699YAo6NMF3H3uW9YIBGIhxc25mcIeubDgJXCjbB4XCZdOH9ZcD0JcDfj
         qAjBJXIUSGSCUcl0hIqQnNfLUMm+nobjlriIpD5szT8RTqEEv133sW/45qZXgK1hSzxZ
         BIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711627969; x=1712232769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IHDJ6rlEEebln0ELZLhFxdjJ4IMCGnn3th1c8YTYOtw=;
        b=Xrsk3aXTT3w303nbmXn/XWXGF8Ni7x/3VlsPFazaXZa5NN07c0R5rntV8Y/lGkQ4m7
         JnXAsFP12831V0pSw64BtTZYI532mELLnHa4qml9TTNJvs7N+UcguMjZ4KSogqNwDKE0
         JlqEdfnEfTKNtPTW1zJEc1lZGxoTdD9G6zRKTZMVZswhdyKh7Vc9kIVy0eRxbj7XRqfa
         kklFblnZO7BptF5rcYmM9bATagJqBrNXl8YlPg5/BTwY6pgYqyQYW1aeHwVTPVQdibc4
         uXjK9miryhWDAM5K7bE7K5E4k5B0gll/AUyMuG17aTfY6tvFaxiqwH+tcs/LCQOpIje1
         fAgw==
X-Gm-Message-State: AOJu0Yz2vmJ4B6c27syU988IgcwlK9O2G7g3NWZaHiCW3vOPJ1QKxgDj
	XUQV5qYXXV9UW/tvWF50AsG+CYF4ZrSdB/V7vLcPReI/Uc2bA6Zx
X-Google-Smtp-Source: AGHT+IHwlz6BzdFgPSHNY37ZWQvhFtbbZArhAgaM/MNTbOlDBkFm7N0qsXklr2nX7WXuUysQCuB+Dg==
X-Received: by 2002:a2e:6a18:0:b0:2d4:99f8:8b9f with SMTP id f24-20020a2e6a18000000b002d499f88b9fmr2235018ljc.50.1711627969345;
        Thu, 28 Mar 2024 05:12:49 -0700 (PDT)
Received: from YOGA.local ([2a06:c701:736b:f200:125e:963c:4e4b:b7c5])
        by smtp.gmail.com with ESMTPSA id bd11-20020a05600c1f0b00b00415460a63ebsm1416456wmb.29.2024.03.28.05.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 05:12:48 -0700 (PDT)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org,
	felixkimbu1@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] staging: pi433: Rename vars, update param type & remove duplicated code.
Date: Thu, 28 Mar 2024 14:12:38 +0200
Message-Id: <20240328121244.1244719-1-ikobh7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset improves readability & maintainability:
        - Rename device related vars.
        - Update pi433_receive param type.
        - Remove duplicated code in pi433_init.

Shahar Avidar (5):
  staging: pi433: Rename struct pi433_device buffer field to tx_buffer.
  staging: pi433: Rename struct pi433_device instances to pi433.
  staging: pi433: Replace pi433_receive param void type to struct
    pi433_device.
  staging: pi433: Rename "pi433_dev" of type "dev_t" to "pi433_devt"
  staging: pi433: Remove duplicated code using the "goto" error recovery
    scheme.

 drivers/staging/pi433/pi433_if.c | 690 +++++++++++++++----------------
 1 file changed, 345 insertions(+), 345 deletions(-)


base-commit: 20952655235dd9b1447829591774f1d8561f7c6a
prerequisite-patch-id: 91943193af2fea74182be67fb583235a3fbeb77b
prerequisite-patch-id: 2cad031ba6a0782a67ab1645ff034a8be65c2e76
prerequisite-patch-id: 1a852ed8f9d133aec7c651fd9007e59e39c55fb7
-- 
2.34.1

