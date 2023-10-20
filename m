Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE1ECA46;
	Fri, 20 Oct 2023 06:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NdV72lfg"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9ba1eb73c27so72974166b.3;
        Thu, 19 Oct 2023 23:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697784884; x=1698389684; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UA4TXMxziCYtofjWSa2Xmk+Pq1TJM/vE1qIJ4LDb2G0=;
        b=NdV72lfgzOKJpRCpnPzlZTX8bStbiST6v837QxKR+R/SxY74xM/w3S/7T9O9OoGxfJ
         gtG7d4REQ+Uk/aKlddE9TivJF20p2zFhKUT4oVryv3rI7ZS/P9L9aIcbqe4sDk54j18n
         JppkVZeYl9it7XTf7Tp2y9605D9dxyQBwapZNhv39i4UATlDAKpE95ZK26ZEqgdo2GIm
         wYpyqR/XARAh7fDQHR4oncNlGL8kGL2xXwJ7AYjHlcWqLGOE4M2lFpTuQ+vtpu+hl5Cf
         jOpCJX2xCb2SrHnayK7Ye60F+PJFBP/QX3NU5fB7fg6F9R0WhSVIFLx5fY7GUpADC9E0
         Q4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697784884; x=1698389684;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UA4TXMxziCYtofjWSa2Xmk+Pq1TJM/vE1qIJ4LDb2G0=;
        b=ZzZpxd5GLa2VS4do0eA41fqLKgM1FRu3kQ6du3a88spC/BTcMMwrLNrCYMlZZWHrVD
         6F0H8L3ZeHRoy19jSGzstMf+BcWP4l5LAbg9Vyba9WtLAc2xMQFhAkH0bJTjo4Jm0u0X
         7HUGIEj+Agh8UcLGIT0qXDsGTGJBKFlI5GTGo8IZCfffchQ0YkHQzfUtwzFwhtbLFWM9
         qf6GOYt5IUjCAU/Zl/ox+FsixRMnr7RUN+PdQVa2vKefNe1wLOpwvYRYN2F3hmLKn1BS
         Ck5Bdy9Xxqbl2t2WYj2lVQ6ZqEb35iXHGIPjTlUrYaPLq0yWrcjBMa/uPzxz3AEYd6sJ
         C4Kg==
X-Gm-Message-State: AOJu0YzlnpKTNzvBkuzHsf9QnEonC6XGmfpUDCSL05YaaUtzxr5U9rpf
	uMqkJJaFb81iM5inxzm722M=
X-Google-Smtp-Source: AGHT+IEibmeX2HW5sBb7ytALTs5d+SjR88/vHSu9Xd9Z5Tt3Sw9hZSX3p1gCOAmfXHwmUHpekYE9zw==
X-Received: by 2002:a17:907:9302:b0:9b2:babd:cd44 with SMTP id bu2-20020a170907930200b009b2babdcd44mr592920ejc.44.1697784883554;
        Thu, 19 Oct 2023 23:54:43 -0700 (PDT)
Received: from ubuntu ([129.205.113.155])
        by smtp.gmail.com with ESMTPSA id m11-20020a170906234b00b00988e953a586sm885257eja.61.2023.10.19.23.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 23:54:43 -0700 (PDT)
Date: Thu, 19 Oct 2023 23:54:39 -0700
From: kenechukwu maduechesi <maduechesik@gmail.com>
To: shreeya.patel23498@gmail.com, outreachy@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rts5208: Add parenthesis to macro arguments
Message-ID: <20231020065439.GA3579@ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Checkpatch suggests using (reg) and (host) instead of reg and host

The use of parenthesis in the macro argument '(reg)' ensures proper
precedence and resolves potential issues that may arise due to the
surrounding code context. This modification adheres to the recommended
coding style and improves the readability or maintainability of the
code.

Signed-off-by: kenechukwu maduechesi <maduechesik@gmail.com>
---
 drivers/staging/rts5208/rtsx.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rts5208/rtsx.h b/drivers/staging/rts5208/rtsx.h
index 2e101da83220..7d3373797eb4 100644
--- a/drivers/staging/rts5208/rtsx.h
+++ b/drivers/staging/rts5208/rtsx.h
@@ -39,17 +39,17 @@
 /*
  * macros for easy use
  */
-#define rtsx_writel(chip, reg, value) \
+#define rtsx_writel(chip, (reg), value) \
 	iowrite32(value, (chip)->rtsx->remap_addr + reg)
-#define rtsx_readl(chip, reg) \
+#define rtsx_readl(chip, (reg) \
 	ioread32((chip)->rtsx->remap_addr + reg)
-#define rtsx_writew(chip, reg, value) \
+#define rtsx_writew(chip, (reg), value) \
 	iowrite16(value, (chip)->rtsx->remap_addr + reg)
-#define rtsx_readw(chip, reg) \
+#define rtsx_readw(chip, (reg)) \
 	ioread16((chip)->rtsx->remap_addr + reg)
-#define rtsx_writeb(chip, reg, value) \
+#define rtsx_writeb(chip, (reg), value) \
 	iowrite8(value, (chip)->rtsx->remap_addr + reg)
-#define rtsx_readb(chip, reg) \
+#define rtsx_readb(chip, (reg)) \
 	ioread8((chip)->rtsx->remap_addr + reg)
 
 #define rtsx_read_config_byte(chip, where, val) \
@@ -131,8 +131,8 @@ static inline struct rtsx_dev *host_to_rtsx(struct Scsi_Host *host)
  * The scsi_lock() and scsi_unlock() macros protect the sm_state and the
  * single queue element srb for write access
  */
-#define scsi_unlock(host)	spin_unlock_irq(host->host_lock)
-#define scsi_lock(host)		spin_lock_irq(host->host_lock)
+#define scsi_unlock(host)	spin_unlock_irq((host)->host_lock)
+#define scsi_lock(host)		spin_lock_irq((host)->host_lock)
 
 #define lock_state(chip)	spin_lock_irq(&((chip)->rtsx->reg_lock))
 #define unlock_state(chip)	spin_unlock_irq(&((chip)->rtsx->reg_lock))
-- 
2.25.1

