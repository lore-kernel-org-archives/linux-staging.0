Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCD02B5CC;
	Thu, 12 Oct 2023 23:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HrO2eQh+"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-578b4981526so1144645a12.0;
        Thu, 12 Oct 2023 16:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697153358; x=1697758158; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ox7ZzV5ESrBmEIpsae5SvW22xhGmgMakXbrbQy8MZic=;
        b=HrO2eQh+zQRFK6A1f02dAYbJO7VEX34d8nMCHLFBsEo54ZhfZK/ygUYnshLh2km07t
         6e3yCDnNAKKpi+zNDV1YnJwXh6PzrfE8QSwxtmgHLfOr6ctENnwxxUH0Uud1O+17TG8z
         kb/QOKvQthDepO/99nWCajsH/LhgF0TydzrVnAPsnUQVQ5saHE/fxXeSwmiqI8afJG3x
         GPywoBVimJPS7GSzZDqEeLEY4D6rQmK3hz7qaY9cG1jOSqV+PNSSixvdd7/JYF6pfE/F
         MN5TgNtlkhRJMvxMyUg+M2ENtA5+6xaQtxsi+aiFMV24d+yUq00kJd2WH2cbU/p/6S+E
         fGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697153358; x=1697758158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ox7ZzV5ESrBmEIpsae5SvW22xhGmgMakXbrbQy8MZic=;
        b=NzHYDoZnx4A4O+z+3m4feUx/F21htdwpCUT2Iu4A8pFRxvo1LA8mkIa/16JUJWmYNM
         pa5lnuPbaT58wHFJ+v6r7EG7cw4/pMftpwScaOPQT0as4CRB+yE6o0vpH8KszFdMT1Q2
         VIMl2DQ3fBCy7EvX8KzgztRLr+GrR4sdbAxkTZvcYi8bPmLodHwmUhhVmLZiX6Ia4Vm9
         D6mwVBNfOcFZ5xZuiwhf1yb1QSDuDbhyeSntfD8vPecYSMz6a3/lEkPUR3lJDrpsPKyK
         yq6vP0Ks5wkR04Z3AW66nR8+iWj7swtYM2PNKaUsc1HTZTUdbeFHNbCb3mNgoLHlsG/D
         3+4A==
X-Gm-Message-State: AOJu0YzAltr+WOyXhM+doFjoUcUXIeKbWBtBVYbf2SH4dl78RFPTFCig
	4b7QJ+rRhqVETpRi02VAxmw=
X-Google-Smtp-Source: AGHT+IH6Fe/H6t0yDaS87yU66xTqEIVg1VfGPCa+mpPs4pHNgVILOzirnJiNqIaMO68eXqsoYWZQrA==
X-Received: by 2002:a05:6a21:6d9b:b0:158:1387:6a95 with SMTP id wl27-20020a056a216d9b00b0015813876a95mr28303215pzb.19.1697153358401;
        Thu, 12 Oct 2023 16:29:18 -0700 (PDT)
Received: from Negi ([68.181.16.134])
        by smtp.gmail.com with ESMTPSA id cm24-20020a17090afa1800b0026f919ff9a1sm2377359pjb.10.2023.10.12.16.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 16:29:18 -0700 (PDT)
From: Soumya Negi <soumya.negi97@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Micky Ching <micky_ching@realsil.com.cn>
Cc: outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Soumya Negi <soumya.negi97@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Julia Lawall <julia.lawall@inria.fr>
Subject: [PATCH v2 1/2] staging: rts5208: Refactor macros to static inline functions
Date: Thu, 12 Oct 2023 16:29:05 -0700
Message-ID: <c7431fe4d7f72138d8dc86269794f87c30d21a38.1697152251.git.soumya.negi97@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1697152251.git.soumya.negi97@gmail.com>
References: <cover.1697152251.git.soumya.negi97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Driver rts5208 uses macros to read/write data & to perform generic PCI
functions. Rewrite these macros as static inline functions in the header
file.

Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
Suggested-by: Julia Lawall <julia.lawall@inria.fr>
Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
---
Note: The macros wait_timeout_x() & wait_timeout() have not been redfined as
functions because they pass defined hex constants as arguments(hence can't be 
type-checked).

 drivers/staging/rts5208/rtsx.h | 59 +++++++++++++++++++++++-----------
 1 file changed, 40 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/rts5208/rtsx.h b/drivers/staging/rts5208/rtsx.h
index 2e101da83220..ea29646b8c38 100644
--- a/drivers/staging/rts5208/rtsx.h
+++ b/drivers/staging/rts5208/rtsx.h
@@ -39,25 +39,6 @@
 /*
  * macros for easy use
  */
-#define rtsx_writel(chip, reg, value) \
-	iowrite32(value, (chip)->rtsx->remap_addr + reg)
-#define rtsx_readl(chip, reg) \
-	ioread32((chip)->rtsx->remap_addr + reg)
-#define rtsx_writew(chip, reg, value) \
-	iowrite16(value, (chip)->rtsx->remap_addr + reg)
-#define rtsx_readw(chip, reg) \
-	ioread16((chip)->rtsx->remap_addr + reg)
-#define rtsx_writeb(chip, reg, value) \
-	iowrite8(value, (chip)->rtsx->remap_addr + reg)
-#define rtsx_readb(chip, reg) \
-	ioread8((chip)->rtsx->remap_addr + reg)
-
-#define rtsx_read_config_byte(chip, where, val) \
-	pci_read_config_byte((chip)->rtsx->pci, where, val)
-
-#define rtsx_write_config_byte(chip, where, val) \
-	pci_write_config_byte((chip)->rtsx->pci, where, val)
-
 #define wait_timeout_x(task_state, msecs)	\
 do {						\
 	set_current_state((task_state));	\
@@ -147,4 +128,44 @@ enum xfer_buf_dir	{TO_XFER_BUF, FROM_XFER_BUF};
 #include "rtsx_sys.h"
 #include "general.h"
 
+static inline void rtsx_writel(struct rtsx_chip *chip, u32 reg, u32 value)
+{
+	iowrite32(value, chip->rtsx->remap_addr + reg);
+}
+
+static inline u32 rtsx_readl(struct rtsx_chip *chip, u32 reg)
+{
+	return ioread32(chip->rtsx->remap_addr + reg);
+}
+
+static inline void rtsx_writew(struct rtsx_chip *chip, u32 reg, u16 value)
+{
+	iowrite16(value, chip->rtsx->remap_addr + reg);
+}
+
+static inline u16 rtsx_readw(struct rtsx_chip *chip, u32 reg)
+{
+	return ioread16(chip->rtsx->remap_addr + reg);
+}
+
+static inline void rtsx_writeb(struct rtsx_chip *chip, u32 reg, u8 value)
+{
+	iowrite8(value, chip->rtsx->remap_addr + reg);
+}
+
+static inline u8 rtsx_readb(struct rtsx_chip *chip, u32 reg)
+{
+	return ioread8((chip)->rtsx->remap_addr + reg);
+}
+
+static inline int rtsx_read_config_byte(struct rtsx_chip *chip, int where, u8 *val)
+{
+	return pci_read_config_byte(chip->rtsx->pci, where, val);
+}
+
+static inline int rtsx_write_config_byte(struct rtsx_chip *chip, int where, u8 val)
+{
+	return pci_write_config_byte(chip->rtsx->pci, where, val);
+}
+
 #endif  /* __REALTEK_RTSX_H */
-- 
2.42.0

