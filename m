Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9D1337B8B
	for <linux-staging@lists.linux.dev>; Wed, 18 Feb 2026 09:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771405991; cv=none; b=qlUeUj2CiFFHuXb9a89iLIJygbaKvt0/n6MVtlhfZrgE6KkFunxP4onwdiPHmcy226GYpqYjBK75X5ZSR9oV5UhDXPQ6gfoH4nav6T9YsQBBy/iFFRL53PuPANJ/suXHH3QVO+tR2+MJSKAVxgk8fUZO1FHTtnWaBNPFkc8TV1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771405991; c=relaxed/simple;
	bh=yDXdPH5jQ+PTw3OpbLPTK0YtLLJZGRJZCm5vHR7761E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qXmth1WpWRPCSExnmVaFUUPHcfIl84tOaOkd7jXriFmC5IwAR2HxW0hlVbdeeXXIUeApEuqn2Rt5OI8oUHD9jtzS92K+wq1e6J7r9ndDS3AJ2g1+fiCnlMtcF9F+TiihlJaHGrA3+Hgqg9ONOPd4vXSVy6j/NVMYcaDPjT1qeKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e5XNaSwu; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e5XNaSwu"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48378e60742so6524375e9.1
        for <linux-staging@lists.linux.dev>; Wed, 18 Feb 2026 01:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771405986; x=1772010786; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dISuGvMUd/YXLmhCKcNiGCS11LuaPPjJEeCHOWGlkLo=;
        b=e5XNaSwutT/yQD9ojV/fG9AxDl1WGoUkLoCwsUV9ncEml7JXHbzS4B9zeH1djLeyqA
         dsvQUFLeEdMRzEpIvgc14jPnhqxR4e4AafiQ7DXLir+fwOdIpDQKxvQWW2F8kAI18mCF
         moitafpp1Eezo3R/cCPs3DStYA+86XnsNQlK3iGIo/pKB3+U1qwMUIQKGoMJZGYwUP5c
         2AnyytXKUEBpmxRadiCmKuHy2B+2Vv54rakyjr+Dejuw7NUhM2EnefZDaFxMp7Fpg/Rh
         /02kJGHWawhllSb+bXfh8iUB8b5RGDSWDxJ05rxAupqXNS06idwRB3nG9OVEzofET5ZA
         e4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771405986; x=1772010786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dISuGvMUd/YXLmhCKcNiGCS11LuaPPjJEeCHOWGlkLo=;
        b=Bs3EqZduXfYAmtIvaXFA5Qc/mn8o1tOsjN0QARv6GQh69eFxos2sst7h/z72P1WsJ9
         8AT9geL5DanStOdTMqy0O2RUdM+S/+IaZ6Ozc/7EJDfMGjQ0v5la2mRKG0jbQamWBajR
         mKarlVgoqmS9cKYjUgkIdYgHZf09tlo68TdVi94XmyWVg4O4ZNt5SbHz0OHJprcHdcoc
         URqSb25tsrFt9ycYVF0GlGerm1gK5uiYWwkH0nRycR05SVIzTxL9rEERiHEQVdIO1IQ6
         ESwyWJOpxK9fRA6+6JALnp37QwJ6KuQFl64lrfjPurM/XoFMX7LcOJcBAfw6t7FNMNFB
         EsHQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3zhMP2G2Fdj0W40iACWqoY0cOBxuWLfkwIoCXNAyzgXwDgRvw2+EdfVYtsfCuoG/kQcnnK8Z8zZNm1TVo@lists.linux.dev
X-Gm-Message-State: AOJu0Yyq0uCLaafFyfaNwet3iHKhXI/SpuP2LrdNUCNZ9L5Xgf7zVWik
	VwUMhMAZg273dnK1z4F6v4P9J2bm2dxrDW3sukYp9ZApV+VpRCpF/U1H
X-Gm-Gg: AZuq6aIeaqI7dJVuJ6Vnt4+hIPgsB1U1qGDbQpbMem9Ulco/RQ7G4xmWx4bcKsEt5Ye
	71XmulViyCDkjymvXTwL7IqjV1fR+W1zeBkkdipucucyHrO7xGbIg3J8w1B7G4W5gZre3x842Ky
	RNT5XvtABJ8DnOqBvZGoIvMxqjbMf3+U09juwH5kEwXgIv1QKy/CfA62BXadrNmnRKMd0NB13sj
	NvJXhYu/V0kbHW1PiduYd+mHUTTGIwhBFqZhr0UaByXDQhGikdmwwtknKM6lR7HuJcAKGz8+udC
	8OHDDed2xpZ87qPP4c+ikarM0nf4pzwaebHbk2jGh5OIqNFdWxc3LluneZKfghmQjYP+nuPKoIE
	FUUMZ+n+hl9Xpwh+UqUkI9qehDIT9MZcBykInlJBAP3S50EDo4+ZdV67DJ641dcpLvZHtX9uAkt
	5qXTkwq6OgRks8/5+InArO+hK4XZ7eNxsfnRmW70qybx2ZyRarB2xvDy7xrk5ySdaEA1lX0CzVH
	G0Dfrq0+5a52GrZxYg6FvZ5LEXrcyYgNgbxKaLAg4TDwNFMu3dx
X-Received: by 2002:a05:600c:5494:b0:483:7d93:9f8a with SMTP id 5b1f17b1804b1-4837d93a46cmr154219145e9.1.1771405986316;
        Wed, 18 Feb 2026 01:13:06 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dd0e327sm577811725e9.14.2026.02.18.01.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 01:13:05 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH] staging: media: Fix typo in comment
Date: Wed, 18 Feb 2026 13:12:12 +0400
Message-ID: <20260218091211.128887-2-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change "acquistion" to "acquisition"

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
 drivers/staging/media/atomisp/pci/input_system_ctrl_defs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/input_system_ctrl_defs.h b/drivers/staging/media/atomisp/pci/input_system_ctrl_defs.h
index e26b9ba3356a..49e327b55b9f 100644
--- a/drivers/staging/media/atomisp/pci/input_system_ctrl_defs.h
+++ b/drivers/staging/media/atomisp/pci/input_system_ctrl_defs.h
@@ -222,7 +222,7 @@ InpSysAckOverrule  2/0  [3:0] - 'b0101,
 #define ISYS_CTRL_PORT_ID_CAPT_A                  0 /* device ID for capture unit A      */
 #define ISYS_CTRL_PORT_ID_CAPT_B                  1 /* device ID for capture unit B      */
 #define ISYS_CTRL_PORT_ID_CAPT_C                  2 /* device ID for capture unit C      */
-#define ISYS_CTRL_PORT_ID_ACQUISITION             3 /* device ID for acquistion unit     */
+#define ISYS_CTRL_PORT_ID_ACQUISITION             3 /* device ID for acquisition unit     */
 #define ISYS_CTRL_PORT_ID_DMA_CAPT_A              4 /* device ID for dma unit            */
 #define ISYS_CTRL_PORT_ID_DMA_CAPT_B              5 /* device ID for dma unit            */
 #define ISYS_CTRL_PORT_ID_DMA_CAPT_C              6 /* device ID for dma unit            */
-- 
2.52.0

