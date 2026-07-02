Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A641F38D6A8
	for <linux-staging@lists.linux.dev>; Thu,  2 Jul 2026 07:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782975982; cv=none; b=lYm+DFz0i8LxE+mM8hDxl+5G54pmWjYFMfCb0Nw/6MjXm1QjyyV+D7rWfTuOM+b9hVV65+JaF3IlLKtZ3CY3qJsvu76GioyAtudQdLXb2kCfyHRgnV9daWSOp2Ph2Oux5iGYGYdCv2VnnzK7Fw7J92iHGF5KuNhk35HMFdqm+KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782975982; c=relaxed/simple;
	bh=SmLgwpO0279rQyG3t+/6E1esX3qzQX3VTD8kX/D9Jgc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qbnnvy0pbpPFdRIpmpJsiBM0vKfwvir9L/67dIk+qeyVdHf6CBrTT7OKP/JxaAi2af8gs/apn7mOtPAmVCovTwF5pDGsBNYSQ2Z/dLHkxUmNfgCiHtb92QPVolSEegFwcoz5+39bW+fpMrYOv5ELASkZj7jQPHvoYBD+HAumieE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nwWsJ0OU; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nwWsJ0OU"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ca265d6ca1so2857515ad.1
        for <linux-staging@lists.linux.dev>; Thu, 02 Jul 2026 00:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782975981; x=1783580781; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Obo3DWrcSSJI0VTLgU2funcqlbzsvG7w9ZzVK504uGk=;
        b=nwWsJ0OU8xCjaKJiaS+8++M91Y1F6PjeOX1zkRh9OhkkucMkOVV+NcunNZi1WpZ//b
         CUEJeHe6HPCgq15Vv+8hMks9xHrpEmmje/Zp7JVdRSauwM1uPo3vfE/5TEmJBLdLDyX2
         0GVa/+o1/6iCUTFOd9dsTCjY6scaEa4Fz8F1PXIWjM3MCiLahwan86KV51jTgAGH2yxu
         riLf7KrF/cu33wnubiwpFdYb+2/kiE43jMaXY5b0o8WW+Gb1/vGzyaJzfDDGv13THIg1
         NCnz2KecG2njqJf7Zj3eo8ZkL8CQCcqHhinaQ6ImwHqfJY7fR0osdMGqq4OFCEVZ3vXy
         1K4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782975981; x=1783580781;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Obo3DWrcSSJI0VTLgU2funcqlbzsvG7w9ZzVK504uGk=;
        b=GHAwOF+Ax5lhUCMzaWjKw1BXGCk7KI7abpCizyyUvh6SX6JHSYsu1JwKBnWmFba9EJ
         5oIH+R75FNJJlbG+mdim2x6ZLDnMqL2OdX6D++hWHw9Gjy7wgbtpHXEhPOC9Dto2NmLl
         MO35zVi4TSHw9EUUvCWopx2QNFmCrR8khqeG6FAaomtZr3qLspIj+oNJWnZbRmVUbZpU
         fJVxG22bzKkvAhLpoD2kiVWoO8g0MtzXqkrJjoBUeW5LUcfi1H4A9fR6HBCDDcmEgv2h
         gA3P9R5g4Hmf7Q34Hw3ZC3IrcaEMyQ6QiIfUBvndipC/WVluNNUj2gjyMsTxeHCaJgfz
         V5UQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqgprmz3NOTCVKCsKCEy5n00DvBSWZ/DxgGyzYF43kDp/5bJg2/rTmOi8gow1gNhoq7NOMZC+NsBQQrO2uE@lists.linux.dev
X-Gm-Message-State: AOJu0YwI5u/icctf4XzrWySEXR0SdOx21RqmvT1RxCBjkxZEOBkhT20M
	l1GK2SWlfastdYTQOdJWgHB8xgx9DWL5bw8+9GtCsMKm+cK4LNfy2W6L
X-Gm-Gg: AfdE7cm7+RLIu7c4ACB8D1EE2U35q/34nD6pQlfiYxQ83o9pv/2HWXQIIoIjE8TAkIe
	by/vSdEvSDsGPXlYr4bF5vyIPKZdXNufz7psfMa1HRZt4X+TKsix+oH2rlejMp8VMecmpzqvvcl
	GmztaDUSVz+kdW9enMt+mL1grF47K4MRCRU8Tsa5b6HWIP7H3JFzygeLFcP5k7xbwldFl8PTkF9
	+ssmccdu3avsbwRFNUHzUYsdrBZZAEw+NgvOqkwlRCKI55aN84gKf6E3/C5qFa6pL+TCWtkokHk
	0YHtC6Fzx9gHafthe4T3X1ra2VXhnCLn8RtRgQhNFJzCP0re8Qktz5CvVHxNC1N2ShTblqloAjp
	DztLXgdLGQBi4gAV9OVFjN+MxTfHPQzcc/eUR9liufps0+g4ur4mYcM1zYWNwx8VHdSQkjylIMb
	UJz9Vjsmq5AJp4ehpmHQqTs49STSsQkY1H842CjCMyYIUv4XOFaLIPcY9FBYiNuA7lFxHToYTF0
	3Gy6+mR4es=
X-Received: by 2002:a17:903:2ecb:b0:2ca:b3e4:858f with SMTP id d9443c01a7336-2cab3e48bcfmr1771545ad.14.1782975980763;
        Thu, 02 Jul 2026 00:06:20 -0700 (PDT)
Received: from [192.168.1.45] ([45.64.226.42])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a9124f2sm8865035ad.33.2026.07.02.00.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 00:06:20 -0700 (PDT)
From: Prashant Rahul <prashantrahul23@gmail.com>
Subject: [PATCH v2 0/4] staging: octeon: Improve initialization error
 handling
Date: Thu, 02 Jul 2026 12:36:13 +0530
Message-Id: <20260702-staging-driver-octeon-panic-v2-0-2c2b6ae086dd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NQQqDMBCF4avIrDtFU7Wxq96juAjJGAdqIkkIL
 eLdmwrddvk/hm82iBSYItyqDQJljuxdCXGqQM/KWUI2pUHUoq970WFMyrKzaAJnCuh1Iu9wVY4
 1lhNBRprO9Fcowhpo4tehP8bSM8fkw/t4lpvv+nPlXzc3WONEUl/aQQ6ia+92Ufw8a7/AuO/7B
 9RXV67GAAAA
X-Change-ID: 20260625-staging-driver-octeon-panic-2602ed8d5d67
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Klara Modin <klarasmodin@gmail.com>, 
 Prashant Rahul <prashantrahul23@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1918;
 i=prashantrahul23@gmail.com; h=from:subject:message-id;
 bh=SmLgwpO0279rQyG3t+/6E1esX3qzQX3VTD8kX/D9Jgc=;
 b=owEBbQKS/ZANAwAKAWw+kajX8DhtAcsmYgBqRg3p9RTyB8xT4IqjoOWTeMKA9tDl56Z2tCDT1
 5reDInDTK6JAjMEAAEKAB0WIQRS5esR6MP3hQs0SsxsPpGo1/A4bQUCakYN6QAKCRBsPpGo1/A4
 bQjBD/49+aiQCFHVpnw6F2lbzzlakR5efuOyrMVSSeOuygJvmALGuiX9yGrWP8CxyfmmGmrjO/W
 2OHsdklNDuHWS1Vx3SqVLNe6giUmoZzeZt+PCf2CkQfx/SmAI0A1IiY0qNPTQT6V2jPf6PO+W2o
 8atOJj82jcE726Ko0zPkOT7/hpeSRk39kiKjmMiaTGC0f7bV/yQvC2KpQr47YxZc3MJzkiYmJ5/
 e9gSZaZQW/Nlo7gPWZ5kBS3pc30COuYtAHm4G2DvOQQ6Ew6noyaQiz5lY0+2Kw7Fxqoujl/BSFW
 yzWvfIstMIYyAdi03xx6eJdYJETD556yPqjjxbLZPJkRV5xzrdjpznZatqnbEWZJxZLv73eV/Wx
 Y/gVJB5UyH4riBJ7I+UV5Arti1QGlZseCbm/A1IlG7U5LlALTKEszH3Ay/sjRGw3HvY9us35cBo
 fueepGtFIUJ32mUJtUTtCgewWXWdIN0wnfRBWxAfxbEUUhCM5oUoBPlcXRicZHfz74ovyDHfV7y
 zO3n4AzReorIlUdvSlwL7AKWV/nJF/TFuDN5tSrW2g8sriEVPCnpqYmwUzOXmXnplLPKR8I7h55
 iZ9M/VI/CfSSkPK6DAXXH7HF/H/SaIs0qCTvD+5QGMxFS/G1wOeaGw4QXs+8VKOXQYcOob+1aNc
 jhgFJ26olovQEMA==
X-Developer-Key: i=prashantrahul23@gmail.com; a=openpgp;
 fpr=52E5EB11E8C3F7850B344ACC6C3E91A8D7F0386D

Hi all,

The TX and RX initialization paths currently call panic() on some
initialization failures. Instead, these failures should be reported back
to the probe function so that it can unwind any resources acquired during
initialization and fail gracefully.

This series replaces those panic() calls with proper error logging, propagates
the errors to the probe function, and adds the necessary cleanup to avoid
leaving the driver in a partially initialized state. I have not tested
these changes as I do not own this hardware.

This is my first time working with drivers, so please let me know if I
have made any mistakes.

Thank you! :3

Signed-off-by: Prashant Rahul <prashantrahul23@gmail.com>
---
Changes in v2:
- ethernet.c: remove unnecessary curly braces around single line for-loop
- ethernet.c: dont mark cvm_oct_remove_device as inline
- ethernet.c: remove unnecessary call to cvmx_pko_disable as cvmx_pko_shutdown
already does that.
- cover: specify no testing

- Link to v1: https://lore.kernel.org/r/20260628-staging-driver-octeon-panic-v1-0-fe8c34989254@gmail.com

---
Prashant Rahul (4):
      staging: octeon: factor out device removal into a helper
      staging: octeon: Propagate rx initialization failures
      staging: octeon: Propagate tx initialization failures
      staging: octeon: handle rx/tx initialization failures in probe

 drivers/staging/octeon/ethernet-rx.c | 18 ++++++----
 drivers/staging/octeon/ethernet-rx.h |  2 +-
 drivers/staging/octeon/ethernet-tx.c | 17 +++++-----
 drivers/staging/octeon/ethernet-tx.h |  2 +-
 drivers/staging/octeon/ethernet.c    | 66 ++++++++++++++++++++++++++++--------
 5 files changed, 74 insertions(+), 31 deletions(-)
---
base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
change-id: 20260625-staging-driver-octeon-panic-2602ed8d5d67

Best regards,
-- 
Prashant Rahul <prashantrahul23@gmail.com>

