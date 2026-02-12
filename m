Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71CB224D6
	for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 17:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770916765; cv=none; b=B0ekk2n9kAtbJWXAJWHr3tth+z/fP7lWU2cghjjL++ItjVbX1Ho5N/lDIdx45f8HxIXLbBLUH8AXlW+61SeN3M+O5XfK8HAGGuBFKZqVsLU9XYr0PVE7BXKF1cGulfCA4yzdCosoXw6/j27+Yic4XYc958x+uiA+0iV3b8PPEPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770916765; c=relaxed/simple;
	bh=CrQpbEV5IPnUNL0QPZBCTdajYkmOm0/i00kO26QPOrY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TxtXUlHFJ2XiGirgTk+s1PnFi76c8oN1ebLXKdzv2vQH0tGcwLOYG+78XRibVs7nYXhJvvz+FcTSC1y+675biwmlxCjAzaSH53hTzgVWmCC6OaA+g3SLTLtIQvAF+m1mZtoRbM4w3YEoMw8JJswJkROZk77O9sKpzJ4I1jZyZZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RagSBSqp; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RagSBSqp"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2aaf43014d0so273805ad.2
        for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 09:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770916764; x=1771521564; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Dk12s/kv9fkKYCcNYFIar28stlOTl1HDBawH5eqWR8=;
        b=RagSBSqp3UmVU4urfqUc+RM7UgXTGlUhuzb/MZU7HrV8anMPZHZTC75WLg2e1N6azm
         6YPsj+o+0GpBf5RcmnuVmW56lHtvnBlCJIExvfWSURcVFBZ78UAjNEgga5fqY4SviM4T
         vwHsDk/kFnQX16/Dx6JO6HXu5Y5hLNmfQUvl1vsGJhUCKfoA0i/XVIxYpHl+YW4Vr7CK
         UKj9Bkv2SVUP9/W79ezECNZPjCMSfniuuxBC45ScGu1sgYTUChj8/HAl4S0KkHKtbOMq
         SyGFUzbDIGumeQi+FwV4FP4p3MbOj0oQ+S4jWoo20ENGYa7zxbgNOYDhx6wvOsaepi0n
         0hpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770916764; x=1771521564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Dk12s/kv9fkKYCcNYFIar28stlOTl1HDBawH5eqWR8=;
        b=Mv8I3YuR2gt0bsr/QkwSh9Gmney4PZg2+4jftARPb587+hP5wYr1jVAO/HmCnAZF6f
         yLx+0cz7wBbZBQ3n/B+VnvVDgCy6fJAy/oflnB6SAnFUvtACeyqcjg/YwoWG/4oWRJCs
         yz2iA1IA0okys5jRQz7d8In3+sRbWtY+4HJxTrocpHzvYx/gLqprtITHmJ3+iF88Z5nv
         4X8m1SfkAEmiZfj7Xq46Zjwd6wEqP4vFiJGeoVL87B5wPe0nNPP3WKPlXMqZoXNJVkqx
         T6cQi/uxj10kwG9suQUh1kpyC4mtTr/Q7zTH1rUFOS9kpgs1dsHUU17RTbB0NxTgY5l9
         1M1w==
X-Gm-Message-State: AOJu0YxPMiuZhqjm8o1EqF2Uo5IqT/fXg0I0tjaFX2ir1i0FXN0CLObW
	aDcwJMAXm+79NWACLe/H83FckgcPVrrS6ODho4mdHuoqhEA/zo8ijs93A6rCjPAA2WU=
X-Gm-Gg: AZuq6aKUemJ6FYbUSBoc/BHpoo5pIw1gTJEvDfGDcMYvcTb4sG5lUi50j+Zyxy+kevi
	PrzIfLnH3814HJSWXxUpLF9Nz0QeMAkNCPwrAK6i/mBHyEPdW8jZIFpBz5nqbXavX//cDoq6WgX
	Ly548DGY48rYpKLoUb55g/NDOjjBPQM4WotUsERqITyvQ40rrZ4cvVBmswZCwoPygIxzmNX63+B
	4bQ/FiNRm9kOrELQLGXhPA605bgGHi2+8Nn5DfGnI/gxuS6sqV3o7kgaIIlsAFqK64cEtfUOjhC
	ty74lRbv0ir0J3zENvWMICMYSkvDC+8XU+JWMwUOFMTIs3weTSq2xs+t38XSugd2HeijId4TNxT
	kvyb9wR2bxn4qrmELGWGzM+C0pMqWOsNCJWpTM41d0S/GSV3if+zHUYK2jleRK9OsocwnPLjWi4
	rMinCLx2mXuccK7bGjsKcXH5/aSX5P/pOIpXo1Jua2jNrrE+d1+Sse18zAUTydurtqsD1bG0ZAI
	yaQyNX0udC4OnKwW35AtkQ6NR0D4+tKhWH0jzEg1Yc7z1aPcqyHOMZUFQ==
X-Received: by 2002:a17:902:dac2:b0:2a9:5b48:2b50 with SMTP id d9443c01a7336-2ab396684fdmr36675425ad.3.1770916763679;
        Thu, 12 Feb 2026 09:19:23 -0800 (PST)
Received: from ThinkPad-E14-Gen-6.. ([220.158.168.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab2984ac8fsm67571585ad.10.2026.02.12.09.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 09:19:23 -0800 (PST)
From: Yuvraj Singh Chauhan <ysinghcin@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuvraj Singh Chauhan <ysinghcin@gmail.com>
Subject: [PATCH] staging: octeon: fix free_irq dev_id mismatch in cvm_oct_rx_shutdown
Date: Thu, 12 Feb 2026 22:49:03 +0530
Message-ID: <20260212171903.1417804-1-ysinghcin@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In cvm_oct_rx_initialize(), request_irq() is called with
&oct_rx_group[i].napi as the dev_id:

	request_irq(oct_rx_group[i].irq, cvm_oct_do_interrupt, 0, "Ethernet",
							&oct_rx_group[i].napi);

However, cvm_oct_rx_shutdown() passes cvm_oct_device (an array of
struct net_device pointers) as the dev_id to free_irq():

  free_irq(oct_rx_group[i].irq, cvm_oct_device);

Since __free_irq() matches the action to remove by comparing
dev_id pointers, the mismatched cookie means the IRQ handler is
never found, triggering a WARN and leaving the IRQ line permanently
allocated. This prevents proper driver cleanup on module removal.

Fix the mismatch by passing &oct_rx_group[i].napi as the dev_id
to free_irq(), matching what was used during request_irq().

Signed-off-by: Yuvraj Singh Chauhan <ysinghcin@gmail.com>
---
 drivers/staging/octeon/ethernet-rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/octeon/ethernet-rx.c b/drivers/staging/octeon/ethernet-rx.c
index 965330eec80a..d0b43d50b83c 100644
--- a/drivers/staging/octeon/ethernet-rx.c
+++ b/drivers/staging/octeon/ethernet-rx.c
@@ -535,7 +535,7 @@ void cvm_oct_rx_shutdown(void)
 			cvmx_write_csr(CVMX_POW_WQ_INT_THRX(i), 0);
 
 		/* Free the interrupt handler */
-		free_irq(oct_rx_group[i].irq, cvm_oct_device);
+		free_irq(oct_rx_group[i].irq, &oct_rx_group[i].napi);
 
 		netif_napi_del(&oct_rx_group[i].napi);
 	}
-- 
2.43.0

