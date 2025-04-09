Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D84A20FAB6
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 05:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178370; cv=none; b=hg4SAwaOct7U2jB0jwXILq1JsHkkZsraBryfSrcwZao38hIq4vbD9lK6eaxv6xfDMED2FCDhCTxM/Zp7VOdC0OykU/+P5igAiP38ZHeK4cpkN3GVjtOWCffmYil7skYif1X9nKBBPTaUZ2ws7rEEe8FWh0neLvFIMd3GwfMc6oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178370; c=relaxed/simple;
	bh=bnOEpAgszHqV183TiTZpNDLiDy5SjR9NqKMUBuyXQPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mA6HexfHT8eqAIkg8o2LDBibfgshrr/BdxA6pC5k4EmLC3Y03QNu4glpOMryaCEot/0d5rutYsxMV5b62Eb527hw6dYiWkGkoszkHEx6IuLMsjxYXDFChDk9OTBDlX5GrJg+PsSF9NHGaC4KjE9gae6PXWkejNwRb7WMwqqkDfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=VSJo4j0d; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="VSJo4j0d"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3018e2d042bso4324632a91.2
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 22:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744178368; x=1744783168; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kYW2NNA+2M0Vl0ws9Jg30Dh88lZBV/bMfWO6aX463XQ=;
        b=VSJo4j0dGsEKwUeChaonu+ZlJ2n6mRYpKD9oQauqGynoEzHmfqEb9lyAjvYX1Pa6oM
         TTKI1CQsTcvuAj6eqNLBh8doRndCUViO2vp4ozh+xrSl8VlAWWqbPcaBdtPJUcOLdNKt
         aE4+cJJ/yuZ6rNBm/XbM3VjuTeuVjgJ+zjUdA3LWiX9EPvZO5MFthddh/pxS0zaEIPkj
         R6/eKqtHt59SrWdCEbGApuusg9nfWvbvDnNiSUdpqy9kMLMGNtlPtxtI1hqPMhq9vzJc
         KEPQHDJ+gqDffRcx9a8CV5Gq+F7bvo/FpWoGpXW8Ya7F7m9Vam/nnwx+OsYlpR57NpsR
         9mGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178368; x=1744783168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kYW2NNA+2M0Vl0ws9Jg30Dh88lZBV/bMfWO6aX463XQ=;
        b=AL24tZtq6P2HWxLryeylepHfmIYL8U5HPZ50XBrnSeJ6PJGneQ/v0radAZ/OjKTKV6
         /HgphOIitdmLlgYrO02XiRGZDPrYP1q3e6XMGYZA+B92kh+rBJ6mxxZrX0qMaJ7ZhVPD
         Fe8fFgFuY2uDuYmdTkxqNCGFfy/ITO6/UGjf8mqUEnYB5jb7T35x3drfVT/HJy9JtNty
         ScksrysQbTAlkmkKQqsBw5wg2hVQfDP0E59QgKkMZs1T/cEcut/38MC4znD4DRUiEk18
         c5xXYKViSfuiPsHV3PzbRzld4PWFufxkYe0/5qBJFsGg6fOVWRQP3EjvKXvuZIqf2mfy
         z+cw==
X-Gm-Message-State: AOJu0YzWuBx0ACY1diSMXEQ0dF4iMANeMUJ9Ny7nHnzIKHpNccyef31Y
	8WgomQio1QEI+dDwE9TR4H5ojTxdpWt3CrUodHLpPBi86D8bJF94kUF1B8dkeg==
X-Gm-Gg: ASbGncsSxHKOesim2Xhfci37ZzelmbKc6eBrpbEyIEnRUwGJbnERQzA75njYFnpya1G
	gnFWwwW56DGwKpblWva0Zx0vUXTd6K52vaTII+fFsq2ipJ2At8tNPaFui65mGIS8Vmb9Jo86RgD
	0+7xecDn5s4JRB505UAJm8Qr5h+8l9a8aK5JOsqbwaWMJvAwz4K60Y8EccXUyu4rIzG019F4Fdg
	vliuePVdAnDRMBdF/qT67LXzi8hjOpL/a5Qk++MdwWrvfr4K2dtZZPOERZ0iM+Tja3PrD7xUduS
	nz4nvFMlpp7vPir4z32nH67tZeTrUYLMlfE9nBLfF7erT3pxhGUzDVRFmbrsS/t+kvk0FpPaknP
	hzmkXirQQ2GcEQ1VM
X-Google-Smtp-Source: AGHT+IH5y8Af0uSTY1F5xbiHQYDz87apb78KZQCQ9yxl1j2FzAb0ftWhM1s5X6lHV87g+rmitKGgBA==
X-Received: by 2002:a17:90b:5344:b0:2fc:3264:3666 with SMTP id 98e67ed59e1d1-306dbc3e090mr2359719a91.30.1744178367850;
        Tue, 08 Apr 2025 22:59:27 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd12b599sm661785a91.23.2025.04.08.22.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:59:27 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 18/21] staging: gpib: rsc_ioctl_t now int
Date: Wed,  9 Apr 2025 05:59:00 +0000
Message-ID: <20250409055903.321438-19-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409055903.321438-1-matchstick@neverthere.org>
References: <20250409055903.321438-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style to replace typedef rsc_ioctl_t with type int.

Adhering to Linux code style.

Reported by checkpatch.pl

WARNING: do not add new typedefs

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c  | 2 +-
 drivers/staging/gpib/uapi/gpib_ioctl.h | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 72a9b660f124..6a2ceb7b0b59 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1970,7 +1970,7 @@ static int event_ioctl(struct gpib_board *board, unsigned long arg)
 
 static int request_system_control_ioctl(struct gpib_board *board, unsigned long arg)
 {
-	rsc_ioctl_t request_control;
+	int request_control;
 	int retval;
 
 	retval = copy_from_user(&request_control, (void __user *)arg, sizeof(request_control));
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index e9baa6724fb4..c3d82b627210 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -107,7 +107,6 @@ struct gpib_select_device_path_ioctl {
 	char device_path[0x1000];
 };
 
-typedef int rsc_ioctl_t;
 typedef unsigned int t1_delay_ioctl_t;
 typedef short autospoll_ioctl_t;
 typedef short local_ppoll_mode_ioctl_t;
@@ -152,7 +151,7 @@ enum gpib_ioctl {
 	IBQUERY_BOARD_RSV = _IOR(GPIB_CODE, 31, int),
 	IBSELECT_PCI = _IOWR(GPIB_CODE, 32, struct gpib_select_pci_ioctl),
 	IBEVENT = _IOR(GPIB_CODE, 33, short),
-	IBRSC = _IOW(GPIB_CODE, 34, rsc_ioctl_t),
+	IBRSC = _IOW(GPIB_CODE, 34, int),
 	IB_T1_DELAY = _IOW(GPIB_CODE, 35, t1_delay_ioctl_t),
 	IBLOC = _IO(GPIB_CODE, 36),
 
-- 
2.43.0

