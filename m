Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAEC2567
	for <linux-staging@lists.linux.dev>; Sun, 17 Apr 2022 17:54:49 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id v4so15343904edl.7
        for <linux-staging@lists.linux.dev>; Sun, 17 Apr 2022 10:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OILYgrcMHgfS0MAxmoEH1VbxpcKZui0oVM3USNBv13c=;
        b=P5JmW2KvKOzg8qOf35NH2HDiMtRbk+FunpBhn4lw3vrTLmTtwn+zfCxWydq2GbZqDD
         pv+pniNDd2S/dD7GxQkyq73AAJJMRC3xnzIBhA/5JPwOYbYL/WTEEVEnfvM9qeYANwUV
         EQsvajbm7ra+t55FY2WbCC10lvtFqiJ4vrvGRogBav8w81z9ZHgb7VA6vi57p0fgUxC3
         nwKUSibDC1N+eyAhY1tj/8cLwp30FSiF+hxlXaR3loHhAw/qS5RTbQeymMNwZBlWcpvB
         0KOybdRncJsJqu7B+H8Fntd4y1iFNknSdkmOZ4x17GwBJ2KYCcbJZa7HWXJmHkJCFO91
         Y8qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OILYgrcMHgfS0MAxmoEH1VbxpcKZui0oVM3USNBv13c=;
        b=UiM/p3WCK2Y+jrcc4CCZTJ+uF3b45pPLVxoNQbGmVh4LNM79s7eR7JjsO9Q1gRzZpf
         kPw6w5jDtJ8WLhead/Viy2YmYgmtXfyQCuy+c0SAeGBwlvrMj3WRQZ9IVIrUzNk+D6GD
         bDmCrmN68IALFE9C1RCA8I+DYfIDQkO4evRg8uU3ASkvl3dOXTJtChtPKDjdb0YKYPvU
         0vOxYv5JxZflaeE3IzIy0+gcADg2z7iXbfUFRgwYsf8WiKMWT4NuGVSaFJH41+LtdbaZ
         XzGRPPVqou+yIjc3iyXxUkuCzAHzIeNDYKfedUj6HJk0kzpoAS2Bmgd9ovEsiYtjT+Lm
         tZ9w==
X-Gm-Message-State: AOAM533RFXFLhH9lW1l0tup21xQ5VEnBLpIGGJBffZ1CzemvePC+sbQe
	OCBgzWK8QqF7n0nZkH5Fqm8=
X-Google-Smtp-Source: ABdhPJwqZKjheh+2KqPTKOUweCixJfif8kv973dXy3667xA5l9SqWcbZHJ5+FUDWF3oeidpQTGO5Xw==
X-Received: by 2002:aa7:ce05:0:b0:41d:6857:549e with SMTP id d5-20020aa7ce05000000b0041d6857549emr8844788edv.251.1650218087587;
        Sun, 17 Apr 2022 10:54:47 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abba5.dynamic.kabel-deutschland.de. [95.90.187.165])
        by smtp.gmail.com with ESMTPSA id jw12-20020a17090776ac00b006e87137194esm3719409ejc.150.2022.04.17.10.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Apr 2022 10:54:47 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v4 0/8] staging: r8188eu: fix and clean up some firmware code
Date: Sun, 17 Apr 2022 19:54:33 +0200
Message-Id: <20220417175441.13830-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes wrong size of struct rt_firmware_hdr in the first
patch and does some cleanups in rtl8188e_firmware_download() in the
other patches.

Tested on x86_64 with Inter-Tech DMG-02.

v4:
- Keep the in-line comments of struct rt_firmware_hdr.

v3:
- Splitted the first patch into two separate patches.
- Added back logging the firmware version only once.
- Included the compile time check for size of rt_firmware_hdr from
  patch 8/8 of v2 in the patch that replaces the hardcoded size.

v2:
- Added a patch to check size of struct rt_firmware_hdr at compile time.

Michael Straube (8):
  staging: r8188eu: fix struct rt_firmware_hdr
  staging: r8188eu: convert u32 fields of rt_firmware_hdr to __le32
  staging: r8188eu: clean up comments in struct rt_firmware_hdr
  staging: r8188eu: rename fields of struct rt_firmware_hdr
  staging: r8188eu: use sizeof instead of hardcoded firmware header size
  staging: r8188eu: remove variables from rtl8188e_firmware_download()
  staging: r8188eu: use pr_info_once() to log the firmware version
  staging: r8188eu: check firmware header existence before access

 drivers/staging/r8188eu/core/rtw_fw.c | 84 +++++++++++----------------
 1 file changed, 34 insertions(+), 50 deletions(-)

-- 
2.35.1

