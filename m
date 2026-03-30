Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC88C3ACF11
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 08:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774859679; cv=none; b=AXv4mnEoB8i9+uV8yojHYyoVqIrEbotb7LaxjCCGXGWvr9vCgFzceQ+jRn5sreaEbpfm1Cm59GnaSisbpP2b6kG3JmaJaOOn7XRBotmxSNplD1L1x9ERWxc/8Olz/GoctNFpUCwW3tKuKaw1VaT8CA3vv19SJ9nWAZhvvMOUpyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774859679; c=relaxed/simple;
	bh=vP9xJ+DeCKh7L3DK+oYZMX9M0qno6xvExsoFW+s2UJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FpWMyfqmregjxlV9V0BiDkMf0q2VGRxA+BynlSJx0SF8j9+GZfogSdA8J2DiZcQEVvin4ZDiVJi08HnJK0/xTHCBXuF86BpzXvJ9rOoP0XAa7Xl5MQ4UKvZlhkaxkYYZsLUbH2tBHdvbLri5wxIAMNs2AqG+nddGHoCO0mJMQN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g5DKpvvi; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g5DKpvvi"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-35d90833cacso1177875a91.2
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 01:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859677; x=1775464477; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J12BhFYptyFLfnU7tLD4pN+BX2lCLcGi17cBlQr11v4=;
        b=g5DKpvviGWdYEfU5j6kDPBfFOea+JCpv+pPl242ebrL6NGCfUweeV0cxgSTZF3gio7
         jp0LCe2ztJSd1TehClkPHxt6V5YIuYYWFz2lyFIJy30xjwkYnHBSK4xiamVA9c45h32m
         K6a0IeAMAv588byzKYZvjuZgfV9Yr3QHYJcuyl6Vx4eHrWnl8NQ2sJAy4Tmoog3ebQ3e
         ESy0XRLWHrZg3j6Mbx+4n2Ed+3gOGbBE6dR5HT5PpooJgssX385EVTLTnTIi09ZJovH7
         2Evt8ce/OYSooHowOn227Hw3n08vq+twS4c6/Kj/1svBVfufdxrbUx1wEwRLjv9ooGjo
         He2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859677; x=1775464477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J12BhFYptyFLfnU7tLD4pN+BX2lCLcGi17cBlQr11v4=;
        b=rnGn5mRqBp+iV5mpW/uKg41x1cm2SupfuMVHQ9I2VbCzjUxg0twdtFp9+XvPuwpSyD
         i20sE8Cu3cp5Lp6xlJeD499E4wgHKifOx/Y3qsXhG9tvBDhr9WIwf4mYqpbxrU129JIu
         J1W8rCzGPN7VKaKeMd1juQK2RbeuO1i4zmU6ppL1P3VU16vJjCGRdhQUJ60wuyI49cN9
         dCRXwlSxb8oO1zLC99l1N+I196WqUAZBOdQ7sMLQJf6x3o5RZRZvkRSMlbzS4pnVLGJF
         Uz5O4gwV65K+CswuO1Dbv0ElWdIFZm/UjS2ELEOpFbWaXfwr+fS9uM68toQ6hrxtqYDG
         mDmg==
X-Forwarded-Encrypted: i=1; AJvYcCWwTk7QggvFix9Ubqts1xFMsK5iZItYmYprhEKQMRT9KrmZcJYolRI2PKrU9f/+P/bXppGne5/sy0JSWiYX@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1g+RWKe5MtI14jHYLts9avbwmFSLz7mHc8XHxY6YCYfxHo+rT
	8/0Ec1c/zdzxbS8NFOlw+gU7i5rfkdCEuLI6WVNTVxqKMchVYKua5HGd
X-Gm-Gg: ATEYQzwzcxfrN2eaQARgAx/FQADWoIc2YwHwG+eeZRlnEIDoH+We3vRHOQEwe0pRLvQ
	BhuUNr+6w6///8tXB7bHaQhaZ6cAAN+G+ooJ0UbUZ6d4QFylSLRpgUX6ssecgVQDRsSEpLZgscq
	9H3KYMfvw0FxWzru7vGOZ01GHNCjnbsymCznNR9uApyGtoT7ZeXsIxiTntb+fVsNt/zmXKRpMYs
	0uKJRS7I5aaWeXccW7pBCyqLaiei3OnbcL5rGauFBRa8OO9zS5TIXL3mNMx8bMi4Y36M7WnSxq8
	BO7dUuzfZtXJIxugXqxw64aJI6lUQyJVILNbs8Sb//I/s3Ei/EPDH1BFVEWtFNF5CyDK3wnY1F5
	Hc/6CegH3hXh5lJU5wjB/fAujcHWA8lPhLglxoOM6cGHtZ3o6sTHze+FVB8ItLlFPiopCuEOXyS
	59KFk2QNk6zBOAsK37GEv68QRB8cpjxJV1Z43BkYGx2nZsZv20Lutovw==
X-Received: by 2002:a17:90a:657:b0:35d:a2d3:5c44 with SMTP id 98e67ed59e1d1-35da2d35e66mr2104168a91.28.1774859677125;
        Mon, 30 Mar 2026 01:34:37 -0700 (PDT)
Received: from ZC-202510311500 ([123.139.39.124])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d94d057bbsm6429367a91.1.2026.03.30.01.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:34:36 -0700 (PDT)
From: Haoyu Lu <hechushiguitu666@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>
Cc: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Haoyu Lu <hechushiguitu666@gmail.com>
Subject: [PATCH v2] staging: greybus: audio: fix error message for BTN_3 button
Date: Mon, 30 Mar 2026 16:34:25 +0800
Message-ID: <20260330083425.266-1-hechushiguitu666@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In gbaudio_init_jack(), when setting SND_JACK_BTN_3 key, the error
message incorrectly says "Failed to set BTN_0". This should be
"Failed to set BTN_3" to match the button being configured.

Signed-off-by: Haoyu Lu <hechushiguitu666@gmail.com>
Reviewed-by: Johan Hovold <johan@kernel.org>
---
 drivers/staging/greybus/audio_codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index 444c53b4e08d..720aa752e17e 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -781,7 +781,7 @@ static int gbaudio_init_jack(struct gbaudio_module_info *module,
 		ret = snd_jack_set_key(module->button.jack.jack, SND_JACK_BTN_3,
 				       KEY_VOLUMEDOWN);
 		if (ret) {
-			dev_err(module->dev, "Failed to set BTN_0\n");
+			dev_err(module->dev, "Failed to set BTN_3\n");
 			goto free_jacks;
 		}
 	}
--
2.17.1
