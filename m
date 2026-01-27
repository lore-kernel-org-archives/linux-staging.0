Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCC3265CD9
	for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 01:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769476910; cv=none; b=h6rDrN2tbsm1av0guAaCeoTrYz7ZBNUUL9fd8UQFMwpkx1473yv46LA2ReTKmtX/Kq1AzLdXJCT9+cn0UgKEW0AJmaoJONMmfyCM1sPfqk4wl2tl4by6IxxdJSnMtAySyrxtxBYNBVUqKhHlti3BzA5Yo5+FX1apR1Gd1IGe5Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769476910; c=relaxed/simple;
	bh=FOkv29nEYucBdaK0TCDNtrtaCOt5iq4tQh3P2LSPZUc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Naowql4mH+BRXbfary7unycF6x7W8prT2XfEjwE0skqiqzkH1RtNT6czenHFWfnSoLbGDtHGm+580hQZghxZnu5qXgmA5qlGEcbbSGyyon0lZo2lpX+42bgwcwn9aEqhNJHQw7KHbMl2j93kx0hqyczxnrdnKy4KqaOCJF/vvdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WUbBxBDF; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WUbBxBDF"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-790b7b3e594so53055347b3.3
        for <linux-staging@lists.linux.dev>; Mon, 26 Jan 2026 17:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769476908; x=1770081708; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dn9HCRUTLSb0WGFaKFz+y1mSDDwRePumGtcU4XsiQz0=;
        b=WUbBxBDF9lBXzxaU6cRWAnR89P8g/qWThR9+yvE80aPk5zwiBVjRn9R7hiaZxGnzdC
         UQs9VvmFqfQ5p8dJqs12+avyVwyopQAWC9f0hy1R/9T4/arOtxizvhzAz9qpt5SmNRUa
         CQexAtCzzsYeZj9tEqngQNz48OdCYnfMk6ojFhVDQ4AmMV1g9G0VAX90WilUK5jEkdSK
         oKGn8JqZK8wOIZ504s4eK3zKBTBOm5ZIS+G7KVl19Dr9An4SstRs7lg0rn+aSZ4FuHu2
         r+z/cQRjR+BPim1Ly5LZwoMaa61mz5nDhhp4f+RJ1YKjZw2eZJybnQ4uqieCdeu6NdUH
         dZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769476908; x=1770081708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dn9HCRUTLSb0WGFaKFz+y1mSDDwRePumGtcU4XsiQz0=;
        b=fY16JGYboRffKcKrNjlWBSuVwytt2aJeFqvzYK7E96AIc8CFk5AqGvLGwdcWmBBXVX
         PXV9yrbUpZYr4Kc8eJ8yjtviTBelk+zgQ4h+RPGJiOZBkEUCMmW/d60MDeHtSdQAdEdV
         Ompt1xPNecMVk0zTcfINllhLgRGM1Pixy9P9VdOzzft1U9hSTI85f4orRPYGTfXf7wEu
         K7w8QPFPzHCNvbZYbGev+nyBXfOOHWwXHe/r0lIJ29Y+5ytkP5ugbuKx0FJoS35g54Zh
         +4F7yYCtgbBPO+HXyIIB1OzW3IPw82XAeXcDUXLSrREIJeFJx2WYoKEPm2XhBoPV2n5w
         PLAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGvV6nNn4GhJMCwRn4GpAx6z6GNsTvacVeS8rVrqGfiVvkBGZMyfTdkXn8/JdtRjI1s4wcDlrurqQB1AKr@lists.linux.dev
X-Gm-Message-State: AOJu0YwR1oBG5+P7DfR0rcS1dAfMTvlM3EHHWIhCOjchpJrnMRFNlNCc
	PG2W70BhIpzzRWW2tejeNz82fh4zR6uwOQ6Am9XeNCrotQ3PyHxMth8C
X-Gm-Gg: AZuq6aJGe3d3DMaSzP+GMjTBraJZcG+Ps28B/7lcBQTDS7CRhiaK6fInaZhTbbjPoOg
	AvJT9lc0OA1bvSIRFjerjDxMnVs4rXGVitQSfyknMEQvMBTM2miQrvteXZ0Km5bJMlI+FB1uK7o
	EBayUt3Ns9r2HTMQ6KLYuUUYIEXBQgdM8n9uC0zpgFfTolsPW63w0DnPovsIMniVRedQxzhV/HU
	l7jQncudBSlq42HfY6Zi0Q/csHlgyPEuRaMO8qLY5EhZq3WNMThmkynocPtg97SeLgXvQ/2XeKU
	U86KdetD8Kxcqpxy7nSu2w+Hn8Pc61ZQQmMSHvKid+eKyYugI4G8CpCya+5bzgi/84sPv/4eTyG
	f3pv0fL5N3ChVNqVRXcjr1N0DEzdOiqAYOxoeIwc1OVYfeT3kL0GYR9jjLeHVwTBAE/o=
X-Received: by 2002:a05:690c:670d:b0:793:aa11:d9fd with SMTP id 00721157ae682-7945a8b046bmr43939917b3.25.1769476908098;
        Mon, 26 Jan 2026 17:21:48 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00::89f2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7944c5c9b0bsm40189657b3.57.2026.01.26.17.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 17:21:47 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH v2 8/8] staging: rtl8723bs: remove unused variable RFE_Type
Date: Mon, 26 Jan 2026 19:21:18 -0600
Message-ID: <20260127012118.43037-9-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127012118.43037-1-ethantidmore06@gmail.com>
References: <20260127012118.43037-1-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable RFE_Type is initialized but never read or used
anywhere in the driver. Remove it to clean up dead code and fix
a CamelCase warning.

Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/staging/rtl8723bs/include/drv_types.h | 1 -
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 00da21774c4d..11e1feade4e4 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -160,7 +160,6 @@ struct registry_priv {
 	u8 reg_enable_tx_power_by_rate;
 	u8 reg_power_base;
 	u8 reg_pwr_tbl_sel;
-	u8 RFE_Type;
 	u8  check_fw_ps;
 
 	u8 qos_opt_enable;
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index c163e2eeea26..f7f23d1b1709 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -263,7 +263,6 @@ static void loadparam(struct adapter *padapter, struct net_device *pnetdev)
 	registry_par->reg_enable_tx_power_by_rate = (u8)rtw_tx_pwr_by_rate;
 
 	registry_par->reg_power_base = 14;
-	registry_par->RFE_Type = 64;
 
 	registry_par->qos_opt_enable = (u8)rtw_qos_opt_enable;
 
-- 
2.52.0

