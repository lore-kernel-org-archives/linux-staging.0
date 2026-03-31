Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4AD2C15BB
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 16:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774975489; cv=none; b=Td0jP0uhO72vdC3+LfZ+YOanMagduUIoMgyymiePW1gszh/kITJy8qM8hrUyamnvUrqc1g/VZ+5E6R5S8w3LjWX7NvwJq8kkNOEj1jL1Jz95JhI/80aFPX5CTdXva6TJr2MkJUqDQgWxlUBmgpFuzJpu+1tuWZ4eIBYPh0xZoyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774975489; c=relaxed/simple;
	bh=wAAzvbppSXnpSZR9uf6b5wtnBW+eH8zJbzPykDmGAW4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Q8zQ6BLdwSFr8vq8P6zAymmoGlPOqYrChT2PxV/A5eRnG/C9z3aZO2bISUcg/Ul2Xo5Z00Ow37deKcevdqrvemMTk87K/arHLps43hpN9Kdr5BGSJvIJczULsUePVBS8LjDBk6Dwc6pqfR824mbm4qPho6dDFcnvGYFBHfXr3a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CsyeIqzr; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CsyeIqzr"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48702d51cd0so70268745e9.2
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 09:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774975486; x=1775580286; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QX2plK9fWTBnAWrRTur6TjhAEBGR23mNVxFAED1Ph6c=;
        b=CsyeIqzrZQfkHYUgHrJGPYfpAOR4NnvGQejH5LWmfyIwHwTjid2P4iZoUycbz0fi1z
         ESEoMOtDaN/Wm31T+RgopsDMNY8zyLpzDoh7kmZmqlp4WecRSfTd4AJLqw0rTK4VcvnA
         QZTJoHxKgzVsYmh4HWho29m7FCKKjlQUuL5TVTpa4b4syuli8+ox0oQnErIV0m+LFw55
         hk9tqkInjafliGgAPoGBp4nYaBn+y8V7Lz5GbuzxhL4RDIL/5ASnjFZJmBRu08nzP5oG
         cUcxXqpHWuKbEwf5OVMf7PwIy/jqIhYqK3l4aqdYJ0MdIl5zeeITjjWnSTuhiZ6oPdy9
         PosQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774975486; x=1775580286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QX2plK9fWTBnAWrRTur6TjhAEBGR23mNVxFAED1Ph6c=;
        b=n+wjWH/TAXB+pGRg8HPAlMp1NFs/cKFlXC5Uy0ocLbtAtWX4Ru58Tn6QjQB45lyV5h
         cgtg+ZCVlnOvm7bWzh7t+3T4Hv8RSMP720HayMyBY212VDeuVwIoURRmYEIJGbdP+Mu5
         9ypaom+eTVZlFAXypzjx3DOggab3W3ISNguhII7cxlGhqzJWE5DPpFbgxP8Nmhr6LxwO
         Noebt2GzSNYcyMGPqiBEuEW8n25aAgpjkUoMStqx+LrykivjzElOEGjQcP815whaMOD/
         xQuHVlR1UIodhA62ho5n357fGtMc7bjgj24XsCMbmfJ/YD6ZTPGXzf2J22RFul09Z7pp
         zbow==
X-Forwarded-Encrypted: i=1; AJvYcCWexqk2MI+D0atpovuqu8YNqIZ68u6HhNw44ikMRy54Urx9JSZZaGLfUg3Sy5LKmz5CWXNL1M+4nuPpKxQ7@lists.linux.dev
X-Gm-Message-State: AOJu0YwujrqkAt46nDALoYUrTR77d/xilCzG0cDDys/18ph/6YvKOSla
	SIfpAMvV68Kijx5XrKZE6A1F6HeGFebT4LG/kazqsgNpvAw3WFq8RyXL
X-Gm-Gg: ATEYQzzSO4Jcc83dMvPIg635ZJsMcC2Wj2sygTqoM1w0SxUHWzl5AaUt4Z2yqUuyAMV
	bcYwlBCpvqxOo+hHxHPVfJxNFKK/E9ZcNMsWZev5jxy0mEemZNmmN8ZPtMx4/QIoyDGoKTuOrBo
	j/jf3aTxZC0Vvz5EM+w2BYs96GaXSM1UEYAwSNhH1IVPMqK5Lb1bffCUm8V8A2p8vXHiqjzX5QV
	+LpXNRrLol8v689PVleqxw/nDoQHp5fT/lMsu6JqaEROnIme8ENco0UBZ5xEXmwjv9TLjFrDPvm
	q7mUWSqZ79ni1+JOJbu8F74Cdq16TtXwk9PgwKe6SgYIMagz2xpUb9zcA5QOqwZhCaraea/uTVC
	TS8TpYP12toKRzaNjrATye3v7YfFBNPcfgTOVuuTPni9jTtgbyFrJfa1TVjR40jNx7+9tTm7nSh
	8c9igKbxkn0T5OjleqoDAPeH+sazqbcFq3gIaNDfpwFPeeg+ufJFXe
X-Received: by 2002:a05:600c:45c5:b0:483:6d42:25c6 with SMTP id 5b1f17b1804b1-48883592213mr855675e9.23.1774975485885;
        Tue, 31 Mar 2026 09:44:45 -0700 (PDT)
Received: from localhost.localdomain ([2001:8a0:6c9b:a000:7962:f026:60f9:dfb3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e822227sm53110625e9.4.2026.03.31.09.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 09:44:45 -0700 (PDT)
From: grondon@gmail.com
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	christian.gromm@microchip.com,
	parthiban.veerasooran@microchip.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gabriel Rondon <grondon@gmail.com>
Subject: [PATCH] staging: most: dim2: remove unnecessary NULL check in service_done_flag()
Date: Tue, 31 Mar 2026 17:44:42 +0100
Message-Id: <20260331164443.47682-1-grondon@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gabriel Rondon <grondon@gmail.com>

Remove the !hdm_ch check. hdm_ch is derived from dev->hch + ch_idx
(pointer arithmetic on a struct member), so it can never be NULL.
Keep only the !hdm_ch->is_initialized check.

Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/all/acuoL4DRi0pmsQY1@stanley.mountain
Signed-off-by: Gabriel Rondon <grondon@gmail.com>
---
 drivers/staging/most/dim2/dim2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index 7953d4626..f5bd7d44f 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -271,7 +271,7 @@ static void service_done_flag(struct dim2_hdm *dev, int ch_idx)
 	unsigned long flags;
 	u8 *data;
 
-	if (!hdm_ch || !hdm_ch->is_initialized)
+	if (!hdm_ch->is_initialized)
 		return;
 
 	spin_lock_irqsave(&dim_lock, flags);
-- 
2.33.0

