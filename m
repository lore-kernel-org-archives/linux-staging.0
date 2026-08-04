Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D7A4C6EFC
	for <linux-staging@lists.linux.dev>; Tue,  4 Aug 2026 20:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785873963; cv=none; b=h+49AXQv5Iu5DrAo2ZOaPj7qwbMzxm6fE1933QGnZofJE619GXXkPSa6LCZtmlVCt7+eGxANQQ3JIz9XmOEXZvMrqesZmYwiTPFlhV/wEgIB79nxs4Vsb2aGO22lHIrWcK7+tjfcXZ0zTkC9MdYv+SR2LcuFUtFZnspFHFe4r0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785873963; c=relaxed/simple;
	bh=Rzyg2r9Gw+DBv9EyDkN9C4yX0l0alqk7TysPz7LzNDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tMk/JVrxBA+ZyQ9QbzR3psvKJYymcIHyeuuswL/VPpf4KYMPZp9XA/Is+scKI4eBnwAUT2LroOYiUXa6guOYv3kIS4DRPVFVvNMxiUVBUrKG+JbNhbgkrPUZO4h9ShOuZiqjGvwjG3azBbNRrjwRLuYLwUeCbDymTdOWPskNLV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rVijyLdi; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rVijyLdi"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cf452def93so12560935ad.1
        for <linux-staging@lists.linux.dev>; Tue, 04 Aug 2026 13:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785873957; x=1786478757; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wk0tZ9b//2KmUpK5oczo+l+IRmx2KRAWrszmUttdFGo=;
        b=rVijyLdi7H/84kt4DGMifQVAAJaVAbJ1JuUnvEXm3gOaIusT0sOA/ZRsLusvaNNs6S
         6/lkGPAVdbA1/t4Pewal+IM7n23ew5xlX5YGHTCZU7XNTPjpyeTIgxnhTZ0BneTHGhbb
         teAjKpJ0EnUy/5igyuOfTj9vvQ3B+cYeqt8o8X9F9qw7CycVeMhRWB/fOdFE32ovr3bP
         9oLgDbkuYGMSe/Uhq8GisQtjZig/EWrH4U1J2AOFVpz+ZxtZTI84tI8aWn1aiR05fD7C
         FAI6SxtI3TTOM9BpJaS1c1Xv63z0NAdt22BgiPMWWpc9gHzsWJ6FKxU/hjsHNCIdo2XH
         PUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785873957; x=1786478757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wk0tZ9b//2KmUpK5oczo+l+IRmx2KRAWrszmUttdFGo=;
        b=VXVp8tIc588QKTgL2IEmmUizvndLvIoYYoWK3gdo3fRZ2C8ifmPReEHqc7W5zo4o6Y
         N022LJl2et6GcVV3jJ5vrknlAZOAboogBOfb/UhbbI9TZmADI+fDoDX/DwmLvtD/y7km
         vitFxw1bLXAE+jMLJYIp5ZdH9JXFq0mNBNvmER6kOxf3MPrPkH88LOP8leGPKNCYeQMD
         DNSrYlh88DAkCV9yLkJq8hzkCe16K1klQDcA0bBPCjMtkkg93oXpuT/TmbiKegT7wWHR
         FnDcin7lyMzRFovzidQU/L0+XqR9m10kVVCj7CQwmjUG/vmdQiSMfuDIIKxCalLfPdPT
         4o6A==
X-Gm-Message-State: AOJu0YyBVN/zI60LAPeHHQxtSM5qQyWCHb5hOdIbAzUBsJj/XXh8Hyab
	ucPIG/DKuL6V+C83+S7hzHKJjdU1aiIiotxwNs+QXdPRkHctjg/zkeYjizkEqEDd
X-Gm-Gg: AR+sD11fSHaRLtHW70NaNGd9mbBQ+1hyVL+eGFGo6rNGfpE/fCSmP9QBLyoE332n94h
	43OJ94Dhj726n0dvlYtp7PXHVvFmkP0AwckL/ADdbU3vC7yZS2YMpttg4+hE9y31UmXwZ7yd/ha
	RSWU8h65lepfzNH16nx0vTRjO+n+3eAHi/BYg/EtvRJwOHnf3skU16KyQ5uzRIhyCY2e1IKe9Nr
	FDmT9aYE5vq9/eQxa6cIYcxevOicKC6EY/ATsUbbPl+03GbL1ZDDRpJdW0K2FmnSQ/iTOJXaJlT
	0/xbveOHLj3yWFp7+wOjYDzjYFqWgHSK7FgtoSmhP23Q+x5FWisw4l0hpYQqTbYJcTVmcEcpxjp
	GF7LsLj04m0EGxaZw8byDUP25zIBsOtyJKlcXvoh2uwwXdApCmWmGnxT5Pl0ojlrrA8910yBJD1
	gbwo+R7TPQPe8UBE9Qux6mezcw3noAGIV9HczCabjEWAVGqChxQPkfB6LDtkrp1rT5Ql0uaJawJ
	ltrfuO1JcOXUnK6pzLBMvqENVzhHji2zmxUbbwhGEL/KR/qM62/zw+yMEd9dv9gapg3urM=
X-Received: by 2002:a17:902:d54a:b0:2c9:d56d:afa3 with SMTP id d9443c01a7336-2d08ab5dc4fmr60130665ad.15.1785873957038;
        Tue, 04 Aug 2026 13:05:57 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::6868])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0a9f93621sm12975185ad.9.2026.08.04.13.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 13:05:56 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	Ivy Lopez <skunkolee@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: use kfree_sensitive() for key material in rtw_set_key()
Date: Tue,  4 Aug 2026 14:05:40 -0600
Message-ID: <20260804200540.78104-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730231315.79688-1-skunkolee@gmail.com>
References: <20260730231315.79688-1-skunkolee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

psetkeyparm holds WEP/TKIP/AES key material copied in via memcpy
from psecuritypriv before being freed. Use kfree_sensitive() instead
of kfree() so the key bytes are zeroed before the memory is released,
consistent with how psetstakey_para is already handled elsewhere in
this driver.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")

Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 1196ec011455..fb45f7295386 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1926,14 +1926,14 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 		break;
 	default:
 		res = _FAIL;
-		kfree(psetkeyparm);
+		kfree_sensitive(psetkeyparm);
 		goto exit;
 	}
 
 	if (enqueue) {
 		pcmd = kzalloc_obj(*pcmd);
 		if (!pcmd) {
-			kfree(psetkeyparm);
+			kfree_sensitive(psetkeyparm);
 			res = _FAIL;  /* try again */
 			goto exit;
 		}
@@ -1949,7 +1949,7 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 		res = rtw_enqueue_cmd(pcmdpriv, pcmd);
 	} else {
 		setkey_hdl(adapter, (u8 *)psetkeyparm);
-		kfree(psetkeyparm);
+		kfree_sensitive(psetkeyparm);
 	}
 exit:
 	return res;
-- 
2.55.0

