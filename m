Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE781E5724
	for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 16:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774108968; cv=none; b=cVV2XTLUWgGFVLFIrpjGLH/E7ZNm9r25xzqhJtdYYg4fUBoRZR/Smp/TM89S2FKNgj7JhJ31FNcnV4TR77aHK0qOB6wb7xoTE+nnCjw4JPh/HtnFEDz1+xp0g6kTsjA+7cpKwF0ekmkUIQpekOeGYUrGl32JwserBWj77SKM0xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774108968; c=relaxed/simple;
	bh=vsldp4MpUbLBEkHKrRaW7BdJNhICRrig6kecdOG7c98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cbdrDEbNYHviVu6NwqDZXOKI+4zZkARHKMjbj3ISzlZR+fSqhvEm/wRxGy1KyAe7N3vP9JqURb9fbnu3w7C07Sr6LuW1+H7Hk4G7wbaPGiHlUHzmSIpg1mrUrpmECzck0sFBXhlCEN6S/tm0CeWgR3CGvcsOFcrFbnocMi+vrNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cXObRjI3; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXObRjI3"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56a9c5cb48bso881280e0c.0
        for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 09:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774108965; x=1774713765; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kOoT1I8Hwmf4qwd0+D7vff4isi44iL4YiCfQGzaVF+U=;
        b=cXObRjI3K1PUwvs6xlcQuiB+5zY4vG45brgF71ZQN7fTpmfuR++HX8eEJ/BsrG3jfV
         h+8Y2GwvkNkfq0vlL6Zv1lvVDF4VOLyFMvzTrE2wfPKthHwZjUPB3QJKSVeWTCMtlHCO
         IEB/Y2Jg0j6DFB5wt6v/u5tVqi6Ze/ARbDYGpa/AFYs1PjM1BrO7mxZAs6UemrbOq9JD
         TsMnJ8Wo3/L7OZdoU70AF9gWCmoT7lb2mV96RTswFC58ngExuesv+xxQ7PlEKY0LLkkt
         u+hJe6zxgpyUaC1wka429NyldP583MRiSnhXs1w5ytDdkv8NYZ4Kdw6a/ylRCT8cmvqD
         Or9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774108965; x=1774713765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kOoT1I8Hwmf4qwd0+D7vff4isi44iL4YiCfQGzaVF+U=;
        b=H/xJ31xgS+0U7HK2KX9rZiEMTL/iicmvfrSUYfu672Pt+OVs3lAruLxegikgKQ3Qx+
         58kPY5W6oD9V7gywNXze6s6BCYkHB62yd1vxH5V7N5685j8luBlIdwR9V4dR8J5m06aB
         42SU5dEc/I2HwcsgNCutAW7jOkNyKkyLYm/qjxCoHE/nP7FCn7CO4/3l6OOYm1rZVNHO
         atYamPSb0QMhDGcoJEDxe7vCoXYslJXMZkVzNiyWCduGF7AsU5I60g+8a/8ipGrrh7JD
         2xcVeMkBD0dOCgb4qeGcHF7qps265MU9QMUUjS3OJ8v7zNDFxV23ORDjnbISCDHAM5c7
         irmA==
X-Forwarded-Encrypted: i=1; AJvYcCXaAU8/6U7IAr66FFkCk+3/RV8qQFbm1aqYtEij0qneS68P8sXmwM2wRpI8ZAhuJ1vpDvH8RaJKbcwZwasQ@lists.linux.dev
X-Gm-Message-State: AOJu0YyKXwhEj8VN16yfLoKFVujVnIfU44aHiVshyVOuLgayIUwJod/n
	q/V3KqeTPXfie0UTbgi0Z5B5akoI/CGb09Kt9f5zYin1hx5T6HbyGRuX
X-Gm-Gg: ATEYQzxgn/Av5JJIKeNHNRXKnX4mvNyj7B/NZ4PGHGXW20wG5Ni8Ok3xIj/TrdwOn1O
	5aOAs+fEsCl7Sx+JXhrpiLnsRXfIkLEYLcEY+SY/Gvc+Lvx7+x3pKzYuotCUwVAR+RLqDbcIy/q
	ajecee3d5THIlxeDiU7arNeswQEmWztjAwW5bYI5/XkBVpwJSfQ4ppl/EXS8klvKYoG/npQhzfF
	S6r2TJz5eKyfFx/IDDe+Zl8s4FZPmbIO0cI1rg0Nr2oymr4mQ8RWkakxvSmwsB0pIQuqUnUU3fg
	aVupgzTm7ZTEul2JQpqJLXvMe05UKmAGRaE00TeeswpN01rUopwkTeN0F7BmXxWxSQduhZDCL+8
	jnbPqihw3QAtKs6LSq0Hp5pmfTLSE4SmN9QzANScLzD3GG90oY2oOwnkiOhrFLaxAYvY1gtJOdh
	KvFzfb3XS+JWrxGQCH7XD8qd3njJrz2Ok/vtarl4A31IoNNgDc
X-Received: by 2002:a05:6122:2885:b0:56b:9ba4:1372 with SMTP id 71dfb90a1353d-56cde3f20c1mr3291034e0c.9.1774108965487;
        Sat, 21 Mar 2026 09:02:45 -0700 (PDT)
Received: from localhost.localdomain ([131.255.96.168])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56cddcc2d60sm4829916e0c.15.2026.03.21.09.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 09:02:45 -0700 (PDT)
From: Marcos Andrade <marcosandrade95963@gmail.com>
To: dan.carpenter@linaro.org
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marcos Andrade <marcosandrade95963@gmail.com>
Subject: [PATCH v2 0/3] staging: rtl8723bs: rename rt_channel_info members to snake_case
Date: Sat, 21 Mar 2026 16:02:15 +0000
Message-ID: <20260321160217.36060-1-marcosandrade95963@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <message-id-do-email-do-dan>
References: <message-id-do-email-do-dan>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series renames the CamelCase member names ChannelNum and ScanType
of struct rt_channel_info to their snake_case equivalents channel_num
and scan_type, updating all their usages across the driver.

Changes in v2:
- Fix incorrect member assignment in rtw_mlme_ext.c
  (channel_num was wrongly assigned from scan_type)

Marcos Andrade (3):
  staging: rtl8723bs: rename rt_channel_info members to snake_case
  staging: rtl8723bs: rename rt_channel_info members to snake_case
  staging: rtl8723bs: update rt_channel_info member usage to snake_case
    in wifi_reged.c

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 82 +++++++++----------
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |  4 +-
 drivers/staging/rtl8723bs/os_dep/wifi_regd.c  |  4 +-
 3 files changed, 45 insertions(+), 45 deletions(-)

-- 
2.53.0

