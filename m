Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7362280338
	for <linux-staging@lists.linux.dev>; Sun,  1 Mar 2026 15:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772380402; cv=none; b=bMsi6H0qQeg1yPoHEGYVWQCTpjRZ717eVTEfAIUILmZiGV3xW/b8CdMUmO3wMp+naJ+UIH9+nmJF/lrRcvnYIpExiRYY8wI0NI0jRZnDe+3EnH27k8zIby8J7xqA8CEZc0NibN+1imhXqp1Bvy331ljN4m/7lJ1rI7yl8RtxDBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772380402; c=relaxed/simple;
	bh=E6P4zl+ogSsTKWQchrlBIkwXXzS1ESJHwt4Bjw9TtEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QSj5njzRibKDmTaolXWzAOSISPFRI4O/DyfFuRKlrZR8vcS4PI2tmHg7nGiyJE9355JB3n/ZwDx0ZMcLT21XKghfmROnYgPcKIA6OXEivVVdhIbyT8GfYKGXKhMCB2FAHrbPQbm4jSen8rKkcg6Z7vji9r6MYEitVYvlkpFOiA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gRhV73bh; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gRhV73bh"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8cb4081e82aso507162385a.1
        for <linux-staging@lists.linux.dev>; Sun, 01 Mar 2026 07:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772380400; x=1772985200; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1fSiNkGIlgUwAF7H+ltSh61FP6xahZB5t8DbtiOF+B8=;
        b=gRhV73bhPUN86mkJpAD3x83lvUfRjWTOp08MMEyN8zdhi6BT2PjpWxZkQnfEy6Wfkj
         QiwdU4ekzA4dQZLsXKScGGm+ugLxemuTouSClGfCwWxMK59QMdiodvWGAPK8bAQj7jlA
         i4TbgymdMGMOSN4dtkjQC1Xvzhm4dFCteWPg/W7uxqm4hvha8D6eqBE+gIpT2ByvuCpB
         G9RjPxQGPMUTMwxEOokhnWg3MjboLLe+nru0ypPg+SNbgTr2sLtKfl3eizaUL8NHO46D
         3IKv5tahFhQcD0AgJUCKFfzBqMTv8gJQBanDumpmEnwoQE1z6zIFpCN0Oi1WU+FIcR7z
         PSWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772380400; x=1772985200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1fSiNkGIlgUwAF7H+ltSh61FP6xahZB5t8DbtiOF+B8=;
        b=nUrb+BbB2Dm3mUiaXkDQ3iDj7guu2iYc14JU8/igCUxk89JE3vMx+c+Uj/Kg/ps1iC
         adMaOMyjFi4fzkrQatdWg1G/ejwbEHFL7B8nTbIyTukTjVQmVuPAQl29vF7M3gs6Lbts
         9FTR9ubK/PYm+JD4wIAxGURdn/4zreQ4IvU46JRFc88fbfeTZcVuTvmq+5258vVGZ8Rg
         dcZNL/NX63DU0otcVJ5dxavRej296OpX13+vK4FkUtBvSAU9Rs5Lhomf5tjXuwi+lRgb
         bhfJE3ZnVyUy4Dh0WWeeipx0hqZEYEgQZl5QPVnHvrQmLuR7E4YcupeM96I6+B9nx76Q
         SknA==
X-Forwarded-Encrypted: i=1; AJvYcCWRJ2ht5X8tY9VFZOjqmEnAuJkkXdh2MSCm24bfnVf7rZC4xvGR7iWb9XEtN4/GZRCX7soiW1QNTTBYZ6uc@lists.linux.dev
X-Gm-Message-State: AOJu0YyMxomHB8Q1ja5xms3dhZ+ec0rgViULH5Z1I9wVIFgc6/vZD4Z3
	alYBMr7Sd+vvC6pqJ33Ixtmge2UmgYEEQ7qPyF2vcwlXM+VsechAPoYF
X-Gm-Gg: ATEYQzzOp7d+0tcPGYIyd8OBydY4/lgyQBL4Lr/14rBTyYzXd84rIqHP/TWs9MH9HL1
	wPmaEwolqW46kQZSrKZWdx/tqSZLzKPd8Zqi20O4fnpqrrG7FcufvAd34+nZYpmtZEx2mSOiGAN
	hXNnGtViHoqNTyMwBBh56NsxC73jm5zasY18EwcvYFw7ucoKCtDro3ELhaTUBFYJOWAWKgEazFM
	aeXSK92kKiOLockFQAkzo6v/2n0XbVq0tvELrI/0qkDzfRxM0vEWYV+wnYcw6Y8Pn+SIZhjLnso
	ChEXT5H5MFnlmFo++2q/RIk4mBLcfPaPPD34rv3QeFieDA/qIb1F2hnGv4Ecmhk4a8dCOoHQjRP
	mslPhTWdPTi145ddmd+g63MhTod6VooU2QnXp1ma+85oY32xkXNzJhrGu5yGWG5aEn0fNdPkC9B
	6eKdAJFY5hImxckyfjDuHll9nJzfS0ESdBDgNckd1xkbbcR3h6yu9Uvt4rpJAt4slCLmlTMZt9K
	Mi/
X-Received: by 2002:a05:620a:28c2:b0:8ca:105a:298f with SMTP id af79cd13be357-8cbc8e1a508mr1320025085a.68.1772380400568;
        Sun, 01 Mar 2026 07:53:20 -0800 (PST)
Received: from instance-20260207-1316.vcn12250046.oraclevcn.com ([150.136.248.187])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899efc810e6sm21128516d6.5.2026.03.01.07.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 07:53:20 -0800 (PST)
From: Josh Law <hlcj1234567@gmail.com>
X-Google-Original-From: Josh Law <objecting@objecting.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH 2/4] staging: axis-fifo: use lowercase hex constant for consistency
Date: Sun,  1 Mar 2026 15:53:16 +0000
Message-ID: <20260301155318.2596519-2-objecting@objecting.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260301155318.2596519-1-objecting@objecting.org>
References: <20260301155318.2596519-1-objecting@objecting.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All other register offset defines use lowercase hex digits. Change
0x2C to 0x2c for XLLF_TDR_OFFSET to match the rest of the file.

Signed-off-by: Josh Law <objecting@objecting.org>
---
 drivers/staging/axis-fifo/axis-fifo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index d5533235cefc..e154139831ea 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -46,7 +46,7 @@
 #define XLLF_RDFD_OFFSET	0x20 /* Receive Data */
 #define XLLF_RLR_OFFSET		0x24 /* Receive Length */
 #define XLLF_SRR_OFFSET		0x28 /* Local Link Reset */
-#define XLLF_TDR_OFFSET		0x2C /* Transmit Destination */
+#define XLLF_TDR_OFFSET		0x2c /* Transmit Destination */
 #define XLLF_RDR_OFFSET		0x30 /* Receive Destination */
 
 #define XLLF_RDFR_RESET_MASK	0xa5 /* Receive reset value */
-- 
2.43.0

