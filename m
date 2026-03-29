Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4821F2C15AC
	for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 11:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774783501; cv=none; b=Nmr7HlyldC2UxwzbZkiL1xx+Fc7wA6JPC+cjghjmsXRt/L9/RSRz3Rx1IGUm6IC/h/B6PzBCOU6LZrOUhRUjQcLIa0FJBRYGmXTCkJV/2FRFQMWAD9zoBDq6o1rfgrouTU0L/5zccS+vJuzJ+Ro7+S/ffGQyq/TUv7ZdLCQEvdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774783501; c=relaxed/simple;
	bh=iZrjzKNbZJWiILraD5gk0B5Os6Fan4Uxa0X2Usab7Dk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L2lyAy6QmTYri58pxVV3jURJWRf8eOBq678yt2aMNRMTes3gY+BnvzpMqjNm9XQNuvwjXWY+mxvYwPJa/ProIsJcfwJ250ruxtQpGeOm/PeQ+sOizkxD2HDnxZ/92Ssh56RiCTylHHNfQRRmpPH6AvgO12TMcD1iBMFuglvvdhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QwkxAsXx; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QwkxAsXx"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2c0c955a481so5974913eec.1
        for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 04:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774783498; x=1775388298; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZTnZYp+whS6H00aB882o19tV2H2QLAWalf0xzF7QaaE=;
        b=QwkxAsXxa+IPBtJ79z0+my7Au3+sFNSCHHTlRl/tDKZmwrdzg01hgfQ3zyRZfV0cgA
         Y27z/dZY93lUVXCYKYAyU3GACoVOTNEWPqlnBLc2ORSWZL8F1X+Wz69FbP3+6wVfNMPT
         qoqsRjadC0SikBqstBVgJyGoT+VWUz26fJvJDdTc2efEaf8rCb44zUZY5+eJyCSocAQB
         qnm5ZRwNOrfPCF7Wzh7nkQlYjLOdOWO4qlWqMAH6jMDhqABFIiLp1Ap5AJ+UOL0CV4oV
         +Vdn9L6JAAVk3JmOFaqlBu5ZkiTu2yoJCeGohHDQuR0lzBvDx6z4s0L5h5QFeBgZx4aY
         RoYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774783498; x=1775388298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTnZYp+whS6H00aB882o19tV2H2QLAWalf0xzF7QaaE=;
        b=gZPhrRrFtSPJDIL3RnVM/CjGQulTWikh+auoNX1lZfbfSRhvfiutoW9JzliOLU3ZiS
         dOCoU8VOnPw07c8Fsr7psB7oTgfz3mVsPi7huj2TwNX+YtbvPAPBdcqzxX2k+LHG/NsW
         J37RoVKEYLno/cUw00zAeqTclBhmfNlTEH4tgYoRuwIkARuKB0NjaTtLP75MhDN2zln0
         IQwQsFZa2r7k8zWq0KU3oYqtPGtEQFqoSNMTNBJf0UQrWSXeSfeCU7k7d7pQ341+g4Es
         PCm0Oz5LUCqhXTdQUxuTcx4YRUbakvdkc04lKjpWEi/R51aZ3dElcZ/sHG/N5lXiGgmA
         m++Q==
X-Forwarded-Encrypted: i=1; AJvYcCWHAEzb/qngigHBPt4/JnggVMnM/Kd/UvqQFHAxrkfy4KfMnX+kB+WZ63mCHVapRm7+QouW5ub8HxSW+9nT@lists.linux.dev
X-Gm-Message-State: AOJu0YyNa5aTSAi2T3KsVZgOJrrGfV/l8d+rORgQ1QCkLW8Rv4loKiPn
	JgHyRUmOZdp/zBFi1P78E4gr3FQceguflR8QfIdjx5sIixJDotj5HrMu
X-Gm-Gg: ATEYQzxADoq1d5CPHvTSZrjqupk7o+lEi3THSZW3drtrYl3FUPDpBHFJ8dAuAQ2V/zn
	sXx5DyEliTanWBLPNUN+k3NlnPk9pgxlt4JgOoLu0EtwsOp4LxP0Y5HLDUVGel4pOxRPb58Q8G5
	zP0XGiv8cnzeJKWQMZNChDKNWYxN+GqsZyELWz1vBn2BEZr3dxkbc3tCNyA2TR48LgkDJzis+dp
	IF+fBeO7r4saeljHwzYNJS6SqFLvD+S/VU3rwYiNPDP710RzpNFAmbTXyrFrYpc4D0yFrUW0/5S
	SXJUB1EH+zM4SL2xMPpFRzVR9azUpSb8inQiQqKsneIWTByFZgytrsSzXBeipHjsqweN15PsvcI
	rkwPObXafz9gknD9ecSpgjsnATic67wsGMGSUvW2em1qeOrk1PTpHaK+SqaUjzF+kG3bTzhzO6D
	ENYdDICKGB91feoM3Po8iACNhnS9vpuhLmnnKeOQ==
X-Received: by 2002:a05:7022:f005:b0:128:cf5c:5362 with SMTP id a92af1059eb24-12ab2884d8fmr5089494c88.12.1774783498217;
        Sun, 29 Mar 2026 04:24:58 -0700 (PDT)
Received: from localhost.localdomain ([20.171.108.164])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab9864810sm4642238c88.12.2026.03.29.04.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 04:24:57 -0700 (PDT)
From: Tanjim Kamal <tanjimkamal1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Oskar Ray-Frayssinet <rayfraytech@gmail.com>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tanjim Kamal <tanjimkamal1@gmail.com>
Subject: [PATCH] staging: axis-fifo: fix alignment in wait_event_interruptible()
Date: Sun, 29 Mar 2026 17:23:52 +0600
Message-ID: <20260329112352.31917-1-tanjimkamal1@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The line was misaligned. Align the arguments with the parenthesis above
and wrap the line to prevent crossing the 100-character limit.

Fix a CHECK issued by scripts/checkpatch.pl.

Signed-off-by: Tanjim Kamal <tanjimkamal1@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 3aa2aa870..1c34de020 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -246,7 +246,8 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		mutex_lock(&fifo->write_lock);
 
 		ret = wait_event_interruptible(fifo->write_queue,
-			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);
+					       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >=
+					       words_to_write);
 		if (ret)
 			goto end_unlock;
 	}
-- 
2.47.3

