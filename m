Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5388845D190
	for <linux-staging@lists.linux.dev>; Thu, 23 Jul 2026 15:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784820130; cv=none; b=txrwf0GYVJraiHK3rHyMT08DJxHf3o+YSSck6mI07o+GnAROxlhtsJ+fHMxhpcEtng8Q74CDQK2sNm9cmgu9cUm+o9TGKjY7R9/vilq1wyWzjT7zNbDSNcKtz5AsOkmCua52YNYhr+j+E6sCylDCb3eVfeRe3GN8W8KpvHc+TZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784820130; c=relaxed/simple;
	bh=Wdu5jzsTRu1UQapIpzehyg1ZndegJxmvxZqQI4wa8/I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pav5hEnECTxh4yAPfQNl9G+Pl2xpBGch+wlu3kSDA0Q3GQnpQ1KCO22F9+kaKRPwJGD4qCkVPPHLsI0XU5TKwQpCg7+J5OkFrpXzaWAVU/rJRoeVq9NuqnObb9RP9fSSlzho7ReraIuy/A0Y9VXloGhKhuKqOErNqMf7dKiB6fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oEeJsdR7; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oEeJsdR7"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-74d55dac06eso404193137.3
        for <linux-staging@lists.linux.dev>; Thu, 23 Jul 2026 08:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784820121; x=1785424921; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fj+kSfKG+GX3ABilBOw8Vr5IsCiYnxIkSvhYryTFnFI=;
        b=oEeJsdR75QRhtIjsudumWtcdjgnFt/NxALur6ovZI36SH6U4ueZeVKzbq/Bx/1ZtbC
         l1XOxTh3Z+n3WwZbvsdLDx6iqGgR2CwuzeRy8KmyxEUsCejf+nVd2CwqFuHYylOI8+01
         glzwD/lwUk6NVXFOluXAwJEKRu5LrFbRs/IVcq+joLKH10dQfmzZE6Aj7co3/6Q8z7ci
         ya00TDpK5G2V7fG8tq26EuaLHkLRCdMpoDCVhpCrFrKAvtL+Rf6WwZMwESAlB4rNfgVp
         aLzro0E+n0Q3UsarlgsvwYBuNmNsSZ61+PB1rIZ9jsEHUD1UmrBxOVW7CrHDGBhFz747
         acYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784820121; x=1785424921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fj+kSfKG+GX3ABilBOw8Vr5IsCiYnxIkSvhYryTFnFI=;
        b=cvBCC7EQaTcqZBnsrTc+AfytFE7XhnBPNp8TZ/CQzBLamxk+wmiQfJwwRsBwczIXNE
         l8lMLMuWOsacQ5GEZSYH4IkjFY3RDzGuNb9UzpNJwNiWDWssumDO4rh645fwgH5GTK0H
         WreMwUaZ/udXY6tgNh1+PFjUMwGwknXm/KxrUUqlpAE0PVEyliDAoSltw3sHExyMJed0
         qloZ2pq6r7icwbEv5vW6I7Lu7MhUzm8fc/c39FXrBAGkt9nVZzVgSOlTpMTSU5uXUP7+
         zydwugpNwdCpeDtsRsj2vzmiVK1hEKj4fT112sr0hnsYYqNuLt0wL3YC/mxoB9A6gTqZ
         ozJA==
X-Gm-Message-State: AOJu0YzFfMgDSR53NzQxZMxAJiArH+PPVYbEJAk9ONKjkwJgOc97d+m3
	HCYYowYcfCF9wTbWr5lE5ZP+eAMVudiOMxNTPXHmw+220ezly5RhtFiw21oIUwdB
X-Gm-Gg: AR+sD12wA5sjYjfPRnQhy1dI0Z2DfhgR1Cu5AikBembUpa6dCSWqS8Vh8UUTskXJJtR
	XqFR9UssjNl3pZhQUgvAMRD5Ohgn/GaQL5Vb9ZQEiVWT23V3YAgMFGzFCqOmdhEgDw8JqZGnjem
	H/EJ2ekBR1+SiRmMzyuVWOwtndwos9xlq9vkHaYEuG5TMfu+iKML3SmaWjiPCW47gDRSljGetaN
	ZjRr433QptHXt55p087aNh8VrTMjfnZHTO7H/CQXurjqzOmrV1O4IxBt+gfbmKrofhp3YL6tpum
	bnbzGxftrkS4wjKTPwVzO2nWHGFoPGUjWvmNuueS2c9qDApOoYd/CJE0YbmDI0vkq1V7VMCoj3w
	tLnlnWf36OHEruXqRVsLW7turjH6brgEGA3HcegHsKQY6p07qoayJP66ZMN1leW4Oznu9RRugT8
	5vLQ3gJW1OGMRtL1Wx4zp+uc7eUcXOgc+s/nIdymq/NHG4HYo=
X-Received: by 2002:a05:6102:c50:b0:631:2973:5c2c with SMTP id ada2fe7eead31-74d604fd347mr1689165137.21.1784820120923;
        Thu, 23 Jul 2026 08:22:00 -0700 (PDT)
Received: from note-javi.intranet.unl (fweduroam249.unl.edu.ar. [190.122.249.184])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-74ad344bb32sm5494191137.11.2026.07.23.08.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:22:00 -0700 (PDT)
From: JavierLeventan <javierleventan@gmail.com>
To: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	andy@kernel.org
Cc: ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com,
	JavierLeventan <javierleventan@gmail.com>
Subject: [PATCH] media: atomisp: replace spaces with tabs
Date: Thu, 23 Jul 2026 12:21:30 -0300
Message-ID: <20260723152133.56400-1-javierleventan@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpath error "WARNING: please, no spaces at the start of a line"
in ia_css_fpn.host.c

Signed-off-by: JavierLeventan <javierleventan@gmail.com>
---

Hey, this is my first patch. I appreciate any feedback, thanks!
---
 .../pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c      | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c
index e701b7e41ef4..1c8e60c1b071 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c
@@ -22,9 +22,9 @@
 
 void
 ia_css_fpn_encode(
-    struct sh_css_isp_fpn_params *to,
-    const struct ia_css_fpn_table *from,
-    unsigned int size)
+	struct sh_css_isp_fpn_params *to,
+	const struct ia_css_fpn_table *from,
+	unsigned int size)
 {
 	(void)size;
 	to->shift = from->shift;
@@ -33,8 +33,8 @@ ia_css_fpn_encode(
 
 void
 ia_css_fpn_dump(
-    const struct sh_css_isp_fpn_params *fpn,
-    unsigned int level)
+	const struct sh_css_isp_fpn_params *fpn,
+	unsigned int level)
 {
 	if (!fpn)
 		return;
-- 
2.55.0

