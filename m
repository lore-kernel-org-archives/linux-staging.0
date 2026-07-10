Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4461DDC38
	for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 15:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783695713; cv=none; b=pn0HPfV8tzkPzsHfCOyyVqV/1GnPeuVsUdR74zTeYnezxK47YQ8OnI4Mj6q/9EXd1OLkBs1jaChBORnNI7bVbPjhSMUZEnxKsNcTL+Ec8A3To8+c0vkjH+ylUGHc0464WnE4rOrLnwVVJtd/tvuuwTnlK7vjGl0mnmUtKZnj1Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783695713; c=relaxed/simple;
	bh=FJE/EQ9TA3ouqfr1NNxRs9ZTfKeUIT++5v9OKtGST8o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BO474JYuObNbrhIBy5lqle26O//mBFKoNnd3UiyLdepGjCHnxBcaSC6BRaEX82bOTsGJiyLOOyLEWdBLzdMRYhcqwAq2seA2fO+Nzvud4sHvPXHhdrwTO2QS6SPwoViQA5cEXv9LsbiGcPQa/ZF/NvZq/LnZDKCT1ZulLCKBq1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YJT1if5p; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YJT1if5p"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39c953950dfso7389331fa.1
        for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 08:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783695710; x=1784300510; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TUKQVag9IzE4H7QHQpL9vh5Ulz0DkhvqjWN5WTc39J4=;
        b=YJT1if5pasI7lVCsb2ui6e2x0IohNcHRxHkrm5qLB2LRWWjRMr12z11iaZkbJF08mT
         CV2I4Uhxv/J2IEfcO5QutBpkH1hx+QGauuFFGDvYnRDWHmekLQ7LclxdcXm/uSPi5Gry
         Atnldh6U9aLLl5AO+FWjlu5Y227lVL213IqCmFUGfSm3T5HM9rfpBSRecp9hnEFdhtGJ
         /wm4W2+qcilJ5EW/htgwoH0IvsU82ls75Hw7ovNKtq5ij3uDbZddJuqDlivGNuDTvtZX
         HAKCr8AMPkSADlZU2fcqmuhDwTRZasRc89e5Jp2QsABxFjeCtiSb0xw4b0W8d9gzFnw1
         EApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783695710; x=1784300510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TUKQVag9IzE4H7QHQpL9vh5Ulz0DkhvqjWN5WTc39J4=;
        b=fTyaizf1QsvuyiW6rxL5dK4GoZcJ7Q2jfFg4Zvtx3cAWhcbeN9V5J046j2L1zkTP5C
         JpCIHT2YBX2Sz9A9k/uZZpvn4yQSVYyM5i3qFjPxXdKGfsNC46f9TsNJTS0rse6XWQNA
         Gqkbkn5ap6WlaWfelYwVBVjbV/ix+N105qvFGaFNxkFIChNYZl6JNQTLKR9uR9EWSHSJ
         IaS831B0kwVesa07Kx2/0WfFrpCkQ0jBZzOEx6thKSZ/2C00YMhfGWRmemEzTDN79NST
         LOfXyGKflJBqLUvpGBGZMg6gFb4pjW7nZvMVKASoEd4HvyDdPCnfSaihSFAPGfrlLcdK
         GT3Q==
X-Forwarded-Encrypted: i=1; AHgh+RorL1K2Ihz36eHdG14Yc1cX6lI5nWtnF1PxQTN5rzWdjTLB/8WhlVAd03jpywUamlINS+VvwmbJn+2MEOjr@lists.linux.dev
X-Gm-Message-State: AOJu0Yzh//64cmivh7Hdhpm8yLEVKxyZwbeFMe+Jp+G/DE2t3cKx2tZO
	JXZWka5nHh7YFxE7r4a6jlHD5a9293S8y8a1Mdw1wvoW6UIsVt8/wrEo
X-Gm-Gg: AfdE7cmV7nZDDpUWVtlPP4Okc/MS4mFWIOfld6nH53y16ry6dyCgddKRYo5e7Rliwxd
	18EVFWhoUDBt4XaItN3BeegcEgsVhhEfjwSp6sx6wcncdMB3DxqQYU6N4oF9gNwtvBs3yF9fIYQ
	BQLIfT+gFOcQfcfkjmak3p7IAUwAPoXnhStoLegSePN/LHAd72LGdTMi+NDv5aOg2tpnn9MbmsI
	3jfOTQm+gTYDHPdKZtXpvw2R73Mvg6h1y+jgoDFrSjzq6sJH48OLdrwSUQ7svPYiAL1zrnRDPpG
	y1TVwzhP57BHSK/CLyDKYjRIkcjc8B7EAcJJ11aKprIj2aZbb+2O+emPzkHL30b2MySmXkYUmkR
	knKdO/lj6fSgMGpv2TpCKnEb4LpaMIqcaM8P/wtjpkFdGHdnC/2YlJi17khxij6llH+lwwoAwYU
	WRhi74a6Bdc+tqz1tn64B+7gWVflFGoxAZm7hebPx8Q9r0PV5Z8FHGzKQJDhEN2+25SuDkGv5WL
	090pOE=
X-Received: by 2002:a2e:a912:0:b0:39a:eb5a:d790 with SMTP id 38308e7fff4ca-39c7995f790mr21390521fa.35.1783695709661;
        Fri, 10 Jul 2026 08:01:49 -0700 (PDT)
Received: from debian.localdomain (95-25-158-125.broadband.corbina.ru. [95.25.158.125])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84b8564bsm11054021fa.20.2026.07.10.08.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 08:01:49 -0700 (PDT)
From: Igor Putko <igorpetindev@gmail.com>
To: Marc Dietrich <marvin24@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Igor Putko <igorpetindev@gmail.com>
Subject: [PATCH] staging: nvec: nvec_power: use GFP_KERNEL in probe()
Date: Fri, 10 Jul 2026 18:01:13 +0300
Message-ID: <20260710150113.3041-1-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nvec_power_probe() calls devm_kzalloc() with GFP_NOWAIT, which
disables direct reclaim and is meant for atomic context. probe()
runs in normal process context and may sleep, so this needlessly
risks a spurious -ENOMEM under memory pressure instead of just
waiting for reclaim like every other probe() allocation does.

nvec.c's own tegra_nvec_probe() already uses GFP_KERNEL for the
identical pattern, confirming this is an oversight, not intentional.

Signed-off-by: Igor Putko <igorpetindev@gmail.com>
---
 drivers/staging/nvec/nvec_power.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec_power.c b/drivers/staging/nvec/nvec_power.c
index 2faab9fde..c514d51a9 100644
--- a/drivers/staging/nvec/nvec_power.c
+++ b/drivers/staging/nvec/nvec_power.c
@@ -377,7 +377,7 @@ static int nvec_power_probe(struct platform_device *pdev)
 	struct nvec_chip *nvec = dev_get_drvdata(pdev->dev.parent);
 	struct power_supply_config psy_cfg = {};
 
-	power = devm_kzalloc(&pdev->dev, sizeof(struct nvec_power), GFP_NOWAIT);
+	power = devm_kzalloc(&pdev->dev, sizeof(struct nvec_power), GFP_KERNEL);
 	if (!power)
 		return -ENOMEM;
 
-- 
2.47.3

