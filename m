Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196129;
	b=VHsvYyNPdFR3FTfwuYRcS2Yn93jDfl4evef5HAZ8kEnWcTqhwyS5RQHHrQBr+2RLDWHj
	 +Q0bi9ZNRCS5YgVZEh2XiBZQXmjhGnT1ew2ZZRM0YGWiuNhYXF2MmiUMV1jznPljVX9uq
	 IHMg9tLHTktsnkpcWHAaIAfbCT2y4mLy/nkqOjXesPUfI5ftPBYkDMQs1nxIHMW506AHt
	 rmnDEmaKQAFjLuCxJjsMDbuZBHJxdk20NO37ODO93anKSoHG8kfTpNRB6+Klm7MXJ0zqA
	 wqbzxeIASn/MkW7cXIiROq4Mr2WLUxuhxe+J8kHI8kPj2TBZ3UVtFckWpEQioUoJ83g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196129;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-HM-Tid:
	 X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=2n2zs14xPakSNx4z7J5v3THcb6G951+ehp+zy5kuS/Q=;
	b=Hjr7a7JGmANTvNqaNRUJYB495cEpmVweK+P2XyeZFV3dVEikDGwOhyIVvB/VM/+/lspL
	 vT3iKI6KlBLGzr+pjk4bIbVb8k2hysuUAKDW76xircPh7fuBiIazGNIa+5CT7TfI01XvI
	 VoYHeiaWTZzkANj+ApPfPIuBqgaRZ+vrTYyFs+M+3hykPaYPFFj+e8W1+ua49+oE4dyMN
	 4TB9KxAKJsdMGqGuaWLEZri5wCemhb0PwmXoyaCfwWCJvL6zYo1QJ/JTWZ0Ix+gJyiyU3
	 MpqArF00Ugz81sSTcFove01Vgzhne1Mo2e/HaqHAJg9Rvb0NXtvHUBPSeiPuVptojbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=cKaAddK8;
	arc=none smtp.remote-ip=45.254.49.197
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D9360A262A
	for <linux-staging@lists.linux.dev>; Fri, 20 Nov 2026 17:35:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55D9360A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=cKaAddK8
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5573c0abd;
	Sat, 21 Nov 2026 01:35:24 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] media: atomisp: Fix potential firmware leak after partial loading
Date: Sat, 21 Nov 2026 01:35:22 +0800
Message-ID: <20261120173523.3923967-1-liguangshuo@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1fa06fdfa03a1kunmffaab860238b7e
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaSB0YVhkaHx9CSE9PGhhNGlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=cKaAddK8jh/P0mfm2ZFvOUGmgcb1bDvhGPPvyAxq+6uOwoFl7nW1u+d8e2q+pLt7QpOhcbudw+qJNI/N+LdXcohrHJ+AxhKXTfQTRQrAlxbtFabBNIMNVJu72NfmwnWkkLE2ZhwZqAKQaB9M98rYrZ/vpc4nVUXyOr1XF7DkAXk=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=2n2zs14xPakSNx4z7J5v3THcb6G951+ehp+zy5kuS/Q=;
	h=date:mime-version:subject:message-id:from;

A failed firmware load can leave the minibuffer table and successfully
loaded blob parameters allocated. Probe skips firmware unload, and a
later retry overwrites the pointers to those allocations.

Unload partial firmware before freeing the IRQ. Clear all_binaries after
freeing it so cleanup after a later failed load cannot free the old
allocation again.

This issue was found by our static analysis tool under development.

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c              | 4 ++--
 drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index f8875d2b581b..4917d6bae44d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1423,7 +1423,7 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	err = atomisp_css_load_firmware(isp);
 	if (err) {
 		dev_err(&pdev->dev, "Failed to init css.\n");
-		goto error_free_irq;
+		goto error_unload_css;
 	}
 	/* Clear FW image from memory */
 	release_firmware(isp->firmware);
@@ -1442,8 +1442,8 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 
 error_unload_firmware:
 	atomisp_pm_uninit(isp);
+error_unload_css:
 	ia_css_unload_firmware();
-error_free_irq:
 	devm_free_irq(&pdev->dev, pdev->irq, isp);
 error_unregister_entities:
 	hmm_cleanup();
diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index e9016d7775dc..8fe22eff24a1 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -511,6 +511,7 @@ int ia_css_binary_uninit(void)
 		binary_infos[i] = NULL;
 	}
 	kvfree(all_binaries);
+	all_binaries = NULL;
 	return 0;
 }
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
