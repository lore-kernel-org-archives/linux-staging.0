Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3422DF707
	for <linux-staging@lists.linux.dev>; Tue,  2 Sep 2025 07:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756798742; cv=none; b=sbtDUugnUyhGlg+yCS14cGXqW0Y817vEbZYPxwk8w2Y1PWznSSzZIzp6QvJS177Ixteb+jt3whjDpvRpTcinPLZ8+w/jMAqjGgnRhM2enoVvxsNQzr6HLsv9fYVp33fSfkZq4+21OIY2x3yFH8mXvgfqlX0yGq7QcuNMiVj1hK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756798742; c=relaxed/simple;
	bh=qxr+CREui4pE7rWTCWj6E45p0I+6Etq/aCUmmlsx7ok=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=e1NOcAqhJaafHkPgOc8p12JC6obo67pf0pT/ySspRbRuW5EDeAm+9rXiKkOA1lGRHqRZnTA9Vau4TUYSap5+LQf2tn6wDn6CWBTHg9VyUI22yjSDdYZ0K3eTNFx42Xf7dw4+farmHCPQ7u5pzjtb3Nvq0TJCrOr06h7TEY+OnUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aU+Ro8zY; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aU+Ro8zY"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3cef6debe96so2628479f8f.1
        for <linux-staging@lists.linux.dev>; Tue, 02 Sep 2025 00:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756798739; x=1757403539; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WE7v0z7TzjZvPVfK4+4Sp1UwAsOZUOttl1hBOuNjNnw=;
        b=aU+Ro8zYXNMMyU01oQ0ut0EaMZ9Nx/GMjcezDmQMWK8CFaOsjbBo9hyvSql3XFdafO
         Yt1KHvfie5bEEDmZnID+ZT1RCXbpJoDWoDmpXBDKRJ/Yj7l5u0lp8SRasenznhryyw75
         iidqXYohR7AUdWaU/umY0B/ZWK65FgwC0N5kYN2Ah+TiKSj8zigf9oxjg2w+y/Zm0ZrW
         Z5e/XZ0FDdtXnXkIX2gj4CH2g0pUJJDPjMXxlJfGtTNZZ0kGDGuSpobEBQzIrqEC1py/
         zRmxtvLmD+Bfv+szg2TI4PJquHPUfh7XjkZa2W7EXtDHWb6uPvjvNvVZvVh97FdypqCr
         g4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756798739; x=1757403539;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WE7v0z7TzjZvPVfK4+4Sp1UwAsOZUOttl1hBOuNjNnw=;
        b=asGQLquBtcD+57eC5aFUoawjVIcCphLmp36/Byb7KMcfQfZZJnGkMEFb0ilb5VU/0N
         H2OxfoRdZjN6m7hi2cKsR0vhcQq7IL9cPKgdJKgvs7ycMDGhrU/prHS91KO334UXtaHb
         4foSwVrtsjzfqx9q8Qrn+8y/Btqfe/vCqORyvY/tYPkLW+kxmnN1rR7Xgw3wVsgX3ceV
         kgtth81A3HFzh/azSeSD71CxaGDa5moZ7AT4cyu3GQB2RXnLEY6k0tR18Rao0ktpmMa2
         j6/7jMSIIOGzLvzyIi2rvjdWGS237Lsdnb4DuvSLVaPce5sVMaDPsnW8g2goShh3OrHJ
         mKiw==
X-Forwarded-Encrypted: i=1; AJvYcCXICQEPSKInSXAtNoF0cd18oTkh9zi1oRNLKQZGOuRsM0e4FCjVIK2zAfszM6/AJtPeOMMnl2dewXzOuDr8@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4qs0in1762FSW8FEhaIrgvlMIo0VaGbQUhXC/e97j0IkreqLy
	15ec1qpM4/811q3zG2ky/l9lfs0qduGQuE4ERsJ8m7PnlVrytOIVqrIa9I8CjJZCIMQMUoNCNGJ
	4SnpqClqegw==
X-Google-Smtp-Source: AGHT+IGtOLqgwO0BX/6Sg5J5mhZ2KciPQ7kiO1dkbcPPy47bP+WENUmn6cded6JsjNVS6Jfarr14pjp35Rl5
X-Received: from wmsd13.prod.google.com ([2002:a05:600c:3acd:b0:459:dcf5:1b54])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2d82:b0:3d7:38a7:35dc
 with SMTP id ffacd0b85a97d-3d738a739a7mr3158803f8f.12.1756798739364; Tue, 02
 Sep 2025 00:38:59 -0700 (PDT)
Date: Tue,  2 Sep 2025 07:38:40 +0000
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.318.gd7df087d1a-goog
Message-ID: <20250902073841.2338568-1-abarnas@google.com>
Subject: [RFC] staging: media: atomisp: Simplyfy masking bit logic
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Cc: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
Content-Type: text/plain; charset="UTF-8"

Simplified masking logic in pci/hive_isp_css_common/host/vmem.c.

---

I have tested this change on whole range of *valid* inputs, and it gives
the same results as before, but this function seems to be little
counter-intuitive as far as start is a (bit index) but end is
(bit index + 1).

It is follow up to: https://lore.kernel.org/linux-staging/20250901091050.1935505-1-abarnas@google.com/
---
 .../staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
index 722b684fbc37..9703e39b7497 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
@@ -22,14 +22,14 @@ typedef hive_uedge *hive_wide;
 static inline hive_uedge
 subword(hive_uedge w, unsigned int start, unsigned int end)
 {
-	return (w & (((1ULL << (end - 1)) - 1) << 1 | 1)) >> start;
+	return (w & __GENMASK_ULL(end-1, 0)) >> start;
 }
 
 /* inverse subword bits move like this: MSB[xxxx____xxxx]LSB -> MSB[xxxx0000xxxx]LSB */
 static inline hive_uedge
 inv_subword(hive_uedge w, unsigned int start, unsigned int end)
 {
-	return w & (~(((1ULL << (end - 1)) - 1) << 1 | 1) | ((1ULL << start) - 1));
+	return w & (~__GENMASK_ULL(end-1, start));
 }
 
 #define uedge_bits (8 * sizeof(hive_uedge))
-- 
2.51.0.318.gd7df087d1a-goog

