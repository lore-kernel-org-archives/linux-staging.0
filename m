Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AD370
	for <linux-staging@lists.linux.dev>; Wed,  2 Jun 2021 19:34:02 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id f22so3054210pfn.0
        for <linux-staging@lists.linux.dev>; Wed, 02 Jun 2021 12:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bYV9p2tuNrJ599IxGk8dIW77JyAflkTh2/fE68VmgyM=;
        b=aWp5GUM/bhCW6yAY39LTLAsipqiKUrlLxMqLXUInHoEbRrU1LZiWbcU9BecnAlRxYX
         AMnpitbU77d+KFXqgGCpCgQOb1xyRjS9irXXC7eYpEW2/CdRFXA1a+6HiraPp/mGRUeE
         rMqIeuOivzbmCBt89n0taf6cwzdsP+aX0wZoRfZ/aY97MLGZ/yPtiw1tkUjWGHFXvD+z
         gC/7gLRItTVcJuiTiFS/gvXKJTtn42OgFeflFcxDZXd3a5DkZv8CPyfTdXPlUahLRG2i
         XlYqasofmvqiD2zu12hTHMzGapNFyayXZZzdjCKbSof+qrtTBtUKzzTfyGPgb0d7RJVr
         wi9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bYV9p2tuNrJ599IxGk8dIW77JyAflkTh2/fE68VmgyM=;
        b=XNrgtAXwczw/mt0SR+q2SVxNSuW3bNxeYy9kpHQ5e52Zetzj9NszO2O2dJsLWCP3Us
         RfKBkdrKI4I1qIbmbonFky5nCit5dEqn1N5W/Unv+JRDud1nor8ZaWPtLA4rXmsjlxiB
         6Xt1KD+CI6cNNKowUZdA0j4LcTNLULphi/oi3FeNS1jOnMRXtVPRpBjC3WlQj+seIki3
         T1/ShX1V7GEP37s7Fjt9N4hbRXT4j5H+Bdhiej1XJRJjweNIGDgTkWqNrpDMoVYuXV0x
         RRHr6NXR/WErbspOsZmRRZv9vmJDdjRZL11lHAAZV9KfBXZtTh5FFyBsv5FjTsGcxkuc
         RSug==
X-Gm-Message-State: AOAM5319OhJJWoVrtyC+k2plchjuEgTc65BrK3dz7UKN6sFCOUd9LEGQ
	wY7fn4uMNnTj9cup/1mK6ss=
X-Google-Smtp-Source: ABdhPJxCNxOm6FEb2uuA5Yft/f308qmvjpEITztw8xKT9HG6SwUfrp6FFHjxFHKBzEQQQ/21hmTQaQ==
X-Received: by 2002:a63:1316:: with SMTP id i22mr18055328pgl.150.1622662441778;
        Wed, 02 Jun 2021 12:34:01 -0700 (PDT)
Received: from localhost.localdomain ([183.82.156.141])
        by smtp.googlemail.com with ESMTPSA id 30sm520570pgo.7.2021.06.02.12.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 12:34:01 -0700 (PDT)
From: Manikishan Ghantasala <manikishanghantasala@gmail.com>
To: 
Cc: manikishanghantasala@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] staging: rtl8192u: fix spaces in r8192U_hw.h
Date: Thu,  3 Jun 2021 01:03:32 +0530
Message-Id: <20210602193334.11687-4-manikishanghantasala@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210602193334.11687-1-manikishanghantasala@gmail.com>
References: <20210602193334.11687-1-manikishanghantasala@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed "please, no space before tabs" checkpatch warning.

Signed-off-by: Manikishan Ghantasala <manikishanghantasala@gmail.com>
---
 drivers/staging/rtl8192u/r8192U_hw.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192u/r8192U_hw.h b/drivers/staging/rtl8192u/r8192U_hw.h
index 1de0605a9423..217e77766442 100644
--- a/drivers/staging/rtl8192u/r8192U_hw.h
+++ b/drivers/staging/rtl8192u/r8192U_hw.h
@@ -88,7 +88,7 @@ enum _RTL8192Usb_HW {
 #define RX_FIFO_THRESHOLD_MASK (BIT(13) | BIT(14) | BIT(15))
 #define RX_FIFO_THRESHOLD_SHIFT 13
 #define RX_FIFO_THRESHOLD_NONE 7
-#define MAX_RX_DMA_MASK 	(BIT(8) | BIT(9) | BIT(10))
+#define MAX_RX_DMA_MASK	(BIT(8) | BIT(9) | BIT(10))
 #define RCR_MXDMA_OFFSET	8
 #define RCR_FIFO_OFFSET		13
 #define RCR_ONLYERLPKT		BIT(31)			// Early Receiving based on Packet Size.
-- 
2.25.1

