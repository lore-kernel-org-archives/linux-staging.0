Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43053189F43
	for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 08:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773477254; cv=none; b=J2E4z434gzJCewiXg3uQmAXadNqaO5A5RFpz7YLBvTqj3TKRdgG5moTTa5YpNxMPH4Q1plYVz1PH/InXaIx+IVyaGh79jGB4ezdlf8e5flto6+6OFyLXjSLSbWvblC5BRMXwNs+BnyAuNeQj9gOWaogDgcVbPID222oYNUA72Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773477254; c=relaxed/simple;
	bh=6VPhZOK6JM+Iii0x58vst5J+6APwxlsK+iyqbZmv/JU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=odnOz8kFbU8MncuCgxOoMRpzDw+ayOPkKlj7q405mioWb9rF0hB2fA3GLIlahtftGGmLtwdwps+XzZRTNR2mvdeH4J5tYQXR36LmLHAqMrsjWrhiy5TwkfNU7ttDpoABC8RkPcP8+WtjuqitBPPfjj+dyBA9VJA3zjfavmtBJxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CGOr6/b3; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CGOr6/b3"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-94ac5cb71feso789490241.2
        for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 01:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773477251; x=1774082051; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nZIVuoMp+YBbxXvV3koRdzYF/yNfpEe+OFh5lBB9KHU=;
        b=CGOr6/b3qj+mwu47wm4EfvqTy4WcKIhS945gvJjy4GApsAjjp+T4f1KML/aXFc8A2+
         G/JdkQFZtoIPaSj3C1gpAU+p6q9cx1B2d5rtyLp2gjpp+R/acSsumarMjru/clSMVEZ/
         IP3FUQEDBTAA9d6NIWZP/8Y/IH96dEM5w78ZHmm0gws+k0UZy0gQJ8J+ylNTLIpjsKO1
         levC7sFYmHdRms2ZR1d3WxRDf6gzml/INZ327SjX+e9j4fpngDVQiuKMRiMqUbfGq2A6
         tZ4SIMuexRRtN+rxM18On6n2PeIiQ7O8oyIWtuu/U5us2hrvbOFHF1Y+cyKjGQ3L/EdI
         miDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773477251; x=1774082051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZIVuoMp+YBbxXvV3koRdzYF/yNfpEe+OFh5lBB9KHU=;
        b=XSN160Iu8pXf8qURe6QCZXslcz4C/K8hab0yovb2CKs6RJwJiF6CEKoA36J7hVCPPG
         n8pu5auHY+9vgOsumIsYlGQSiMg0LTtF9cEYi6S77GG5Pr/gt48XQmdYpHo9/72MWnj3
         nh0cBYwhU6ymEXnw2/qg+GHtQRXIMLAJ+CRgavjSFAJEqozU6Sw/poDTPH85a2uqNb//
         yaW4RDTJM7TQSNhBdS4+xd8T87c74WcegCLy3C9XRTeBctNxNBfHta7cP+j+DKlYMTrB
         3s9sfX8b4HtMvkOd0/P5AV2qA+j+hIubdnZzNE8amKUTUvjH2HV0Fipb0yQLp4RuDW2m
         HHIw==
X-Gm-Message-State: AOJu0YzLGlCaqM65mtkkfU3DAx26TsqaPUfGe0tpGXvsxB0wkBs5BoNQ
	a8cxFmzlveCiWK+TGVat+6FY7cXIRtjEP1WOI1O51mOKf863QmZYPR/+
X-Gm-Gg: ATEYQzx/KhthsGFQSvxNPZ1/Rn6lbt0vwPBrzuVh38K3p/ffmZ+Z4ybm/9HJ6lxMOZu
	8qDt+PnPfeseb/KDxragZJj809jAw9BfODxoLy/rgvqJ5K86znPVlVXbChND7LfROfSjluQoYHa
	Cwno3+IoHtmi5rZRkcuDNcPCahvLwA7BmLS62UXeZnRUOsdS+a3URd/+69SCxXm5I1mpoocScx0
	BMUiRrn7VtjFDlctdzwlvhrJgFhFN69clitbbmC4GUPr0kSHmY2St0eCHO1BWLFZcQ12ZRFTiFu
	SHtvBwnzM/x0BqF/ByCa7Czeydw8oy3233HGJwoBcuORhPFJavQbYMNgOOdFeIa9f8zTd3FdULA
	6RyzimJ3eLAf+R6fee2uBtLO41ZT4q6P9gL39UG1/Githeg9lS511UKH+XYWnDbSRtgPZjnJKrE
	ais3GVPIAoaZmoVcmg0P4A0TTziifj5mHTnyD4wByi1ZYkjQY=
X-Received: by 2002:a05:6102:e0f:b0:5ff:cb2c:a04d with SMTP id ada2fe7eead31-6020e2f5302mr1962405137.17.1773477251109;
        Sat, 14 Mar 2026 01:34:11 -0700 (PDT)
Received: from mjmachine.localdomain ([131.255.96.240])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94ecff69249sm3664199241.12.2026.03.14.01.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 01:34:10 -0700 (PDT)
From: Marcos Andrade <marcosandrade95963@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marcos Andrade <marcosandrade95963@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: remove unnecessary braces for single statement
Date: Sat, 14 Mar 2026 05:34:00 -0300
Message-ID: <20260314083400.1774-1-marcosandrade95963@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary braces for a single statement block in an if
condition to comply with the Linux kernel coding style.
This resolves a checkpacth.pl warning.

Signed-off-by: Marcos Andrade <marcosandrade95963@gmail.com>
---
Changes in v3:
- Add missing change log as requested by GKH.

Changes in v2:
- Remove unnecessary braces in os_dep/sdio_intf.c to comply with 
  the Linux kernel coding style.

 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index d664e2549..a86252cca 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -146,9 +146,8 @@ static void sdio_deinit(struct dvobj_priv *dvobj)
 		sdio_claim_host(func);
 		sdio_disable_func(func);
 
-		if (dvobj->irq_alloc) {
+		if (dvobj->irq_alloc)
 			sdio_release_irq(func);
-		}
 
 		sdio_release_host(func);
 	}
-- 
2.53.0

