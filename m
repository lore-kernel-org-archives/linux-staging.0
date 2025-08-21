Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4376233473A
	for <linux-staging@lists.linux.dev>; Thu, 21 Aug 2025 13:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755783355; cv=none; b=Kv8O6PmakVC86mtLUelZorghdtEOC17UCcWAZWA4WWyO7E/O/+9vFE1rLCuTMnWixPcWqDQsGERJE94+Rn7LES1XWFPlD17uhvu6MX7bKOIExTWRTKe5voiHF3IADknojtVGIvvugU/Qccr6iC9dlADK0mEDr3w7jKUgYEXgIEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755783355; c=relaxed/simple;
	bh=ciExmzo9EJPLx3gD5Z3HNVmu1olV2ONrRUp+sH5Nk+Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Pg30LEL9A8rpEqupxMJet3+GR2qYFFb3iOqP6HlRGIkdvdz8t+SC2Up/vzA6ixbepqy8bIymZyXYzlBNT/Xrp2d2RmiLI4GnTVYVSeus5hmU1wVkHXPdUcU60wSa/A3cQEXYDHL7G4j6SCSrVwrDwn4IgMMK0SpeTI7emnsSS/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D0feIlqK; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D0feIlqK"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3b9edf80ddcso407646f8f.3
        for <linux-staging@lists.linux.dev>; Thu, 21 Aug 2025 06:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755783353; x=1756388153; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q8nelKIncwI/x1u9VaIkU0iKbGn5Mrkkuwzjfbier8s=;
        b=D0feIlqKBEMiB40AwqpoKNETwLdH6nl41lplSVJ0e0yA0lmaM48YuSU1JPry5LHDHM
         GzA94slRANAaKDHPOKsr+TwTVUZ5ltYhW/Oxc8aQtCEKPx2NlYj1iXkpQPD8l0w9FrQl
         QK2ZiB0zgwECOsN6/eAN80o1XgQAtwHffkk96gfKki5o9x771SJz4MspH/ktZeFPVXza
         C5/QcR3qah9/biDhHjG8oQzL6kl96iXnfOOm38oaH4JgObs0SFj15a2cAMkL9hEL/fxg
         +WTIrqKlBWbTl9puBViJVVLja2RoQle8BUE9upejswczf7YhO6E3NgRmOYEVRnX+IxaX
         YQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755783353; x=1756388153;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q8nelKIncwI/x1u9VaIkU0iKbGn5Mrkkuwzjfbier8s=;
        b=o4Ai/y1UjPgGkCJknlFztdVor9oDUiiS2FButYb50sKTWgQx1Bi+G/Kl2+hQRwaqTg
         oABY6nZm3nmNioos7zH0hpFQOiv//+O8hwMB2CI+duGikN8zcgYkgb4HfjJkJWhrEugA
         ejD/EBrZ39isWB9jW/JE0NqRkl+vm3M4GJ3JOfrq2AeYlmLUjrI94SP7rO2SbwUoWxBU
         V18cDRB0bSBkBOvVCHxrHJ418i+00t9if/8luCBH7y8w+oGYPLGomU0aoyYOdBMsJ5KO
         VHXT/ZmW5UQZ6AU3UDcIpUo8FExH0En6ylYcey/N4SbJcBdf6GG3YWXvJfpJQbFJQjhv
         /YhA==
X-Forwarded-Encrypted: i=1; AJvYcCV7yHvj/R4ZvCuqVJh6ap1dNFl/sazBPhbFbUoOGJKAwj2cCO6Ce0K79jG+BK9WG/VixbTyjrvY2vsNEisT@lists.linux.dev
X-Gm-Message-State: AOJu0Yy50ohAhwcj2BQuVSPyp8bUuBip/9WvmdgHkMTrI3iWw6mgwuHN
	drePH4fH/UtDmX9IyKAQQqgAgiW4SWfEBLW66yPFi2Vn462nJFi0j2d8SDa+3sflvuqPBCZl4uS
	JU4KXSLNoOg==
X-Google-Smtp-Source: AGHT+IGoeb9qMtnY0byB8qbwt2AQUvSpswXowm/lbVJEvWyPvIRthWMZy0Z/kNnivC3EcOI5uD+SgMqANpxc
X-Received: from wmbhc5.prod.google.com ([2002:a05:600c:8705:b0:458:6799:d779])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2387:b0:3b9:16a3:cf9b
 with SMTP id ffacd0b85a97d-3c494fc64a9mr2439269f8f.5.1755783352693; Thu, 21
 Aug 2025 06:35:52 -0700 (PDT)
Date: Thu, 21 Aug 2025 13:35:21 +0000
In-Reply-To: <20250821133521.2665734-1-abarnas@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250821133521.2665734-1-abarnas@google.com>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Message-ID: <20250821133521.2665734-3-abarnas@google.com>
Subject: [PATCH v3 3/3] staging: media: atomisp: Remove return from end of
 void function in gdc.c
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Cc: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fix checkpatch.pl warning on useless return on the end of the void
function.

Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc=
.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
index bd44410729bb4..0906f1d1051b7 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
@@ -43,7 +43,6 @@ void gdc_lut_store(const gdc_ID_t ID, const int data[4][H=
RT_GDC_N])
 		gdc_reg_store(ID, lut_offset++, word_0);
 		gdc_reg_store(ID, lut_offset++, word_1);
 	}
-	return;
 }
=20
 /*
--=20
2.51.0.rc2.233.g662b1ed5c5-goog

