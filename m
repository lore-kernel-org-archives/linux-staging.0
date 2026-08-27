Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6661F3537E5
	for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 06:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787811946; cv=none; b=igJP6FwB2g1fwmLxtJvn49ZwDujQPJ/9hBnTb24twIrNUHjhGsnIl5arNSG6PwjjfGHiJuUbVpFCLI7HfZcT33Kp0lgFcS/54NOqJjSE7l+AV21bkWALtQk79/wDNMDdMmnzbgG2yYCWzka0kxnEhv7bmgjaVeFuxfoxtOGu934=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787811946; c=relaxed/simple;
	bh=aHTSRDVJrAGh0+hItG8JMYF00k9u0CCqZJdDSAjkTUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nT3EXRvTy+qJst5m58LLKmkprNSazWJOQAXDds5DjAJsGZxYRe3lQqg5JcdV1ruVQma+p+wKjrY8vA/ofM+paBN0uyiOCjC6vhoxdMOtnVzBK49+1HmfWBQNO/HjR82n7TFb0Z4wMs7ILJizFd2Kr38OUYLg1Xbprxj3+JthYp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aXPc97Rs; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXPc97Rs"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-482e4998d28so812706f8f.2
        for <linux-staging@lists.linux.dev>; Wed, 26 Aug 2026 23:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787811942; x=1788416742; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H275nmNZhuFySBcS9gUpFxagGHoU0ikfQIf/QoCidkU=;
        b=aXPc97RsDnuGrKb6mfbUPhnC7Y77U6DIB/2ViqPGCRTUjlVi9pUMjR9P2urqC4247I
         3ptF5chCakcFWdb2hQuar4ZVHlFEhcgs+WvbL+ytozDCY2cBib0hG+TPRxGQ9+ooA0n6
         T38o+XHBUgIqBy12EwIXxtCe55CkKuV+1jxBFu5vxFJZaipUpyVM352hSABsFo/xU68C
         V30w67W353Em8eRdliHOkOODCcbobZSgHJfde14ryjlzTuOD2lnigygkcsnxjZS0vFjH
         ka9maAwmnbuLwO9vFfpV1x96bU5ydTShzaBxm3UHujBrGT5/wVDw9EVLjhmJEvDMsJVN
         qxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787811942; x=1788416742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H275nmNZhuFySBcS9gUpFxagGHoU0ikfQIf/QoCidkU=;
        b=mA8JnGZez6UKTXrRi8oClK3QFiOryPOEraOymFns5CdSQcAIZx3TyjfEqRSuFQqmPN
         vCKY99hKF7kWrUbFgFSu/vpcQquQr9QbkLvShAw+KoWhZ95InmFZSIQ8cqyZc6q2pOk4
         WQ5Y+20DoZuD3BODvwALfqRI8QrMKH1gRBNKdTAa1kxH5dtwBt89E/2SbYYSXr3tXtYD
         qftMXSiZxhx3Wjs4Kc9NFPB7yHon3gPo5LstgoFlkAfA6El7EGCfofIhQ4HPkdG1LJLK
         kz48LG1uM3WHghs1Ae9qBRXYc8JzRs39+eSx1+8EBHm68+edUAM+UPFMiYlx7c+vcDUN
         5SjQ==
X-Gm-Message-State: AFuF++m3h2cPi5H8SnSBOMWccmBUu5lHgbt0JgT/ee0DGKF+R1HkuS1I
	0+Dn94IargZXx2I7Wrz8lSSvuuC41hT+tKvr3u/amZytsS15Dy2iRM7a
X-Gm-Gg: AR+sD12OvulJ1QpgcqMXjw5y1YUq6gLKZBpqN5ArvEWJIYfvVpoguEe4ovW1Jr0RSAL
	zufqLk62ES5PcJdE+XyJkpjt+YSZqDtmEA+GWyqllP0IVgMOHtG2tch68ZmeTHPeD14rEvXhNlO
	rv9IH1NAW90tRbmALnvO5SqtA0StQc70LmhNoHJ09OpVK+10Du84NF14DbFO5hPKKvN/CxWcyVo
	teY/cn33LJfCS0+V+AFyyEux+e1k7BXL6RZcXeAIqa04A4y68sK+Tt7s6odDHpSuCMs84Wzru9E
	+Ffxj7AhXq9hi/AKbI0cRQ/NDCpDdvHgv7MiktLB+gZcQT76JytN/BdajG8qnWRRG9AosrcDcCX
	HBHsvxDZakXPStAs6d7Rom6207xk+fbGDibk4MgmdHqx5BLpIZ6msOF81hb1h3wWPvXjkaqJ07b
	Z/JiR14aF1L1oNb8FeYXH3hMVQMXYcAhgG24x0ltJZg8roKpQStsXDj35iD9fizycuGkXoIvwd3
	tvfujqTsb+hQXdWtsTDCX2E8RvFoY3D22P2eA4TKDkgg62RwEUB1A==
X-Received: by 2002:a05:600c:a315:b0:499:84fe:5f3e with SMTP id 5b1f17b1804b1-499dc81cd8emr110986595e9.9.1787811942355;
        Wed, 26 Aug 2026 23:25:42 -0700 (PDT)
Received: from DESKTOP-EHH7ATM.localdomain ([102.203.209.200])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4d08d86dsm24536605e9.12.2026.08.26.23.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 23:25:41 -0700 (PDT)
From: Godana Emiru <godanaemiru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Godana Emiru <godanaemiru@gmail.com>
Subject: [PATCH 1/3] staging: rtl8723bs: remove a stray blank line in xmit_linux.c
Date: Thu, 27 Aug 2026 09:21:35 +0300
Message-ID: <20260827062137.12937-1-godanaemiru@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are two consecutive blank lines after the #include. Remove the
extra one.

No functional change.

Signed-off-by: Godana Emiru <godanaemiru@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index 4260ed5f4..7a9d2fabc 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -6,7 +6,6 @@
  ******************************************************************************/
 #include <drv_types.h>
 
-
 uint rtw_remainder_len(struct pkt_file *pfile)
 {
 	return (pfile->buf_len - ((SIZE_PTR)(pfile->cur_addr) - (SIZE_PTR)(pfile->buf_start)));
-- 
2.53.0

