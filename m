Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525A23D3D09
	for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 23:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783985892; cv=none; b=XG1uKCsDkE/n7BaBRSUwaFBz7ijzT82cmKJ9X9llF6wRXEgiXOUQj3TQOlHxaLBghvS7ZE3mdEY+RwP5AR9gVQe0Vlb8Y3ggMVcbWDZkqMOu5xGYi5bG0vcn42L9szJjEJP6VG6xA33A3jnyf1BQrtcHG2PSLRQITdRxZfSZkgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783985892; c=relaxed/simple;
	bh=/00cRYn0DsZnB/nldo8mYbZIQeKonyJgnletLxrLHdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BAkb8mAjSwwiH7s4rRgLnGFXcKihTY8x9NC2P3fw2p4pkFvUy4BpiaO/tSkfdZBIHA2hDx1Pem/uybUNHhWFrA50XanHbWhcrAwV2HDnA20y3gNJ6eWyo5M2Su5sIax+Fpwtqq+R5LR6qlEFadeca/9RUfrfNNYrUU4mfeN8iTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g1Wc/5WH; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g1Wc/5WH"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so41418115ad.1
        for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 16:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783985890; x=1784590690; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C11haklYJCflJ7xXpeAfmRSpmnlxr53KIUoMp0xcj0A=;
        b=g1Wc/5WHNgMchQZJthodVNnJm5uQZRcHtSIE0n2c61e3IkWJn/kjOfE9jl4FAFnDo/
         c8EV6O5JYAa2LI0EIuRKe9geFqWbRVhmkn8dkz5Sti2Y45SeGNu7P8/2tYwpD1uZf4Ri
         R9+/pA93bsKwmqVH0HdQNXmKzSatr4DtJLBamlgPcVtdWQ1s9iJ5kbsv3mes6kjSajDA
         2WdF2ZWgNuHLkQwNW+4iMMqBXQMCYivFeRTyCFN0tDc5Fo0jQL2EJDW+CSLWTlLJusiL
         pVLkjoQGtOcyypQJ/psv8DVxPhRur3XH9g2SETuQ5IpFE5MX8eSk+wtuJuqmyrM8e5M5
         e9jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783985890; x=1784590690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C11haklYJCflJ7xXpeAfmRSpmnlxr53KIUoMp0xcj0A=;
        b=GJXeBZZ3MMVxHWPg1vQmrFkm0/cJ5h+NnYZKgipXD85rQrzs9mduz7TQFMZfqahJCB
         6WDjqKGepke8PUqx/tUB2rtnEgfsR+Ah7JDRKCGRdqRy2IbPklGh1GKiuWHOn9QK1k03
         CUXd1tzznlJKDbd3hWMj0nMHISWWttOXUAhbHhKy7hw4wQPdXuFs/eYBp+A1fKHeiqr/
         5Id+yqyKdJ8Ar42yvyjVZb/GZVsENBFPkPzNcMaT7QyP2GVkZ90Dg571kz0hQiPrOGE4
         FrJjBTveTGOtXOY29NZeulhAP9loqabpmHaJ1ZqCpF4TwC0U3/suuyWLR68w9/jRn+ax
         oMnQ==
X-Gm-Message-State: AOJu0Ywea2AeY6FlkFrYLE6LSpSYqfarSmdxUr2K9l0znnvFO+bJ+XZi
	G/LUmq/EBKaSBy9lKLoVd4tYjJiONJ/ezjnDfxxS14kPEVflcGK8Fl4eipbL00lb
X-Gm-Gg: AfdE7ckQEbMsdEB9c6z8VOTxTEjLOjaNmluKKFAVTmpEbFFXmdwGNQXIXX1ABvkrCbH
	IRSSusSSZnv/BIU39I2jkuMELTAbfUj3T6ZBPfZ7bjzyr+yTzssSOH+9RTDHB0YpoL3P1jJR6NQ
	WcREg5tcB6ff3tAExmTmhMCKGhVnh95T844bVYgfl3gfnFLpExd87H4jymI3YjxjyX5sCirSHPo
	EklUPtzFHaNhSzp/2vlN/mqW42erJq+a3GI0SX7fX8LbeUoEzBY/r8hzr/+aPgBBNR/WmpbJC42
	eDVaQs0HO1g9D7JQK3i92Vm5qBuEjSuQBo9WAlDXXl/0NYmXbjzAyHHCVzrWmyKpVaTXdDrWONX
	xw28Q/8vihhxmg5fhsXQPv8By7xI0xsVGJJ/CJnJqWoJ9HkVVZQxN+2NyUe854gpg2e1IAzo2g4
	sSIdl6x0W5bqseZgj6hTnitquKhLd6hbgYvPi1criXNgDBwsI9HJ52kVSWmR5yy0vGs4Ifl2UH9
	pxZbHtYOUTcVzdYokti3FpjH6QWnp0zOPl2AHWzsyfU0iKco9PHFUEwcrZVpiw=
X-Received: by 2002:a17:903:4b2b:b0:2cc:76fd:6537 with SMTP id d9443c01a7336-2ce9e7a53edmr99065725ad.2.1783985890419;
        Mon, 13 Jul 2026 16:38:10 -0700 (PDT)
Received: from bloom.localdomain (S010680dac2bce256.cg.shawcable.net. [174.0.186.197])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1eea1sm107151175ad.46.2026.07.13.16.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 16:38:09 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ivy Lopez <skunkolee@gmail.com>
Subject: [PATCH] staging: rtl8723bs: use kfree_sensitive() for key material
Date: Mon, 13 Jul 2026 17:37:53 -0600
Message-ID: <20260713233753.50816-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713233401.48262-1-skunkolee@gmail.com>
References: <20260713233401.48262-1-skunkolee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The set_stakey_parm struct contains a 16-byte encryption key.
Use kfree_sensitive() instead of kfree() to ensure the key
material is zeroed before the memory is freed, preventing
potential information leaks.

Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index b932670f5d63..a34ee407285b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -899,7 +899,7 @@ u8 rtw_setstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 unicast_
 	if (enqueue) {
 		ph2c = kzalloc_obj(*ph2c);
 		if (!ph2c) {
-			kfree(psetstakey_para);
+			kfree_sensitive(psetstakey_para);
 			res = _FAIL;
 			goto exit;
 		}
@@ -907,7 +907,7 @@ u8 rtw_setstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 unicast_
 		psetstakey_rsp = kzalloc_obj(*psetstakey_rsp);
 		if (!psetstakey_rsp) {
 			kfree(ph2c);
-			kfree(psetstakey_para);
+			kfree_sensitive(psetstakey_para);
 			res = _FAIL;
 			goto exit;
 		}
@@ -918,7 +918,7 @@ u8 rtw_setstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 unicast_
 		res = rtw_enqueue_cmd(pcmdpriv, ph2c);
 	} else {
 		set_stakey_hdl(padapter, (u8 *)psetstakey_para);
-		kfree(psetstakey_para);
+		kfree_sensitive(psetstakey_para);
 	}
 exit:
 	return res;
@@ -958,7 +958,7 @@ u8 rtw_clearstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 enqueu
 		psetstakey_rsp = kzalloc_obj(*psetstakey_rsp);
 		if (!psetstakey_rsp) {
 			kfree(ph2c);
-			kfree(psetstakey_para);
+			kfree_sensitive(psetstakey_para);
 			res = _FAIL;
 			goto exit;
 		}
-- 
2.55.0

