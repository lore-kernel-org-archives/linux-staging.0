Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB292E62D9
	for <linux-staging@lists.linux.dev>; Sun,  8 Feb 2026 17:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770573096; cv=none; b=Px8l91W02vRJ+TqzUSLmqRwF2skc43wwzOBz3cH3fcw4J6upre5W7yOAN21IQBPG4BpKfqAiG0+WVCtl/01zxUeZvTdV+HiCl3CJbc+Umo5oVKmeTYDeP4qC+vAfM4QBsshwK3/uvqkl60IWjGqiBuDC+t+7MgwJ719jEQXbcNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770573096; c=relaxed/simple;
	bh=hYoIryAMMQnIBOicwKP9za1iIhZv20tWmR64Qe4awWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UBPdLcTP1MG6fX1mwFZuO26EqSroIhuugPDik9C9kDI/JjW/53OIbxgPDSrD2ThwZQDJu+9R/j9F+UQRKUotkHXgZNcxuj+v1RYF+JgZ5xp6Cmsk9lEmxe/1GbKWmIbzDF5sGAMVMyA0092LymgUE1zKtO4f6BrHS7s+BQqjZ0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jDpdH25Q; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jDpdH25Q"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-480142406b3so28139005e9.1
        for <linux-staging@lists.linux.dev>; Sun, 08 Feb 2026 09:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770573094; x=1771177894; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BiupoYQvxHFsdqKJYeg4Srj9QOzJLGno6UHJ85/VGkA=;
        b=jDpdH25QjXOwqZ1pHh5wrYYF1LaMrKFSe95YxN0m7XcTMIIImGkjCremU6tIj3J0re
         /tJcXCNpAERejR5EeVYwfgPyRT3yll5/vW+mH21632J4J5RfZQfpEC95tXEI0WKc1NTg
         8JTcs1DPVuVeDeKUF7H23P7Rc7K7VhCBKeOab09Vlxj5hyqJz32j3O409DT1baEoml2G
         ajzVrwI4OMT/Dpg2lrqKSI9x17GOLBKmZlCPMybHQtrMrtHSzsgxr+HPLYEuLchaNrKe
         ruXfi1LkYhJIxuo55tsljloZBEGIj/+MxAO1aI9+jU+eAkpq9jIEJKkl1Z+HpAkaNp5g
         vOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770573094; x=1771177894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BiupoYQvxHFsdqKJYeg4Srj9QOzJLGno6UHJ85/VGkA=;
        b=qRPG+5X6PmMZXjdEkIHp1G7U7hbkQXugDVWcRvghVupql/70NXFDpvO5WBfvGSiklx
         FId0WmbbipEhO+fmg/rzQDOurYQU6qfdyoaaCMhhcNpgXriOsasRaa8u3MHtdaWHDtSp
         9EOU6qjobdU+SlhMpHTdchG/uvLzD0R+kAe6ncO35nW0GvHq0uWSr+jBlPFj493EwbR2
         H56PkJAGmipli+FxkOKeSAqccpYsNDCOhN22z7aW+d8EpXCmjJlvcezI7yqHQvGrE7NM
         3Cj3ZlwjdWvOeo263GMwnWo726so29l+YJ1gVuIgKV5s5Etd7dL1lafbV9UhPDBSkL0d
         QWeA==
X-Forwarded-Encrypted: i=1; AJvYcCVDfhvaGMB686TjLB1jVrgAvZsoBIYHWucvcX2cny7gdLj4pit2BVd9mkg6H0tiJ8yB6QuxT/0UVGR12OpT@lists.linux.dev
X-Gm-Message-State: AOJu0Yxzf0fVxaLy9DNxwcoAXhYosphPnDfa/ZNtARShep+uMRuVn4If
	3I009lrYNE/3It/IxQxljNldfOfB1h8TP4cOfWE4tSVe+P2h9vzEwZQQ
X-Gm-Gg: AZuq6aJa89Moqus8fDHL6OTU7lP17f0FONB+IDWTgKwoOggO8YB1svfWdqirFdrfwhr
	VCnI2bkDaAVOInlpJsDADhSgRG2LkDBtTWTzC8ItwP39R7BmftzzVfNQabgZqJie9NecKY3CdMe
	WZJb1+H670G9lD8iys/3uZLNz98PjtJ+MNxUh92uasuSlKgQyapbS1+VWTTNLPmANfvZCXksEn9
	2V6NYURxG5g0lZipMclrOLFZJMPYciD27PYoWiShN53t3c8KYP10YltZUDrc3AfMSHGXBA9+uZr
	kNa6KJ0vg8AGbqEHmL08vHupLK7FwQTTNEM/JarCKTohmCy1+Agzu66hJAvmtD1r0hwsigLIgvu
	VsMdu7kcTuK2afC3tgTzOOfeg6akUGb9s2ExRRbyiqol3RqXXqdlmnj7Y6hQfR21DvtJeii63NH
	Vw3rbI6bLtGGZqLF/HVrEBH7PBV4ie4deLVxo9I+BtPu0=
X-Received: by 2002:a05:600c:c04b:20b0:477:7af8:c88b with SMTP id 5b1f17b1804b1-483201dd234mr88023095e9.11.1770573093918;
        Sun, 08 Feb 2026 09:51:33 -0800 (PST)
Received: from fedora (95.59.121.114.dynamic.telecom.kz. [95.59.121.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483209d0007sm70942415e9.15.2026.02.08.09.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 09:51:33 -0800 (PST)
From: Azamat Rakhim <azamatrakhim8@gmail.com>
To: gregkh@linuxfoundation.org
Cc: karanja99erick@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Azamat Rakhim <azamatrakhim8@gmail.com>
Subject: [PATCH v2 2/2] staging: rtl8723bs: remove extra blank lines in rtw_btcoex.c
Date: Sun,  8 Feb 2026 22:51:20 +0500
Message-ID: <20260208175120.15717-2-azamatrakhim8@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260208175120.15717-1-azamatrakhim8@gmail.com>
References: <20260208175120.15717-1-azamatrakhim8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary double blank lines between variable
declarations and code.

Signed-off-by: Azamat Rakhim <azamatrakhim8@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_btcoex.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex.c b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
index 444a602d2868..46ef1528519a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
+++ b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
@@ -54,7 +54,6 @@ void rtw_btcoex_LPS_Enter(struct adapter *padapter)
 	struct pwrctrl_priv *pwrpriv;
 	u8 lps_val;
 
-
 	pwrpriv = adapter_to_pwrctl(padapter);
 
 	pwrpriv->bpower_saving = true;
@@ -66,7 +65,6 @@ void rtw_btcoex_LPS_Leave(struct adapter *padapter)
 {
 	struct pwrctrl_priv *pwrpriv;
 
-
 	pwrpriv = adapter_to_pwrctl(padapter);
 
 	if (pwrpriv->pwr_mode != PS_MODE_ACTIVE) {
-- 
2.52.0

