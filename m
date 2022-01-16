Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAC42C9C
	for <linux-staging@lists.linux.dev>; Sun, 16 Jan 2022 00:23:38 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id e19so16483539plc.10
        for <linux-staging@lists.linux.dev>; Sat, 15 Jan 2022 16:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to;
        bh=XUevpNNDykU/4ILcYiCpzemK8vBue+56hRj6RQzQGMU=;
        b=MiAgIFkxalnmcs4sv9TbjpiMgQaqwR0LrRmpbYZ1WsoAE6WXtNvj6hRowhxnmGfs5s
         ayewYOWnUmiWOIcSwa7g2hvfadQHekefJrOuwuD2rGXggBZQYSh4D3hulFSVzxkWERYe
         eOAYWEUlihEVnN5w0f0MTWo5/fVl6QsJEy2sCtrmO9Zaj++MtJWK8yAMNfbW+3V07a0m
         du8r9KfRzJgwJqdNHU9LeQQ2SI+WYojcz7bBWW7iI0tczmuOi/fehEnyTy3zNbGFZ/+H
         85xD7/MasPepPmDm+TJxjoxT4wtQQwqA4DGCScdAhD/0SPq+8qrxcp0dWz6JLrrKa8Sk
         +tsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to;
        bh=XUevpNNDykU/4ILcYiCpzemK8vBue+56hRj6RQzQGMU=;
        b=dAGRocGXAZVhT/hLMuKxhckHH3LWR6+3ske/hsfqd5KMCa2DPl/dIcjsOIaM3OIQcX
         paBaB0e1UDsvB4s4idBjqmQeeb47jt3v7J6Bajy3RwFq2HEPFG/a28tUnvSZxW1B+74k
         ibjpF48YYePDqrMYw17tp81OrpNZNVv2qjAC2s9BHBPqZFzcGLOo4xEhIp5Ll6OERBXC
         yp+Uh7Ni7rjC/oeDX635FG6iJyDJ6KVXhhuTh1R31UJc18rVDWSd/C6uYpD/ZJ4K4/pl
         G/Z7E4nTSpQhoH/0qD8tPQPs/oKRWJPwKGk+aO2OHGfCpcVl4LgZPV1E9kjuhldYti3i
         ZNWQ==
X-Gm-Message-State: AOAM533f2ggTWbD6WXWjiE3MpP10F/1Sk4pMgw4qrnJUX+uJ7DyCu9AP
	Mmd7r7DQ1hLoLm59e33iyGE=
X-Google-Smtp-Source: ABdhPJyfyEL9fNB3mhjYVVtumdJtJpoq2ElX2EhvkynF/cIBVq5utdJx0nN5McC9ot4pFcj6H5k0NA==
X-Received: by 2002:a17:90b:3607:: with SMTP id ml7mr2910363pjb.141.1642292618470;
        Sat, 15 Jan 2022 16:23:38 -0800 (PST)
Received: from mail.google.com (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id c17sm9904581pfc.163.2022.01.15.16.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jan 2022 16:23:38 -0800 (PST)
Date: Sun, 16 Jan 2022 13:23:33 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: gregkh@linuxfoundation.org, paulo.miguel.almeida.rodenas@gmail.com,
	realwakka@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] staging: pi433: validate max bit_rate based on
 modulation used
Message-ID: <20220116002333.GA23305@mail.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220116001726.GA22699@mail.google.com>

Max bit rate is dependent on which modulation is used. Previous
validation routine only took into consideration min bit rate which can
lead a misconfiguration of the rf69 chip causing the packets not to be
sent/read.

This patch enhances that input check in set_bit_rate to account for
modulation values and their respective max bit rate

Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
---
 drivers/staging/pi433/rf69.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
index f4ac17adcd83..70ffe291b0e6 100644
--- a/drivers/staging/pi433/rf69.c
+++ b/drivers/staging/pi433/rf69.c
@@ -229,9 +229,19 @@ int rf69_set_bit_rate(struct spi_device *spi, u16 bit_rate)
 	u32 bit_rate_reg;
 	u8 msb;
 	u8 lsb;
+	enum modulation mod;
+
+	// check if modulation is configured
+	mod = rf69_get_modulation(spi);
+	if (mod == UNDEF) {
+		dev_dbg(&spi->dev, "setBitRate: modulation is undefined");
+		return -EINVAL;
+	}
 
 	// check input value
-	if (bit_rate < 1200) {
+	if (bit_rate < 1200 ||
+	    (mod == FSK && bit_rate > 300000) ||
+	    (mod == OOK && bit_rate > 32768)) {
 		dev_dbg(&spi->dev, "setBitRate: illegal input param");
 		return -EINVAL;
 	}
-- 
2.25.4

