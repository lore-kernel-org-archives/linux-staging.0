Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57461186B;
	Sat,  2 Apr 2022 17:57:02 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id yy13so12095308ejb.2;
        Sat, 02 Apr 2022 10:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BVxMHUicLbUH3Hvb1PPfVYvYyoskkvyv49vbgbrFCNo=;
        b=l4c6G01X/mM7+1GnZ7oTuCLmtLgPbKG3mx7SbFPIku+ccwGTElZ0p+W8JpJcckG2wh
         /lF6CkMeckAATTx3qq8eCxC0mdDSJ0VT019mKzu8JOetLhqQuR09W5RVyrR1UzGEDt7H
         knZw+WaqR0Sidvgu5QJrnqYYMGo1Y1pb08ICafpgzDjkd/Q6yIWrf7dgseR/JD945Em3
         9BH+Nb3SU6TlJBW8YtlSz/fuKkv3a9zHjIUAn2x7LKtTPE+BqSFW9l9bishHF4Eei2fe
         fJhs+n3r7vBmF7oQn92ysEu3AeNjnZ7OlVofn2YH8295+lgWegZ90Ap6GMNXlUY+LxGh
         c2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BVxMHUicLbUH3Hvb1PPfVYvYyoskkvyv49vbgbrFCNo=;
        b=pMg3g7CJu2U53hSc9teVTIuYQQSdrADXaWbvp1lsOWxC0/sUJuZV5s9znFCSNqY6AV
         GD28GpRrVkM0G+Z59NRfUk1LeuzrqWWCngL+Hr4sSS3jxtBKEVbql+uCyyf6Raxl4l+T
         KqpmO7+itti0CLUkBmk+NwKXidTtxxiCAWv1oq0Ku6qa6yCVjfb4hWudvbJ/GUR+49rj
         j3vSV9VwnSWeALL/ZsXh06zAm9up30vAeiYMa2Q2GS0Pjf41RJIGMbhCBXVLAdsiVOJ1
         fr02kJ3HYfntViwda0QU1qlz5YS6eY0THLJP+TLygyJ8AsjXTPR0dGxM0U5bhaU+cbOr
         CMHw==
X-Gm-Message-State: AOAM533tJedNb+Z3yGc1j9FoKkDvqYegcGqBLQ1fmD8POS5HrtYFGXzk
	LlCUGfqKMOSChD1cjdqLRXY=
X-Google-Smtp-Source: ABdhPJxRkR3w6MzpTeXo9b3BtpKvfUhBJrw6SYUseLvbqksVCDq8E3opTpW2w3JsDEAmAT8cwPaL5Q==
X-Received: by 2002:a17:907:62a9:b0:6da:7953:4df0 with SMTP id nd41-20020a17090762a900b006da79534df0mr4472210ejc.316.1648922220505;
        Sat, 02 Apr 2022 10:57:00 -0700 (PDT)
Received: from localhost.localdomain (host-95-249-145-232.retail.telecomitalia.it. [95.249.145.232])
        by smtp.gmail.com with ESMTPSA id hs12-20020a1709073e8c00b006dfd7dee980sm2330857ejc.30.2022.04.02.10.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 10:56:59 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH] staging: sm750fb: Call iounmap() to free mapped bus memory
Date: Sat,  2 Apr 2022 19:56:55 +0200
Message-Id: <20220402175655.31512-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If ioremap_wc() fails, the code jumps to the "exit" label and forgets to
free the bus memory mapped into "sm750_dev->pvReg". Mapped bus memory must
always be freed by calling iounmap().

Call iounmap(sm750_dev->pvReg) when the above-mentioned failures happen.

The site of the missing iounmap() has been detected by Smatch.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/sm750fb/sm750_hw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index a7c6eb07b62e..55cb00e8b0d1 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -81,6 +81,7 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	sm750_dev->pvMem =
 		ioremap_wc(sm750_dev->vidmem_start, sm750_dev->vidmem_size);
 	if (!sm750_dev->pvMem) {
+		iounmap(sm750_dev->pvReg);
 		pr_err("Map video memory failed\n");
 		ret = -EFAULT;
 		goto exit;
-- 
2.34.1

