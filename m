Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD7D71
	for <linux-staging@lists.linux.dev>; Tue, 27 Apr 2021 17:47:23 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id m9so47594930wrx.3
        for <linux-staging@lists.linux.dev>; Tue, 27 Apr 2021 10:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=4YNKwrbSH5Rvo37rqzZa8T4Lub6eWYDT8GYlkyyDYk0=;
        b=C8dHAVl38Pf5OiBKnYeqR4yQrqD3SxvRYXRFscwQp+Y91UOh/+OhBTX/3SrTyoPY1y
         ZSPDZv6w2LW6rRRKMGC0huKX+E3+8hXOM76CD01PuQsRXoN7/meuUpr8kqnVv9wXuBx/
         okw/ifFFZfN/609mLVtLB6gUlUkfE2Ogw5VyJ7nrZQGEAoNV3dWPtCmFMPB/znpan7oa
         sXxgRB1+t7zd8fZ+asmw+JmuXszcAWTWG7IPftOHLlCiWBkBJtkLFUPBOh5rVkp1J9aq
         9Ywtk99SKMA3ImR2uQSNhQXtL+OpKLodxC+tlJd1V8IowrfL2LlRUgdfval3sxqnhKmp
         obmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=4YNKwrbSH5Rvo37rqzZa8T4Lub6eWYDT8GYlkyyDYk0=;
        b=ZvxIG2Uj/LRdlGyPyZ5LMsi9Jc6DfJYSgatHPtgp8Rf5fWvodkB2TlXGCaD9IicDg+
         ywSxGqKKLm4OxsgrQWxjTdlidDO8/bLWWcvBGjcsS1Y5podpQStvi7qZO9eWd2LK12Py
         MtK7ptUbgaxgg7jmqB+FCkwcAd6KnHrXTRKSKYqgodpD+4YYA88CjzHouANIRK+/q/YS
         qq4ktntT2wzCPQoAIyMN7MuAQLaXJtxxRFY+re/X1rb2M1W7Jizsj1UDoq53oekFu+mH
         WJsR4nTXxRdEPHVpheeW51oTYdIRe9/tMJL6ilgSAweOivHwlUqZ3IZ7kXtOEC5D9WMg
         Empg==
X-Gm-Message-State: AOAM533+c5BOw+WA8eZx5jhCRTpoyE5/hFLGT7arJpqyz41+Fnrl2fY7
	nOoYkGP8YFRSZsQt0UHR/1M=
X-Google-Smtp-Source: ABdhPJyQWagRbNKnvuALypImjKzksqcPDteX3KMtMJwu1zocATBGwcgBG9ry/MFwPzFudi0zE5RVxg==
X-Received: by 2002:adf:f8c8:: with SMTP id f8mr16769606wrq.267.1619545641745;
        Tue, 27 Apr 2021 10:47:21 -0700 (PDT)
Received: from ubuntu (host86-178-35-221.range86-178.btcentralplus.com. [86.178.35.221])
        by smtp.gmail.com with ESMTPSA id i2sm2335534wro.0.2021.04.27.10.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 10:47:21 -0700 (PDT)
Date: Tue, 27 Apr 2021 10:47:19 -0700
From: Iain Craig <coldcity@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: mt7621-pci: fix a multiple assignment code style
 issue
Message-ID: <20210427174719.GA14124@ubuntu>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

avoid multiple assignments while setting pcie->io members to NULL.

Signed-off-by: Iain Craig <coldcity@gmail.com>
---
 drivers/staging/mt7621-pci/pci-mt7621.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/mt7621-pci/pci-mt7621.c b/drivers/staging/mt7621-pci/pci-mt7621.c
index 115250115f10..f3b5b8ac03b5 100644
--- a/drivers/staging/mt7621-pci/pci-mt7621.c
+++ b/drivers/staging/mt7621-pci/pci-mt7621.c
@@ -306,7 +306,9 @@ static int mt7621_pci_parse_request_of_pci_ranges(struct pci_host_bridge *host)
 	 * resource manually instead.
 	 */
 	pcie->io.name = node->full_name;
-	pcie->io.parent = pcie->io.child = pcie->io.sibling = NULL;
+	pcie->io.parent = NULL;
+	pcie->io.child = NULL;
+	pcie->io.sibling = NULL;
 	for_each_of_pci_range(&parser, &range) {
 		switch (range.flags & IORESOURCE_TYPE_BITS) {
 		case IORESOURCE_IO:
-- 
2.25.1

