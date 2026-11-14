Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794650547;
	b=KXhcVGjOjNZH7yJvn44cGskUNLL9pRlJlOFDg95jQpnPPDL8RkOlBkbg5Ie2J0JN87zs
	 vr1o0fgCITTpiMCXNQKn3RIZ4kqqQPmUvPtVHbOd67nKx63Ob/OgJHHjassL3EE9YB6vE
	 ffXE8/idJ9VDCE1BjZGKu8wlnDohc2ZJfcERlTRtMDbqJWcVU+eeioj8Ppu431CXuJklN
	 I0wI4MuDjCMUiwz9DCoFJgB0QHYmy2giV6F+xz/H9JKjTrXKNvxKJJMoArb5W6KuObqvY
	 X1oV0dom+aCtAKbclGRERlY0vqeO/gUf9WCt36WmiaQs+Pr4Pe1+L4Ko22OKRb0x0rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794650547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=f5u5RK69/mPjrOb3K0zsus8OBr6kPMDbdsuU8MpIs+4=;
	b=GHqFgHt/VEk2/aE4nNemdfZ7WEFmPseAthPY+nIIZ8e/qLqFJ0O/xmV7ZPSG3Fy9PBJx
	 p9qS083jDNs+31w7aQrEs19fngLEwSnLTDcFihcBGNjDH58/e7f3XnrgYKTEYmnT2kQI4
	 p6zjgiAJLCHIoZyMa3MZHraY4RG8+dSSiHdqpe5d3xD9u2cqxeTjvYrRD25oJUT0crouD
	 ri+b2+iEWKSbDDcpIwdTyOKhhvHeb7Hf76t0RxMeK4yqFVrOieeWDiSq/aBRP6L1yp2Sp
	 tocxXsuad0Wqolkd7mV0U1fblaRQvqv7bWPSKDNI8LHdxRAheZOiYLhZEE36asVXd8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sbiqjE7n;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0069606A890
	for <linux-staging@lists.linux.dev>; Sat, 14 Nov 2026 10:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0069606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sbiqjE7n
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso3527035e9.3
        for <linux-staging@lists.linux.dev>; Sat, 14 Nov 2026 02:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794650545; x=1795255345; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f5u5RK69/mPjrOb3K0zsus8OBr6kPMDbdsuU8MpIs+4=;
        b=sbiqjE7nIpenOGdvTUnK+vZC4/iC2g49Z4deYPUF+NBIcNc+SjNUdTPO8axw7LJAs5
         q6ILLwjqjiDRGCdgEH7QooYBdYJy2Y53IIb85bG1TkIgzprql9XGW34RleUGIQtzL09F
         kPbV+7Xdax+I3VaqE4v7zpn+WllQC5RsTSZyi8QMizW/GFSnnxaL0lxGhYADOYGe24RS
         CwOZFVRfaDg8X1X8vvWYPFX2M9gZONVQ5Hg++H2DKgaoTLzaMH9SlTb2WTecCvkkEQ1j
         RcbSW5x1w2MndWuWS55pdLsxof161vsf5rIAKuGB2Ufk79BksWCqtd/7NhZ5Ujqh2tAb
         WVYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794650545; x=1795255345;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f5u5RK69/mPjrOb3K0zsus8OBr6kPMDbdsuU8MpIs+4=;
        b=Rf/UPbqMKI6UkL/tZaWk4e5cd1yq4mSFuEi1dT98lfcwt6KaQHZC8k0BI4mdcRAE/5
         XtXCcP3Hhh4p7vI3ADJDqFAVXyJYjMzyLQ9iJ9mo5v/Fw6+lEbqVavpYmpN1t+gSWGpU
         CFy2YV7SN8wK85CJ/9BqV3ooGyYUNjKTSNoOjS9oHpESoeqnm+AMlTF0qfYGsJe9Ma2D
         lzk4v/jfoGIMWiXU2B2mL4u2FVuzvPpflSpuFo0Uh4+JtsVDnVAR5Sg+POspq6fer0In
         JaY4pmDerZz80X+PX1FB2f8vAS422jFCQdBZBML00o53uBi8lU58bst/EhVv9l5N52IT
         Hgpg==
X-Forwarded-Encrypted: i=1; AL+hErGhy6znD993qHCjlpoP24vLd3r90RKzqo/wtQ3dgaKG4+fLVaWS8j7gx7ky+zDRjAEdcAmrDhtdtPPAmBu+@lists.linux.dev
X-Gm-Message-State: APuU4Z8rTdVD0cGPz0pCCBWWYctxaxK5ZF/4YCfEUVMLi827C6Ddp4sR
	GD+gekmyY99xGkYZ0HaU2V0EazJhuUvym2RS8i8ugOZf9z9TO61DJ5rh
X-Gm-Gg: AYBFou3Kqt0kOO80PD8WzOh+v5GWhOb83F2mqaOGgyoOMSvEwKGj6PsGC/vyi1QIUqg
	HhWL3KPOeF1MsyE4G6DYorsXclnU0MqUXQXvARXcZavpbSZUk9KVMzehealanC/8R5bzFrDbVGr
	QZQzaov0gGmEaRVRQLaqnVnN91HshdCa8LLjt5wcYCT5CtRJUK2euIYtOagAoJdztHX+FGpD7mX
	aO99zF4Aj5v9x3L1KneKo6S+5T+mAlJFY/LLoycaX/VcGfmA60qVivedeG/u6Q3vpwpiHpOMYTO
	yEU1A2yJUasrP+tOJXwoyZ772ZxG606L/TlOzx63D9AWMdmT6RRZ7vYdMpWqZ6cFDP8OonsVkWW
	b78cB1LMlWH6UmZ2NlIL/46aNo6nDKQRjV4dIOuyH/rTU+GppPVRSUahog6Uhb0EBwPytJiwyOX
	Ek55nh0Q6BxryIGlr+vFk7uNgz2j3CqYwPOMXsiTZeuHfORFhB28kidDDNgX63W0aNtb6i5gKD3
	3lk+zEzWgIQLHM89ZeNHQw8mH306wTpLufxOlmzrKYrC+rAWGN0JxDXX0poixPnfJLU2MAqOb9X
	Zdq8mAdaL46BpU8bkrTVXHb6zutdZKBeEA==
X-Received: by 2002:a05:6000:430a:b0:48d:f14a:9182 with SMTP id ffacd0b85a97d-49c6fd93307mr12159903f8f.20.1794650544657;
        Sat, 14 Nov 2026 02:02:24 -0800 (PST)
Received: from DESKTOP-TMG47OE ([176.41.25.224])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608cf46dsm10520184f8f.43.2026.11.14.02.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:02:23 -0800 (PST)
From: =?UTF-8?q?Ali=20K=C3=B6se?= <shroot1337@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: gregkh@linuxfoundation.org,
	rppt@kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] staging: sm750fb: Fix DAC power-off bit handling
Date: Sat, 14 Nov 2026 13:02:06 +0300
Message-ID: <20261114100207.9124-3-shroot1337@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114100207.9124-1-shroot1337@gmail.com>
References: <20261114100207.9124-1-shroot1337@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The DAC state extracted by ddk750_set_logical_disp_out() is either
0 or 1, but MISC_CTRL_DAC_POWER_OFF occupies bit 20. OR-ing the
extracted value directly into MISC_CTRL therefore clears the DAC
power-off bit and, when off is requested, sets bit 0 instead.

Translate the state into MISC_CTRL_DAC_POWER_OFF before updating
the register, preserving unrelated bits.

Fixes: 5372350be30a ("staging: sm750fb: use BIT macro for MISC_CTRL single-bit fields")
Signed-off-by: Ali Köse <shroot1337@gmail.com>
---
 drivers/staging/sm750fb/ddk750_display.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/ddk750_display.c b/drivers/staging/sm750fb/ddk750_display.c
index d619e00fd88e..dbbdbe08ad38 100644
--- a/drivers/staging/sm750fb/ddk750_display.c
+++ b/drivers/staging/sm750fb/ddk750_display.c
@@ -7,7 +7,8 @@
 static void set_dac(unsigned int off)
 {
 	poke32(MISC_CTRL,
-	       (peek32(MISC_CTRL) & ~MISC_CTRL_DAC_POWER_OFF) | off);
+	       (peek32(MISC_CTRL) & ~MISC_CTRL_DAC_POWER_OFF) |
+	       (off ? MISC_CTRL_DAC_POWER_OFF : 0));
 }
 
 static void set_display_control(int ctrl, int disp_state)
-- 
2.53.0

