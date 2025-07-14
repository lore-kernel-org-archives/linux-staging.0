Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC1C24A047
	for <linux-staging@lists.linux.dev>; Mon, 14 Jul 2025 13:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752499800; cv=none; b=rYEtOak8fK8/UD86uGa3/eFheiQDty92TIPr0pJk5gzTC0filscGDV+tpGgyVaVDrsG3rZZ60+N6EckP5nCoXMmZuBMrtkpBFafP/hfPrcBTBQxFMevnu1vvgKFNcRi1E/YVCdd+M9qCObM89lepYzGsRr+Fgreud1qVoeWQn0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752499800; c=relaxed/simple;
	bh=7Sm5LsOFtuRrz/TkiuLgXge3S0NaRIa9UfX2d9h8Clo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aOlXu0mHyjpZOLzJXlMRo4KNmOWihZB4NSlaFVAynK4DJMNdWrv6UXNcSX6+EOXDKrvSMjYH9EEOyqkDufVXCFY3iw5hI/25XAozKHl3MGaFC42oYL+DZxdyM6wCpMoJCHKyodlU3yYQlXTR6aa30m2COyBIyrvUtAuNqmOld6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Axi8KxvL; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Axi8KxvL"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7176c66e99cso40244687b3.3
        for <linux-staging@lists.linux.dev>; Mon, 14 Jul 2025 06:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752499798; x=1753104598; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ar8UcJJp6D80cSBExxGKJ5XW7V6hUSuTns7AE4Udt1E=;
        b=Axi8KxvLoo7coVEbDxL99F4XRpCWE2voikNmCgpil+e8gZsiSYxzSzuSmxIrmNlnwf
         S9SwdeCzptIvSpwWURSOniVyhk+VqSU69sobHtId5YqO6BfQ81SKbp6Tb7hWdCqZno+d
         bMoQtdiWnXG9OVHrxrrfIh12FfDR/RCsclIjLUn11gLhUNwCB4mVzy7JzgerwYoPByO/
         i8ddtvAapPEIqmMW+YjJKb5TDLoyl0SRHd6NcG+EdZErgJiXO9nCx0uCZsPB1kZE1FC6
         THuZSq7ex+JQgXa5+jSMX2nF5RYhmigQVfXigD3fCtp7BEpBcgP84f9ZifHK7AnVr/u8
         nfKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752499798; x=1753104598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ar8UcJJp6D80cSBExxGKJ5XW7V6hUSuTns7AE4Udt1E=;
        b=XkKjB1XiTuNgi8vn0grj5C74pDL95XXmoZ4zyXlFLxQMFuZ4KV/WBONvv3IJoq8pq0
         x47sZmLmelaCosSFNCc754GoAeXJJ/uNteEqezIfteRY4jb9LXS1ZV8PRdkJ4ymjZ5Uo
         0NKmLd/XTojfQwifscFaTWljavIZIfEnn90SznwKvPDKQ/rLNboazwTa45YuIS0DFTr4
         phwPbWDmcSQE6FRxhY867p2XP+gNMG7BXhtyNJscjjEWubE+Q211kQ/8IezgnzzIj2bX
         r0gYjx3aZtyLjMK0PbcAbXm/3jt1t+2nxB0ofr07i62Khalc5kDr1J/KSt9TWv62HOlS
         nv7A==
X-Forwarded-Encrypted: i=1; AJvYcCXfARcOMO6AWjRgHFQ2bOo8fjAZF1ezymlEKj2nRV8AB2UBT5HNbWZT82EjzeMD8ReSspqSOXkrUgB2rHJ8@lists.linux.dev
X-Gm-Message-State: AOJu0Yx66oEfL4bF5wakhodoMadCEj4qaHgoVoT0M1kkxxAQkU3e4vqW
	V29aVPuEqguY1qJW+tUQZdkmJlcPXTXCnzhxEbC8iNrIfUtkD7tMSxPta+8BO8fraSM=
X-Gm-Gg: ASbGncsW8CLx+TqrZZD9trATU4TkT8LYQdSZVuvmm5/D+A+LgCTpaHX9IwCGY820Bbp
	zfFnoJvgruMUaJO5hnrMf48D0zdIX6DanRRDCoYhRaYXyKr8nOBhrXTqGdtbocYJjbRwALz25D4
	9Ch0wERPbRwmMgDKDk0A4u/pV5ZDCZKaOBfoC5aRAc1aFxQQ8yN9FTUWcl1QbYfg4Wd3E/NE4Ju
	GYXymV29DhYyNBsn4wv1r2pIA6yAM3hQmQpKVBB6bpmg3NEPeSI3417kfrtJO4VZT82s059V+hw
	hkCOfJVH7s2+I3Jrs2a37Gx6vVBlv5tWtV8tCepBAzXvlexFSjgB2gx8V0hs8rLWwcw2M/JrlyN
	X88purM8fESgKzI8yJHa7xg0DhV81vz4=
X-Google-Smtp-Source: AGHT+IH7+og1xlpSo1KjxvBX6cVnUl4llNG6qDuzOyNqlBivr5CMAMFFA7FG/5rqovphZxKeWwjDDA==
X-Received: by 2002:a05:690c:6608:b0:70e:326:6ae8 with SMTP id 00721157ae682-717d5b83502mr204844177b3.2.1752499798235;
        Mon, 14 Jul 2025 06:29:58 -0700 (PDT)
Received: from localhost.localdomain ([89.234.162.240])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-717c5d792d1sm19529317b3.48.2025.07.14.06.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 06:29:57 -0700 (PDT)
From: Ravi Kant Sharma <rks1986@gmail.com>
X-Google-Original-From: Ravi Kant Sharma <contact@r4v1.net>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com,
	Ravi Kant Sharma <contact@r4v1.net>
Subject: [PATCH] staging: rtl8723bs: remove blank line before close brace.
Date: Mon, 14 Jul 2025 09:28:34 -0400
Message-Id: <20250714132834.79911-1-contact@r4v1.net>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch CHECK Blank lines aren't necessary before a close brace '}'
FILE: drivers/staging/rtl8723bs/os_dep/os_intfs.c:631.

Signed-off-by: Ravi Kant Sharma <contact@r4v1.net>
---
Hey, this is my first patch, I appreciate any feedback, thanks!
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index d4dc169e1..292b5f8dc 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -627,7 +627,6 @@ void rtw_reset_drv_sw(struct adapter *padapter)
 	padapter->mlmeextpriv.sitesurvey_res.state = SCAN_DISABLE;
 
 	rtw_set_signal_stat_timer(&padapter->recvpriv);
-
 }
 
 
-- 
2.39.5

