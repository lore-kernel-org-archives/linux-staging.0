Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9143A54903;
	Fri, 15 Mar 2024 21:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710538325; cv=none; b=PjiQ8xYCFheAnFkCpex+Z6uSc5DzxQttZs5gG4TBqXAm5IU+QwBToWxnhVGv3dtQbZXoEqhN07Du34SS85LTKIWZs0ZDiyir1fjsZN8fxZ3WMy4DmjIeoOAR8d95GptwXPIcGOhy2cBnVJ0W8x+9+6dTLaTG0zC9GBAtTSgFuUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710538325; c=relaxed/simple;
	bh=kI3FpuAUIzIJ5YpNjrE1DZ6tCTgLd+HtXmRoONaXbJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tPHRP3yeoA6GvN2utaUIA3tTG9XlKaVxe9BOkpgXwTbFWs0hdekc8sJqixCaWKfbhJ2oPNZcNONovC98ckXmMmMvS/4bwvBpNjQB50HXelVvwSMthwa84hO7ON8dy7mZYvFkFseBjS1u6DM3z82PBX+ht/Zr9c3ddN3JKFqUoT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=awWsICo2; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="awWsICo2"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1dde26f7e1dso19770235ad.1;
        Fri, 15 Mar 2024 14:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710538324; x=1711143124; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ql5/CZn2RtGTQlI61ALXwrW8731eNL3M0vcE3ykcjDQ=;
        b=awWsICo2PDZJbf4qaPY26bZftVhOzqS5JsOWOgdDPTB1raDP/dPEKIuwtnIl/UPEdK
         n2XOs7DU/EHSkifyn5w5wnFQ0U7hJkV0vIxXTO+Gtz7SavQYv4m491ycdq03E+XSQgdx
         UJAURFPBnKqwV6poGQomZ/D7Q21STZDyyYtoxFEiC1VpW8p6eJ8/i1TGkGAT3qMhFM6N
         S9ZdN0F/3oIMACNU+GoqUcOh8Wy6DfmzJqqVZnr8B5lbE0RPYERoDC7/Q0+81zm1gKrE
         baE8nUpxjUd4714CT5OqJ3Sb783IrpUI27ori7Ebq6DVqem1TB/RNorC8ioDEY+gB4z3
         F8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710538324; x=1711143124;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ql5/CZn2RtGTQlI61ALXwrW8731eNL3M0vcE3ykcjDQ=;
        b=iDSCok37SKRB52aIn0l+d9GpwZi3AOQXrQ13WGYNZGa/JVEdhSJXp9UJQw0MExY+tv
         1+P9HmC+hozNFy3J/3xfGOifoBYEr8DtsHH7zoqHhSrS7f6XM8fjgt+51C0ouNgbmn4h
         8wMM9bwMR0Y2mTG0nWVfVOSnohVhGDqSFR1Afsv4Xzgm2PhsJNATHuADZZuXCVtUhaA4
         G316qKuWb0RjweP3gRdQJMGYvc5qUJlOtui6IPPC17gxjPumwxvKqxkdWcd25/BJ+WY/
         s5Aa8DxIlKtGrl73dnabtgiRS8pXAeAExMVomZOHY47gdu19I5MM8+YFs5PtD2vUNtJ6
         bDyQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/H3h+XiRFJGTn71ZfIL4X6781BJAwVaIGyZbOK3E8DIbG/A2gM/qAmE8veknXkNqTJVZ7zJ2qUvLrlXLZ4/NbJBErB6AHFKUT1ixRIA==
X-Gm-Message-State: AOJu0Yx+ifpa2W0iYKH7kz2+mf8QLfdQ/mhxw786pA2y0yZq+ghCOO47
	HnbvvTNE3Gce0sjtIUhKhaxsCbeMBXZkWOfbNS86Y5i6xmqrQAi2KQhAr2HYByI=
X-Google-Smtp-Source: AGHT+IGq2m6m0XKukC+zMZPHwWnmwOFptJAIRQ/jUEi1zvutS2LuS4RGpVQGVxHy/NR/2poQBzBUQg==
X-Received: by 2002:a17:903:22cb:b0:1dd:66d1:a62b with SMTP id y11-20020a17090322cb00b001dd66d1a62bmr5176084plg.5.1710538323770;
        Fri, 15 Mar 2024 14:32:03 -0700 (PDT)
Received: from tahera-OptiPlex-5000 ([136.159.49.124])
        by smtp.gmail.com with ESMTPSA id a2-20020a170902ecc200b001dddc21866csm4364301plh.103.2024.03.15.14.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 14:32:03 -0700 (PDT)
Date: Fri, 15 Mar 2024 15:32:01 -0600
From: TaheraFahimi <fahimitahera@gmail.com>
To: Marc Dietrich <marvin24@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: outreachy@lists.linux.dev
Subject: [PATCH] staging: nvec: edit udelay comment
Message-ID: <ZfS+UaVyob+lFmmS@tahera-OptiPlex-5000>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Signed-off-by: TaheraFahimi <fahimitahera@gmail.com>
---
 drivers/staging/nvec/nvec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 282a664c9176..b4485b10beb8 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -712,7 +712,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 	 * TODO: replace the udelay with a read back after each writel above
 	 * in order to work around a hardware issue, see i2c-tegra.c
 	 *
-	 * Unfortunately, this change causes an intialisation issue with the
+	 * Unfortunately, this change causes an initialisation issue with the
 	 * touchpad, which needs to be fixed first.
 	 */
 	udelay(100);
-- 
2.34.1

