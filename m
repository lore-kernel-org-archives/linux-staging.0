Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2C338C401
	for <linux-staging@lists.linux.dev>; Sat, 13 Jun 2026 11:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781349000; cv=none; b=Riu/SKZEDYalYJtw7njM4OZau+IeUn8C5xIR2ExPJIvpyx0HDGzv8Ev1yEFP1W1LamCoMQ9zEArFzxKrKDjL9RFE/71SjJnGKSy2aloBlQMmLZ2ogpgO9+WozE2sCOX+0WR9KCvObsl3Ntl9RjsG3UVIM0cSQNSYmJIFWAOtUHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781349000; c=relaxed/simple;
	bh=/FIw9AC+8Nx0SI4BoFKw35QxmDhS+Lui42fBdvZIEZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sCvNa4WkRw3CAO2/KZYFrx0bqvpbvtLt6BhKhvLrA6mVF4tM/Y8vtSeyjnE2glr1NHmvZMkqHjel2/RPUN8vzFMwXZGDVx4Rzy8pFHO/nGt+9IEoNpjh6iJDZcxA8/GWOAg0SDGAGwSZqtRSUMmFQTKsjC+fboXo3vT0G8npUAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dE0MSAzW; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dE0MSAzW"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4905529b933so18046845e9.0
        for <linux-staging@lists.linux.dev>; Sat, 13 Jun 2026 04:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781348996; x=1781953796; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LfLmR4y74+nAERkf87qCAjiTwREwiy9ZfP8ZT75R/W8=;
        b=dE0MSAzWgFi7FU92r65fmCjrWmQg3Rj03DXMm1TiAiwOeatPswW7grO5ygq3AJqgCX
         smij0A/i93mAvcqlsd2aNgQs84EyB6zdIoETtcQRumNNvm5RDNGAjj6PABl5FFT3nu6v
         bH3F1AY9yLxuHuVafUfOIqe0KzzsCwTxnIJ6sS3NnZqTVdSa/FsTL5xiNdnjW2JUdzvA
         p1+7cKBwVAjNzWvgDHOuravuJnbvfxpxEYsKWL0fcT9vc2Ff69yClwcExR8wD/pUnSXr
         Ix9lKKU2DzJWewAVyHEPQeE1gsQOidX8V5FDojYdGKJ9hmupPtFPnyxJzI1X9bZD8aau
         iZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781348996; x=1781953796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LfLmR4y74+nAERkf87qCAjiTwREwiy9ZfP8ZT75R/W8=;
        b=XIA87EQC86pmHe5lnQMWpVB7LtZqxkczRLMT6bhJRD4FoiJ1CDDoomuuC/tbfuIQR0
         F/zVWhNkwBCNQioY+9p4DgLPjsrTdkzs5Xy2bOq0LjVCJtOLPEJZwB6mdctXBy7JYo9K
         DScIob3XKnpIDyDl+jYdaEQ1wKQgCqr2/XpXH3uOAm5Otw2Ra1i3R6vxGUXMGI2gGqHu
         RIh6c2gmjBDEJcwaUsIBIrUotIasLSWvouDRzwB37hHmVhpiPJsPEKglMY0OohLd6eno
         E0e4sIgiw3hJGg+7VP/UeIcwbVbz1bSuPx4j6J4OM6iI91TsdTNkXrdWt4EgX4z5Mny8
         O6uw==
X-Forwarded-Encrypted: i=1; AFNElJ9kQYlKBXjwXQMp1eyuA1NLiKnMt304/Lv8Gn3jF0tfAyFDDXA3gI29K2CLGVvKsMsoiazzLEIsisqX4NNq@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5d4ieGMRbVYz6CZz5fE0j4XGfS+2Z0oAAfcpovTFVYY62QblS
	yjXE/Nt4B+JVT9bzyk1/P7LfOfRORbSa0djyR+z1YNIg9WgG1L6DidxX
X-Gm-Gg: Acq92OEL2iUi7Ey3cSLX2VzKlMOHIWm02G1irIqiw6myhXdhDm6DkiFlgcVUjwi6eVV
	zkRcjQoF4GZRWP+MbjzgPTiXeHSytXtAOSlSKjPgjmKKpqQmnk2+m2nmShou5/dt+POKOzSSdAP
	mRGiiJ0D1t5OX1SiS7Q2TnUZ9ejoASx0kGPWZPTIcCE5Lmx3YlRvWUCf8VyB3Lm+PDegxnOgM/Z
	U2slyDeUx0K9erjKuo9jaJ1sH00/WbrSAEfrYWtOapZ8+JOg527MeuYLCMItJuyAgayrzKjwvj3
	LAWUp4yJoC6L3vmOC7WELxB1q5a0EnxqQHna5zjznioOow3bNKJuzL6gNCzaphnY4uG2vxvXRw8
	atm8y7P+OxJJEs6Dv/NhChZ1T+adrEX09JneBnuFoiTLbjjaCyf06lIAXIwiYf4ggY/KvGOStha
	jlF/T1/exFWKetijzkbpo1rTglVO1q308iFjRCndClxpdP5w==
X-Received: by 2002:a05:600c:3513:b0:490:ae94:a7e6 with SMTP id 5b1f17b1804b1-490ec4ee41fmr81296115e9.24.1781348996139;
        Sat, 13 Jun 2026 04:09:56 -0700 (PDT)
Received: from fedora ([154.182.122.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922033156csm62256155e9.7.2026.06.13.04.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 04:09:55 -0700 (PDT)
From: abdelnasser hussein <abdelnasserhussein11@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	abdelnasser hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH] staging: greybus: audio: evaluate sscanf() return value directly
Date: Sat, 13 Jun 2026 14:07:48 +0300
Message-ID: <20260613110748.13497-1-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Smatch warns:
  drivers/staging/greybus/audio_codec.c:335 gbaudio_module_update()
  warn: sscanf doesn't return error codes

sscanf() returns the number of successfully matched input items, not a
negative error code. Do not store its return value in ret. Check it
directly instead.

Signed-off-by: abdelnasser hussein <abdelnasserhussein11@gmail.com>
---
 drivers/staging/greybus/audio_codec.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index 720aa752e17e..295222ec0f1a 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -311,8 +311,7 @@ int gbaudio_module_update(struct gbaudio_codec_info *codec,
 	}
 
 	/* parse dai_id from AIF widget's stream_name */
-	ret = sscanf(w->sname, "%s %d %s", intf_name, &dai_id, dir);
-	if (ret < 3) {
+	if (sscanf(w->sname, "%s %d %s", intf_name, &dai_id, dir) != 3) {
 		dev_err(codec->dev, "Error while parsing dai_id for %s\n", w->name);
 		return -EINVAL;
 	}
-- 
2.52.0

