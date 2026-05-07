Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08662378D79
	for <linux-staging@lists.linux.dev>; Thu,  7 May 2026 15:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778166896; cv=none; b=tTovdbMd0uFADvjWa840eb7Ztpg/mrbD5pedTdSk6VWbDU2UGR//ZMNxPompXtsH/VKYYfms5wjEZcb8TzWHZpSVQ5MHAq3LshelqG/4AykkkDMGazxeK9p42JmILlDyyEwnrm0aIG0RVlgULv8Va04Hkm8d0f88dMajbTUSnjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778166896; c=relaxed/simple;
	bh=xFS5J5u77pt3Y7Hf4FpTk5D9ePHHCptoA+oAHM0seJg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rv9x8UnSxAPHHAPmkxJstWhfxp8+gjHMKQ9We47lbr+iHmoZ9cWc2rObvHrSieLgEaC7I4ri3+bqOjDmGXFH7iad/fCdrhPf4rCHjueGxJTvrxcWYYIrI711quk1ZWoQSmPbVomR7d/txHdQWKUj36BoM3aiPgyXd1Lzm0xGwVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dnnCLXnj; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dnnCLXnj"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ab077e3f32so4824745ad.3
        for <linux-staging@lists.linux.dev>; Thu, 07 May 2026 08:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778166894; x=1778771694; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EkKYvF0OF++20NLzTdvDQYF9J4JuHMfHvRom9bmio3E=;
        b=dnnCLXnj7QBFxjhc5JnheF3P5ZdV4E1xYDW48x4020W3BNS6mePomGSCXfYRvNtPXs
         YYAYZx888cYBsFQkYu9b/aZZgarZ/l//taKvsh15/OL1QWKbfqInUgSZGEAtKgSpide5
         aSmcmJBW4RmDgmmGp4JVptPn9HWRK+dMFjpxCKgp/iCCJiTCBXRf/PFPKOr2SDPKSKth
         nUY8T9do0Myr7njrnJZI1/NrKaAj5r8sdOhbgI6NpfWaOOJABY+5W6SiwgH/C1qGyLOM
         7PzItEOJ2Re6ztLAGVu+sW08LznZP1mXM8FiDOOVyDLtxML9f3SlqGD09+IeOSM4YUg5
         q3WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778166894; x=1778771694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EkKYvF0OF++20NLzTdvDQYF9J4JuHMfHvRom9bmio3E=;
        b=cqaAV8lhUuMcjc7MrAryNuXKRzvIWBcC+z1UIm9IEmi/xmZIe18keBsHa1epZh9LxY
         1nynr7JmyS2g6m4rSIQRbOzmZrGc4OITPVtUrhXSG73fuAVkrBCVFHvl15G9dfHXl7rl
         cC7dKR1LzeQh00vku9SN+asBjf4DEjnwmGtRH7NUUrDB3oV7gS+58cSOTWI4DBWaSpzt
         vapsK/gGGIajjXkrsx/8j7vDmphOmlo0vkuHrO8M5uvBoVEBSLVWX1WmcWneJcIrZMHl
         oOiA2BVDXxZgS+jhHOAADwLAb7xIbUCYXxIC8RaZgQWOPdspEnky5/InNFhEZo92JXFw
         oZrA==
X-Forwarded-Encrypted: i=1; AFNElJ+s0r6TTj1L9oHSNcMR/zGrKhO97W9loCvXuKKetm4E/Pz0cVbyz8tQGjk4LuU8cD/hgEn7GQldOSA/gjUX@lists.linux.dev
X-Gm-Message-State: AOJu0YwjSzDHx8i3G3YTqxO+W0Hl3+L7Sbc5sUKiFDdOAk03EKDJVGI1
	H//lunD00Ili/wM0BevFqw2+xaKCjAodWhTll2g02B2rEyy1saZCz/Qd
X-Gm-Gg: AeBDiet9fwpHRYVwcB08LINfrtnyB06fSDhGi/tNyKWj3naEmbjsG+OwbAT+aE0MTvJ
	sf+xM8F4isVtcrhR7jkw/yFK9GTK2LCzD0cJIctVN6yJPROL0IVeHoYPCqjCYx/+sHpMfry1+r+
	u44qEttJBk6wkKenIfS/91NTVMLnmDyQFxQ45HG3kfZZCpwg5RSHE9x1IwwWrSQKHm3yA0eZwTQ
	X454Q5v7lF3Bep7RuIcqzR+eN/T1nTUMy1Zhe3uXfwvdk1ah+wV6k0zZPrQRzudm5MeYL6Rm85a
	oD2tzl5oZ5hjgbjcpaXCrbnWNiQUlTPe0AGRyQFIRRuf0XIzY8+XNByRMmS6YTdKkXGcx3a8I9J
	iQ4+oUf6x7YyRI8wGYLYpdiO71m2QsOjqykwFZI4lglr7UL6SII/rwUreg4koMP/jjUKTK3U6rf
	UKRldpK8cY1Yy7Z65pcdHdZxOWyYdPz86kabB6iuk=
X-Received: by 2002:a17:902:e54e:b0:2ba:4eee:6c1e with SMTP id d9443c01a7336-2ba78e40c8fmr87801885ad.15.1778166894387;
        Thu, 07 May 2026 08:14:54 -0700 (PDT)
Received: from localhost ([2405:4802:1bf7:b0a0:33c8:3ea:357a:8f94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bae78544ddsm112945ad.56.2026.05.07.08.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 08:14:54 -0700 (PDT)
From: Nguyen Hai Phu <nguyenhaiphu06@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Nguyen Hai Phu <nguyenhaiphu06@gmail.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: media: ipu7: Remove unused struct ia_gofo_secondary_boot_config
Date: Thu,  7 May 2026 22:14:27 +0700
Message-ID: <20260507151446.153614-1-nguyenhaiphu06@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The struct ia_gofo_secondary_boot_config in abi/ipu7_fw_boot_abi.h is
not used in the driver. Remove it to cleanup the ABI headers.

Signed-off-by: Nguyen Hai Phu <nguyenhaiphu06@gmail.com>
---
v2: fix subject line prefix

 drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h b/drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h
index a1519c4fe661..21d1ff7ab29a 100644
--- a/drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h
+++ b/drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h
@@ -91,17 +91,6 @@ struct ia_gofo_boot_config {
 	struct syscom_config_s syscom_context_config;
 };
 
-struct ia_gofo_secondary_boot_config {
-	u32 length;
-	struct ia_gofo_version_s config_version;
-	struct ia_gofo_msg_version_list client_version_support;
-	u8 reserved1[IA_GOFO_BOOT_SECONDARY_RESERVED_FIELDS];
-	u16 checksum;
-	u8 padding[2];
-	u32 reserved2[IA_GOFO_BOOT_SECONDARY_RESERVED_SIZE];
-	struct syscom_config_s syscom_context_config;
-};
-
 #pragma pack(pop)
 
 #define IA_GOFO_WDT_TIMEOUT_ERR			0xdead0401U
-- 
2.54.0

