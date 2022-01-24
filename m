Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54378168
	for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 04:26:42 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id y27so10542299pfa.0
        for <linux-staging@lists.linux.dev>; Sun, 23 Jan 2022 20:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to;
        bh=wg8p6MJoeXN1GheWHqOGh696C/oxn1QTFiYK3wt4Tk8=;
        b=HSKGIMxHPF0hjmGxZ7JnR8ZIymOJus9qLm27mkGXkFuSX0+AgExwJ56EGzvyG1Gzfe
         UI64p1Ar1V6vyHEH6ecabD8nhpmzlHy1Fwv/MTIYwKbSACopW+mUMwJ9dTkCFzPfMfxw
         XRm2H2dF8uDmGfCXmxx0dlJvXWyYo6vOsFd/H2Z9OjwOOfm+6SHKqUZ71qM9yNlLZ900
         m0p0uUt0x5aCV8sc4bNRj4hR0w2fZZS6TeZPDRhMHxhVwSgLe5hXEORwIrrdFjSR/r+c
         KjPSQnWhjhZOUsfggnxoh2I60/3RNSH9bMaurInM7SD4pKaBxW04HqNl4YGgOA4AkDKl
         FePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to;
        bh=wg8p6MJoeXN1GheWHqOGh696C/oxn1QTFiYK3wt4Tk8=;
        b=04H5qnKxjHZ66yhqXFJ3ERZYjQyH4thTEDW73rGdtBvJeUjYTvJ1q1ra31Vpkpc0Xo
         T4X9S5Rotq6V26UfSiOXnxPuGEl+ZzbfOhKhBJme43AwBJZg5z6YO/bVZe8z+CIHvKc/
         3AnCT2H/O4h29r8HYJxc+RI4QKo29yRQ0kHm00S21gRdF/goX55DYSWf2bRHSllIh6GT
         tJH0jQsJpL7SOQiNYm+5nVKuVGFGpxR2iIW1vspVJZfUoDWfHJPo4NPW/5Mm5L9E75M+
         A20K+6nkfg9zHluHlNsZSBYFtEekjW6tUXNG4cRnYeCDobkCMnNaYZPRNmZcxq8Xa6C6
         ZIMw==
X-Gm-Message-State: AOAM531wROYcxTxYYICqLpSxOv4EwM10N0uYnEQOGwJHIRlUQ7+GHESM
	cjgPbKcbpC1FJQA+CAI6Yfs=
X-Google-Smtp-Source: ABdhPJxFGme3GKnWg91F82NBmqrmlLAp9xb2nFQdckwfSvKAecraKNcNxVAgPLLCvv9uz1LlfwzwtA==
X-Received: by 2002:a05:6a00:2189:b0:4bc:3def:b662 with SMTP id h9-20020a056a00218900b004bc3defb662mr12747565pfi.5.1642998401887;
        Sun, 23 Jan 2022 20:26:41 -0800 (PST)
Received: from mail.google.com (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id l10sm2070853pff.44.2022.01.23.20.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 20:26:41 -0800 (PST)
Date: Mon, 24 Jan 2022 17:26:36 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: gregkh@linuxfoundation.org, paulo.miguel.almeida.rodenas@gmail.com,
	realwakka@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] staging: pi433: add missing register contants
Message-ID: <20220124042636.GA7962@mail.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220124042506.GA7662@mail.google.com>

add missing register constants present in RFM69 and/or RFM69HW so that
we don't need to hardcode values when referencing them.

this patch adds REG_TESTLNA, REG_TESTAFC constants

Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
---
 drivers/staging/pi433/rf69_registers.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/pi433/rf69_registers.h b/drivers/staging/pi433/rf69_registers.h
index a170c66c3d5b..0d6737738841 100644
--- a/drivers/staging/pi433/rf69_registers.h
+++ b/drivers/staging/pi433/rf69_registers.h
@@ -89,9 +89,11 @@
 #define  REG_AESKEY16			0x4D
 #define  REG_TEMP1			0x4E
 #define  REG_TEMP2			0x4F
+#define  REG_TESTLNA			0x58
 #define  REG_TESTPA1			0x5A /* only present on RFM69HW */
 #define  REG_TESTPA2			0x5C /* only present on RFM69HW */
 #define  REG_TESTDAGC			0x6F
+#define  REG_TESTAFC			0x71
 
 /******************************************************/
 /* RF69/SX1231 bit definition				*/
-- 
2.25.4

