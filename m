Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC84B285CA2
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 19:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777318788; cv=none; b=h0lNHMOjuVN9evDVMsUUx/9vw6N+Tzw+0qW4leed4efAT6u14KGzq0JvaprGrNbhWwzUyv/SgxQergap6bNyzgpL0OTxYH37CyR+kDGyqkpQJbMTybNTh6j7DxGcFrEmabcU5zQ5Xj1kYQ5Jfyujdz3VKDzHZ6Xnk2eIu/8eDhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777318788; c=relaxed/simple;
	bh=Mes2KaJhf2CSfjsd85hgbWOLYrIjL67/7sdqP9ag7tY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DUzCFS8A2j6H1CXGnQYyfaoNFa76bJOyZ30T7h8iak4KSbaBXIm13h2UfBiheTANLYLcC2UPkMhI75ERRnRDIH2xP96qkBdTuAepXFa5nJ0Wqq5sm7sWnaYrc+P0ypAZnAJZM0UOzQI13eV8j1ZqlmGMQnmDmk71zPoc9plvHDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=scOCEulR; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="scOCEulR"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12c19d23b19so13756729c88.0
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 12:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777318787; x=1777923587; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+H6il/Xg/I3BX/zTi+6cDSRSCBqx5F4RbBpPiu1/JnI=;
        b=scOCEulRI5AhgLbk7+oBWUCu+QTTMwH4VsnupXPFK7nv5rI+1n44X6a4xGYaXGGekl
         sfSxl1n3O98oGnEKY9WfqHSt30VHeJX9WYCa6iYrv/8GAt1ia1MUhtzFBnF5B78PnoQ8
         2gBUzUb2FnEekuIj8ZFy+9T51ZPCvX+HhEMqG92mUX16MqtQFOP+9gzEjkGPs9PxePQI
         jS//G4QbV/wedoDKprRQ0EX00xEo3x4rW++acFi+cnnSBFYZLROsn3O4vFPQhl0sfDL5
         9UYW174WRpvniTYjrle4lznGNIPGChi2ca3YL6d3zPARFsVQs6hjcC5FpENO6IL9KPcX
         P4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777318787; x=1777923587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+H6il/Xg/I3BX/zTi+6cDSRSCBqx5F4RbBpPiu1/JnI=;
        b=mnhIVySfi2JjbWk6Kj7ruaRQIfvddnTJXiqaMYnSiMdrK1MoaLXk+7uzORJQoQe5Nh
         OK0MjCQMSeTJgUR3/WP+AcPER+sdc865SXM5e/VHMVs/c3doj+smS259R5Qne6MZQO12
         NzsGLL2kHybeVEz0SHPOo4LhKFFUnXoGJKxi1D0xNMINEjN2RSEfmtRgNtsYX0pRaHuF
         1e+BQhYcHyjlbB41JNnzWfJLSFLKa1MplLljlswywVZBIYdAHIf6N9WHsGbsnE61NBj1
         A3KYXUE9S4+LZ3Kl9xDRHd/P736Xb8uNEpcvFtPbXnTpLv0TWRa0EpqOv3g+HLJuFG7H
         cd+A==
X-Gm-Message-State: AOJu0YxF5I9PyL/xqw3Gs742n5amAmVY/Z46mamRRbN25/JdHQ77PsE+
	Px+kVBmEgnTLYPs5VgQoMDB0lD6cbePRz5PkMMBVqYp/6UMbdaKo5JEV
X-Gm-Gg: AeBDievRAPdTi9Hn1oIKHOpwsdHYvlhF64l8zAMOdLbA6BXavjtnvljd6NtfRqyroTk
	dblzpuzrzMquPI8rZAzs/NXsg8rYIP1GoG96x9FAVvG5N5BNZku2U+5261DOQp2QRpVd9toEiPJ
	A6mXCfs/ET5VusKMOQ/gH9r6P+e8DBsuFgHzIsUg1y9Nw2MM75p6dbCyHbMW9KpHLZn3sk9E972
	yzDn6mBJlyUeOIc9y6mFCjNHLU/iNB1WmCRRLtNrs/ahnOBhTQwQmCCBqovWbxubiQKaO7hxSXh
	wtGlhJsUxdakqHYlh+jT5+rsLvv3/yHFuxhYtqwCk664imBiyiFJQOR3P9b06drDMlE/nJX6q/9
	hgGgSmCFHYvaPcNy5lGdiD3ncWD3a5Xwjvi39N3h84BhkbA6lff8ZNc44+5ciHs9XQSM+OrVp9B
	p3pT0G+Oj59JY5mT57Z89+csvj6up3sgIoAnROmn0A/5Qd/9CpPyeUDaMTDKfvXPXltkbfUqoiv
	kSiJqvVtm209CDpMC9RrvWYRvd+
X-Received: by 2002:a05:7022:ec16:b0:12c:8e70:c32e with SMTP id a92af1059eb24-12ddd961cb5mr141244c88.5.1777318786601;
        Mon, 27 Apr 2026 12:39:46 -0700 (PDT)
Received: from localhost.localdomain (wifi-eduroam-143-106-58-44.wifi.unicamp.br. [143.106.58.44])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ddd9b1bfcsm228048c88.12.2026.04.27.12.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 12:39:46 -0700 (PDT)
From: Miguel Cyrineu Vale <miguelcvalealt@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	luka.gejak@linux.dev,
	koike@igalia.com,
	~lkcamp/patches@lists.sr.ht,
	miguelcvalealt@gmail.com
Subject: [PATCH v2] staging: rtl8723bs: replace NULL comparison with NOT operator
Date: Mon, 27 Apr 2026 16:37:59 -0300
Message-ID: <20260427193759.71642-1-miguelcvalealt@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260423184219.827694-1-miguelcvalealt@gmail.com>
References: <20260423184219.827694-1-miguelcvalealt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch error "Comparison to NULL could be written "!psta"" in
ioctl_cfg80211.c:2432

Signed-off-by: Miguel Cyrineu Vale <miguelcvalealt@gmail.com>
---
Hey, thanks for the feedback on v1! This is still my first patch, so I'm
learning the ropes with the DCO and formatting.

Changes in v2:
- Use real name in Signed-off-by tag.
- Fix commit message line wrapping and remove unnecessary blank lines.
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index fd3bae31b0ed..8ae3adecafd9 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -2429,7 +2429,7 @@ static int	cfg80211_rtw_dump_station(struct wiphy *wiphy,
 	spin_lock_bh(&pstapriv->asoc_list_lock);
 	psta = rtw_sta_info_get_by_idx(idx, pstapriv);
 	spin_unlock_bh(&pstapriv->asoc_list_lock);
-	if (psta == NULL) {
+	if (!psta) {
 		ret = -ENOENT;
 		goto exit;
 	}
-- 
2.53.0

