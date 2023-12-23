Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B020802
	for <linux-staging@lists.linux.dev>; Sat, 23 Dec 2023 01:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="jovgoClu"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-35fb39c9dcaso8970905ab.2
        for <linux-staging@lists.linux.dev>; Fri, 22 Dec 2023 17:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1703296786; x=1703901586; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQy2sloRPBS+5sAQ/YWqlyAxRk9/nFXvBjKhePgocQQ=;
        b=jovgoCluwIphh4XOJnjXixU5TATIEmCXbfOorXV3uUpsqYNjLjcWC5NNTmPF9Mjuzo
         2e7721cji0TA4ci+aPicPWfdoKWdO2vvAFCv2EpmoTopFc30DQT8dj49t3aapKZo2Il2
         IPat2KfUTTW5KE9dwQTPgyj9/C27SQbYlYBwDUPtnpgP5zXMrydnp2DMrJOKgk+s6zeD
         VPHowZGr2t7cVZEgalY7+7hsXjbjZDGz6pc4sDeKE/qmtyjobDnVu3pza3psZoWjw9nF
         kAuACneYDxSG16SGvnEsS+kn75zxBAnMh3bmTAJpCQj3BNbVziDmHsibvU1NUyJjD6WU
         Qc9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703296786; x=1703901586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQy2sloRPBS+5sAQ/YWqlyAxRk9/nFXvBjKhePgocQQ=;
        b=chLEEvBZD1c5hN77OTeUaf+i1c3r2dNupxwSWwIgzrA7KjkpS+d1louY5egUa7YR+E
         rCTboYnY1YBC/Oc6sBG51oSljQKPmH9mbgCO2PUIr8I5Yr83kmN8nbnAD/RIDn0vA1V0
         jABBY7duzLYLuPGDzqd/6OKRzNLfohVGPF065LboHaGaC2ci0LrC0kJ2CCXNPvsmWLwU
         TULdcjWMSPh59iinu4nFsQ6IikZkQTF0eBCBw8t+Z5rMwFo87h9YbMWbZh5T07ccmL0e
         t7fdUiSSQJo7IzY6kCipgGUp6NaOBBQvwg21NFiEWq4QR/k92T4VTMIZKmBHB2IwWnxP
         Fp4g==
X-Gm-Message-State: AOJu0Yw4Kneskd1UUhhTbfOD9RxN9NMJpe4swtKKjEDokIZ1WRrCNYtb
	sZRofFHfVPU7MKG18QyF+GrNkzk+aUVJz9+WH3g/RdrzN7U=
X-Google-Smtp-Source: AGHT+IFQyLpqVpmR9kVWJbrOmb5xX3iPD7O+ccWEvcCW8fzlF2R+aXIa3ArbcU7Kb29zxd9UnRuEUQ==
X-Received: by 2002:a92:cda9:0:b0:35d:6227:4f03 with SMTP id g9-20020a92cda9000000b0035d62274f03mr2780374ild.7.1703296786409;
        Fri, 22 Dec 2023 17:59:46 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id kg15-20020a170903060f00b001d3edef115dsm4106546plb.20.2023.12.22.17.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 17:59:45 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 01/20] Staging: rtl8192e: Remove unnecessary braces from MgntQuery_MgntFrameTxRate()
Date: Fri, 22 Dec 2023 17:59:23 -0800
Message-Id: <20231223015942.418263-2-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231223015942.418263-1-tdavies@darkphysics.net>
References: <20231223015942.418263-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove braces from if statement to fix checkpatch WARNING:
'braces {} are not necessary for single statement blocks'

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 9c94c5ceccd5..2c46906be38f 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -172,9 +172,8 @@ static u8 MgntQuery_MgntFrameTxRate(struct rtllib_device *ieee)
 	else
 		rate = ieee->basic_rate & 0x7f;
 
-	if (rate == 0) {
+	if (rate == 0)
 		rate = 0x02;
-	}
 
 	return rate;
 }
-- 
2.39.2

