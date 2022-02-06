Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658162F21
	for <linux-staging@lists.linux.dev>; Sun,  6 Feb 2022 05:55:16 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id n32so8815305pfv.11
        for <linux-staging@lists.linux.dev>; Sat, 05 Feb 2022 21:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=QllGcs8jzslhBf9s27Nd7fCzfzy4T3imE/YP1j3Ms3c=;
        b=l6+4DZO0eT+NO+dc2mLF5dsgbs9+drsyJuMcPj3hNHjIyyhgmfWhsgIhnPVEqTl5ww
         7FzxZ/fU5knE1fPFx4tIU/J4vN6P/zg+2FlLqnzbfaQtgYbVCa80fa5eoJDg1FXjZgWl
         E6vEYJjrEHyVeZT0He2n+JdsXJWNn5ZiOgWJ5EI87v6Ws7+8itqaInyWZChB1UyZNrGw
         VVASpSMs23kvPx0gnd+LJJiGXPYuLxow4ztB4FHAtb2F0HIzaKCUOCKmUtrWgwfvmLN8
         pgoAyL1hbOEqz8yniKBpweAIYxoYEMfQdI6I12tyEzpKhSJCN49BMspFGUKUyrONhYko
         MRiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=QllGcs8jzslhBf9s27Nd7fCzfzy4T3imE/YP1j3Ms3c=;
        b=abT4KQrx9RyCgV2KHMVPabMfRchPQ8AnO0B9B1CgLh5dMR+sWjKwPTcw/ZS9w4gNr4
         HR/7fqiTWpAAMcEJWjVSe+aB5RvzsS6gWfoVmiXs1F2zoHVhU3gl5GvSssmet2I7z7H/
         IH/8Gh35tot4SFcLWcUo+SMwV5oDSD2iBlCkI9uTU6qUKdvwpaFNFmb91VJQ1ruD2BtX
         LA9GkeHF7TZBwXMKX1MfV6BvRE4JoeDE7IayN/Ejn68icycBJjH+yzQqGXQzX6CZkcW+
         jUMTe8yUY0N5wEsIFdsStb9IM7CD3Xakxgx0RHhz/plFeJQYm+XSA3URSt0/raWTP9cs
         r1SA==
X-Gm-Message-State: AOAM531uvLqTPmrXwV8nR3ujFlrYO0BwP6LWBC/V0Ow/na9/Sx0Tw4QU
	jPOD8urWxNcJ6V//MSRT80U=
X-Google-Smtp-Source: ABdhPJxmThNqiX6NqrU4WsRYYdLRfnbKATWJt3yOAjweie1fwvFZ++Dq7mGovWp/DrwF6mynq4CL/Q==
X-Received: by 2002:a05:6a00:194d:: with SMTP id s13mr10230054pfk.22.1644126915744;
        Sat, 05 Feb 2022 21:55:15 -0800 (PST)
Received: from mail.google.com ([124.157.67.163])
        by smtp.gmail.com with ESMTPSA id o1sm8311886pfu.88.2022.02.05.21.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Feb 2022 21:55:15 -0800 (PST)
Date: Sun, 6 Feb 2022 18:55:09 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: gregkh@linuxfoundation.org, paulo.miguel.almeida.rodenas@gmail.com,
	realwakka@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: pi433: remove register debug dev_dbg stmts using
 DEBUG_VALUES
Message-ID: <Yf9ivRB5qpmA5rY2@mail.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Which the recent addition of the debugfs dentry (regs), users can now
obtain rf69 register values without having to tweak constants
(DEBUG_VALUES) and recompile the pi433 module source code in order to
see those values.

This patch removes code blocks made obsolete by debugfs regs file.

Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
---
 drivers/staging/pi433/rf69.c | 37 ++----------------------------------
 1 file changed, 2 insertions(+), 35 deletions(-)

diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
index 2ab3bf46e37d..bf26aef69daa 100644
--- a/drivers/staging/pi433/rf69.c
+++ b/drivers/staging/pi433/rf69.c
@@ -8,8 +8,6 @@
 
 /* enable prosa debug info */
 #undef DEBUG
-/* enable print of values on reg access */
-#undef DEBUG_VALUES
 /* enable print of values on fifo access */
 #undef DEBUG_FIFO_ACCESS
 
@@ -26,48 +24,17 @@
 
 u8 rf69_read_reg(struct spi_device *spi, u8 addr)
 {
-	int retval;
-
-	retval = spi_w8r8(spi, addr);
-
-#ifdef DEBUG_VALUES
-	if (retval < 0)
-		/*
-		 * should never happen, since we already checked,
-		 * that module is connected. Therefore no error
-		 * handling, just an optional error message...
-		 */
-		dev_dbg(&spi->dev, "read 0x%x FAILED\n", addr);
-	else
-		dev_dbg(&spi->dev, "read 0x%x from reg 0x%x\n", retval, addr);
-#endif
-
-	return retval;
+	return spi_w8r8(spi, addr);
 }
 
 static int rf69_write_reg(struct spi_device *spi, u8 addr, u8 value)
 {
-	int retval;
 	char buffer[2];
 
 	buffer[0] = addr | WRITE_BIT;
 	buffer[1] = value;
 
-	retval = spi_write(spi, &buffer, 2);
-
-#ifdef DEBUG_VALUES
-	if (retval < 0)
-		/*
-		 * should never happen, since we already checked,
-		 * that module is connected. Therefore no error
-		 * handling, just an optional error message...
-		 */
-		dev_dbg(&spi->dev, "write 0x%x to 0x%x FAILED\n", value, addr);
-	else
-		dev_dbg(&spi->dev, "wrote 0x%x to reg 0x%x\n", value, addr);
-#endif
-
-	return retval;
+	return spi_write(spi, &buffer, ARRAY_SIZE(buffer));
 }
 
 /*-------------------------------------------------------------------------*/
-- 
2.34.1

