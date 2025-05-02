Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C9F221F29
	for <linux-staging@lists.linux.dev>; Fri,  2 May 2025 07:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746170519; cv=none; b=KfUWMxeni6mjjIkQgQvxHoKjLS2VXTjiOTrzHDZ/BEUR/Z/rjyba7QNFfrebrYL9f7xo1DDVMDniom6Xls09fJ8mnvAmQOGnzX76KkO6jm67Jr9gRRMQgBJf70fr9oy1GC7NqRZVXwGpVi7eCwgNiCDX6peRI9EEj6WFwHsQSjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746170519; c=relaxed/simple;
	bh=EnC5cdHF3TbsKUEY55JwJp8080ea0nqVvuu+9SIRm84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j2Xzac3MSD83mY+wSzHOzozmaP2ng47WuwPuRoMwVzdf7ovu6e2fn6pTb6wb18+YB97KLVVHNZxlCaC3UC1eHD1pTYRSO1T/lB77+aj5C7Nmqpm4z1yEQMSEDImZR0fhisTMdQPazKEP8jg3pCfa5mnTN9RPCKCN9I+Hf1RPj9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PNq9Lj0m; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PNq9Lj0m"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac2dfdf3c38so307928366b.3
        for <linux-staging@lists.linux.dev>; Fri, 02 May 2025 00:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746170516; x=1746775316; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mszv+1TRrfEJqnlN0+/XQLFyntyzjNo5JYomyINlSm0=;
        b=PNq9Lj0m0h1fMysa4Hk1OrnB1X58xf7zxJYF1SsuS4AkJnDz+IRyY/McAnj3PSvkxb
         MzS4kiKwlEWFpw0LS4q2CggaKRzEtgoMRFZdOvPBc7lAAZ5RPj5F1jat6vMmbJZNfg+N
         6ukvbHbejg8gYKA1W3nnuH3rKwSDAxjGOw76tiKvcyOFjpWon7zNqNippQICZ2LY1dyV
         IjzUjjNVV2gwyOqDmExYGQAkWyzaAKcBHSik2TAVUShOZBuaC4UpFfj+e2+iwEjhUy76
         fx/BNbKsekj2mvm29lbuy/W0frugNsjfYlp8PMD8P7P64d97NnK98BJppfr9HCy4h36O
         pikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746170516; x=1746775316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mszv+1TRrfEJqnlN0+/XQLFyntyzjNo5JYomyINlSm0=;
        b=kAEfgvV6e8wPnSzbl8A38xB5caK7gCygwIA9ztFY5BpPTBwCEtsZ/1EKSfGuHF0GOu
         EQqk3yqiDMy8HqwjJeDveeX3ZwGlmcTKpI1M1xVGxXHISMeRD1kkZXjiZZ+oJi/lqMyH
         anm9EQwZewABnFvx38uRs26xq6fOswW3p0Om0kxPNFehwgtyNXZqMjhHmS0D8LyOATpq
         sFhBj85kfIMTN/aChlgYPIcuqqW8e7CrvT16AkQdBS2/Y+XLxTO5OV3NIhbq9ZkCqZ+Q
         o2fczOHDFblx+iVhoowagjQcdeLbLOSraPuFpFKzHkvdPUlVtIvK57NeBrauBASl9f43
         nidw==
X-Forwarded-Encrypted: i=1; AJvYcCXsyQNWMB3tVc7ilyV9hcybimqtfBKNSJvisxjEqeshzRI+c8xE9twQBjPqlIJhURo/gyBRYCRZQCB0es+3@lists.linux.dev
X-Gm-Message-State: AOJu0YxS4SD+nXWW3G7LZ/CKHT7MRKA7d0fimgc1zFYarG/zX0NHhwyx
	T9tDP8pTUqunGmI0qj9nbo3irfwCD/bHN8iuHMlbYXsFkNyj0ISUjRkMt58cooQ=
X-Gm-Gg: ASbGncu6awTaglqBB7f4I+srLu+jYNa5bOH1D6XaK8SEQXoGtovlJb9SL5A0AAPtoSI
	7qa3/wSu/CQvbI3fimOW6+1iW669GywvtEbyk3v1nXGDf7b4Ht9JviZjXcXXAON845jn2cyO7GI
	mCtyLUICMhFTBLdv8NcqazRghzxMONW4MbQnXWDkp61bPzK2ePWybzlJcbjVhEipxt04ra/hVph
	kO9Zqc2Z+zhcBjxxPW58TkEphifrPjKltyC8+If8e1DJfFsxakpxWOSlqBoKNDnNHsHVGbqJuFC
	mWf6akur0UhEN9biLq3lvaTHVDV9Os7xrRdDZT0J9YETNFvPdvE=
X-Google-Smtp-Source: AGHT+IFfSDV5JbZRPD0lYdfO+LoK4oVGXJrm/3LHFpLnHgTFW21f2kJ1S2E81vtNzM+ZyL3RiGwMkw==
X-Received: by 2002:a17:906:6a2a:b0:ace:cb59:6c47 with SMTP id a640c23a62f3a-ad17ad88ddfmr202128066b.25.1746170516018;
        Fri, 02 May 2025 00:21:56 -0700 (PDT)
Received: from localhost.localdomain ([178.25.124.12])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891f3c6bsm5691966b.82.2025.05.02.00.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 00:21:55 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 1/3 V2] staging: gpib: Fix PCMCIA config identifier
Date: Fri,  2 May 2025 09:21:48 +0200
Message-ID: <20250502072150.32714-2-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502072150.32714-1-dpenkler@gmail.com>
References: <20250502072150.32714-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCMCIA config identifier in the ines_exit_module function
was never changed because it was misspelled in the original commit.

Update the config parameter to use the correct identifier from
gpib/Kconfig

Fixes: bb1bd92fa0f2 ("staging: gpib: Add ines GPIB driver")
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/ines/ines_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index 49947ac30feb..5168811ee850 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -1487,7 +1487,7 @@ static void __exit ines_exit_module(void)
 	gpib_unregister_driver(&ines_pci_unaccel_interface);
 	gpib_unregister_driver(&ines_pci_accel_interface);
 	gpib_unregister_driver(&ines_isa_interface);
-#ifdef GPIB__PCMCIA
+#ifdef CONFIG_GPIB_PCMCIA
 	gpib_unregister_driver(&ines_pcmcia_interface);
 	gpib_unregister_driver(&ines_pcmcia_unaccel_interface);
 	gpib_unregister_driver(&ines_pcmcia_accel_interface);
-- 
2.49.0

