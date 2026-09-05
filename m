Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DB31A6839
	for <linux-staging@lists.linux.dev>; Sat,  5 Sep 2026 00:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788566825; cv=none; b=tVX3POUWkaKdA0x11KfxP7B0OnyifgTu+kEuJ0C55R8QRXhUQsqjC38+8P1m8nVjKzh7MaXyD2ufzrurEE6L/8TBTnAeWzARfZsOozD4F9Rmrn1Fuy6Kk4gQZY0K33eDX/QI8hGnog2gx0/Ewlj8jAdjFOi7xrJdje4jxWq5/QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788566825; c=relaxed/simple;
	bh=AbGCPD867X/zR4JWWABXmcYRuDetze/f0050Gy5ULXM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=prNx+5OY9eVpNo7/aL8PjQRnoIvUhtJ0Uo0vK0Lueu/SSsOfRR6y+uYXH6KNRy2ZpDUiFRZB5SshMnU9KT2oQ0gGzKbwtAB7mxjlKNvouPBfLrSPEDJmPXKepqFwRux/9Lu0ZBuogjEBz09SnIWcgNG7TLtooHJ+LO18hT4n5VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hhTzAEo/; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hhTzAEo/"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-784a1696a21so1203045137.2
        for <linux-staging@lists.linux.dev>; Fri, 04 Sep 2026 17:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788566823; x=1789171623; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ySdxtd2OOrMzj1/M4oljubzNlyC8qvGXvin601ESwdY=;
        b=hhTzAEo/Y4Z7ot6JV41ptSvbuchPcAuMu8NVtTSMpwcbOK7YNC1lM/deF9+jyRDy0J
         CNAOkvWmvd5lBin5DABcphpD4ViEn9q2lshyrtBnTCRj4/6O5viWXKq90mDUGVbUqrc1
         H3563iTXKP4WlYizlUYkPTP/KCszXZsCohDbqvY7KntbnMMTP8mipB2oWo8bGAXA3+xG
         7pr7BmwMeeshDetieCOHgC4IgaQED3uYmlo65mT7M+s0x3vEkTdwtl/bbHZlFM9ylInS
         eCn0OecOt2aFq6pN0qrUrsYHiJY83SMaAxd/ho/4J6QtN/exegOoCWlaZqCiIER9fOCG
         zpTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788566823; x=1789171623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ySdxtd2OOrMzj1/M4oljubzNlyC8qvGXvin601ESwdY=;
        b=eEzXWZYTQJIMUFrVTBxkIHNkzJrofW7m6dygY3kqFZNG1nyarEwbQj2SUBuAFPGWOQ
         rypV17aW3C9/Qp4a3eH4z9bvUU4eml+abW3Y1n481Wc1VYMKKl4RgpcOTpmEB332MFxM
         1ce92Jdu/pC57xI4mYxhX1qDRNjIOyc8AHGwY5+OiEJWn3qAOGgrFmbhv/xzaB4XHWhy
         E0VZFbNZmgxG0M0diQUrU18BBwhT5F+3aEu7Nn3qArVqxB1B7WU8FX0iudAxwJsjB1qi
         YdnHP2C6bw0HM3wb8TutrbNNigfC/6muq0SGL2r8zMXYh+ZnTuJSZrpIRmla+EGZT8X2
         NVjw==
X-Forwarded-Encrypted: i=1; AKwUvBzrVVmONJ+sVNbYQ7UZXOb3tfbxNH9Dld3Ctu0hTC0TtiOeULlgysYkRfR1300lJNmpvJ2xzV+biZUWwx61@lists.linux.dev
X-Gm-Message-State: AFuF++ldFHRXqDzrxnbIBHpNtRuHv+4uX/jm16fj4SWy0DDf49Lt+EJF
	4SyvXio3Lx6suQH5xNV7TxDBa/dmdcQ5Nfei9bu7EXj2QAqA+yeymqQX
X-Gm-Gg: AYBFou1rXAzEL40ChZGHao9oOnIRPtwtJbjy7j7V3mOU2l1iXb7A4ZOm55nxvnIMC/b
	/EDXygt0Ds02wd4xfwKthjVAV0yUBfHFYmIbJ0fdC4HjmzgLaqkmPPqsFBTYeQmh3rYn7lppQzP
	l5uA7eWh53xGjmwcXH1/bALvsbseLRh0MbxUF0DfVuBY92UvmfBHxnsk7KDLtS7yWBvWZMuCzGC
	JnvDV2WXA0uyAaj5nxDu8GofBHNO41oMQbomhWyFLjjJNBFdGE2ebzfWtSiR+X8JHcdhCPzF/jJ
	rsdY8qAGnhoB/vk6CsJ02VFXO4h/4fjI1oiocXC+Bhafd+PV4DRdGJUVKJ8MgxykIlxiryFgbl9
	I4/gyvY4Aqc5+lvrTzmi1/1cGTbwYwkSMkm8G/NsZeOQasRMi4782v+5ALWo2KIgUh8nlDxqn0I
	pWcnt1BFFetbjbH0/q5sG6Z8mI/UlPllblZfAmPef3vneOd3eXUWY+cCcb610oCErSX8bUCKC8A
	9UVikiFoqJi7A0TpPzysSL2b80AVl84
X-Received: by 2002:a05:6102:554b:b0:786:4607:bdaa with SMTP id ada2fe7eead31-78a4a8983c7mr3967271137.4.1788566822540;
        Fri, 04 Sep 2026 17:07:02 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808eec7c37sm2735870241.13.2026.09.04.17.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 17:07:02 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	linux-clk@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v3] Kconfig: fix typos in core makefiles/code and purge remaining ghosts (v3)
Date: Fri,  4 Sep 2026 21:06:55 -0300
Message-ID: <20260905000655.103429-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Analysis from Sashiko AI revealed that several legacy options were not
true dead weight, but rather victims of pre-existing copy-paste typos
in Makefiles and C code.

This patch:
  - Fixes MediaTek interconnect typo mapping mt8196.o to MT8195.
  - Fixes MediaTek regulator typo mapping mt6316-regulator to MT6315.
  - Fixes missing CONFIG_ prefix on DVB_ULE_DEBUG macro in dvb_net.c.
  - Retains critical PCI_IMX6_EP and Tegra audio prompts to keep hidden
    symbols selectable.
  - Cleans up the dangling comment in drivers/leds/Kconfig.
  - Purges the remaining verified ghost weight.

Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 Documentation/admin-guide/index.rst           |  1 -
 Documentation/admin-guide/lcd-panel-cgram.rst | 27 -------------------
 2 files changed, 28 deletions(-)
 delete mode 100644 Documentation/admin-guide/lcd-panel-cgram.rst

diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
index cd28dfe91..70c0bbc87 100644
--- a/Documentation/admin-guide/index.rst
+++ b/Documentation/admin-guide/index.rst
@@ -152,7 +152,6 @@ How to configure your hardware within your Linux system.
    gpio/index
    hw_random
    laptops/index
-   lcd-panel-cgram
    media/index
    nvme-multipath
    parport
diff --git a/Documentation/admin-guide/lcd-panel-cgram.rst b/Documentation/admin-guide/lcd-panel-cgram.rst
deleted file mode 100644
index a3eb00c62..000000000
--- a/Documentation/admin-guide/lcd-panel-cgram.rst
+++ /dev/null
@@ -1,27 +0,0 @@
-======================================
-Parallel port LCD/Keypad Panel support
-======================================
-
-Some LCDs allow you to define up to 8 characters, mapped to ASCII
-characters 0 to 7. The escape code to define a new character is
-'\e[LG' followed by one digit from 0 to 7, representing the character
-number, and up to 8 couples of hex digits terminated by a semi-colon
-(';'). Each couple of digits represents a line, with 1-bits for each
-illuminated pixel with LSB on the right. Lines are numbered from the
-top of the character to the bottom. On a 5x7 matrix, only the 5 lower
-bits of the 7 first bytes are used for each character. If the string
-is incomplete, only complete lines will be redefined. Here are some
-examples::
-
-  printf "\e[LG0010101050D1F0C04;"  => 0 = [enter]
-  printf "\e[LG1040E1F0000000000;"  => 1 = [up]
-  printf "\e[LG2000000001F0E0400;"  => 2 = [down]
-  printf "\e[LG3040E1F001F0E0400;"  => 3 = [up-down]
-  printf "\e[LG40002060E1E0E0602;"  => 4 = [left]
-  printf "\e[LG500080C0E0F0E0C08;"  => 5 = [right]
-  printf "\e[LG60016051516141400;"  => 6 = "IP"
-
-  printf "\e[LG00103071F1F070301;"  => big speaker
-  printf "\e[LG00002061E1E060200;"  => small speaker
-
-Willy
-- 
2.43.0

