Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8092236FC;
	Fri, 21 Mar 2025 11:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742558158; cv=none; b=fzOv0OMEWobtKhh7yTprOEcSQaCL11QqxMRus8TdRdH5cDx/kBbPoAFF6X5hNOVEU59JRA1409OCrFpie0F1/HMPG4fUxpz3oU8WAiBBMkPFoEaih8oe6xmzNPnkj5nRCB+wrR+P/f5C4Ni/RvPcB1PLbC7QVtDI3UMiIvjBqQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742558158; c=relaxed/simple;
	bh=tPboUf0Zr+l78s8Qk+IxHCsImOBRnA97c2p4L+E040k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PyiGCQOxxLjiHJQxJKmi2tsqkMPS1v/s0MnSd6szPQfra8SkvZmYP/dN4z70ixq11WdbxmMa8Q5JJsanJ5eIZz+1fK+KQa9C/mHRrGPKSNwQZeSpWCGTVnZLy04erNWt/qN9fcqrzEUnOH1/jX93TdunheuT+VH56+stQi1OoNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DsmXk1YL; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DsmXk1YL"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso1681594f8f.0;
        Fri, 21 Mar 2025 04:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742558155; x=1743162955; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c4sDOHOmH2F/18zOsLI6QpBEwsBgeSty8cc2NNHzyKU=;
        b=DsmXk1YL/aekuwfwZwUsT6C1ypzWyxkRYwH33L2+oj4wP2GHFPiJbchjTP9iBkLkuG
         a5W02o6I/xPc/InlZ2eRVEftQyDIekKBZCpZcixDctLHw6iyZlvm7i9j+xAJd4merhg6
         foc5SXy3ZwjoMl2VxElLvs9lYvh4LctueCUnLOKz2nCXndDYNXXDyZap3QMzynjDQajz
         hjCVVbE4R5lEfv19JSZBKS4904eqznnndw2ju4WNvUVgzJMTcJVE+Y2Vruf7rvcMtGJG
         oSOS9qZMkHDxPpikxOFcWz8Ta8U56kHRaTliMqDGW9okjxbHEu9wbWFqP86/EOjmcuvh
         HKlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742558155; x=1743162955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c4sDOHOmH2F/18zOsLI6QpBEwsBgeSty8cc2NNHzyKU=;
        b=mdwewv0Qa3lf2jc/rquG4/0gSTndUmfXtGrcVFefQ6RIJ6qTabr1U11dnuPWT4vhdp
         cu8WrAjEZz/1mZUemfnbexRpX0IGQ2kHPPvnOpoHQGvHx0SWip3PcgscFRn4tsdPxlEf
         sdITgdq95ZnrtY9p4nuxTeBrSgGNW/63N+FQRSovt1pN4/rdXmfgEXLqQj0rxqHA9m3Z
         lSydePu5TRYiL4oBsgwga5lpNW0ziR+MwHrMqoqJBEnVAnyGSpn07Kxf47gkNNlYydsh
         620pPU3CptDYANgo05x3Z/9CJK8SnTkmX27G5hB1Cuy4QuHqFHWVXOXiyYj1vhOmUQ+6
         6j1Q==
X-Forwarded-Encrypted: i=1; AJvYcCV0rGGqRKqpex2wQFpQKDuc+kEPydBi+Pxw7A2VxX3xzE0Y7AHCp+Yj+Acm3MlbzNRJXZuu4QVydUPA@lists.linux.dev, AJvYcCVM9PgCy8T2ijkU8cdHLZpB+LzdtRgxEH8HTG6FsV4vB4JoTrX1TXo/Y0q7qJ7to0nzbv50zgrb6UWbTtOW@lists.linux.dev
X-Gm-Message-State: AOJu0YzL49XyZoJ6v8YGR/bLgMjx8zKuweSifY5Ttecx4zt6yRDMIGNz
	5NON1Zw4JDrK39D0qxYE1PHu8AW2T0FaPcfQK+2Le1z52OonMjUQifgPxv/ibDU=
X-Gm-Gg: ASbGncuifoWSdPKk2V12o4AztjI/gi8rjhUTFea3Zw+bTRNuAEHphG9hNyorVg3SmN4
	KJq/awlSD0hH2/li+HZMbcCssrEGExbtb5uqVNJ06MDXwgcRV2E8ZOqRMm5CBymzSy0k7OREEuG
	2trxNffqYgpwqjXNrJzt9Kf6oa5eVHbgCHkRnwxsQrKjHkJT7oCoPRnENs8+3uCCAipf2VLTGTl
	XMe8MtQnffSrygxOfEBDpYAaWHGkeCnAaRXLcF+Y7MAoPRIK3MPtRiOzIlJmECNbr0OLPMd0IGm
	x7EpfnRK2JzBdc9k8/pozA17BZQSSVFyKRrkQlfpVg==
X-Google-Smtp-Source: AGHT+IEGpQVJLgp09GpEuzAgmZJOX2/jxZFFMYn1wXHIxrgy8GYpeYc/67utxdndf3QlfJj/lUeemg==
X-Received: by 2002:a5d:5f85:0:b0:399:6ad6:34 with SMTP id ffacd0b85a97d-3997f9390bemr3262333f8f.35.1742558154743;
        Fri, 21 Mar 2025 04:55:54 -0700 (PDT)
Received: from pc.. ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9ef23esm2148164f8f.81.2025.03.21.04.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 04:55:54 -0700 (PDT)
From: ErickKaranja <karanja99erick@gmail.com>
To: hvaibhav.linux@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ErickKaranja <karanja99erick@gmail.com>
Subject: [PATCH] staging: greybus: fix line length issue
Date: Fri, 21 Mar 2025 14:55:45 +0300
Message-ID: <20250321115545.24468-1-karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix line length exceeding 100 columns in arche-platform.c. The code now
follows Linux kernel coding style guidelines by keeping lines under the
maximum allowed length of 100 characters.

Reported by checkpatch:

CHECK: line length of 101 exceeds 100 columns

Signed-off-by: ErickKaranja <karanja99erick@gmail.com>
---
 drivers/staging/greybus/arche-platform.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index d48464390f58..1a82a7a3991c 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -179,8 +179,8 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
 				 */
 				if (arche_pdata->wake_detect_state !=
 						WD_STATE_COLDBOOT_START) {
-					arche_platform_set_wake_detect_state(arche_pdata,
-									     WD_STATE_COLDBOOT_TRIG);
+					arche_platform_set_wake_detect_state
+						(arche_pdata, WD_STATE_COLDBOOT_TRIG);
 					spin_unlock_irqrestore(&arche_pdata->wake_lock,
 							       flags);
 					return IRQ_WAKE_THREAD;
-- 
2.43.0

