Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6152DC791
	for <linux-staging@lists.linux.dev>; Sat,  7 Mar 2026 14:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772892604; cv=none; b=fHcDYHJomfllc7MaK1IDSoSRmqzmUQmo/6XStTnPDjy4BnQ3lMa3BWsq/aZzOees+CbEVpPNnsi2JZUfiPaSQR0ANvUrlNtxYAxoQbSpzQoofsOIN4WznODDvqbF076nfeNQ+63Oo6IRVoEKhe3iSO/Oi1vcm4fVLjQ6AN+ctfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772892604; c=relaxed/simple;
	bh=KD+2tOKrOlbareEMhoIs6tHoWtHaZuqGmcL0jIFQO8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QHunValV5VTMx+CEoG/49t3WRLZm0CFhI24kgoUHGn44S99p2uTxKu/sFxLO/q1pwsECpf/MajCpycaqbF1a4qRcE0+BSeCd0KwpKT9eX8RYXDT2KoCC+Ze9SmJvJifNjUNFKJYzzUIo9j+HXYuYcYKfC1LlY/VuCb6Hp4Z8Ky8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dNuBgJA5; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dNuBgJA5"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-829759ca646so2046942b3a.2
        for <linux-staging@lists.linux.dev>; Sat, 07 Mar 2026 06:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772892602; x=1773497402; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=czdNAj4K0eRQ1+jtOgU111t/1zRT7GMt/3oVDAa4ZYs=;
        b=dNuBgJA5L1gQPMByI4EGjXrhujVjBJwovxilAKE5Bkxyxm7ZWwarnHci7/+4ahPwC8
         GL9foBx93UDx/DRglHCOxPkJkLJiMHVFL76Kh3/DkLQcA/eecNJ+S1PHrAEQ6ScOxENH
         BIosldEHBAGrBKGh1nMa8ZrtRa678cdwF95PL6QdQS9C/DMaC1hq419umhZ+DogEMZcr
         NGekN33jyc4vpk4d7SLztsZeYNQ2DnQoqO4lIXm8bCUjp2OXhNZ2ep7yot88b5bszTF5
         s874E8BtB/32mfeqcMiyFn6kuU20xf0Sp8dzJymBqpjL3xgLO8gOHe8ZBMWZ7IVoETB1
         OkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772892602; x=1773497402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=czdNAj4K0eRQ1+jtOgU111t/1zRT7GMt/3oVDAa4ZYs=;
        b=NiB7G8kHvzmeMqbqgKbfW3bEWJQLF3b5jdXFV6y/y5skObVp6dQKIccA1fkrppq+yh
         8Gxp6qHN4a4PxSSwKmR3QtOgQwenu3c+lp9AUrgTExRkamsULTppV/1O1T02oAcV+tSh
         jQV6Qxoh3drycuysYyKtqQHoyz9AyBW9gIBAy5o2U7MvB7HJDuyP4sQRU11hSPk4Fyf9
         odn09DpL1eMXvNqbDCjadC6GwKeudryveEf4b7BrUYHKl4DPzw5/2Kci8PF7oY40/jIw
         Em4cHR4Qno9HVwoIgFjPR2yGzsRvk0+r6h9J8CnaY2Pmcbvn9JAn9KLGFejqLJqEnjdb
         VOjA==
X-Forwarded-Encrypted: i=1; AJvYcCVic6B/MbO68xVgAhA8AJkAGimeLaG+ddFXPfmZaNUsXPnDQJ7BFtJ/S4IaaEMzi5VI9yegwiSnlCe12Ya8@lists.linux.dev
X-Gm-Message-State: AOJu0YwJjOQBoJqV02FpXL7WbZGC6Jy1K0dL1a0hKgxCuXBPX2t1Ydn6
	hLNiMwMRtRfmLxUWC5R1wUMTEVttgmZIRyQB/FracLjk7r0ckIH+kwDx
X-Gm-Gg: ATEYQzxNaulb0fOMxwLCg6A+iIEmM7QAhk8sc0abDqSBmWB6cnwaB+5oIWCJsI4mXJB
	FR4Xg2TAwDa7U8Sg6943rLPk1hC8Y1iU49Ekdq2AgqLAhxr6oHWCQphcG9RHAXUHgdoW8sGHv2r
	2NUeyFy6kPoACOfwtognrt3lMSJC3FaJG9vrn4ed7/5Op/HSE9AN59H5w4Nrnlw3NJaEsWvZSPA
	uWUaetgjzW1Civh2WUXzATT5rwbuLGu7v+kEz+0aC333Pjfq6fA8h/je6ZrVw5PXhJrRFnZ3fRA
	fjebplgBNOQR5PkP00mm14P75Jz2uh2H7/7SEmvUhzlGFP8bNkqGvAHDcM2xPURU/Rj1iHkji40
	2OM1yVAgRAgTOPtubydS2Gey9fA+k0XdOqjnQKX0G3+g+bYQU8AA/o7acsmPUjmOH9wrmVX7RX4
	z6n2tApYyCIfTZFbiXHUTavgFwHiVyuZc1iYPTkmFmIW/nYzbS+JW46CusspJ6qi1757wDZArZh
	074uMwGfn/d5s79kzch7AahZAPb7PrBCTQ=
X-Received: by 2002:a05:6a00:cd0:b0:823:c59:9cb0 with SMTP id d2e1a72fcca58-829a2db98d7mr5454772b3a.1.1772892602081;
        Sat, 07 Mar 2026 06:10:02 -0800 (PST)
Received: from DESKTOP-7ISABPS.localdomain ([223.233.81.133])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a46765a6sm4784965b3a.29.2026.03.07.06.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 06:10:01 -0800 (PST)
From: Rachit Dhar <rchtdhr@gmail.com>
To: 
Cc: Rachit Dhar <rchtdhr@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] staging: greybus: fixed styling issue in fw-management.c
Date: Sat,  7 Mar 2026 14:09:24 +0000
Message-ID: <20260307140930.1732-2-rchtdhr@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260307140930.1732-1-rchtdhr@gmail.com>
References: <20260307140930.1732-1-rchtdhr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed a styling issue highlighted by checkpatch.pl, that was occurring due to improper alignment of function parameters.

CHECK: Alignment should match open parenthesis
+               ret = fw_mgmt_load_and_validate_operation(fw_mgmt,
+                               intf_load.load_method, intf_load.firmware_tag);

Signed-off-by: Rachit Dhar <rchtdhr@gmail.com>
---
 drivers/staging/greybus/fw-management.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
index 5d01da6b6eb9..e20e9136c106 100644
--- a/drivers/staging/greybus/fw-management.c
+++ b/drivers/staging/greybus/fw-management.c
@@ -434,7 +434,8 @@ static int fw_mgmt_ioctl(struct fw_mgmt *fw_mgmt, unsigned int cmd,
 			return -EFAULT;
 
 		ret = fw_mgmt_load_and_validate_operation(fw_mgmt,
-				intf_load.load_method, intf_load.firmware_tag);
+							  intf_load.load_method,
+							  intf_load.firmware_tag);
 		if (ret)
 			return ret;
 
-- 
2.43.0

