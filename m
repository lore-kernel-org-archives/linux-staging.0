Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A8949B5C0
	for <linux-staging@lists.linux.dev>; Mon, 12 Oct 2026 16:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791821608; cv=none; b=fBuHDXiyPWAfKUWta8lO8a/Q0UeKwhObNr1SU913V+kFnXgfR5t3UevyfWXGjKEosectlk55LtDGtmh9oarZiqZxTX9vBTG5hq2YnDbOSdZN+FCDV37mtcsRInnrinoTLBLt2v8IxF+S6LYDKNgWqdfovbpitxFEZY0m4191IB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791821608; c=relaxed/simple;
	bh=hBFpiBsh1OJ7/0dcpT+PVUfIoV8PmYIo/FqAcvIJ30o=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=fo3/ePPW1nVT/H3R44ZeYGPXpWO/yiocIKpogXeranNf5BIKlGRaU0Cwezctq97NBXvyUYOQ9Fv8Kw9aKoOYCXIIGwoHt+SkmFyPDxxVTN2UCATP4NzivoNojN6kw652qavN7Ay/Vho6gujcJDpNY2PTWLAE4iQH31vPGDWn85A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--johnsingleton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QdRCVqDW; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--johnsingleton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QdRCVqDW"
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4dc57e2a3f2so3556029b6e.0
        for <linux-staging@lists.linux.dev>; Mon, 12 Oct 2026 09:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791821605; x=1792426405; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LBXNI3mtAkG5Ua6Q4/3lD9SCGWUQMAEPkEoP8hTTCsE=;
        b=QdRCVqDW+c7Qw7KzkTQR8uF3mNa7XSWCLSGTM031xBk42HtOnmF9nyK6SbwDav+V/Y
         ujQTqEh+F+mO0lz1LmNvA5fGSW+LtfG5JoWNW6tPS/9binJKi07Vk2D+aS7K+nxaOE+n
         FrEaLC1t4JY2S+9GE6E8X/hjLfnTkFtmQQdhAsjfJJhhrL6z4k6lj+eniQJUT1vjzm70
         JVDFmcvG2U+hPXGAI2YovmGIp7UDK7nY6PogXHjjStWuQmV1eg1aOupc0c35DkcB7/mt
         iUhXwe73kJ50AdOAQ8avhf+F8CotMaP2Jb4XL7NU/+e73xEiJnNQ97oPl4IalHBvlXJY
         4G0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791821605; x=1792426405;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LBXNI3mtAkG5Ua6Q4/3lD9SCGWUQMAEPkEoP8hTTCsE=;
        b=l5q0/4rK5727ywiholEuWQNhKF5BDrgtoXLIrT+aOEYgBYC4eHZoRmHizExF4f17xf
         KG54Byl66OUw+OwEP9KD3YcBOGP4nlFvrBTOxCRNOlPacrwSH52YfnbyeJGnavquhE0Q
         ErUC35fGvB4wu8P8QuYX0GNfE1SsQDn55nEVOpxjuMWsBfn0ix/y4JWiTiS8R8P7i4yV
         cp7Dr/MT3Xc9QAhaG01ho32PTXMtCEFow6l0910lsKNu3N+8DWCe8GAjSo/jasqMxZaK
         9C/2VFMHbvqkSBVXPY/dQTBo4yZY2tMhryC/W6aA1Oii+jsQfn/SfE1iaTkproxJU422
         vAzg==
X-Forwarded-Encrypted: i=1; AKwUvBwl6Q9taGnTPFrRI9LDWGRqCxMfHfR970zp2Y8q540eykt8PjjKvEYahknOXURW4tEsMZhm/Al7kZdVuZ7v@lists.linux.dev
X-Gm-Message-State: AFq9FYJKIp+MBbvyB9g6fMCuaqYbcG/d0GTOBNsqG67BLUv/Z8L4kMEp
	3cHl00APk3y1DFHNYziCZlXATUl8fhilzvrH9QJaNG1jO4WN59ujecE8aF5GAARR4nXs+ugRX/z
	G+WVTqfUUOx7zU5tYqMbnL+8B13y24MIbQg==
X-Received: from iljf6.prod.google.com ([2002:a05:6e02:c66:b0:50f:bbf:6e5a])
 (user=johnsingleton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1983:b0:4f9:595:b80c with SMTP id 5614622812f47-50c56bf8a1bmr10785057b6e.41.1791821604817;
 Mon, 12 Oct 2026 09:13:24 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:13:20 +0000
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261012161322.930099-1-johnsingleton@google.com>
Subject: [PATCH 1/3] staging: media: atomisp: Make pmic_name array const
From: John Singleton <johnsingleton@google.com>
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@kernel.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, John Singleton <johnsingleton@google.com>
Content-Type: text/plain; charset="UTF-8"

Add const to pmic_name[] as advised by checkpatch to ensure the
pointer itself remains unmodified. The array is read and never
modified, so this change safe.

Signed-off-by: John Singleton <johnsingleton@google.com>
---
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index a1d3a16921ea..d628fe4dca6d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -109,7 +109,7 @@ static enum {
 	PMIC_CRYSTALCOVE
 } pmic_id;
 
-static const char *pmic_name[] = {
+static const char * const pmic_name[] = {
 	[PMIC_UNSET]		= "ACPI device PM",
 	[PMIC_REGULATOR]	= "regulator driver",
 	[PMIC_AXP]		= "XPower AXP288 PMIC",
-- 
2.56.0.385.gd3acb90ef8-goog

