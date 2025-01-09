Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802794400;
	Thu,  9 Jan 2025 00:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736383009; cv=none; b=cTGwVu4JPz4pnCZ9OS0eHeImDT+btgYaoQKspEGX+FIZijtdY65Tdf1OXN6AnvWPNMLqbadsCNHpqCoiZUuRqzXiA2fndOtBl8LQZLohIRNA0GX1rGOUrC0WsOCLljRvsOoRUD3oD/vKkJLo1JyDrpC/VrnpNfDHqG6aeF4hap4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736383009; c=relaxed/simple;
	bh=zj0QOWjs+MsrULA4H/ObVexWyLy2wmpE7GtenPOgjD8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FSl7E+UwFfPbyIwHQl3JmC3D9Zr8gJNkQ27leBeqjXgBaQg7cnlJMXwc9bOqh6S2P1EzI06L/rsU2X/Qsby++svx7KTQfUehdKwya95t9faqeNYwkxKwFrNQ0dW9JyeRLBKJkAEFUc1sqgZCI8TG43vYBXFkKQR/Y8gmqk2u8FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DgSFzmMj; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DgSFzmMj"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2164b662090so4807435ad.1;
        Wed, 08 Jan 2025 16:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736383008; x=1736987808; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6+LKtCRG1FUBD4almpiimICflcvc4RUNoszuDGr/FR4=;
        b=DgSFzmMjEIn9ZN+ANZ3EandKY6YrH6+CCGRbttBRkAeczGcjAhuMI2XvyjK9fGZV8v
         hoummCVKMtCgdie65vAbNMY8JDO/CB8p2YnqCUzSRm+8S4umJZMjhrabJ56FFijXOSUq
         jU43GfJ7LdxJz+KYV6jksjKE8nkRIgd6Fnccu65iV7STyQNHcPhv5iJTQ3cbAQ3NDk+b
         fYzzLMu3cv4fNKbeqa7uy9qaKie4XIK91COhD2Tv8ApB8NQatbs8AJhWylWCgQouYXba
         Bruu0a1JHy+opfD687GYsbM7ily+ck3BKhmr/lYPufYLXtlKR1K/ClgBZDZ0YDncYq/g
         cMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736383008; x=1736987808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6+LKtCRG1FUBD4almpiimICflcvc4RUNoszuDGr/FR4=;
        b=fkra9y/Susrs9weKVqBnr5lAlBNCpWgTZ3oX/sU+o6rgOoSshJYqRwDFTvMpnS3vWN
         c6Q8It9AsfQlCdE4kYEwm2TneIGcpGWFgR1yzt1fhfwes0ORWGookraDTUh2rsEG3Zz4
         q4wkdDsJ+Z+9/KJY+IiRvmuia/fPCLOKPKKpChonFF6ThC6j5PX/oAR/AEvnaHxQG+Pn
         zvvd32t5o7Gz3kaJSZ7MLHiC6ChrofDKqYEOOIPoXNuRGth0OIIc+Jv26bRNSFIWfgIc
         /rdgiOerTaFrTQbZmy7hSoFTbEKkjeiHcZdbtCWUA0MXhXrJK5rGJD+oPVuVXgSZbyTx
         YxmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ+52mWyM65bC4qf3nN/wJbudev8SXhr+31zvNf4FR6UPT4+j9dVtVck5QDHnFiYBs4nWhvGBuvMcwuqb4@lists.linux.dev, AJvYcCW6Uti0CEZejl5qJFv5ODSv5ZC3hxoi6V5UZuoTpii9hrRs+5WW8ZXOJsFcPmWgdkw+7ief7h3FPuy7@lists.linux.dev
X-Gm-Message-State: AOJu0YxUHjXwz522Y8seEqVpusUjsexbZEeKjylCxpHA/+hOfseqm775
	/h/ILPo/buyhWIq+u1y4TX68rDDyIdJI9Abi/esYnNhywEXO48RZ
X-Gm-Gg: ASbGncv6tlRsGNsBWuhLSUjoub8ABSTlysxgkW717O3M935xxPR2jsh0kmb/H9URNWe
	TNhALDUi6QYGS6AHc/D+GONjg4kKK3A4iKashV/41kEXpEdFvq/1g8M09kGZHn9YB25tPaP9SJM
	ZOsyvq8ktLjMe5tC0pjvBTDR5daSEPuh2kqxpbJ6dzwXaD5MBf8n4qL54LTgzuR94PFIKlVrlsD
	RYTYfqBaFxwIkSw8ux4B1MRP51H7HFoGlpbRQ3qUKIyr9hlNNhnEnK2sHIrXO8=
X-Google-Smtp-Source: AGHT+IE8EITm7/h5K/dtsJI7YbGz/vEHOe0nnHgchriGMyiWPKtUjKtoxXPqcCogOddRu44BHL8EHg==
X-Received: by 2002:a05:6a20:734b:b0:1e6:8f39:d607 with SMTP id adf61e73a8af0-1e88d0a477bmr9041471637.31.1736383007660;
        Wed, 08 Jan 2025 16:36:47 -0800 (PST)
Received: from kernel-dev ([203.56.147.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72b29add282sm22201299b3a.158.2025.01.08.16.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 16:36:47 -0800 (PST)
From: Will Walsh <iron.will.walsh@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Cc: Will Walsh <iron.will.walsh@gmail.com>
Subject: [PATCH] staging: greybus: remove unnecessary parentheses
Date: Thu,  9 Jan 2025 10:36:02 +1000
Message-ID: <20250109003624.37323-1-iron.will.walsh@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unnecessary parentheses in boolean comparisons make it harder to read.

Removed the extra parentheses on line 305 for code readability.

Signed-off-by: Will Walsh <iron.will.walsh@gmail.com>
---
 drivers/staging/greybus/audio_codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index 2f05e761fb9a..dfb5322964de 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -305,7 +305,7 @@ int gbaudio_module_update(struct gbaudio_codec_info *codec,
 	dev_dbg(module->dev, "%s:Module update %s sequence\n", w->name,
 		enable ? "Enable" : "Disable");
 
-	if ((w->id != snd_soc_dapm_aif_in) && (w->id != snd_soc_dapm_aif_out)) {
+	if (w->id != snd_soc_dapm_aif_in && w->id != snd_soc_dapm_aif_out) {
 		dev_dbg(codec->dev, "No action required for %s\n", w->name);
 		return 0;
 	}
-- 
2.45.2

