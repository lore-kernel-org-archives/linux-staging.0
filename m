Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58341113;
	Mon,  1 Apr 2024 06:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711954554; cv=none; b=RE0W+2SlSIEHu7ecSKergRbjpKwBzAT7drPG8+REaJiYpFgCLzXxt849g6NKbTguKJqi5JohRfPXftX1/d96d1jz2YCUcry4Rn024HP5TcjShhufNgWiDh9b/l0cgEg2TX0zDI5YVPXg5Tsy6uUsrMgU3KYCavD+JsEFxyCTgA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711954554; c=relaxed/simple;
	bh=/yju9lel392OfRllN7ckkKL9AiRf1PmiXkoeZVtVAZ0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Bh4y6NBXPSFPkNf6NuhBUOE/cDToLYRwCtFfPAJyrGUf3MyOqy8+VqaLdE1NzN3ekS0NaK1RBvTpN2csYtppgwS2liEh1n4yKudJi8AXBmEfI86Z84v4KoK3SPLDLrlsHZk8w1Ro61l0DdIkB63w/HL0UHBhY1Aa7RuyDZOgbWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RQR25S+v; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RQR25S+v"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-56db72fc3a8so1037807a12.0;
        Sun, 31 Mar 2024 23:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711954551; x=1712559351; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DTB3IpGjwW6koQXgT7+nFzmTK/yYw6PkG/WN8b+/Pp0=;
        b=RQR25S+vr2Jr/CzEp2ZWPpHV+ncC8r8Ftj8N6GbD0BnaXiFgn3114k1FKuML2OsumL
         +62YiP3JycK2JC1KsJA+P7i3IzJJ7/3B4gf/4pV/NKlLujDaZs9sFlqf3iNc5ltHRmwJ
         NPw7nZ9ZjqnkMpp1JPQ/98xWzYrbKo8NPXL2zM07VbSmjM6qNXDR/+wB4/zkHB8fBHMT
         xWQW6ye3Mk321SclEz3y//DnIlsFJkfl8y6Nbi6Ztl5tzWS/K8klaHbUru/5DwjxfHpR
         XyU7v3UCmuQz7AnnJTJijdkxe3QY01SigQW0RvstMdnGrX81nuLHVLmg28pBxYuTLUrk
         Zs8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711954551; x=1712559351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DTB3IpGjwW6koQXgT7+nFzmTK/yYw6PkG/WN8b+/Pp0=;
        b=BES0GQ0Kk34dEfZmKND2tXZMlCJHz0TkL5W72nCfB8ZAUY79WXO2glWKP0I27iiDk9
         xW3X3jKUDxApXt6OecvPI2iHp5+r/ws35mBLRyEy1CSm8+kogEpl/3gfEygRQ2WvX1lm
         2Qm9PRKJ/G31T6+olzOypXZhbW4gXlJy+ifAjE1O4IqZfaLIN8JGTUMytdO2gpnMZ/fw
         /DjK5CXAftj53LeMRaJm5yDyfcMJalYvaXma+OdIVi8jQAnmhW6XDiF/1SbawkxeOstI
         yt4Nw1xgt99NC//7I7ilCVqftqVc6uPtnDZdfso7WOpDzbOvqamLSyE4bbsO+gTNnD9X
         eKiw==
X-Forwarded-Encrypted: i=1; AJvYcCW0jefuVCC70tWUqbyxDfcZGPKRGnmqNgs0ptkooO7W4Ha5x7bbvldVUVRVbkyxqmbKaenrGVif/ktYuNZdaJ6KB1qvMGe3Yxy3xmU5ecdN/m8+OqaG9QmidwRuIClpjZHoVnaggiqreQ==
X-Gm-Message-State: AOJu0YzSZO17GPfEAOt/Gu0f+grVzwVD0daBWcVgGIYc5Rgah8xak8eH
	6HgBVtX3/z9UyVb3F90iIvLBkHsHSg3zMU6CKUROVmq8it9c69vY
X-Google-Smtp-Source: AGHT+IHzFOoYM0AxzX43k/kIkuo7kzStBkVnLIHkJt0q1Lf8FeDxvnJr2erLbyDF5firwabdnHS0jA==
X-Received: by 2002:a05:6402:2110:b0:568:a792:276 with SMTP id bl16-20020a056402211000b00568a7920276mr7918700edb.7.1711954551021;
        Sun, 31 Mar 2024 23:55:51 -0700 (PDT)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id eh13-20020a0564020f8d00b0056b7ed75a46sm5118876edb.27.2024.03.31.23.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 23:55:50 -0700 (PDT)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	marvin24@gmx.de,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>,
	Alison Schofield <alison.schofield@intel.com>
Subject: [PATCH v2] staging: nvec: Fix documentation typo in nvec.c
Date: Sun, 31 Mar 2024 17:05:48 +0000
Message-Id: <20240331170548.81409-1-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit corrects the spelling of "initialisation" which was
misspelled as "intialisation" in the irqreturn_t nvec_interrupt()
documentation.
The issue was found using checkpatch.


Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
Changes since V1:
V2: Fixed the patch subject length so it doesn't line wrap.
    Tidied up the commit message and added a missing period at the end
    of the sentence as suggested by Alison.

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
2.25.1

