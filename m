Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BF51E1E16
	for <linux-staging@lists.linux.dev>; Sat, 23 Aug 2025 12:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755953020; cv=none; b=iAzbFVNaHeBxgY3qws8fdGr6PpQDa/vY13NGIhYav8Ghf0s3Vwh5u7LyfKtlrgVx6IiY3+JP3S1smnDf0T435JmmJOqk/RfH0aBdeqpcqLn4kFar0ZLQPZl2eo6/CJoqu8mPIPWfpcBTmTXQha0c3hLdesCEUUtaQ4oPgesctjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755953020; c=relaxed/simple;
	bh=YIikSvCwL4fgtKBGPzG7IRo8UVfi03Coa+9G7HcIzrw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fcOGuBTXY4xp3tFBlNJRbr7BVV4phUSSHBfqSjzFqwkexhyVGP8U3rTQpMksSusHDYyEp5JfHAoxSy5utmfSZKh/rFSbjk+QRBkNQGTkEt+QC2bcZo2XT+fGv/4XxFhSDBHDQzKmKfDdj4HHNp5wHRC+uRkS+6Rh5KKDXSg0ckQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RrAYblep; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RrAYblep"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-afcb7abfc5cso466879466b.3
        for <linux-staging@lists.linux.dev>; Sat, 23 Aug 2025 05:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755953017; x=1756557817; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G+w7hdy5uL013HNunk5Svr2/NlQYQi/VIxI5ZhfFEzA=;
        b=RrAYblepjF+3QkH5WgtiJ2NTYKBaU3i9oQyp1J8x4sq/SlnruTxb/FmSbHIdFBs9sJ
         GA1iWvIih9Gwyl2q0ODcu+drthYcrfhnk29wLcS4KyMZS1GcvIxBdxUSPJrZWeCY24rK
         bgUnzAiiJz3OOyrN7okZn1IYwDE7xjm1tDIwXzQXd6w+DW/qHnp3jfRspJ3gz1exw3J5
         wvAX8+KLgiTsIMs2nJexdifNNxSxbxBeTPidYsJgI+Wu7A0U/VMx32WKzH/8tpplKW29
         4UvciCZP7wVp9zLh7/d5hOFYj5PkAFRd2D7H0kcd0Z/XsvfZPRua9GScDoh7eNNtHvFB
         xusQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755953017; x=1756557817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+w7hdy5uL013HNunk5Svr2/NlQYQi/VIxI5ZhfFEzA=;
        b=SlJewnEiaykqF0Tdn/Sa8VwckZs54MJWLa/qQ3aoLBlXeE+MOi6e55JRlVcItIXK0y
         pdUMHyYGyoQWMH1KkZE8ny0+ZrIoQEEZT+UxMsLXIs+nYE9dfceaZrpV0wM/pY+7Ea2e
         nljKeTnsgKmIyxhJGzQCSs7T6AWhlPY9Q3/gmrK4I0r965MNhiqFG00NWoenTTLSBJe5
         Hru9NDSXPhRy0IEnSOV7uLMvN7wjM1I7H69jkSPCtHnrqekHEV5D9T4V187vS+ZJr1m6
         qDDuBVOAXnOLJkgIe+RTsf0Wp69G5tPPdAJdzUpOYBN1NGiQnSDVz8AAdyTetkdyl3G0
         bzBg==
X-Forwarded-Encrypted: i=1; AJvYcCUTDrMCX5sMLoRDWGnpDAs3MVu9WMxu4hP/La3PJuDMHiqpOxvamdMUJ1Ogycxsik/yjcsBPaN3SjosUMEu@lists.linux.dev
X-Gm-Message-State: AOJu0YzoN4NZmooYv+cwnyvWizlhN0wGxSUnZpPBiaTrne1X73NYSasT
	c8urkjt/CkzdPjBInNxcpmOUwF8rk1GWxTmrlB43VGvIq6cqpV8H6UZt
X-Gm-Gg: ASbGncu1asDM+k/H1CEZL/u9DLSa4rybVFuzYYO0ymiItRcCXfFNv5XdWOuznWh+TGi
	jPjcDUl4qyhL2dBjQ37eRNJiaFZ4+BqshdxFLM8Nhp6y2cCqHohDFN2+fS+qZZIlcLvDigg/BpA
	VgErzQ+Wv+UvMo+DEv5UhS0clHh2q0aZ3iaa3uo9cgE10Bm8tCz+s4BqdRLYh3mWtj+QkYHNh8U
	E/wZlhf5rhbq5W3BL/oftIRHjDMM04fsLoszKzd7YkV0eJr5OKZnZvtLhKQOBXKSoPFwA2IoZvf
	3mOEGPnXTf30F5N9B7tyCGI+YGVtB7S1Si3WvIOI2mbHaTYhVb/j0M8fmloPoCy2+g/g6KNS3ek
	VuyGaU1wy3sTQQ3p3Geg+jjhZKA==
X-Google-Smtp-Source: AGHT+IHYTgKq2UJBbSR4c9S8K/8myhf1eFPtQrwBFMbW0Fh3s6SxAw6ABjkuJJBZkcnsmixJ6UZkhg==
X-Received: by 2002:a17:907:86a6:b0:af9:34d0:836f with SMTP id a640c23a62f3a-afe29446a55mr574315866b.27.1755953016672;
        Sat, 23 Aug 2025 05:43:36 -0700 (PDT)
Received: from tumbleweed ([95.90.184.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe49a1f5a6sm165076466b.111.2025.08.23.05.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 05:43:36 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 00/14] staging: rtl8723bs: clean up efuse related code
Date: Sat, 23 Aug 2025 14:43:07 +0200
Message-ID: <20250823124321.485910-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes the boolean parameter bPseudoTest from efuse stuff
related functions. As this parameter is always set to false in the driver,
we can safely remove it. Besides improved readability and decreased code
complexity, removing the bPseudoTest parameter allowed for getting rid of
a lot of dead code. In total, this series reduced the object file size by
more than 1100 bytes on my system.

The patches have been compile-tested only due to lack of hardware.

Michael Straube (14):
  staging: rtl8723bs: remove bPseudoTest from EFUSE_ShadowMapUpdate
  staging: rtl8723bs: make Efuse_ReadAllMap static
  staging: rtl8723bs: remove bPseudoTest from Efuse_ReadAllMap
  staging: rtl8723bs: remove wrapper efuse_ReadEFuse
  staging: rtl8723bs: remove bPseudoTest from Hal_ReadEFuse
  staging: rtl8723bs: remove bPseudoTest from hal_ReadEFuse_WiFi
  staging: rtl8723bs: remove bPseudoTest from hal_ReadEFuse_BT
  staging: rtl8723bs: remove wrapper EFUSE_GetEfuseDefinition
  staging: rtl8723bs: remove bPseudoTest from Hal_GetEfuseDefinition
  staging: rtl8723bs: remove Hal_EfuseGetCurrentSize
  staging: rtl8723bs: remove bPseudoTest from hal_EfuseSwitchToBank
  staging: rtl8723bs: clean up variable initializations
  staging: rtl8723bs: remove bPseudoTest from efuse_OneByteRead
  staging: rtl8723bs: remove efuse_OneByteWrite

 drivers/staging/rtl8723bs/core/rtw_efuse.c    | 138 +-------
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 326 +++---------------
 drivers/staging/rtl8723bs/include/hal_intf.h  |   5 +-
 drivers/staging/rtl8723bs/include/rtw_efuse.h |   6 +-
 4 files changed, 62 insertions(+), 413 deletions(-)

-- 
2.51.0

