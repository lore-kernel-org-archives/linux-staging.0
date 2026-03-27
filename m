Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40A93A75AC
	for <linux-staging@lists.linux.dev>; Fri, 27 Mar 2026 10:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774606866; cv=none; b=HLMpDe7yRtGt+vKV5DUzieRJNiyWkF4s5xhoIYb1gANzUkOafBhuv3Yb1RapxMhBapcVpOg/VnI05LRpnjcJE5ti4kHO4Y9/VPMl1wFZeDWRBaTx1QZ8AdKHQ2z9C5Dc0KlRLWhpQF13zQq6Pipjkum+oYFbrc3Rlc3K94RgOFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774606866; c=relaxed/simple;
	bh=+HzFcP+iaCHiwMHXf98duZxvxwzHWkn/zHyA6WaLTMA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DfDA1+PuVKVx5+FShRT45ctSNGHlYe+Bv9G4gQWXXM07yUXO6dBUOoION/gMmdtsNHoMYCzzPiJjVSpzdK9golOqIZstvH5r3whsQo0rR09ESpfMl6V5E3G1Iu8hjg96gZg9IWiFrGHiUqny+mj3hqegtjJkziYwxYCquDLVPiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHw+HkUk; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHw+HkUk"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c70bfef17a4so1425451a12.2
        for <linux-staging@lists.linux.dev>; Fri, 27 Mar 2026 03:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774606865; x=1775211665; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SrKzgrtvat7SateWZE96rEA48qdqw5gVrraZgjTJdcQ=;
        b=QHw+HkUkzAbJIHIiHVe8lCkTLprg0XwSml82lSJinExPsYYeJQWzfIoxh1H9bEeTPA
         J6CTuekQRDCnrI9LVo8bRIwK32EHNZaDkrSNE0EwM7ocPueM0AfZSF65O4yNHlGEbA7o
         3dz7B4DC7uTMkmcWkzUA9PNojoGwZtUTel6l+Zi6l8y637GRSkjiR9yKFyhuEZ4Ydlr6
         Ee7PgtO5b0aP7HPUASxHWD6A0qvSnUG2M87SELv+lYmDQsOAbQXXvvZkCzBcxK1e0kG3
         V5LHS9xLgoWzA2D91NEdt8yMHiws/BAt997SBVQ6SBOiYSlG8QLMmA0Ugng1+opBYtbL
         JySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774606865; x=1775211665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SrKzgrtvat7SateWZE96rEA48qdqw5gVrraZgjTJdcQ=;
        b=HoicAOeeK1kX6fgFX/J6YhWr2UXyP6bJFPcnYgK2Q/aLNViMmWljocEPtdIpKrRhWx
         r+tJuezkKgEBjsIzmzLUlQ3hUtdYoFX/jeAvuqO21PGeB+hqYC+VJtd8UUIUBsbSM3i7
         tfdhuOOKizLt38JrW7meME6NQDk5eOQac2aBl4Vlk+nyLclP8PYBM00cME+pNKrKZkpY
         4QmExMxI8jYoWFhsDtx1IxJinCiMy7by2H18Qx+tMfV7lDd2NZ9XaELxuzwQ7/Y+bSlb
         bSaLyOZt+tIEl0btwTi3s043Pdc4sjIRA66n848Y6wAO31cTqKhVVN76rS/YAzXNAG8Z
         RLnQ==
X-Gm-Message-State: AOJu0Yy3uWn7ol/czdk0oR+Bt+UanPC2VG9JnLgJ2+S4cfxNIVjMBLSR
	YGe8tsYZk0EjQ5pnX+042C3MZmljJfVPg+3htEYpLI7BMGujOrzK10SD
X-Gm-Gg: ATEYQzxeAEFQV9RVcg1FSx5W9jK2+UK6DTSHN3NAHvjzQWbNyQhyD3DygK4L+hprLEw
	KkfzuC1ITK3VjVz62rgBLJp9osaMJU8R2G0SS+5K4lhQ+UeSWEWbY7hyYt1DDnyQ1GLF1kDz4Jd
	JHuocYgtiIpqfYOfJjTGiiEDIM+VCRPUv3NPF3cSVznE9050Sg38kmzJx5GG4bQTtaBAVzTyikt
	bxCX2R6UZVgKNEpfn42SHLNr9sVkIyL/Vl92GJnwXiry9rIsfahHDH3w3NsFplJBM7ZCL+3C5IS
	9I391Irx0sBs6XeWFtyNRB1pt4uX8Jmox6FRtMN85kyWEyhuktxx90sGMekK34/KISPPDjilpG3
	Njj67nAACN7EcpSNqoFdeT/sk1ShHEIqwqYSB3Rhdil7+tnfk7i2UHE2Te4bEP+B4Zzlpt7Nllq
	pfTVVp1A4rpTeI/MbAYjWLK9nxJg3evsTv3AWgDUt9tUnKg8n7C2AqOg==
X-Received: by 2002:a17:903:4407:b0:2b0:5e10:9dbd with SMTP id d9443c01a7336-2b0cdbeb419mr21575815ad.3.1774606864979;
        Fri, 27 Mar 2026 03:21:04 -0700 (PDT)
Received: from ZC-202510311500 ([123.139.39.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0cbfd17d9sm21365515ad.25.2026.03.27.03.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 03:21:04 -0700 (PDT)
From: Haoyu Lu <hechushiguitu666@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Haoyu Lu <hechushiguitu666@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: fix spelling in comment
Date: Fri, 27 Mar 2026 18:20:50 +0800
Message-ID: <20260327102052.2937-1-hechushiguitu666@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change "co-existance" to "co-existence" in comment.

Signed-off-by: Haoyu Lu <hechushiguitu666@gmail.com>
---
 drivers/staging/rtl8723bs/include/hal_data.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index b87c90f693ec..ff4383e30322 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h	2026-03-27 14:48:04.333064200 +0800
+++ b/drivers/staging/rtl8723bs/include/hal_data.h	2026-03-27 14:49:02.478348700 +0800
@@ -385,7 +385,7 @@ struct hal_com_data {
 	struct dm_priv dmpriv;
 	struct dm_odm_t		odmpriv;

-	/*  For bluetooth co-existance */
+	/*  For bluetooth co-existence */
 	struct bt_coexist		bt_coexist;

 	/*  Interrupt related register information. */
