Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFE5ED8
	for <linux-staging@lists.linux.dev>; Mon, 13 Mar 2023 22:46:23 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id y4so25470037edo.2
        for <linux-staging@lists.linux.dev>; Mon, 13 Mar 2023 15:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678747581; x=1681339581;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=47X2EKjMMA636t88pLDlxyLev9K8VQs9ssTsZmf02sY=;
        b=eAzvYazXSWovL7Mb9yNKn0qGvam3k6FYzSa5czH0RlfUO37WzySSSqAJJ3EeWzc9d1
         /ISwPc3hMa9ZVeaRhvD6djscLJxGCIDTUPOYyk3nNSXQreT89ZMDYIsKRs4wafCMAZQN
         D5VWy52E3pTl14UXIMI8BnBpLcZbgPHV7jaxuwraIKdU8wH+XfU3IklJCJw4Ikv2ehB9
         tmKYdFVT1Dg5YVnc2oa5qcCqiZ/MknnPfroBd+rDKvgMlFbe2XhTcoRaZBn+ntjv0aUi
         mT6H05VVO9sdl9gjfu/xVxzCt3uc5p6qmnHYoARHhCz6ulSVL3s9FX/XXw6INQvHzFaF
         rlXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678747581; x=1681339581;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=47X2EKjMMA636t88pLDlxyLev9K8VQs9ssTsZmf02sY=;
        b=uCafRbz5dvewmxyNBDDE3I+OoaRL3TjDPb+JdRa5T8I5Ae/5tdrIH5AUVCKiJtQlq+
         PebYeFhGlOXHNJc0LPM649sSrCc8S/2KH0LdbUhHAWAV+BLU6SF4JIaL2p51Ok/k+f6J
         wYuSn7s00zmPHTgr5BSzaLN1BPqt4X5JyDKzexRm1TCixGo+d+ff0vIdtquvLVNeY1OT
         udh1HwCwKaF/3AA7CECCx7hn2n1nGXKbcSQ+on09yCA/Adv1GXqctoe5afuCksHj4K2b
         93lrUXFUZsbjHyxxAqQ1u6bEgl1U+s4O28S7FPNaRU4/dLD3Ijj8Wz9mzkmbOQGN28Ox
         Lg8A==
X-Gm-Message-State: AO0yUKUQFr2n9G22N5AhWE9ajPVoLGHB/U1XM/gjJPvw6krl3Mvk6xxd
	EgsszAjNhPXnXLsA8mMhxYI=
X-Google-Smtp-Source: AK7set9a02G10VT3epJzDUC4nOr7vJEIsy5pPNgtD4A+8wNIKvk5wpfxZ3ZBqQwOusDVSEk1MlrbHg==
X-Received: by 2002:a05:6402:5207:b0:4fb:c8b4:698d with SMTP id s7-20020a056402520700b004fbc8b4698dmr7785989edd.4.1678747581369;
        Mon, 13 Mar 2023 15:46:21 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id y97-20020a50bb6a000000b004c19f1891fasm279887ede.59.2023.03.13.15.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 15:46:20 -0700 (PDT)
Date: Mon, 13 Mar 2023 23:46:19 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] staging: rtl8192e: Remove unused RF90_PATH_C and ..D
Message-ID: <cover.1678740713.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove unused RF90_PATH_C and RF90_PATH_D. Justification can be quite
complex.

The following code lines are mandatory to keep in mind when reading the
patches:
enum rf90_radio_path {
	RF90_PATH_A = 0,
	RF90_PATH_B = 1,
	RF90_PATH_C = 2,
	RF90_PATH_D = 3,
	RF90_PATH_MAX
};

Tested with rtl8192e
Transferred this patch over wlan connection of rtl8192e

Philipp Hortmann (2):
  staging: rtl8192e: Replace RF90_PATH_C in test expression of for loop
  staging: rtl8192e: Remove function rtl92e_is_legal_rf_path

 .../staging/rtl8192e/rtl8192e/r8190P_rtl8256.c |  6 ------
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c |  4 +---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 18 ------------------
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h |  1 -
 4 files changed, 1 insertion(+), 28 deletions(-)

-- 
2.39.2

