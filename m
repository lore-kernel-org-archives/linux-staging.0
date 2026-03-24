Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5057345741
	for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 19:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774381451; cv=none; b=IPcrn2Rh359jCsbg0anJa+YglqrElPw1+hZlGZIjKHyyhpQPZb2SN9jSa7xCtPWXkrP66xwsine5oYC+Ed+uYtXDqBuGUzkvqHOQwtShETpqnc9kwrWTdZTzHQye/r/EgbefvgsHFCt39jTW8sILAciAUuXFQitx4C7ZrkvpBO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774381451; c=relaxed/simple;
	bh=Cr1EGRtFDNYN4F0ds66Cj+wQr7wmiUbs4gw2kBIuGys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q3K5zTlrbLmIcpXHQCC0z76RCSgJTW5nVTvf4CtZNmYAkK+T4w/wmftu1WfhHaiIPbdwy3K2zxAQPgp0BFxDv5sXdm9fZyaxj2YYQLmDtUWRpEpfTCIR1f4ihcShC3TR0LoKInbQPri1Q0PBGYRDc4Tt1PAyzpqz33CAIM487ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JE5JINXy; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JE5JINXy"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2b061b6cf36so32877465ad.3
        for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 12:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774381449; x=1774986249; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x91fosFnDqLtUvCrhnAf87G3z2o0B5MR3jt+r9NyeJY=;
        b=JE5JINXyUk4G/MC81rVVzYfsgCZBX8mO3HidgjjU/B0NW9Gl93SNYIc42gyhzi3ACI
         hMAABAITMJDPfUn5X16OZintUy1ib01gG3eTUjIZx+u00hL44IoBouqGI8ospJV0+O/L
         K5QspXVDN9jNGtqImcsQyVcHomtDXCgf+wWfz2IttMZ6nT9J+1Sl8COOxLX8MOhPGkVy
         4t5yBF6v87WwLKTowfLGhcVedlFSEXQA+osy64UsxVlRdb3iPBXeUdnAOYxRGa8GCa5V
         GzTcq5EEFHr85hT++0etNggAPQw5lTZQgBCBihN9HOHbvqUixUjkipjRAU2VHsxR0XR/
         WeDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774381449; x=1774986249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x91fosFnDqLtUvCrhnAf87G3z2o0B5MR3jt+r9NyeJY=;
        b=EZPTLF6U8L3dkJ45JOVigpW1PXaV1j9e8U3WnngqqttI7UC6eEIDX5NNidZVIMiDv/
         lg9IfxoOg0dMbz9cQIImP5vyMTXWkhFD+GnMBg5/kIZfoJXWOC11ZAkJpke4b7ScNuVd
         rPjIW9gl9+IfWdjoQkT8rq7F53MImHX9by9Eav4OS9HSGq/2WKWsBU0kDDKAR1OhBAHQ
         niEN/HkQcT8cniZk6fF5xbUhVDxwQQl3fAQW782eRt6Jx0Occ5HO9bRFnaeFeOutWCpv
         JemaXTkPPNViQaGxdDi4ql2uFjljsaIZp37lGjG91ohI4nD6ME64S0F54zHnD+nGRM3n
         iq0g==
X-Forwarded-Encrypted: i=1; AJvYcCXGotuEEjzXVkovuRr9QKJDdg6VhHJ/CxxwpCERkdbmyQxxdH/XbMqZrSGoSWlFJU7AqKWWGVGUgoffuFDB@lists.linux.dev
X-Gm-Message-State: AOJu0YxQ7t9qQ6/FTn5LmYlQfQJY8rlNnRGDWgbA5P8a6EL2g7fVyBS6
	QZLFUX4R3lMlK+XjWYRQxX/fohIZAz8G5xA2rj//54pyBTeYJOJnxNjy7cj/T9WR
X-Gm-Gg: ATEYQzzWgC4Tri8yi2rqEwxWsL53ziU2lkKC1jAMVU/u6QGUDSjmcUI2hFyhYXSrauH
	1acryZb0ic5NHluX5WuZn/ThMNBUn/0ZNQvE0k00DYMBCwxrBFQl+bqgPwBQLf874naqPF6uCF4
	YfmN9znSQCus1Xspk/5t7NnfDlxhWlvWQCcE1xhATRHtUKvokPArwf855p7kNrB26GZAXEW9QtF
	miF+fvrEna/h6zb+vV0gux8sr8kCrG9OdsDKEMWA3Oa5TGJB7OPMIbAam2AtrodtIj+yZcZBOWb
	78l9MMj7SGMWXeZDsZhPx4508h5xEyKyRDMm7CHs/H4pOZivHPwm1l9i5sL3QIFxLt3ehFB8zsb
	bVYb4JrDMcB+pOzTGHykmA3sxQND/pOZe6cMYJQNBJ8O+lUoX1mcIOYgPsd0MsEA6W56qfR9urz
	SIZ/VMDhud93ZdHNBAJIWxSObKwwjaN3y08A==
X-Received: by 2002:a17:903:46cb:b0:2b0:4b37:e9a5 with SMTP id d9443c01a7336-2b0b0b2efd3mr7830885ad.53.1774381449171;
        Tue, 24 Mar 2026 12:44:09 -0700 (PDT)
Received: from localhost ([223.233.85.60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08365535bsm148469605ad.50.2026.03.24.12.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 12:44:08 -0700 (PDT)
From: Anushka Badhe <anushkabadhe@gmail.com>
To: anushkabadhe@gmail.com
Cc: andriy.shevchenko@intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: [PATCH v3] staging: media: atomisp: pci: fix block comment style and merge split declaration
Date: Wed, 25 Mar 2026 01:13:56 +0530
Message-ID: <20260324194356.49090-1-anushkabadhe@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324180821.42084-1-anushkabadhe@gmail.com>
References: <20260324180821.42084-1-anushkabadhe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The closing */ of a block comment is on the same line as the comment
text, violating kernel coding style. GP_TIMER_BASE declaration is also
unnecessarily split across two lines. Fix both issues.

Signed-off-by: Anushka Badhe <anushkabadhe@gmail.com>
---
Changes in v3:
- Add commit description
- Fix subject prefix to staging: media: atomisp:

Changes in v2:
- Fix block comment style (move closing */ to its own line)
- Merge split GP_TIMER_BASE declaration onto a single line

Checked the rest of the file for similar issues; no others found.

 drivers/staging/media/atomisp/pci/system_local.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/system_local.c b/drivers/staging/media/atomisp/pci/system_local.c
index a8a93760d5b1..1c513ead5300 100644
--- a/drivers/staging/media/atomisp/pci/system_local.c
+++ b/drivers/staging/media/atomisp/pci/system_local.c
@@ -85,9 +85,9 @@ const hrt_address GP_DEVICE_BASE[N_GP_DEVICE_ID] = {
 
 /*GP TIMER , all timer registers are inter-twined,
  * so, having multiple base addresses for
- * different timers does not help*/
-const hrt_address GP_TIMER_BASE =
-    (hrt_address)0x0000000000000600ULL;
+ * different timers does not help
+ */
+const hrt_address GP_TIMER_BASE = (hrt_address)0x0000000000000600ULL;
 
 /* GPIO */
 const hrt_address GPIO_BASE[N_GPIO_ID] = {
-- 
2.43.0

