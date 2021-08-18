Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2FB6D1B
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 23:42:58 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id q11-20020a7bce8b0000b02902e6880d0accso5579123wmj.0
        for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 16:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m5pI5ids2ZBGE+PXrmlzjU/e6GjyoaIhIF845NNsPBE=;
        b=IGQEmBm163cVsMuhcsIMU+ElZCBoYtlkGvDX1pBJxDC8Hhp2+KhPlUMuqlKlLumKhj
         53T4VZdEPAcc3cGgR0e9dMJbUB1bO6fNLGkfdG/nPTYTHWzAjweETHVd3SnkPfsLN0LC
         J1HchKwQq3IPgXedKeJCuMYlE2gHh/2YZw66XXsrEIIqpPWM+Qoqfg7uSGvF9xbt2w75
         KGUGfM3t1dpOEkkdLy7xvr1zhOBMWSai8uQg4CjAX2eTS5Q7alzCVryX2rcmSRchAe0n
         9tt42gvNsZo5nTleXIYU/Gc+yb6vFNYbLY8ho0wwxFGHdOrVHWFf/r85QU5mRRB2MtHW
         RXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m5pI5ids2ZBGE+PXrmlzjU/e6GjyoaIhIF845NNsPBE=;
        b=hYAbxpFtCICIjVR/q4t/kWWCjHha/xuaBHqJYhvpMdn7N4l88qsYhjoNhuMIhKLEPm
         52Z82TpHJn/A0OGH6ceybMIf68XzZUGEdvbRI3EMK8XCh4TF4TPKapel3Eu4jWgjx5yC
         sATMlzvagQ1NAHKJCMMbzbjQwYxR1wxJQmZhL2VwWIy2rv7eHK5IgiIqCIbCmsz7yvVY
         puiZY7CIJzvhE0QsG4eY2n7xzO6quFQBqNBH+wwUXHpjWGes6DEe9JdIUyFkcJB+ZCHs
         ihFGZt1IhwtDB4Oxh2Z1q6gVbIL6+qlgh5xVG4uXzuGuaP8ZGjzlfG8S7g/L4h9kZMM3
         OpPw==
X-Gm-Message-State: AOAM533A4c0pSlmQPyVk8HygZkuFgTCaisNwbhkgBuyY3vvamlI+REOt
	SL4tA32G0AVyYjukNJ8idozIMw==
X-Google-Smtp-Source: ABdhPJx7F5jKK+Lvs3Dn1JMqEjCwp6qFxlkwXUwtWfVoY/M6xdSZMw1NzM0gg+Xtx9fNB6chSFK8/w==
X-Received: by 2002:a1c:4d17:: with SMTP id o23mr10860037wmh.92.1629330176911;
        Wed, 18 Aug 2021 16:42:56 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id z8sm1194926wrt.77.2021.08.18.16.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 16:42:56 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	martin@kaiser.cx,
	straube.linux@gmail.com,
	Larry.Finger@lwfinger.net
Subject: [PATCH 3/6] staging: r8188eu: remove txrpt_ccx_sw_88e and txrpt_ccx_qtime_88e macros
Date: Thu, 19 Aug 2021 00:42:50 +0100
Message-Id: <20210818234253.208271-4-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210818234253.208271-1-phil@philpotter.co.uk>
References: <20210818234253.208271-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove txrpt_ccx_sw_88e and txrpt_ccx_qtime_88e macro definitions from
include/rtl8188e_xmit.h, as these were only called from the now removed
dump_txrpt_ccx_88e function, which was itself not called from anywhere
anyway.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/include/rtl8188e_xmit.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtl8188e_xmit.h b/drivers/staging/r8188eu/include/rtl8188e_xmit.h
index 20b55e3850ba..e7eb19c4ee9d 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_xmit.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_xmit.h
@@ -133,10 +133,6 @@ struct txrpt_ccx_88e {
 	u8 sw0;
 };
 
-#define txrpt_ccx_sw_88e(txrpt_ccx) ((txrpt_ccx)->sw0 + ((txrpt_ccx)->sw1<<8))
-#define txrpt_ccx_qtime_88e(txrpt_ccx)			\
-	((txrpt_ccx)->ccx_qtime0+((txrpt_ccx)->ccx_qtime1<<8))
-
 void rtl8188e_fill_fake_txdesc(struct adapter *padapter, u8 *pDesc,
 			       u32 BufferLen, u8 IsPsPoll, u8 IsBTQosNull);
 s32 rtl8188eu_init_xmit_priv(struct adapter *padapter);
-- 
2.31.1

