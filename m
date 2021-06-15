Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B6A6D0E
	for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 11:45:50 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id k25so22077563eja.9
        for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 04:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xg4lh6FzY/x6mpAMMiRuRSWrAaG34s4GEztF8UfIitg=;
        b=ucMVTfLZZRtvzlrcYQcji6yqz4vgTroBuv6Z7GrUAH3bQQCdI9meMivVrhJjqcJqDm
         prEgw6+RtbdB9fxZWQUTwnhY5MdEvZY/hFw/iAglcqN01jhZAwBLR+sqghFcSedyx4a3
         nuSsfKtZiIO20O4a8LmqSoBIqxhDTE3QznrnocMkrCxm8iKogfmIJRe0e3K+CEZBiLFj
         mc9JainTmffKDqf3a/jOlsV5cVCLPGHmZ+SicKiaffngf9ysRP7YGDSJgSHKYg/p/A7h
         RzkENz2yUf0oVkMZ4fF/OHAnKSEl9g/Y74rzFJknTdptYwILLTfYO5wy/Ou8Z2k8sUwU
         L7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xg4lh6FzY/x6mpAMMiRuRSWrAaG34s4GEztF8UfIitg=;
        b=odVVVWNFE1zmhyzCgOdtO7M5ioF1/89gE3ohnPjtnjZC3CAMDcpsqko8/E2+vC9FdW
         TH+04Mm4QhRRLBt4It52L1zF0tiko3U+dN0foAXV/tQ+khMBOx1KtJV/WvL8RqgmzEuO
         9w476pof75Qn9lnHC5+0aVhS8hEzfJ8/dcKn25clYzhwuawTCnHjPpoYF7B/VfgQypOm
         q75eeI57zayWhNFX9pGUx3GuBRRtlvsPv8x3d0X320dlLbGrylsTz2J2IKnxUuYcvISq
         nAfGzgwQyKkYN3hUZ3X4zXYrRRwgKLx+e1D0AdguciauuP34/kUjbB4hcZhQ4/K7b0wc
         0MRQ==
X-Gm-Message-State: AOAM5335i//xkD6EUVddFCs9uqmCUd5RNuN9Dw7sGjUqpsgMiIrxpw0L
	0ZibB2iAviva10wM49nHjfE=
X-Google-Smtp-Source: ABdhPJwgBEZX2GOeAWxZZpjCIY/R/gut+lHCeRDJpDujG75wREiLcDlcquAs6gnZbxQUXwW8EOLfpw==
X-Received: by 2002:a17:906:22c6:: with SMTP id q6mr20234786eja.275.1623757548819;
        Tue, 15 Jun 2021 04:45:48 -0700 (PDT)
Received: from agape ([5.171.72.142])
        by smtp.gmail.com with ESMTPSA id g11sm11864726eds.24.2021.06.15.04.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 04:45:48 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] staging: rtl8723bs: move LPS_RPWM_WAIT_MS macro
Date: Tue, 15 Jun 2021 13:45:36 +0200
Message-Id: <5756b958b5d279f1cc8cea7887f50d003b17b94e.1623756906.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1623756906.git.fabioaiuto83@gmail.com>
References: <cover.1623756906.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

move LPS_RPWM_WAIT_MS macro from include/autoconf.h to
include/hal_btcoex.h in order to empty unneeded
autoconf.h.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/hal_btcoex.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/rtl8723bs/include/hal_btcoex.h b/drivers/staging/rtl8723bs/include/hal_btcoex.h
index eb9d0ba861a5..849fb90b43b7 100644
--- a/drivers/staging/rtl8723bs/include/hal_btcoex.h
+++ b/drivers/staging/rtl8723bs/include/hal_btcoex.h
@@ -9,6 +9,8 @@
 
 #include <drv_types.h>
 
+#define LPS_RPWM_WAIT_MS	300
+
 /*  Some variables can't get from outsrc BT-Coex, */
 /*  so we need to save here */
 struct bt_coexist {
-- 
2.20.1

