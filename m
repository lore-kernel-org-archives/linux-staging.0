Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117D816F910;
	Tue, 25 Jun 2024 15:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719328810; cv=none; b=epp2CiyyAtx8XaoZK2c97OLAot2JKPD4phsOQXyAFtO2+xQ/olwauHp8dqHQT1zEycxKLhwLLgF7o3YAhbeKBl8LJfmZOnEMYaRruQifUdiQRNmbaZtYKN/XxCmNQVRMDP8W/Qoz+RJyHcvy7rCVk2pkihN3TVwl7TafHgF67jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719328810; c=relaxed/simple;
	bh=ro15qrG+2X7dzLSbBTP8U40hi2ii1P6THkENl0JJl0c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HDzktdCc1PPGZso3I/wHrDUoNoUjYYVrkcbnuB+KScdXNCq5QMH1nfEi6BbqwUVT1ETqo8vVtIbrI5ocWr1nUGnGLyjeJZUJ3r+Mylg4pugzWMpnQITOMAj3IZ/zDJ16EtPG1/DAhE+Vgr9rEGq0OOK7glqDzzZhXEJicp6ziQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XeRvLL2S; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XeRvLL2S"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ec408c6d94so64863501fa.3;
        Tue, 25 Jun 2024 08:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719328807; x=1719933607; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M7My76Xx+peBaX7RrKQa/BxRrvIU630K8BNIFUaH3MQ=;
        b=XeRvLL2SLX6FGVKAMpvzVWq5KCiB4iUfD6By2OM1oyFRtjqF2tP1Vm429SNO9xIROk
         yAG/W/Ur7x2kpLMRz0hMu7ZEnPGy6GdlD1T3d3GPcrBKcQ/oMQixzEpnU+Sg9HqXDLPK
         C+rrenqC28ievFnYxy4oUA34OlN/JxNawxzHkX8HPZXj6/F/9dgMw6aM/LbxbzmSh52c
         61E8mLswuK8YbDXrybJRQogXA84koUP2Q6fzhGaSQfY+LMdIHKteorPNUkkH7u3clAyU
         qA/oHStFKRrdhgaYA1qozX0ucmDm1U+2sT0t2G4nsUbETMkubY+ZN2BT//idJQSEKD4Q
         NPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719328807; x=1719933607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M7My76Xx+peBaX7RrKQa/BxRrvIU630K8BNIFUaH3MQ=;
        b=HXQ9C2x/DQkUZO3uoXjs25ex/YvWcjXynqrGEe1lMWxs6OlmjouMcyCJVW1k3cFZ7o
         5IFymPut2cXaCTRPq/S8XYT8PfjzrwFUR1XfRDNKevaq+x/4e0YLX97/tg5/tsOuLA8k
         YZk2vm1Xf2XXv4UiR57chVNV1O2i835+n40afjxVu6kBPZQRjAqM4VviJ5BL0kWUyMEG
         INL8NcfjDCgK72yUbdsTpVl+jwVSD4f+vaMFpnZecu8qWK/rHAHYSzCuJW0AU5KsrDpg
         /6swmUbN8x7Vos2uCa3ljmVHN5CZPYULwMs35wZHx68SrOo+cbqnfdDgGPdXGK84Wf+D
         TfDg==
X-Forwarded-Encrypted: i=1; AJvYcCUJe3lj6/5BeZFoCgI0rW7u+nwXEp5DMy0nrs9r57MkfuqVOCh5FVsXfs886UHMQzJV1greACJgddf4K/JVnZp/aVyRV01eGmp/s92NW5/76fxUVeE13dD4U84jXCn+nFHcYqmKs1vauoRhat0=
X-Gm-Message-State: AOJu0YzJ7Y6zOEOi8k8Uzftmedptc6rK4t468wV/edOAqzWXnxfMgsmv
	UfP+S1ZPrBldxKPPwOKcEsEoy57UnxetYdTMFI3cmAQbUFY5o3yB
X-Google-Smtp-Source: AGHT+IEKZTWwrSCXm10ss+29iQwj3R7hVZlF1h2E5+VfQHecxEUa538EMtLDLzdMAs6PdI0BLXe8Eg==
X-Received: by 2002:ac2:514f:0:b0:52c:a5cb:69e4 with SMTP id 2adb3069b0e04-52ce06415d6mr6089650e87.54.1719328806841;
        Tue, 25 Jun 2024 08:20:06 -0700 (PDT)
Received: from localhost.localdomain ([31.120.167.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366389b861bsm13110218f8f.29.2024.06.25.08.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 08:20:06 -0700 (PDT)
From: Teddy Engel <engel.teddy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	oe-kbuild-all@lists.linux.dev,
	devel@driverdev.osuosl.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Teddy Engel <engel.teddy@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2] staging: rtl8192e: Fix conflicting types error with net_device.
Date: Tue, 25 Jun 2024 16:19:18 +0100
Message-Id: <20240625151918.10839-1-engel.teddy@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a pre-declaration of struct net_device so the compiler is able to
use rtl_pci.h / rtl_cam.h.

Fix for commit: 7dff0b27d9c842f88149bf611cbc0b59be1dcd3c:
[34/59] staging: rtl89192e: Remove unnecessary pre-declaration of struct
net_device.

Signed-off-by: Teddy Engel <engel.teddy@gmail.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202406250858.L8rJMHQm-lkp@intel.com/
---
v2: Add commit id that's being fixed.

 drivers/staging/rtl8192e/rtl8192e/rtl_cam.h | 2 ++
 drivers/staging/rtl8192e/rtl8192e/rtl_pci.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.h b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.h
index 3a5635494385..9deffdf96072 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.h
@@ -12,6 +12,8 @@
 
 #include <linux/types.h>
 
+struct net_device;
+
 void rtl92e_cam_reset(struct net_device *dev);
 void rtl92e_enable_hw_security_config(struct net_device *dev);
 void rtl92e_set_key(struct net_device *dev, u8 EntryNo, u8 KeyIndex,
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_pci.h b/drivers/staging/rtl8192e/rtl8192e/rtl_pci.h
index c645775b2150..3e39c4835ac8 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_pci.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_pci.h
@@ -13,6 +13,8 @@
 #include <linux/types.h>
 #include <linux/pci.h>
 
+struct net_device;
+
 bool rtl92e_check_adapter(struct pci_dev *pdev, struct net_device *dev);
 
 #endif
-- 
2.39.2

