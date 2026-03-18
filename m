Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CA72D7DFE
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 15:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773848159; cv=none; b=sR+jW+S5VZeXMvuy2Of6m9jQDbUzBgcc22EXdQ7qi9wlhQvXPTM4ROobyMdeLyrCJESUXsDQgb5DK05Uxrocqzh6ujD7y5pKIXbHCS3dxACRaCGZ9qJBS1OX4OGHGwhZfJuDq8y4Eej9VpERJ5jot6IQyGsdvVCHsc6J1Nt9F38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773848159; c=relaxed/simple;
	bh=hgd/Auf8zOHJsqeTPV9xCQuiX08VF69pg+YajDoBecA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iRZwlTAHl/KSkFTntpOcU9f1n3aT9AX4sDqOTisHeqzc6iO/LbFRGTjsMHGNibjoTRhAghI9f5C5GhZcG3DzCjRzMqpIyYAk5nqgHijVG/u1+cR8JtHssvReHPQ+113cqMIcisvk+8IpxaSrZp1pCcizdCGgiHsHmRK79J95K4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gbclg0mZ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gbclg0mZ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48541edecf9so76441925e9.1
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 08:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773848153; x=1774452953; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4yod8c3zHDtZ7v4GwZL4B0VQMfxfJhQ7gLeaj2wU1uU=;
        b=gbclg0mZG0ivUQ6XebQndFvgSrm+o5hRCtAOyY8ccQ7fQd5YdQiGD5te4ctJjEilOk
         l7MaBkWrvNIXZepjJpQvZCwWuLVflhuhD0jqYm1D2PYvP/aYo7BBkPwAAP8/rMaUt1tA
         sXC99v8gzzZu87JT2sXH2ErwJERB/v5qzS3eIHNa2Zqstpg3mX1OEF2xmcoo91Co/odc
         zMhIaYw0A5hoDrKDvKiG/QwCM7EywSobgQHUAQZ6JO0eUtmT+TNgLPpoKLJg/WjTIaUj
         +wSMcQUV8yAdDOzsrfzddX2NlsFA5onwkFIxdOiI4QbAgb0iAmj/a9VpySrp6Z1YeMDU
         TAxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773848153; x=1774452953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4yod8c3zHDtZ7v4GwZL4B0VQMfxfJhQ7gLeaj2wU1uU=;
        b=Pn3i8wNkTDAO1xOMIb5aWdGdc+gOVJNyCMCcSASn9eIFQO4KJRfFAjLoUyaBGWIb9U
         CjZCSylTWP5nNvyaErYpvSgsrr9MbMI5Ic+UN7L5c7Zz/Swv+eUgXD4nHgM0w49V1S3D
         ts4VTLcF/9qu8tjmJ/y6adm4KT0QLRqZVj22vxnHi16fwn8+KD20V6scoUnj43dL205v
         Ul4ekrRLLqgxxDSuxfgIOtPllZer8Y6qTLN/FHhtfC7gQLydrWRYbc7rmGnU4J39rsw+
         nrwmCZu3YSS5/13kaYGHlwwK+Vwuxb9+/mAGqh6g83BV5rz0gySvn4T9zN/dNT262bxp
         Nw3A==
X-Gm-Message-State: AOJu0YyQ27ZEDK4RzJL30RY55WSe2Oy81qajH/EqhlMPLJiom5lJKjjC
	Z/m5odCJsEVULTuHQG73YbPT/ZsI4Eem+Yle5Wp4K3L6CxphS5bPUPKs
X-Gm-Gg: ATEYQzz2jqVdfcS0cJE0zKp9xszluMBoAFfIijCXGOwVHFO+ZX39aLWEsjJT5SK+EJo
	H6D7cOYtFH3l7GGqzIYQn8/VrsXgayoecqtw8LG95Q/G5dHxOu76yk0Qicw2XJf//jQ4nGys3Nb
	sf1nl6uUoM6CmyJEHaSlZyrYISujMrd39tgiUWLNfDt+kM4bozJeBx/Sda2XQrFssVTcd3qU+8H
	vAm4IKvDbIjd2zmP91gvwKqcfirdp22yOgvGdgMbkks0i3xRSMTISdbBHhVU0aCNI+wwusHxRHO
	YgqcsDCoC5yfqcCf7tYGCYxL83wN55fbTKeX6LOu+bmr2nkMWT8p0Za84AeV3I0/D/ImMJJhQD9
	G9PG4NwrUJdGUmiEg8GHe/HGrLObvlfBI5oLyxVTOGy14Yqhqqq0uxECCJraht6FWpmK9pbwy0R
	K87AQIHgWbYE5e2/T++jcwy20tKinxQZ06q/+VJyaiGF6WwEsSL4mcEw==
X-Received: by 2002:a05:600c:4fc4:b0:485:3b00:f92e with SMTP id 5b1f17b1804b1-486f441bc46mr62041685e9.2.1773848153067;
        Wed, 18 Mar 2026 08:35:53 -0700 (PDT)
Received: from localhost.localdomain ([176.216.150.55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4613243sm40620155e9.1.2026.03.18.08.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:35:51 -0700 (PDT)
From: =?UTF-8?q?H=C3=BCseyin=20Can=20Erdem?= <erdemhuseyincan09@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?H=C3=BCseyin=20Can=20Erdem?= <erdemhuseyincan09@gmail.com>
Subject: [PATCH 2/2] staging: rtl8723bs: add parentheses around macro arguments
Date: Wed, 18 Mar 2026 18:35:15 +0300
Message-ID: <20260318153515.5071-2-erdemhuseyincan09@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260318153515.5071-1-erdemhuseyincan09@gmail.com>
References: <2026031807-june-stress-0ba7@gregkh>
 <20260318153515.5071-1-erdemhuseyincan09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add parentheses around macro arguments in IS_FW_HEADER_EXIST_8723B
and AVAILABLE_EFUSE_ADDR to avoid potential operator precedence issues.

Signed-off-by: Hüseyin Can Erdem <erdemhuseyincan09@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtl8723b_hal.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
index 32a93653b..cd3b49338 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
@@ -28,7 +28,7 @@
 #define FW_8723B_END_ADDRESS   0x1FFF /* 0x5FFF */
 
 #define IS_FW_HEADER_EXIST_8723B(fw_hdr) \
-	((le16_to_cpu(fw_hdr->signature) & 0xFFF0) == 0x5300)
+	((le16_to_cpu((fw_hdr)->signature) & 0xFFF0) == 0x5300)
 
 struct rt_firmware {
 	u32 fw_length;
@@ -133,7 +133,7 @@ struct rt_firmware_hdr {
 #define EFUSE_IC_ID_OFFSET 506 /* For some inferiority IC purpose.
 				* Added by Roger, 2009.09.02.
 				*/
-#define AVAILABLE_EFUSE_ADDR(addr) (addr < EFUSE_REAL_CONTENT_LEN_8723B)
+#define AVAILABLE_EFUSE_ADDR(addr) ((addr) < EFUSE_REAL_CONTENT_LEN_8723B)
 
 #define EFUSE_ACCESS_ON  0x69 /* For RTL8723 only. */
 #define EFUSE_ACCESS_OFF 0x00 /* For RTL8723 only. */
-- 
2.47.3

