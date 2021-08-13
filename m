Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A497272
	for <linux-staging@lists.linux.dev>; Fri, 13 Aug 2021 07:32:01 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id k29so11956810wrd.7
        for <linux-staging@lists.linux.dev>; Fri, 13 Aug 2021 00:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YhM3/UTYz8dk2sZhZpZTt6st98MzOChtEhO/bHLaAHg=;
        b=GAED6S7AkBJXCV/TQx04ArgCnRr8eWa4lxo3X2wfeSnhw0mistR2xpnCMd3idw9fxY
         7iQZIIk+slLq9a8+4jhuphW3EtoO2opL7tX9sveSnoaKop2/rqPFzr/xISdHZ29x376v
         5q1xYOMcPV88hos0872fOx/MrvGY1G8y7mPhGsjIzqir+lQW1+pJsngoHkAjKt1cOowl
         Ep3Ds6CokxyGor/i77Y7OnuJdffk6bjOBONfurTLmyt+Z7zayYk41BOexqfKADE3EWMr
         p1GVHGcwTTqDNXM9vVTTQetJ+EdIcS/WyCaFD1S/caWLeVdP5m/MofXUWwd6f0H3JN/l
         cIKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YhM3/UTYz8dk2sZhZpZTt6st98MzOChtEhO/bHLaAHg=;
        b=LcbiJ4cMHIAcgjz1EOZx+kKZgcw/Ac6Eusxo0DsJ6AXb0EriATfxBMLvxVd97rr57R
         kmKgdR9ZUzP0tsNgYUzfwSaRei2/Ex1sO/N1LBONVAN9VPmq0re65i9zVOwQ4eedITOq
         J+/YoG70k8RmT/sdo+kRm7t3oHgeJmjT7SErIwr4pWMZMRdODmY76Thg6oC3Br6aElTk
         rdVFZSXud6he+OTXJr3N6kHj9Z33ouDVR/Qst8ZnH9VTaMLUo5vhIegzkN5Y4cR0M+w+
         DVgVG3CQ2YPr+E0UzYNIVMHRPdYLZaoAKrIUeojzV0blrWLAo+3iVZGLlQHUC0TKiKyX
         6fPA==
X-Gm-Message-State: AOAM533ICgabiW654NFs5YI6hJZHGHx/TTORg7Hml07Q7bszunTypw74
	nTg6ZSjyMb+BYsi9zfVCUA0=
X-Google-Smtp-Source: ABdhPJx8BsxU6DfJINDtdlyeWIgRdFDxAh0rYxwdF+2TYDObmkCGYC2XAM6vKhd+LrRc/bvyo9piaQ==
X-Received: by 2002:a5d:4d12:: with SMTP id z18mr1421138wrt.195.1628839920023;
        Fri, 13 Aug 2021 00:32:00 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::2571])
        by smtp.gmail.com with ESMTPSA id k12sm697406wrd.75.2021.08.13.00.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 00:31:59 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/4] staging: r8188eu: refactor Hal_GetChnlGroup88E()
Date: Fri, 13 Aug 2021 09:31:05 +0200
Message-Id: <20210813073109.25609-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series refactors Hal_GetChnlGroup88E().
 - removes 5GHz code
 - changes return type to void
 - cleans up camel case naming

Michael Straube (4):
  staging: r8188eu: remove 5GHz code from Hal_GetChnlGroup88E()
  staging: r8188eu: convert return type of Hal_GetChnlGroup88E() to void
  staging: r8188eu: rename parameter of Hal_GetChnlGroup88E()
  staging: r8188eu: rename Hal_GetChnlGroup88E()

 .../staging/r8188eu/hal/rtl8188e_hal_init.c   | 90 ++++++-------------
 1 file changed, 26 insertions(+), 64 deletions(-)

-- 
2.32.0

