Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE3B3054E4
	for <linux-staging@lists.linux.dev>; Wed,  2 Sep 2026 04:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788324661; cv=none; b=CPSRyNDSJupxYelAZK3KEKgR5Z+TZBg4J0nt64fg1B9pkc41NsojU7xP/ep++Yrp0g3bObaRDjJE/9yNkLtnAf1axr8UmbcDv9+E30piirN7zCjoNatAJA4ym2njRxBheXjC7juZq7UXZo5viqTrP6tLcnhaF6XMySzU+iT4WIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788324661; c=relaxed/simple;
	bh=LMSRCIUMLvwhOCCbBHYxtVhNFgFxXi8Mvt8mgmFphTU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=osXExS+2SBvtB0EW3hKrgoWnbGjEAWyyiAGVBQapvOqCsr8Dev8mLbxhcVAdGeAiOnHG/66cDw22gAxcYSJ8JaqWRA/B87lwFu67A+Brbii6vDeuI0CA8b0PDu4YIxkL5PuInj9ppSXkkWO2oRrNrs4ad+kkci3FAus3Yj0I/7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RbetmAF9; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RbetmAF9"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-853f8c34ba4so1015241b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 01 Sep 2026 21:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788324659; x=1788929459; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gL9gEW7ayUvR98UbsWW5JS05cT2CnhJ1qoyjKu7J0AI=;
        b=RbetmAF90hTkJ6wtYzY2F0sFxfLLWKTHCGqc3RTNoNGZPD3EL5vxta6IJ02KUOxFLp
         3qsFB86hdhRFbOWChrkSMQRuatNiuLbB0kbE2D1IxYD3L2Vt92IYsZr2lUhk7pp7eV7Z
         fthTvXb18Qzlip7H+yuiTN0GgM8z8PC9whQMVcf5KM+zICnfvx0vuPuCV/IgM6w/tmdy
         9DzZ+LkRy34BZLHWR0tvKRMD+LUTI9CGLAMJOAaL+dFJPXJbirIiAIAY4yEj7aAssz2s
         LQuA7HFemDDP3NDG7ZcoWKjW7ujf9l9OhtHYrllbc+TwgTBmkvsmXsJVuigEkCmfYyEr
         YX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788324659; x=1788929459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gL9gEW7ayUvR98UbsWW5JS05cT2CnhJ1qoyjKu7J0AI=;
        b=siE5o6+MrPX4IuobANTRIVTIAnT36ieSkG8FqxrRA+jYv4T9lW9CQvF9CGPef8MKXt
         nDQV+fSVSkn9VdjiAprSbPTnv65mrVK9ndN6Cua6ZGo08iR8UDTOc+CAINx/kiB0a83V
         plDYkzQF635FcSCVHJwEbvOB3pIixf5ISi3mOdxeW2Hwiq7JGRCqoH0uceZNlOm8WyyB
         tvzsrkG/1T7WDGz1RSAhd6kDUk8zFzWI0l3M0qU7U2hO6bBJ+Q31Og05aZzfXd7vaZba
         7xIcjSUU0n52VB/fZd+7rfyPg9/ls8rMqTj+8z9rAFJUWD/1JLrwWvvgGF5ET6tYxHQv
         6v3A==
X-Forwarded-Encrypted: i=1; AKwUvBwE7c3Ogwi7GuKweXTjwtwBpPivITae6YDLn2QrkEBQUDZ/ZGrXdONqibaSQHwMK2YO8mwsncbcI0WmrvGJ@lists.linux.dev
X-Gm-Message-State: AFuF++lH9v75ThNHEbt+T7S5+b059VONNEXHKkMMVNGahF2FnJLZe54R
	Z6txrUCYBGiZqv50sbYxcEzR9v+atC6GtsGsnwQeBZKLoa23ycFksI7avROiNt9u
X-Gm-Gg: AYBFou0IAeLMyMqkQJDyNMImISvpHsVwwtzYggc3xQAPM3kWiCbEo+mIDq9HnvpKcOM
	7hDLM+geOjr3eRpii5CIwAMgNmnUMdgn3I4hCIXd8IoA5AnFxk8FbCxWRAM2gin8FqDm9Ref5gJ
	rmHTFoxGdB/m3dajzNULDm9+OK4A1LkB6ZoOS0QOPvVRhAGL7Qmf3QEs6Ew3LvJAKxIT7FBb6qq
	ZONSHVRtv0SDBUmHZpKM0x8xxQ282GfrQDp9svVqA7jXCfSCwljMqv/KrYtXsqJDRafwvbMfz/V
	3evQxnhqBouu9Rta+aFOs2bjqEvKpL2Z4/Lda7HPcF1nyBOMa1dnolQI+TcVF0GtpebyJhQE7uB
	w24TLTyHPJ+AE1U+iTeqCoxzYxYmexda6I6KVYfRJ+2TCUVA0Hb4C6/lpobnOwod9fGfrRDjF6+
	HxvKDVLzyqqMINFxw1PR1AaCsDXCLRtplPFetD7iVpkIG1AX5N6qpEqVhf6z+xXiWJ3zqa1wgpe
	cRbKzME
X-Received: by 2002:a05:6a00:148e:b0:847:893f:2d0c with SMTP id d2e1a72fcca58-85ed1d0414dmr4031929b3a.5.1788324659284;
        Tue, 01 Sep 2026 21:50:59 -0700 (PDT)
Received: from Kalpna.localdomain ([106.194.26.137])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc11f44a8sm709997b3a.56.2026.09.01.21.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 21:50:58 -0700 (PDT)
From: Anshika Jain <anshikajain196872@gmail.com>
To: Andy Shevchenko <andy@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	sashiko-bot@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Anshika Jain <anshikajain196872@gmail.com>
Subject: [PATCH] staging: fbtft: fix len<=0 buffer overflow in define_fbtft_write_reg()
Date: Wed,  2 Sep 2026 10:20:26 +0530
Message-Id: <20260902045026.7442-1-anshikajain196872@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If len is 0 or negative when a define_fbtft_write_reg()-generated
function is called, len-- underflows to -1, causing the subsequent
while (i--) loop to run approximately 2^31 times and write far past
the end of buf.

This is a latent bug: nothing in the current code prevents two
adjacent negative values in an init_sequence from producing len=0,
and there is no guarantee future or out-of-tree panel definitions
won't do so.

Add an early return for len <= 0, matching the existing guard already
present in the sibling function fbtft_write_reg8_bus9().

Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260830161529.14500-1-anshikajain196872@gmail.com?part=1

Signed-off-by: Anshika Jain <anshikajain196872@gmail.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index e03aa251c..7d7135571 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -20,6 +20,9 @@ void func(struct fbtft_par *par, int len, ...)                                \
 	int offset = 0;                                                       \
 	buffer_type *buf = (buffer_type *)par->buf;                           \
 									      \
+	if (len <= 0)                                                         \
+		return;                                                       \
+									      \
 	if (unlikely(par->debug & DEBUG_WRITE_REGISTER)) {                    \
 		va_start(args, len);                                          \
 		for (i = 0; i < len; i++) {                                   \
-- 
2.34.1

