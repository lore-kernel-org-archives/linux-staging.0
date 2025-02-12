Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75CC2046A1
	for <linux-staging@lists.linux.dev>; Wed, 12 Feb 2025 09:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739352183; cv=none; b=t81ppzTGa9DKYawUxqXYOvFGLXQ39x38soCVtwj1n1Yc+cK5N3N1JobJ8OudC5uN3gJXgvXNjns+r+tSm6Xc6PoDjJyLYwGu1d52JMWJmqqvf68lDMWl2lSThaE97bB4jcZqnQTn36UppTcccrsKiquTUPR2zcJnJsgC5FQ/77A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739352183; c=relaxed/simple;
	bh=zQgtlrGgU2i403MDcE/W3UsKyOZHuds3X4vIFaE7F+k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cLuonTqBebaU+obRlzRcnt6g9B+w/1b40pYjdQRNXUsB+ivGd8wdkNVcPsEZm/b8htvvMbV5Qzw9I/7OXz/ADkDshcXfAJXNPrLkrc4O9C4C2/9c9fDBllhwt+1Hqjd19XVKCbCupeJRgxtqqoiy0vmw9on3aNX3MXy2HIHVHFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jqy7ctjh; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jqy7ctjh"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-220c8eb195aso507085ad.0
        for <linux-staging@lists.linux.dev>; Wed, 12 Feb 2025 01:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739352181; x=1739956981; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IKlIbv0ydKkFArCDNqMZeYZ6rB/W8yZFPWOF9LQ+RT4=;
        b=jqy7ctjhVqyvsQbcYh0Q9fgpdAHTT6Gmmk/Jg29SGNz0mDmETFFOpxAtGBgREB3Exw
         r+c6EA/3JCb/JmSwatp9ELZZcRwYcO+OO0J0FXtf733RB83fxmP4jON7ub2/Ik9C1qgo
         1JpkAW97wBPsRTvLdd9QMiYV/JyL7AAN4GMU7fAVxn+OUZVTlk+1798PsYQ9M31FQkNz
         Y462XAQemUdEWocQ72v9gD5WDLPSg0NKq7s/OA1byBJJvKT8uMD6LDVNTnC6wPmRfw5f
         YncM+6NPRpocpCTW8BklFRHWWyn2P/Nldu8OZmI8Jw1zPfnn8pm20x4aUQd8eyJnOlKa
         kJvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739352181; x=1739956981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IKlIbv0ydKkFArCDNqMZeYZ6rB/W8yZFPWOF9LQ+RT4=;
        b=tzSio7c5QRN4bFabzOdfLPWNMVhZxap/74mE+AvteU0zRHCzvNqba7qSfA8/+rxmS/
         j3Xjuv1RQnwBNu6g7QdP3tLDVNBoaOkMZ9aLgBIFUMDQrrOcx4qDXyODb5oeI7KQ/lxT
         b+HB1KIEAkvDD7qmzQ/k4RdqB7HtXEjnohU74CfC9EZvuC/3EstjeE5DEG+wNMqsRDDE
         q8OYIz6yueqTCjjhd5oVy7CBYJpStXgJ9ZYA/AdG5BdfLXNOF9KA7jO0VWb3+P57VWbm
         +0I6sq8N/X8jSKtkwuop3VFF+BzuhW/wkmYEumvsF8dZhF9txVnLfuPyBhn0a1u1cBWS
         ZO0Q==
X-Gm-Message-State: AOJu0Yxj1JgEdmbbMK1UlB1ezej+armvxwRYQsBuYw2Dzi3QDw14Hgyf
	j5tqqmp5BYOQ8vlFzoafqZcvQ+v54Yb54OO07WQVkmdiyHx+ht/S
X-Gm-Gg: ASbGncs0AozGfWcX8vbknZb7dkBkKjcGBLlR7c3H99J6Jf1i89l8fcJpIv3+KQGrl/+
	3XRFE4ri/6iJloINprkzMdD9tyrNVH4vrtvdxVCtmluVfiopYauu6zyE0zjofThixs6nVp5xBA3
	1hRKrX8Ak91QYJIXtYApfI2W8vWI2ngFzjzLPxD0NNqGOjVswbHOTEAL6HAT2BTyvWDAfw8ANyi
	yy75vUy2LqGzgsbapVyJ4OygqlPmrSv3pKLG3nswD+0mF50sAFFiaYRMPpI3uoEF6NLQbPjiZcX
	dLxDJtcbA/S3mH/pqe9hHlzAIFggkJX+DZc/g52UtbUI//Z/2o/pGY6N892y+DVPa40tm/wLWE1
	D
X-Google-Smtp-Source: AGHT+IE5oLYTMyFHny3/RYjVJxsAC85hBSzY2pJoFOwuIMqob2VPFNiq2o/BVLmGBBQ01OeCii55nQ==
X-Received: by 2002:a05:6a00:1d9a:b0:732:1f45:fcca with SMTP id d2e1a72fcca58-7322c411718mr4580354b3a.21.1739352181265;
        Wed, 12 Feb 2025 01:23:01 -0800 (PST)
Received: from DESKTOP-GL3U3CJ (162-207-94-177.lightspeed.irvnca.sbcglobal.net. [162.207.94.177])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7307e29bd5csm6550442b3a.26.2025.02.12.01.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 01:23:00 -0800 (PST)
From: Ian To <onlyian4981@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ian To <onlyian4981@gmail.com>
Subject: [PATCH v2 0/3] Adhere to coding style
Date: Wed, 12 Feb 2025 01:22:53 -0800
Message-ID: <cover.1739351267.git.onlyian4981@gmail.com>
X-Mailer: git-send-email 2.45.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Edit the file to adhere to the kernel coding style. Reported by
checkpatch.

v2 changes: Fix some edits put in the wrong patch, thanks to Dan's keen
eyes.

Ian To (3):
  staging: rtl8723bs: format comments
  stagin: rtl8723bs: fix spacing
  staging: rtl8723bs: remove extra blank lines

 drivers/staging/rtl8723bs/core/rtw_security.c | 279 +++++++++---------
 1 file changed, 133 insertions(+), 146 deletions(-)

-- 
2.45.3

