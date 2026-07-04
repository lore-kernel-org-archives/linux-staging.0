Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B741539B4A1
	for <linux-staging@lists.linux.dev>; Sat,  4 Jul 2026 08:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783152986; cv=none; b=q6oTNdWi+W/7+L2tSFZyXP4ReBnW0c1ncp8sXIJWIXKgE0GmyhrFv30q6/sgOS+IuBPccdoHytsf7Q2g57oP5p6GhJQwCzd3xDRGGhdUIyE9q+1s8khyuFXcnSALrTDyqmt3eJSGw9PlNCarW1vRVlLJzdWnMI3wlC7sCwWikbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783152986; c=relaxed/simple;
	bh=ICYE2DkCV1p/9tLiNI3rxxRdRQI4UCN+8Zh+UvVQYCs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EEZfFQJ4vM3w5FsP4XNK8ZSbRZF1CeJbCrljXdmN4cbAz3Mc9yYD4sBLqeE3NQIhw0oEaf3lgaTx+a/YzOG97zDStudi2reLJFzjMB9jItUYSGErC6A6Stnkz0fvCgNTB1UWOzrrg+SJa3S8urreoH2LmZFTgfiNwifZY94uodw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MeylfvEK; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MeylfvEK"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-381ed661712so736728a91.2
        for <linux-staging@lists.linux.dev>; Sat, 04 Jul 2026 01:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783152979; x=1783757779; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TH3+2uge2X7v89K7Klwz73DAfKLAbdik2q1vKZDeHZI=;
        b=MeylfvEK+5++uLWYG/hJimwMMvPnYVbNGbs9L2ScouIvOy8NAGdyUqywLqPvilWyjc
         zak78XykV6P1Gt0WWbBx0LajkeGYYqHUFw6jCk8k/vIWPIcWL4DGDmG8wDvOg4kNtHsT
         WX6hvo2obxXzSNBIVyhA2Z3Nr11XwnXwuSg5Dnj9dfK5KVP2JUxNxvNAEmFQzUs5VzBU
         h/hlfBKbUffd19NS8J7NyXecq5Ym3DUtoRLOBat7n1CJaLMJqALz519ORCRyCWStBdVi
         okHAU3ToB1Vl/d0LvgnIJv5RlKWCX51tg7xXsha/N/ZCXTvK1a76lmapCPsQuZ0MWIjL
         kK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783152979; x=1783757779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TH3+2uge2X7v89K7Klwz73DAfKLAbdik2q1vKZDeHZI=;
        b=oX2sgdwm3NRJyO18gr3ztUhezAsF1N82R+Iut1niYxD42/5P0qcA211yzF3TTCBg+y
         HVOjWrrsHIO8p0jsWwc8DbhQ0OIUnow33ibFLS594yAv9vPiZd6FUYydsjljRZS/h11d
         rm3yKpXRCVkCtwP1/hsu+Z04QXisJLWRTzBtyxvZs10/u0E2h2d3Jdzdpz9zCp9wfrcK
         Xx03HnXk4phoA7cPxlAAdiVBdATPM+/lxNCgtYe6Tost4nmadV1vlE+UkOF/OWVuDzW9
         P8h5bEmbWX7ENchMeVsoPiU3V4PbQ6Mi4mgioGRTFY1Id8gcKdlj136s2XTqfB9ik3yz
         CL2g==
X-Forwarded-Encrypted: i=1; AHgh+RrHChdNV+VsXgLA9bhxJHmbR66wRksE5r00g70R2N7Ll67ZiUZ5bvlZa8+/wGNfcKDDWKmhwHp/e1HaiK9U@lists.linux.dev
X-Gm-Message-State: AOJu0YwatMo8Irh3kH9kr723+I1mnmP5ln22qH3UiTBW86HprJb/lOpM
	rCpPl8RUlcv1L/9jINvgRZUfJJPlg+m4f8wkMdTsIvfaPI5XUnIynW0e
X-Gm-Gg: AfdE7cnNjpyopDKxGGxsRsZdTnOaLPsfkJ4zqMVxOK8ZYQ1z3jOaX550kSmqidelBh1
	Avxs4zAaPZzbMBafVUnnPSWaO4io1J95xWmOm6SIChwYeaDMiOWSxNZKi+42Q0GlVtGdfYdRGY7
	K82EXC4+hQxkYOrn0GSpR3U0rmn78TthfQdQYbqY2Q0utP49ejm9j9IaLASRb3tai6tUjNYVyda
	iH7UVC6plx/Fw0LsPF+kjk2P6r5lu9nX6IPrabGWHzjMKwPasgdB6XAUv8r1UfCT6ZRCdhvBL90
	WARuKG6Rq4HLTWKc6io+kn1rE1RcsKeBnANEJhDkRk330es5gEpZTB3yqUoptku9WBBn807gvH0
	C5mDVsNTJes4jcpx42MWlTcIk4FUhFW7X4RRA4YLoNR4QuNYcb/jbqZ8oMp709OJWFvY5yvcU3J
	bUATSHeXyNagTuOpdXApBQXwkLgBtiHRnkzQ==
X-Received: by 2002:a17:90b:5890:b0:37f:9ce1:7364 with SMTP id 98e67ed59e1d1-3829f4f0600mr2732468a91.26.1783152978511;
        Sat, 04 Jul 2026 01:16:18 -0700 (PDT)
Received: from Alvin.tail8ccd9a.ts.net ([101.12.233.227])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38127ca8046sm2112322a91.13.2026.07.04.01.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 01:16:18 -0700 (PDT)
From: Hao-Qun Huang <alvinhuang0603@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Viresh Kumar <vireshk@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] staging: greybus: hid: fix SET_REPORT return value
Date: Sat,  4 Jul 2026 16:16:13 +0800
Message-ID: <20260704081613.434445-1-alvinhuang0603@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__gb_hid_output_raw_report() stores the result of gb_hid_set_report()
in ret and even adjusts it to account for the report ID byte, but then
always returns 0.

This hides Greybus transport errors from HID_REQ_SET_REPORT callers,
and makes hidraw report zero bytes written to user space on success,
although hid_hw_raw_request() is expected to return the number of
bytes transferred or a negative errno. The sibling GET_REPORT path,
__gb_hid_get_raw_report(), already follows this convention.

Return ret like the other HID transport drivers do.

Fixes: 96eab779e198 ("greybus: hid: add HID class driver")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-fable-5
Signed-off-by: Hao-Qun Huang <alvinhuang0603@gmail.com>
---
diff --git a/drivers/staging/greybus/hid.c b/drivers/staging/greybus/hid.c
index f1f9f6fbc00e..1d7186eecd23 100644
--- a/drivers/staging/greybus/hid.c
+++ b/drivers/staging/greybus/hid.c
@@ -256,7 +256,7 @@ static int __gb_hid_output_raw_report(struct hid_device *hid, __u8 *buf,
 	if (report_id && ret >= 0)
 		ret++; /* add report_id to the number of transferred bytes */
 
-	return 0;
+	return ret;
 }
 
 static int gb_hid_raw_request(struct hid_device *hid, unsigned char reportnum,
