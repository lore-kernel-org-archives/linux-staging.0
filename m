Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDD51B142D
	for <linux-staging@lists.linux.dev>; Sat, 18 Jul 2026 15:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784387281; cv=none; b=KmMrUE6uMGQl/+LAj5OIHdL2XtNj/9BqYbv9/v/wRR5MmwmPGZ6fThCJXdW6IwccKwVYeWwjGH1hq76JdTzIUvgr3G1Mg1X6lD0gNwRi3bTqaMGTP3Lcr11T8HDX2Pr6zeOu4wAsMU7oXIvaGrRqpKwFn5Q7d5Saw7yKkPJXcKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784387281; c=relaxed/simple;
	bh=05x7CX+zxGhsw7H1cjqKbG4QrUrqBbted8urbsIYC1w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Iymz3xoyxc5BJYrYefx1ayr5FMymtDv6vjovK15lKoSzj2uqtTZdNI6bUICZkFhUFKFXrz5TtH7mu+t1vAF72gSx+tJJneViz5fsz1V2ThRu0SJQucqyWk9D5sDnO6oPj28Hu5eHuiZYWfoNkPfytmOQHUPox0PPPvgfojGQQZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fOSuJGEA; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fOSuJGEA"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c96b08cdd1cso5799174a12.0
        for <linux-staging@lists.linux.dev>; Sat, 18 Jul 2026 08:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784387279; x=1784992079; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ToFjATkctckbEeuPcSDJpiHKavCbws4eU2tpdAfj4VQ=;
        b=fOSuJGEA9DVKPqqLjGxxRTpSde2MA2uRrihEmx8z5z4nPMmQbPogMVNmRozn3pv198
         y+PQ/qyDzz8kKGi3KA+pF7RPAVW1LlcyzkZKNimImN5NpSmX1rQumrvKXrFRNgIOYqDw
         faWLPnPLEsNGr7Ijow6f0KK/7EYxCBBbBLlzoAXU5Eehz+XVHWVAjhGvv5a/CyPZpUG7
         JuPpgdm1RSk2uxosei1drVfLBa4FYY4UCOkegMcfrRHNFQE8mjmCtBlJNEPjoPs/XVaF
         NC00X1r07Mg40PPLCvPLI0L+2uy4j3K7N/DLuy1NY9whSZ7hr+3CqtqNvYuKnDAaoA7A
         whqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784387279; x=1784992079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ToFjATkctckbEeuPcSDJpiHKavCbws4eU2tpdAfj4VQ=;
        b=G510cPn+Jrv+WsoxtILma7Tyme3zY7ue/IUk1moNVGTnNQjAPjuEM0Y6n1+YnlrAOf
         W7FGwMgvA1VD5zDR+CULeUdP2uLVR3B/oG21Kl6rwnM4Gk3/h2trS3L0T62Cb1yhJLwF
         fstOG2hcqHvhdYXf9zT0KFYISlpuHaWdQnQO53lD4FncoTJ93TFzMc7QVmnCE9u6aoZ7
         TSDnf7cbgMRqij0MxuKwTRMxZzR9c67B53Ctp4qf6DNKgPKkClPYVqvu+kV9i+6w8BIH
         sG7ZLcmfzT6J8a21ll6kVvHLgBcqlnOZPF/0sLh+KOR9NQeq6m/eSggWXdqO72kH/gcH
         k4jw==
X-Forwarded-Encrypted: i=1; AHgh+RolnWZLbIqShssyZ1HnsFYoNo/WORAtxW3X0NC0rD2ku1AkCAXC2QSOH1Nm5vjncsqBfIx3qriXYgx8KdKP@lists.linux.dev
X-Gm-Message-State: AOJu0YwkP+sHiAibp2/hN904iLAZfrlSpgA6peI2Q5MWqlH3FgWKrs5Z
	R3GnjIsd7enTXT7eCTXq3SbxrlZFiljYdVNlenhze1CJ0xfDFScZT1aXAhL7ZHDu
X-Gm-Gg: AfdE7ckkNLj8mHSB79ELhqtMOhdv29s6BApbck/uj6lHJk/5Vyurm8DUsly48uHF+s8
	UNDnfTO0oYmDc2JdcstWaYvkD1H22Z8j2wVUOHpBQ/UiQ46fn+OkPeZbkc01limlnvRpStDt8Gk
	qF7XjGPzw8lkaRqs2ytopBNzCVPra+7ZSDBCQ1x2CmRujPNCro1kHmcfyhgjr7+hKqbpxy01KGd
	YSo2mWufQi8ik4eOzJhiLxT/+a4meZhzstUb/+sQBBhSmqGk6WWlKPKqbabrXPbUqz7GCgxMROC
	LIQybllLqMBD0oJnIBhOOs9aHcONv7ohH79HlVnZHgwZCG5L+ATKvBT610M+Y/YWjvprtsTBb3X
	i6Emx6q1HbbUcOBsZBe+dVPFZJpWEIDCi/T8T4QacfLiPvmuCh4YaqRuPAiGEs+INIt8EhSTOhS
	gZSG8h24G0bQFJdlESwUTuooQyhGovw0o=
X-Received: by 2002:a17:90b:5390:b0:36a:8240:2477 with SMTP id 98e67ed59e1d1-38e4b47be8emr7677619a91.19.1784387279286;
        Sat, 18 Jul 2026 08:07:59 -0700 (PDT)
Received: from kernel-dev ([49.36.97.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fdbd45sm18536687eec.12.2026.07.18.08.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 08:07:58 -0700 (PDT)
From: Aditya Chari <adi25charis@gmail.com>
To: gregkh@linuxfoundation.org
Cc: broonie@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aditya Chari <adi25charis@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: remove unused function declarations
Date: Sat, 18 Jul 2026 20:37:50 +0530
Message-ID: <20260718150750.1908-1-adi25charis@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtl8192c_translate_rx_signal_stuff() and rtl8192c_query_rx_desc_status()
are declared in rtl8192c_recv.h but have no implementation and no
caller anywhere in the kernel tree. They are leftover from when this
driver was derived from Realtek's shared vendor codebase covering
multiple chip families.

Verified via grep across the full tree that neither symbol is
referenced outside this declaration, and confirmed via a full build
of the module before and after removal that no warnings or errors
are introduced.

This addresses the "find and remove any code for other chips that is
left over" item in the driver's TODO file.

Signed-off-by: Aditya Chari <adi25charis@gmail.com>
---
Changes since v2:
- Fixed placement of changelog notes below the --- marker, per 
  submitting-patches.rst

 drivers/staging/rtl8723bs/include/rtl8192c_recv.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
index 1f86654f0..b63625ab4 100644
--- a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
@@ -30,7 +30,4 @@ struct phy_stat {
 /*  Rx smooth factor */
 #define	Rx_Smooth_Factor (20)
 
-void rtl8192c_translate_rx_signal_stuff(union recv_frame *precvframe, struct phy_stat *pphy_status);
-void rtl8192c_query_rx_desc_status(union recv_frame *precvframe, struct recv_stat *pdesc);
-
 #endif
-- 
2.53.0

