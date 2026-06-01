Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B0F38B12B
	for <linux-staging@lists.linux.dev>; Mon,  1 Jun 2026 09:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780306691; cv=none; b=u7lpZBXvd7ILzjPH0G+CUPvI6/SaMZGuc+ZrQgK+cGb8BdV9V0JWjSwmKXHXmMmIKcP/E+FFJxYODcacBLaHhmLIxV5atdiIJ2Ah4fo8TMH1zj4RAbauO8mYoO3hytnG3uaZxb0trKEVPAzNcftDpW45hc5EOUIgUovEUxIaTL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780306691; c=relaxed/simple;
	bh=5DahCWqmnPP0SQqk3lhu3ujsdR0eX6Ew+xi2aoFX+q0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WgtKdxxYSQMDTJ4r89cRUt2xWjEYCiNWO6FM6c5MEFs14i1BQd4Peh9xrdLXdNxWxDLreYS3yjL780md4dgSowZejF3YcHpTQLsJ3rOUZBnoiLM3Bd5Xbig/7ZbWknhdSQB+DoyJmEfailTBU1hve7d+1k265c7X0OUcTcIpiDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AyGY5G6Z; arc=none smtp.client-ip=209.85.215.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AyGY5G6Z"
Received: by mail-pg1-f195.google.com with SMTP id 41be03b00d2f7-c857fba35cfso911268a12.1
        for <linux-staging@lists.linux.dev>; Mon, 01 Jun 2026 02:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780306687; x=1780911487; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=70n4u0thMMgy+9agvv7sD+znyfS3Vesvdwb/N0UaqbI=;
        b=AyGY5G6ZS5pq3W4s3BajMQK01gdTK63LYskVSso0qGnZOZlTwWWhsHUC5LFZJYh4oz
         ZprJTliKg1V9A9rhGoYxkzJDVvohC3mN94xfizi0Sn7Bx6rOnKXGwOIyTQWtbNrIIsWS
         UglLbdGw5NVj20ksvIPhdcM2AxI9xwIJVzt4NEuSfS1Zc0djzvcI/Nh53NzufiHcW2qQ
         8Ay+rgbamgyNdc+iuYqkcgJWPJ5r/vdCWEPKAe1TvQr3ss0ZVMSui+MJ4G3YPGEM15ut
         7pB/bVTfdUK0gDzZwbhzOTDkzdM+Kmh7ZfINxNXs7FE7Co7QY102PoW42r8E+UDmmu59
         XoXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780306687; x=1780911487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=70n4u0thMMgy+9agvv7sD+znyfS3Vesvdwb/N0UaqbI=;
        b=at2kd+/X9jlaw0qQFX482pRit6nXpe5NCrcnpFJb3Bwut0z7mE9i2wSX/sGESvZkDa
         O80e+ZIi4DQT7HW7ly+8aR4NejNiNKuKbWJf3dxV+M6/xgJt+gnW3E6Ux0Y31idrV5dG
         S4yNhxEBmizkMmpazpQYi8Ygkq6TdHWJJTPgpt8yY5MHcGJ3dGOhD3bEsVV0LShKeACk
         TInxO7qdWz7wEa3cNaiMkGTWHbnBqM+yJkAqavkYL+NglsJC58qcdVnKDz6yesjSGamy
         FZ7AoyrCBrTzdy44a5rGZVk/ao3yFO2e1uGoleDgCfn0FFz8UxY8Z8IDleKLWzCRn4iN
         YdEw==
X-Forwarded-Encrypted: i=1; AFNElJ/gTlBXYEalb4oCSN5xQ2C8c0DUQeDaWVDMYnO8Pe97KBDVmatbua+v2v3L7jZEwCXcPpnWA4kAOqqo1J7q@lists.linux.dev
X-Gm-Message-State: AOJu0Ywc6vKaoqqL4M+iawnSLZ1mAjKAhGYKy1mb87Neriu1SxBvcutS
	UYku7jOB4AKRZJimPHc8YV2g5kUV0nve3s/1+qkidfwobOeSlA9KcFFC
X-Gm-Gg: Acq92OHeAUIPWZXC2CHsXXZuCF7jK/uqPMb0kCL5NFLCEnbZzPZPTjchEBbJN9UJDe6
	TfyfEdnpKBMAGxRLTQLd9rgWvbONTqAJnJ5OvTRoMNTBe7jqebVMfSwlRCOSHK3OK7c2IAOd2if
	ydRtmlv2MgqoT4URfdoEAHIgDEn9/TVGG6l+t4uAH1t1zQ6Pc28KpIqVFlqkYKl7cG6x0+odWw8
	7op8sLMyWYq+TGnaxk6EhaCb5VHn9OHBeQ/TI2UFgai/2dQgbv4zvp5tZCoEEQbm5n7MsjZOTMh
	r+36GYJoPwJk0dYdlj+3yoRAu770lekCU2viY1RGuKOZxZVZp6kwJ1eO7tgKWT8jLbKwbaZUcW/
	Mok8fzuf2jacc4R3KzkVbjaW2rAGI1bXC4Spq4XzIRXf6OxbUL1UYqoshYDFfwHRy7hdawDAvH+
	C6dA/RdNMwEfana/lSyZZawJSoBpu1rsJ8M1lhlx/FNXF++4JoPXKWUxTfxkb5
X-Received: by 2002:a05:6a21:3511:b0:3a2:f75f:73ef with SMTP id adf61e73a8af0-3b427fac967mr11219593637.37.1780306687457;
        Mon, 01 Jun 2026 02:38:07 -0700 (PDT)
Received: from localhost (bb219-74-228-4.singnet.com.sg. [219.74.228.4])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-c8583333e80sm7129329a12.18.2026.06.01.02.38.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 02:38:07 -0700 (PDT)
From: Eugene Mavick <mavick4022@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hansg@kernel.org,
	straube.linux@gmail.com,
	nikolayof23@gmail.com,
	mavick4022@gmail.com,
	khomenkov@mailbox.org,
	william.hansen.baird@gmail.com,
	maxwell2119@163.com,
	dikshakdevgan@gmail.com,
	arthur.stupa@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] staging: rtl8723bs: fix alignment
Date: Mon,  1 Jun 2026 17:37:57 +0800
Message-ID: <20260601093757.612130-3-mavick4022@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260601093757.612130-1-mavick4022@gmail.com>
References: <20260601093757.612130-1-mavick4022@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix alignment to improve code readability and clear checkpatch warning:
CHECK: Alignment should match open parenthesis

Signed-off-by: Eugene Mavick <mavick4022@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index 02f8564d32a7..e534045dd467 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -249,7 +249,7 @@ struct	sta_info *rtw_alloc_stainfo(struct	sta_priv *pstapriv, u8 *hwaddr)
 
 		/* init recv timer */
 		timer_setup(&preorder_ctrl->reordering_ctrl_timer,
-				rtw_reordering_ctrl_timeout_handler, 0);
+			    rtw_reordering_ctrl_timeout_handler, 0);
 	}
 
 	/* init for DM */
-- 
2.51.2

