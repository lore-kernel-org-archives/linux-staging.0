Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794438103;
	b=lqjSdeGJ2ppOzaht9K1EHA7xpR5tBIuQ/QmBSYCVpVPIWt6V4XM+B3YCyLgTFEWHJZEJ
	 aZmIgs9QZPnyipGqQHw2rRx3j/DDTswNlpUYwOrtXQ5n9fEUMVoQZQFskeVL2YuEjESi9
	 dv9keLr5uD9O94a83GH85V3SVZaU41wGlm1BlNipg7UNwIm8NWjk6D8vKPIkL1GCVIh0A
	 J9hBtNyPUf5P7D/KobLU62+3n2CrftiuIzJt/yO676tYPfce+L2K6KwwlEB27VZc9hFTG
	 j8dKI8ViPaKtXaa5CA4reo/mo5cjWkToTK2ysdr2k6nZtzeTyW7p82pad5UH25EYtAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794438103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=L/DNryozJcI+bS61jpTo9uGJwCePakmBfNnW7ssrmHM=;
	b=wQMdrSr8MP7xDYLguP+Pkxujnf+KBhhRUC9HmIyOnHjFSm45wwP4Q91N9jawTzee+YFx
	 YVBDss/Z3tqD5253+uzqwbw8B2QcHh7XIporeSFD554g4szrxiJ2jP5UluS72alBKFJm4
	 raSD4tlwFrR4gw7b+xe2FQcuXRwMQVcffxMfrhH9M7ocnwR79FejMmxvoK9P2QBxpRyM+
	 NPT1U32yqlaSiG3YRCRReRPrxUnyumSowfasq5frKzk3TvuM2qEucr1Z8P8rbRACtXJPx
	 AHoaV8LevnWkUwA+CMwQup5jtDSKM78InGQaox9yfZZW1Mii/nZAFewyJWuBDxPNAFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oHXZnyve;
	arc=none smtp.remote-ip=74.125.225.73
Received: from mail-wr2-f9.google.com (mail-wr2-f9.google.com [74.125.225.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30811606A336
	for <linux-staging@lists.linux.dev>; Wed, 11 Nov 2026 23:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30811606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oHXZnyve
Received: by mail-wr2-f9.google.com with SMTP id ffacd0b85a97d-4912e5f330dso1626209f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 11 Nov 2026 15:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794438101; x=1795042901; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L/DNryozJcI+bS61jpTo9uGJwCePakmBfNnW7ssrmHM=;
        b=oHXZnyvezAgX5LnlgCmHgsUak2Hx5kBtQYkbnUpTOZ/lPMWd13cYpypazZontvQHHD
         CfZvL6Wb2h/lDnDd/NmoG0kkclVF4Jnf37nz4BqrDOY2F1sxGluHt8VcGvZO127Q22n/
         ZvGEIF8x8gpK2IL0ztPRodpt3t1D1I/tZjmUryGgmodW2NwRsb3F7+W8HACr0BpXbDmM
         gPu2J02BV4A7hGRnwXpnj9SbnzdMjNoduc5nDdOOQNj7EyaEkTluxPNS0FLpFe4vQYRg
         eqGb1aItF3yH6tMpzcKNnVkgeLxtHmzShDeWJ6zERo0q88qjCs/pOTcvJ5y8NBsCzXos
         8EJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794438101; x=1795042901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L/DNryozJcI+bS61jpTo9uGJwCePakmBfNnW7ssrmHM=;
        b=ppd2ViIDVGpUHzUat4j301dgKYDSjlBmIReaVpWKybisSI0SqEm1Wwf2v2CS8CFEvx
         peNVK/F+rd083FXu4LKjdaobc0cBKhLvj7UPMg5WSFHO1LpCeK8I87p86Mse2+kHG37T
         ARUCc9W7PGAEmLTcsrbge6Bt1TRHyO6XR1fAwd+2d39i993QxONLldaaCqhTBIJ5qUBT
         JCGLVqdO0oyD2vfIL2EjkuRpUfNupEqK/5k69ltrUCRCcvJfwYS/UPUw/RBCHArgDOEN
         1OeGY1XttJSHiyXk9CN61qql+2fqCbr6DR3L0WpU0ltILsjZHBX4l88Iqes71k/wT48b
         U/sQ==
X-Gm-Message-State: APuU4Z/FUwazGqI6TXeHJ7fpx+QUuOo4/Qr+NQVrLefzj4ACCjYHd/FH
	jYuyhHRRCMEQ8M9ENiuX6MGD7vrK8Ro0Rguv53zhbb34ubq8IdkXRGM8
X-Gm-Gg: AYBFou30ADeFYEgwdM5o1S3wXorfnb+rqMwGi319nNYiv7SoDdKDKMZXFvKof5bLnKo
	z0lug406MsY5GqS3fuveIKgzyjOtSKaw1hVnD1Wt6II3qO2r74F702KcbyQIhmo/swBHL86V8q1
	thQjUF5H1gH4b2BMYGLTy4GN+vlamMZ3hB+EAGEsPPvmHdaRu/b8JSc8a2+184eU1a1hfaVNt/z
	JiGPyLz/4PGrTXUOzdrkt0Dbw+ZtTPaiUnOSO+Yhrlre6Sa1JcZmgT16imlEm0KSi8OOqwRaFDo
	e/MQYRVDyvSbrVpHAQuPsP5xqCZ4wJIWlxYi400JsOdEElzxiQ+0sYZLuA612nGshufHxWOFD6H
	loA/vq7TNENhPO3mA7ymLwZHyzv3awey76z4ENxDB/Z4v3L2P3fXdX70kY4zn6hWNgAMGZijFCJ
	wJwycJw6r9vcKHNVSSy+4arii2hbwjQ4hwwEuB0TFR0mKx4cfy86nxoe/V8uBReOR/K7clmYtFl
	UczbrfuBrQCfUojyG9qLt5G0uuFy/Z4o3/zVB2Up81+atiMchm2Nfotgs0eErR8JK6StRJkG57z
	Czywxoztd7LFk/wF0ZI7aFcCQQbDoP/1hInu
X-Received: by 2002:a05:600c:64c6:b0:4a1:e69d:90e8 with SMTP id 5b1f17b1804b1-4ba0937fedcmr69091665e9.22.1794438101294;
        Wed, 11 Nov 2026 15:01:41 -0800 (PST)
Received: from cachyos-x8664 ([105.98.136.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e265a0csm22047415e9.9.2026.11.11.15.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 15:01:40 -0800 (PST)
From: Mohamed Anis Ben Azza <benazzaanis783@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marc Dietrich <marvin24@gmx.de>
Cc: linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	ac100@lists.launchpad.net,
	linux-kernel@vger.kernel.org,
	Mohamed Anis Ben Azza <benazzaanis783@gmail.com>
Subject: [PATCH] staging: nvec: kbd: bound keycode table lookups
Date: Thu, 12 Nov 2026 01:01:34 +0200
Message-ID: <20261111230134.200561-1-benazzaanis783@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nvec_keys_notifier() indexes code_tabs[_size][code] using values taken
directly from the embedded controller's event message without checking
them against the tables:

 - _size is a 2-bit field (0..3) from the message header, but code_tabs[]
   only has entries for NVEC_2BYTES and NVEC_3BYTES. NVEC_VAR_SIZE is
   rejected, but the reserved encoding 3 is not, so code_tabs[3] reads a
   pointer past the end of the array and then dereferences it.

 - code is msg[1] & 0x7f (0..127), but code_tab_102us[] has only 126
   entries and extcode_tab_us102[] only 110, so scancodes at or above
   those sizes read past the end of the tables.

Reject any size encoding without a table and any scancode beyond the
end of the selected table, dropping the event as is already done for
the power button.

This only matters for an EC that sends malformed or out-of-spec
events, so it is a robustness fix rather than a security issue.

The issue was found and the fix drafted with the help of an AI coding
assistant (Claude). It was compile-tested with
ARCH=arm LLVM=1 tegra_defconfig + MFD_NVEC/KEYBOARD_NVEC at W=1 with no
new warnings, and the lookup logic was exercised in a userspace harness
under AddressSanitizer for all 4 size encodings x 256 scancodes: the old
code reports a global-buffer-overflow, the new code none. It has not
been tested on real Tegra/AC100 hardware.

Fixes: 32890b983086 ("Staging: initial version of the nvec driver")
Signed-off-by: Mohamed Anis Ben Azza <benazzaanis783@gmail.com>
---
 drivers/staging/nvec/nvec_kbd.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec_kbd.c b/drivers/staging/nvec/nvec_kbd.c
index d2b91318f..9b976f0f5 100644
--- a/drivers/staging/nvec/nvec_kbd.c
+++ b/drivers/staging/nvec/nvec_kbd.c
@@ -28,6 +28,11 @@ enum kbd_subcmds {
 static unsigned char keycodes[ARRAY_SIZE(code_tab_102us)
 			      + ARRAY_SIZE(extcode_tab_us102)];
 
+static const unsigned int code_tab_sizes[] = {
+	ARRAY_SIZE(code_tab_102us),
+	ARRAY_SIZE(extcode_tab_us102),
+};
+
 struct nvec_keys {
 	struct input_dev *input;
 	struct notifier_block notifier;
@@ -59,8 +64,11 @@ static int nvec_keys_notifier(struct notifier_block *nb,
 	if (event_type == NVEC_KB_EVT) {
 		int _size = (msg[0] & (3 << 5)) >> 5;
 
-/* power on/off button */
-		if (_size == NVEC_VAR_SIZE)
+		/*
+		 * NVEC_VAR_SIZE is the power on/off button; the fourth
+		 * encoding is reserved. Neither has a keycode table.
+		 */
+		if (_size >= ARRAY_SIZE(code_tabs))
 			return NOTIFY_STOP;
 
 		if (_size == NVEC_3BYTES)
@@ -69,6 +77,9 @@ static int nvec_keys_notifier(struct notifier_block *nb,
 		code = msg[1] & 0x7f;
 		state = msg[1] & 0x80;
 
+		if (code >= code_tab_sizes[_size])
+			return NOTIFY_STOP;
+
 		if (code_tabs[_size][code] == KEY_CAPSLOCK && state)
 			nvec_kbd_toggle_led();
 
-- 
2.56.0

