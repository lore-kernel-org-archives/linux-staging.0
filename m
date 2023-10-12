Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCDD63B3;
	Thu, 12 Oct 2023 05:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezTfOs8o"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1bf55a81eeaso4775155ad.0;
        Wed, 11 Oct 2023 22:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697087002; x=1697691802; darn=lists.linux.dev;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6/jvxDoKsynF/Hhi+qgRno1n6eO8dybkroD/ZkL/wM=;
        b=ezTfOs8oRgi/Zi4fIsY+tbQwwVNGanQKamgdq0brP2e4rCv8lrygifwdNbz3gHoLuA
         TKjgaA/9wLRDgvqYz+cuUf6cQUgortQN93N2ZfVk8YzaIVoMrNX9OwWgdCQE5aDenVJV
         V45Tzbm3goKPlutDU87UealKwx4ccaZgzQYYf34fhgRcqSZE3h0xAJOpDuuUKC+vuQjx
         cuGb3zYWf/h4kfm/t6Gc4nxTGpsuwbDP5co3dZIGMi0X0sm5xrt7n9/pJ977F79td5h4
         KU1cUXQTe9PQc2dcPsSZZNzxFFBIcWIW2slWfxw9Ci4PmoxtyK/sBZjjiN8qfYw6iFln
         TXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697087002; x=1697691802;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E6/jvxDoKsynF/Hhi+qgRno1n6eO8dybkroD/ZkL/wM=;
        b=XpmsxfYczZ3esl/TLxHdzCUcqcOWqIS/wTUpl/HEp5LteVaMaH3xM0YCFTDeTNzupb
         CqVMPWpNhxPeKaGxsSZ1xsIyb1TyzR/9XRdPwinaVrqkGAalS5bUzBD54yNF4pyq8kMc
         S+iml2emixM8Ficsf7SaqJX93pQ8QM8ENcg0A4RnCoDv/hhsaEdmh9jv35b0K9Tm6kAC
         b9a+y5b1uPTMIXHtF5ZwwDFyOxMmprjAblt+Hx7E3Urw4C06YeGPi0sAtdlxbzQbiwvH
         2yBZIITbCuN0nTVTnogYJeL4D65OpEd3VC2QAunjBfKj7plq2oj9rIebjVSUmJqdjIBJ
         HogA==
X-Gm-Message-State: AOJu0YxPguV+leZnLUBm5F8S1kS5allAmhmsAH5UzDEwGYrGeK2FO4HT
	QdVCEdOXTDolGZvt4KhbP30=
X-Google-Smtp-Source: AGHT+IEruTfzVk/s5T22BWoCbdl3+aluCxel5xThVpM6incPCOA7p79gSs+jWmo6gvq0PWOP0xzamw==
X-Received: by 2002:a17:902:c94f:b0:1c3:8464:cabd with SMTP id i15-20020a170902c94f00b001c38464cabdmr25693137pla.12.1697087002535;
        Wed, 11 Oct 2023 22:03:22 -0700 (PDT)
Received: from Negi (2603-8000-b93d-20a0-29fa-db66-4c18-1f0a.res6.spectrum.com. [2603:8000:b93d:20a0:29fa:db66:4c18:1f0a])
        by smtp.gmail.com with ESMTPSA id j9-20020a170902da8900b001c5900c9e8fsm837734plx.81.2023.10.11.22.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 22:03:21 -0700 (PDT)
From: Soumya Negi <soumya.negi97@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Micky Ching <micky_ching@realsil.com.cn>
Cc: Soumya Negi <soumya.negi97@gmail.com>,
	outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rts5208: Parenthesize macro arguments
Date: Wed, 11 Oct 2023 22:02:40 -0700
Message-Id: <20231012050240.20378-1-soumya.negi97@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Use parenthesis with macro arguments to avoid possible precedence
issues. Found by checkpatch.pl

Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
---
 drivers/staging/rts5208/rtsx.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rts5208/rtsx.h b/drivers/staging/rts5208/rtsx.h
index 2e101da83220..1cc05956ab6d 100644
--- a/drivers/staging/rts5208/rtsx.h
+++ b/drivers/staging/rts5208/rtsx.h
@@ -40,17 +40,17 @@
  * macros for easy use
  */
 #define rtsx_writel(chip, reg, value) \
-	iowrite32(value, (chip)->rtsx->remap_addr + reg)
+	iowrite32(value, (chip)->rtsx->remap_addr + (reg))
 #define rtsx_readl(chip, reg) \
-	ioread32((chip)->rtsx->remap_addr + reg)
+	ioread32((chip)->rtsx->remap_addr + (reg))
 #define rtsx_writew(chip, reg, value) \
-	iowrite16(value, (chip)->rtsx->remap_addr + reg)
+	iowrite16(value, (chip)->rtsx->remap_addr + (reg))
 #define rtsx_readw(chip, reg) \
-	ioread16((chip)->rtsx->remap_addr + reg)
+	ioread16((chip)->rtsx->remap_addr + (reg))
 #define rtsx_writeb(chip, reg, value) \
-	iowrite8(value, (chip)->rtsx->remap_addr + reg)
+	iowrite8(value, (chip)->rtsx->remap_addr + (reg))
 #define rtsx_readb(chip, reg) \
-	ioread8((chip)->rtsx->remap_addr + reg)
+	ioread8((chip)->rtsx->remap_addr + (reg))
 
 #define rtsx_read_config_byte(chip, where, val) \
 	pci_read_config_byte((chip)->rtsx->pci, where, val)
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
2.17.1

