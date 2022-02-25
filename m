Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243191FBD
	for <linux-staging@lists.linux.dev>; Fri, 25 Feb 2022 12:09:03 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id p9so10446823ejd.6
        for <linux-staging@lists.linux.dev>; Fri, 25 Feb 2022 04:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X01b0npE0g+H3NBwvWgXa+/pm4dhDaG2cD6CkeGqTNw=;
        b=CjMH3Qps1rz/CRFPosO3PcU5VcJkFJwriblFFxrCqQ0zxWnUJasp0FbjqTeSEOGs1B
         qeAziIRyG7NOaFRhstdQPnpexaWuYfZJFxdV0PfjznTnE59dmtkmUvZcYlil/OewrOwk
         ocT8S7bpAGGD3sBekuUpDI+66tuUcIF3G7AKwk37hiUlZyYQDa6LCYf8qdtYZIfSKqJ2
         iy5+YTlmb09fMk6bMzCvcMx8fVuS+MEPYqRNoV6NBnDFLJN4RenaaDQcy3/BRLicIT5/
         6hVTSgbUh9hhQ+n/kaD82m1yKEto+Nx9wuyt5uQK4Z2Qnc4LmyGySmsssMZfW3Q5nAMO
         cIDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X01b0npE0g+H3NBwvWgXa+/pm4dhDaG2cD6CkeGqTNw=;
        b=J8omxsofS7cYxbkl/ltl6nEpm/BnvtY7srQL2LAR39O5Rcug3t12KutQl6UJ2JfHUd
         88Ng6dCxN/jTd4AzCm24XwEpfqX6HHhDonI3JQI45Zx+pnAlGqwgLn8GS3TfP21aiMFc
         9kcsUjZeDkR7wfgXTq+imfZ9Mlp6P/sXIk4afhFu1tflqfUN2G4V9PrDxJSj+vG6DK5P
         s7Ynw5RZQJqrN20jG3SCZWddpeau5hzKndVnE4PkmvpbKMqdpd1UKzDRUjZ0g++V2jFr
         0Hn2CPfzXOFK7pa0/z3crsihOxeoLfAw1ukpV34G/+knFnnnyBGoFH71fVzDzkjjCWaL
         ygpw==
X-Gm-Message-State: AOAM531n2NgLyVRlhCKWCrlggnGH6jIxAl28usQiMR7j1sLuw8GTtGLB
	1AeOfzxgVdui/HqYGxa3PLYhs6jRpkw=
X-Google-Smtp-Source: ABdhPJyrS+9uMgAuqc88GQ/Pbftfx5agFbjvTEh1+94I4w9oz959xik5bPykI9Grzh1Os8+Tw2OFoQ==
X-Received: by 2002:a17:906:b348:b0:6cf:5b66:2f80 with SMTP id cd8-20020a170906b34800b006cf5b662f80mr5712628ejb.638.1645790941517;
        Fri, 25 Feb 2022 04:09:01 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb8d.dynamic.kabel-deutschland.de. [95.90.187.141])
        by smtp.gmail.com with ESMTPSA id y14-20020a50eb8e000000b00410a2e7798dsm1229418edr.38.2022.02.25.04.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 04:09:01 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/4] staging: r8188eu: some simple cleanups
Date: Fri, 25 Feb 2022 13:08:39 +0100
Message-Id: <20220225120843.10674-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series contains some simple cleanups in different areas of the
driver.

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (4):
  staging: r8188eu: EepromAddressSize is set but not used
  staging: r8188eu: remove unused function prototype
  staging: r8188eu: remove update_bcn_p2p_ie()
  staging: r8188eu: remove ETH_ALEN from ieee80211.h

 drivers/staging/r8188eu/core/rtw_ap.c           |  6 ------
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 15 ---------------
 drivers/staging/r8188eu/hal/usb_halinit.c       |  3 ---
 drivers/staging/r8188eu/include/drv_types.h     |  1 -
 drivers/staging/r8188eu/include/ieee80211.h     |  1 -
 drivers/staging/r8188eu/include/rtl8188e_hal.h  |  1 -
 drivers/staging/r8188eu/include/rtl8188e_recv.h |  1 -
 7 files changed, 28 deletions(-)

-- 
2.35.1

