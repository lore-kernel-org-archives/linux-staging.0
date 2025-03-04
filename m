Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DFC259CA0
	for <linux-staging@lists.linux.dev>; Tue,  4 Mar 2025 19:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741116379; cv=none; b=MwheM9DhRv6I1/3DcZg0kWdcMW3QbPOclX4y2LtDQq02pY3/39MfyHj3HaftJR4TaHrWgklbaqOduBNUQPo1ptSQQ7FsbqJZ62lE/Tzd4rJBxyCuJFXGTU0HhdMBac5wsloDzCgE4beJcPx2Z9c3NpBqRHZXt3+EUkehjRvW5sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741116379; c=relaxed/simple;
	bh=ctMz1e2CGC4DkzZBkLf4JtpwG8U/L4qitQ9Gn5V9CVE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TeNrCasfPr0hToEJsvtoD/e4eVsiV0JueQtS77aV2PZsfRIo2DUwJda4plsh3Rg9ulMiV+CLPa8PSjXDpbKuJRGnQoVYLFMesbRkBv8QbQ9kC3IlCxs7heJafxS95BOW98BVZkAtYvx1PEr/RjL2MoykybJWM7sxJd3RMDgKpP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lS/epQZN; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lS/epQZN"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2211ea911b5so15185355ad.0
        for <linux-staging@lists.linux.dev>; Tue, 04 Mar 2025 11:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741116377; x=1741721177; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dy8V4gjtpPMBJ5TaQITNkgOEfjsL8exmFfrxFWgLLqc=;
        b=lS/epQZNAMRz38B3Yjn6P0hmYQmyz2M/zISGZi3uBvYXp76K9yzUkRk8m82uj/4qXd
         3NogUmwfow1RNlvoqW3+vodFi70X7iTrOlJEPpZvno8eSyKwn46RQDvFEg89M4jGH61L
         7u8L8uYkf4/ElLXK/6LGRPkdLpTG8ju0uX81TE95tUHQQETgudFr3G2jfm6BDjJzvOcw
         XGw8NmuOxswTv9PaPs/smRGCiUb4kPoUGLxw903O2gbaYsZYvVTR9RPleFGW1bXSyG1N
         ipfqLrLuonbJGovVtiON/80JHDFTtysateK9goDIgqUJ2ESZZFOrA5fVpeCTu/UfNRAh
         trvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741116377; x=1741721177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dy8V4gjtpPMBJ5TaQITNkgOEfjsL8exmFfrxFWgLLqc=;
        b=GPbEC9dobKEFoCPAzzAhVU4d6+nlmkSYc4srU6GhyMvGqR2BuTnOYlkT62aLbipmmn
         wZPK3MT1oCsJMbwk93YovohgaEkO43C08nMxLZTB39cJg6MziXtA/Im+H7Z4osfk52Wb
         HD0X2LTAn3LBgtPXsZGZdohHNF+MzLps+f7SQlfOYbOLDrxVsIvjd3FLxRDTZdv684pZ
         QN/xOqmlfHrsiGUAq1O+1/nUSo9sxp9F3X8tmCeK98w+J+0SAfaHDNXjN3xlFvSmJdIx
         EPukKSqRWebiEDyoJ30wzWjmu7BG6eBXMcVe5LVC/UKTU0AItOTYzFuOLvZL9q6igrN4
         +/jw==
X-Gm-Message-State: AOJu0YwpXZBCJ4FzTpBuGozCoPmix3equNBPrjpjdrFLQbxDOa3m1xqs
	aZ9PulK8faiptXL1U6SSCxpXICCC8p8PSgFkC4b/T/gT/PRywvIi1XKNCA==
X-Gm-Gg: ASbGnctCNJrRyDhi2v7yrfG/PFMuzFMlxL7FLWYKZJRfJIqlWJMLZwp8UtMOZo9N97Y
	u0zQwiIWJT/rWy21A73wGzQGKnW2f+wVUqw2fd9JeAna/2y4TK1KrJ4wTT7FYscn4P9wSr6b/LM
	OtZrIlxkaWz3BrkovSBIqY3Iwe50Ot78CZB6nwpzhtt3GHo6Gvv7nQDIdGOECMIcm6zJOk30mWQ
	Hz7Z806Mlsq8jrhoT24QQOAtYDFBggMCklFzRudlOszj0ik/fKbsSSAYM9oqN93Kue8gJnk5jvM
	dyqCJNR4Al9VQ2Se6H2z5MDKITzhuJsk3DpeEGByqNrmzKN2gX7zJ/a+9g==
X-Google-Smtp-Source: AGHT+IEuEdk79yHkkrNDMvuEPkBCk96IopRp4oy1rlhPhqXw3QwUgWZiPYT5dvgCxIo6wTTUMae/qA==
X-Received: by 2002:a05:6a00:9a3:b0:736:3326:2bc with SMTP id d2e1a72fcca58-73682cda4f3mr39951b3a.5.1741116376754;
        Tue, 04 Mar 2025 11:26:16 -0800 (PST)
Received: from localhost.localdomain ([2802:8012:1f:3200:f1d1:c186:ba5b:8f06])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734d444a9fasm9341920b3a.60.2025.03.04.11.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 11:26:16 -0800 (PST)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: dpenkler@gmail.com,
	gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org,
	arnd@arndb.de,
	niharchaithanya@gmail.com,
	jiapeng.chong@linux.alibaba.com,
	linux-kernel@vger.kernel.org,
	Gaston Gonzalez <gascoar@gmail.com>
Subject: [PATCH 0/4] staging: gpib: some cleanups in lpvo_usb_gpib.c
Date: Tue,  4 Mar 2025 16:25:35 -0300
Message-ID: <20250304192603.40565-1-gascoar@gmail.com>
X-Mailer: git-send-email 2.49.0.rc0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series comprises three kernel-doc comments fixes and one commented-out code
cleanup.

Gaston Gonzalez (4):
  staging: gpib: fix kernel-doc section for write_loop() function
  staging: gpib: fix kernel-doc section for function
    usb_gpib_interface_clear()
  staging: gpib: fix kernel-doc section for usb_gpib_line_status()
    function
  staging: gpib: remove commented-out lines

 .../gpib/lpvo_usb_gpib/lpvo_usb_gpib.c        | 27 ++++++-------------
 1 file changed, 8 insertions(+), 19 deletions(-)

-- 
2.49.0.rc0

