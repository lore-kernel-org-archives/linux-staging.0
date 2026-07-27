Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB3C3F9F2D
	for <linux-staging@lists.linux.dev>; Mon, 27 Jul 2026 11:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785150946; cv=none; b=XtyCUc8I0etNBH7AcDlERdWTQLEhdTqp1cQLXYUoSjG6Ts+gAwRYEeP+LhqsOuQCBiwvLBDgvNjGHmEEvSvmf66GoI3eUNUC9WeE4Kt3SiMfr03JnVVJL3IPBW8n6N66bKeZ52izXgjUtbQXCa3Cva6pG5B5yPZipU4wWMEtFbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785150946; c=relaxed/simple;
	bh=GoUTgUI001M7Nkvz5L0znPw4/YTz9d1rdGCJaMUXKvw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=clPf5Ui/Eu+eEgP9hKVuAt7VyfpGQHb4C5huUbVyBbIVVXD1YvfHowiInrZiA8qL1qqAQ4V1Rxfpe53sOWZjCoTp9+gU4l8MqlcG1TfTqr8/VzdSYVJczVw8zzYzf8vmgU9yAuyzI+3cjJskMWoeUIvms9kXu4KdtFNjvCaLWnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s9ihWvZZ; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s9ihWvZZ"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cbb662575d3so1417157a12.0
        for <linux-staging@lists.linux.dev>; Mon, 27 Jul 2026 04:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785150944; x=1785755744; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z++gezlvac4xYRLRtWLYw02S+0yg9RS8Olu40yBTBJ4=;
        b=s9ihWvZZaEkvbQHeD0JA/3UA3n+Bp7dy2KIxeyEpwzIYthLzlTLK7UI5OGHu9vBAp1
         LCWEENJnLNoE/UI/cS866CPm8ULPLDegbaPBcm+8zhOlNZixItnJ7re0hjDsUdHGfWCQ
         9DQCHFoBxmCirZvmZunuQQHGvFJ8jy8g7i/OVEvEnOChxzQa3HQFr7Y+esoKKdD7/6xL
         efiRCH1U+z/VCGgW3u9c2xwxkvRHTZYNGmqY46n26FdWJW1UCcnS/0s246m+qAVpFchi
         5V6n69ZYL6Ko8QqbhDwEX+TroyCDSupY9NomMw6vW0Iksr9s9m2twFrSEUf+ohXEX5G6
         JIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785150944; x=1785755744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z++gezlvac4xYRLRtWLYw02S+0yg9RS8Olu40yBTBJ4=;
        b=emdLByrQiGxJgoCQgsoihqPqAg3YBC3uiK2RtnGL8vfugDiVTUL9cBlX3WzaeUgNBn
         PzjLML95+pLlx7XdLOZrwXbYqUAMuIc6dElCE5GyBI5BfZYKcBSAYH+xppLhEIQq6fSY
         EnkzkXOegdC7i+4ZvavJYDtU+rc6cxECxdFKucBef00OjI8vxtodmBf9ZCMp3BxJ65kP
         QdjVsoncLHErMVu9BTrzzpZSKue/ZBaNGVr0jbgq7zr0QKqqEdg/kcGZvztJ7Y8KIF7/
         7XYbuPZzk4Vk8+L2rCEC6oDIpHuYpDIIja56x6lPmwhk0pEJ6YYiC8IA8mKVKchtazQh
         Dkzw==
X-Forwarded-Encrypted: i=1; AHgh+RofnmRJiWvnwFdrFZgE+pm+fndJ5436NVk8H4kgRMY5j3ZpbWbkb+rPyn9iJaWgpuGTuoCY/Rt4vzs5HTY1@lists.linux.dev
X-Gm-Message-State: AOJu0Yxfn5MXRJ5GclaIraAmBNBUBx0eL9z5DO48NVYtQrUONsaEV5yI
	7mCbRzeo6oTlK2Y/KPVsLI/TLMcF4NAXvC/CLzhdVgRKwCu/XfoLP+UI
X-Gm-Gg: AR+sD11JLcOHlP+stv3jibsT1n+GKeAGy8/Ve8r6xnmohmb8SUJ5ctniTzAj9Vbfg1q
	q/FhfrCRL76fJV4xfCmYfauOvfaokwy+dhVuIJYUJbs/7J/TgctkieIQLBTYbWSq0NoZZuOPCk/
	iXeDzItjfuOFvyMYfrrs00pzs4GlVCRWz8t+BhC2r5BvT1lq6e/btrfc9rq15gq3G2kP0f9S56o
	eH3AwE1OC6j4tBSs94PnbLDcK4VJcBa+mS8o3XEavjZSEnZhU9EWzVHrzsmA/TejTHG5o5iZg0d
	FBhGf+QJtqW+gra1HWvtDZASlZMWv2dut2SwPkvcJPQuz0oP0TkRfH7oS/sOqsN3ExRJ4v1WBk0
	ue3nUBs2axuT9auABvkhZeGWc2Oln+DEqCGfhAEvX9Onr6QMeyOXPKJlJ3HbAQukVeTYofs84qG
	5Xhn17WLCYJUC1UPsR8yM=
X-Received: by 2002:a05:6a21:50b:b0:3c4:147e:98f1 with SMTP id adf61e73a8af0-3c67daa7226mr8285938637.31.1785150943517;
        Mon, 27 Jul 2026 04:15:43 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130262d2sm49070926c88.7.2026.07.27.04.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 04:15:42 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Martyn Welch <martyn@welchs.me.uk>,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] staging: vme_user: fix flush_image leak in tsi148 bridge
Date: Mon, 27 Jul 2026 18:15:34 +0700
Message-Id: <20260727111534.729615-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When error checking is enabled (err_chk=1), tsi148_probe() allocates an
extra master window resource, tsi148_device->flush_image, which is used
to flush posted writes by reading back over the VME bus. Unlike the
regular master windows, this resource is not linked into
tsi148_bridge->master_resources.

Because it is not on any resource list, it is freed neither by the probe
error path (which only walks the master_resources list) nor by
tsi148_remove(), so it is leaked whenever err_chk is set and either
probe fails after the allocation or the device is unbound / the module
is unloaded.

Free flush_image in both the probe error path and tsi148_remove(). This
is safe when err_chk is disabled: tsi148_device is allocated with
kzalloc() so flush_image is NULL and kfree(NULL) is a no-op.

Fixes: d22b8ed9a3b0 ("Staging: vme: add Tundra TSI148 VME-PCI Bridge driver")
Cc: stable@vger.kernel.org
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/staging/vme_user/vme_tsi148.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/vme_user/vme_tsi148.c b/drivers/staging/vme_user/vme_tsi148.c
index c695ad9b4ca2..8ee1e00cef4f 100644
--- a/drivers/staging/vme_user/vme_tsi148.c
+++ b/drivers/staging/vme_user/vme_tsi148.c
@@ -2513,6 +2513,7 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		list_del(pos);
 		kfree(master_image);
 	}
+	kfree(tsi148_device->flush_image);
 
 	tsi148_irq_exit(tsi148_bridge, pdev);
 err_irq:
@@ -2619,6 +2620,8 @@ static void tsi148_remove(struct pci_dev *pdev)
 		kfree(master_image);
 	}
 
+	kfree(bridge->flush_image);
+
 	iounmap(bridge->base);
 
 	pci_release_regions(pdev);
-- 
2.25.1

