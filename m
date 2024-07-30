Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E477192B7E
	for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 08:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722328054; cv=none; b=KGzDrpJTDZYMuewyoifK3K7lLC3DWgMnNx7hNoQu1wJcMzlHnxahrLHQf+Ff6k+EFuHJjYih7gS8a/knd2JDXz2jt8d6MNzx0hJa0BifbCE+ClqxtnmyliaOPMPz0FoE1V24Mt26NklCrVu3OmDurt6G4F/ID63tMmIxPxKzKnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722328054; c=relaxed/simple;
	bh=RkMiwhOTcXkFp3tFZtI9rqPQrFrDjm7VNpQvY/1ltg8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ubEL/UjwqbGafk21Mct8TwKX2O90e/GCtvNSf2uWyedkltlETlpSqLq4hR7zdPJyinLLmydYB3s0R5Kqhp3C+ET/562yM+ZimbbwvHw499xZtLykexbr697uIH8tPtuG1yq3O4Jt8X+e81mjUlLESDvalqsgvNeyOcYZe6ierY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JiKejnxO; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JiKejnxO"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1fc6ee64512so27007815ad.0
        for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 01:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722328052; x=1722932852; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0C8gOjqrcr9qUGB3HJrE/AWdb1TKczBphAXEi6KgblU=;
        b=JiKejnxOlEs5YkiSktIWRxOegWs1bss/zORoLZ6LOokr81QUcj0dfJOCzR3RhG7uZE
         MdGNf2TBcyAI9xA293jC5lfOtNJG/VtCjkN+BS0aKoIlRmhOa+LbtpAGPgKTGN5qcfBY
         oHVc+uE9U3t81/0B4L6jrvD7qV3Zk3ghyb1cyHjnmmAITje4tCzD9DJC6mnzAYnE92KW
         39hEijlK4AO+QdJcGa7ETAuYpMaBWyc5auZr37krwkKw/uwFXISVuOoQgp0c0PO4VgKD
         B1qmF9W/uGu+HvoLpMfKrWA4kiyWKeTAjr84jciuFQdxQHHG18IM3lciYcB06w4FRWAK
         352Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722328052; x=1722932852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0C8gOjqrcr9qUGB3HJrE/AWdb1TKczBphAXEi6KgblU=;
        b=Pwo5i6uWLxgt6jQeRIBsW0qVf/v/yJMzjzxObqahmDH+aW7YcAxS4c/RVbmshUnpzq
         PoxMmpP0ZUbAArEWZQ4pjlulTu8iXI6RXZmkVwBQcy3CSpmJIimAjKscKaogshw4ERft
         XTAoNErUwtPQP0sWSqtNmQgNA3h4kKld572KArGBBbT2RZglupku7KNekFHKJEuU0VLC
         f8mQ4JFLS6PLWrmLXVU6GwKrsOBSfI6gOS5Vs+x0pHCuydnk2w2e0yG2pRQSypeuvEvp
         CShr/e8KwkprzO6LZ9qDCOhaVdkhSU8FSMomSEj1sX9Bv2VPMhTcs0ox/tw00EK9b1Uw
         VuCw==
X-Forwarded-Encrypted: i=1; AJvYcCVk4lTMDDoWrUhgOM7I5kWl+HIP1mvWRV9G3henxdeY4piBr29VvMXOfbum8mvr8xXwAgAHWPszktfkNCdctd/jVpyUx5/shqnNv1nPJQ==
X-Gm-Message-State: AOJu0Yz8hyqbzm5Ra/0I5IdlSpiOgE6hnPQpE12SvlwT6+c/4YweJ1Of
	iD8/wGtXEAJWmPzk7aKpq7aubmfONKtxYJaUlClahw/mwEoUzIjm
X-Google-Smtp-Source: AGHT+IG/CA98Fq2bpUtZhi/Mp30dxyYK9WopLNARN3D0DweQX5pqwkFzUNS8XPiNowwLQbcjBncYLw==
X-Received: by 2002:a17:903:228d:b0:1fd:93d2:fba4 with SMTP id d9443c01a7336-1ff048e4f38mr83563235ad.48.1722328052208;
        Tue, 30 Jul 2024 01:27:32 -0700 (PDT)
Received: from 13444938e8c9.debconf24.debconf.org ([210.110.131.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7d29228sm98473635ad.106.2024.07.30.01.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 01:27:31 -0700 (PDT)
From: Kathara Sasikumar <katharasasikumar007@gmail.com>
To: 
Cc: ~lkcamp/patches@lists.sr.ht,
	hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	helen.koike@collabora.com
Subject: [PATCH] media: atomisp: Fix trailing statement in ia_css_de.host.c
Date: Tue, 30 Jul 2024 08:27:25 +0000
Message-Id: <20240730082725.2524-1-katharasasikumar007@gmail.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch diagostic of Error : Trailing statements should be on the
next line

Signed-off-by: Kathara Sasikumar <katharasasikumar007@gmail.com>
---
Hi,  

This is my first patch for the kernel. 
Big thanks to Helen Koike for the guidance 
at her Debconf24 workshop.

Thank you,
Kathara
 .../media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c
index 25e3f0822..e66faeda3 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c
@@ -47,7 +47,8 @@ ia_css_de_dump(
     const struct sh_css_isp_de_params *de,
     unsigned int level)
 {
-	if (!de) return;
+	if (!de)
+		return;
 	ia_css_debug_dtrace(level, "Demosaic:\n");
 	ia_css_debug_dtrace(level, "\t%-32s = %d\n",
 			    "de_pixelnoise", de->pixelnoise);
-- 
2.20.1

