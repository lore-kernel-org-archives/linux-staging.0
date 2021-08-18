Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B1A2FAE
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 23:48:57 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id q10so6096164wro.2
        for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 16:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pgG1PsY3tE2f6I79M1HWHc/yv1eGrqJsECS6IsBtKJc=;
        b=oDKq8IhSo9XceFS8d9SssZnfdPKcmb6+DnDgUYV1LFyKzMKsksaG+VDk7vn0X4a3as
         EoifHhPg6Xq5XigBSlukV6yvk2wc/scebnU9kwEDhcU09BbltZcvdK7/1l+l2QuCHx98
         HuIQCRP0m8z2iQB+ogWR6C9nGmXdslPaxJ3CsuhlH3cuqnasZplQgZydQF8Pnf4TCv7N
         DqwbaZ06cj9+95QZXwBAZWpI2eh72aS+rDu9eky1qNkhTFkF+EW7cww21Srp5zTN40lY
         xpeaSCwCNIwgnWvaMYLu29WJn72nRSIX1VtssHqE+nJQvVgfdFafcWQZsDkHGg27Yi80
         SP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pgG1PsY3tE2f6I79M1HWHc/yv1eGrqJsECS6IsBtKJc=;
        b=jc305t6bQICXOkBLHPj9QOb2FpXgNgBP19sFzJ2wUFGFPFB0GbL/PXPzuxO+/H52s4
         l6rl5OZ1OK5MCPKnUp6BnjhieyACJsrEOI/zoPBZI6gJLm/BFCeYpfdmnyeANdm1j6zL
         2OPcHAvad8nzQ9bxR22EURx/DMuUQrUxDZFCEbymP1bKNHyvYBnuSakPcJCsyRIUnYml
         mtD2iPXvwUfmGDOftUjEtNZA2QXRsliUiVFaDl1VC3UkjcdQXmhbTp0lc1uZ7uQK+iV7
         PH982wU+wnTfreSdHglv/Xa/eeKvjBZsjFMIVY8Hf2E2It5l+e86aEORHrXMhLMNLr5J
         ODYw==
X-Gm-Message-State: AOAM531IWPVI69Q3BhKGSw80iaxns+5JlXoxE5G+y9PZ+HxhFMsY8Qok
	drBw2tfUmBJ4944H8DgvQxeZMVmDqs7fq+74
X-Google-Smtp-Source: ABdhPJx8oJZlUs6qetU3AOfFAT3Bdf4wrPVN8O8dXYUIs5V1eXRqp7dpNPmNrUtuFzKvD9YT/Ti3ow==
X-Received: by 2002:a5d:4846:: with SMTP id n6mr73176wrs.91.1629330535943;
        Wed, 18 Aug 2021 16:48:55 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id z8sm1205916wrt.77.2021.08.18.16.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 16:48:55 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	martin@kaiser.cx,
	straube.linux@gmail.com,
	Larry.Finger@lwfinger.net
Subject: [PATCH 1/7] staging: r8188eu: convert only rtw_vmalloc call to vmalloc
Date: Thu, 19 Aug 2021 00:48:47 +0100
Message-Id: <20210818234853.208448-2-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210818234853.208448-1-phil@philpotter.co.uk>
References: <20210818234853.208448-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the only call to rtw_vmalloc in os_dep/ioctl_linux.c to the
kernel's existing vmalloc function, as rtw_malloc is just a preprocessor
definition for _rtw_vmalloc. The _rtw_vmalloc function is defined inline
and returns a u8, wrapping standard vmalloc. This behaviour is not necessary.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index c0e66c194952..ab4a9200f079 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -4481,7 +4481,7 @@ static int rtw_wx_set_priv(struct net_device *dev,
 		return -EFAULT;
 
 	len = dwrq->length;
-	ext = rtw_vmalloc(len);
+	ext = vmalloc(len);
 	if (!ext)
 		return -ENOMEM;
 
-- 
2.31.1

