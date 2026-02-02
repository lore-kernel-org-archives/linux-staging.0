Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E626D36C0D8
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 14:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770042057; cv=none; b=k1m1K+Zja13fF31KdWrDbk2KueMOp0Q7T/UgbPAIr3K4kPDKCe4fGwsoPIbogVzlMpQ5pZjl3nBTHugywNVrJO6X+bHiKUhv8hscXoG/f6sbk6IvEQKo0tmlBna+5nOkgHgtYTI7wsYBD9gscInwiEcz1mHCl6TkBxrRkuEhAvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770042057; c=relaxed/simple;
	bh=MBYm1WDp+n1vNV/e96+fNeYRSxsIZe8YZeqqMvth1Gk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CH3hSthCt1/Kh+m5pYbl9WzVX/JtCBBXmZIFAeq62pHd7DvvBGv5J9bqUvIC886VkpmPyeZyiq/MGdBIFflbjCTAa9v0deE8Ap55Q2KSz7ksFWMsizHUErpe9lsZV1p78alphxN4x7TWemRph1L7qrzpT4BYTqhwD+NnQZEawoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ix/wfyRc; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ix/wfyRc"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-794baacdefcso17274377b3.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 06:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770042055; x=1770646855; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N3+jeQ1yyBjYwz5Y4Slzhkp57vYmDlyNtqZI+k++T0M=;
        b=ix/wfyRcCkhWiiIxADtIO7fscquiXHKhSE3xahjk2wH/XhFjYIaHbMMbCcumqMemku
         8gjol4NVeHugU6zUkFMiZcAMzOgFHvlnPTbkMaArra8ghVxaZAlhx/SHRxW1CyJDli6Y
         xTrgzgiQmHMhHVJYWyLVi9M36clZnXOYyDuC9FgPngjDBIvU153UGvvjOTOOhUZMuHOp
         Kdhwew79SzhFM0t3ShxV0s0dw93GtGP0pWN4gmu6p3Cq/CXNqvjuw9vK0pTtHr5AIYYw
         t3t2TCLNdGen9WXxO2bxhdhLDRGtvyy49BDE/PKw7xHtwmMayRPNd9FL9vgOHI162WfL
         JvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770042055; x=1770646855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N3+jeQ1yyBjYwz5Y4Slzhkp57vYmDlyNtqZI+k++T0M=;
        b=U1yIuYkVS9iUI+9/rZu65VNtbEr4XdKtrIExEo95bo/jYytNT4dVhwIbkcwXShrbAO
         6jKeAz+QyaZnxgGGIGFhNokvuJP/Q/kkIWLpREy9M+LxVBwBoHxC8dbEGJw7BLPn/33d
         fVGxaHqCozx67i4srccnaMP7QUKx2agN260YqCVVMn2GLlLAHxUpitOXjUzltcbqzxSW
         b9SNp8c7R8jsEsmGOqJYxZrfv5hMPxJYSK1aumpHxqjx0+LfQi3/OypaxtetX7xgTZPp
         kb//8Ck66IKQzDiXPGeu1JI/ivrKrfdjqJ2gxvvU8somksr0P+Xb5DxpjHzEul1ib3gK
         nctA==
X-Forwarded-Encrypted: i=1; AJvYcCVmx9e88qHdg/JN7y90S9+xpLul2vJRkRve9w0y3PUSpe+pHkuE1uNewYEv/7Qca/YTzKHt6HuGKcZhCCjb@lists.linux.dev
X-Gm-Message-State: AOJu0YwrM5aO+eJvtUvp3mrSjVLhojxRlrji/u7GYNae2Gt6jNYh9m73
	uD6XMN1YYxfW9c4bV67JjPPcQOf+2tSbErWKZeid2RXXyJcd2picaQM9
X-Gm-Gg: AZuq6aLTzTc4xn38fhXKTKA/hsFCkzcgJeZ/L8Qc/11PP+M9jZ7cy6DbsLl8fqZvxRF
	oWbPp+ttT8Ux45hrn0eckRTXdpV8LkU+5Wjq1NdjRkpy7Y9d36vV4lVcK2OI/fWqdLWbJH4E9Pm
	U9Q6hcTo8qXhWoJovNQRnQNeCQUW+tg8SW7Mx+ISmvimb3iY9v7vVY/xB8rfiIXuDvoPHZNHm06
	5qyaEVzTS8FDXFwcMOcVsAB2dsQd42BhBNYhSxd5xNdSZd2ANZCu4XSEEBkdgg5gQ4alYTdzVby
	rlfkv3x65R/+r6e3hLhsN4+u1qnM5qHufiJZz/pTtK58iKqy1Ki8JgLOyvnA00GS5Gd6zrifiOP
	C3eK+lVf78b1vQKecBdPcDWWmqXiem1T0K6BqdyE0lhx56XfLm2cNrnH308P0f7V3WRGo6h9dxb
	r7K8d8zBIzbx7UB3v4xCgtk9MO/o/vI2LOJjAYPCvqtGIU9tbCwHBO3iePGNsb39gV
X-Received: by 2002:a05:690c:6e8b:b0:794:a165:1c3e with SMTP id 00721157ae682-794a1657a1fmr212284727b3.12.1770042054806;
        Mon, 02 Feb 2026 06:20:54 -0800 (PST)
Received: from gustavo-arch ([2804:14c:f25a:845f:5b8d:2e7c:d238:2d28])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-794b2468901sm47292927b3.22.2026.02.02.06.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 06:20:54 -0800 (PST)
From: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
To: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org
Cc: ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
Subject: [PATCH v6 0/2] staging: axis-fifo: refactor and cleanup
Date: Mon,  2 Feb 2026 11:20:45 -0300
Message-ID: <20260202142047.30704-1-gustavopiazdasilva2102@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up the axis-fifo driver probe function logic.

Patch 1 aligns the struct types with the OF API.
Patch 2 refactors the parsing logic to be simpler and less verbose.

Changes in v6:
 - Removed the helper function axis_fifo_get_u32() entirely.
 - Kept 'node' local variable in parse_dt to avoid checkpatch line length warnings.
 - Removed dev_err() calls in parse_dt as requested by Greg KH.
 - Fixed checkpatch style warning (missing blank line after declarations).
 - Ensured newline at the end of the file.

Changes in v5:
 - Added missing newline at the end of axis-fifo.c file in Patch 2.

Changes in v4:
 - Removed extra blank lines in commit messages.
 - Added "rx" and "tx" prefixes to error messages in Patch 2 (now removed in v6).
 - Explicitly listed changes in individual patches.

Changes in v3:
 - Split into two patches as requested.

Gustavo Piaz da Silva (2):
  staging: axis-fifo: align fifo depth types with OF API
  staging: axis-fifo: refactor device tree parsing

 drivers/staging/axis-fifo/axis-fifo.c | 82 +++++++++------------------
 1 file changed, 28 insertions(+), 54 deletions(-)

-- 
2.52.0

