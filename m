Received: from out-2z4y-a144.jellyfish.systems (out-2z4y-a144.jellyfish.systems [198.54.127.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28540357D02
	for <linux-staging@lists.linux.dev>; Mon,  5 Oct 2026 06:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791182136; cv=none; b=sTVmgvfSpiQzYoHt8R3H9Y26ctWzdO3uuyVY3FpA9aBJjDPFkPMIqvQ9iqRU1V7YedR2FTuBRG17Cbi/EZVx4+Knt8kgJbTIG7HjYGrrjoCRpf7gq8Rat0cLpHyIb5mtsofbhZMubmDlL3quJ82Vykn7jJWAlp122D/flNtX2+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791182136; c=relaxed/simple;
	bh=PTGmCC+ctpZ97bVZ6YQzHtRjaWdcVXGe8ToSu8hMtbY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vEf/H/aSdopSa1EAPvZMKyJ8u3N4YU9DQMKoM8WvKDe0TPFvhUBYmzDTlvVUqEILTO42rXKhBGRQExpoMYYBlhk4zQ/u9BLywJpUfoFqNDRmsUiyh+8UgNKA/1TqN7Qre5MGL439P3Bj8+lLihkTVnHDNB7BFHKz/5PPYTxLpbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=firmwaredesign.org; spf=pass smtp.mailfrom=firmwaredesign.org; dkim=pass (2048-bit key) header.d=firmwaredesign.org header.i=@firmwaredesign.org header.b=lTefF8Ij; arc=none smtp.client-ip=198.54.127.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=firmwaredesign.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=firmwaredesign.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=firmwaredesign.org header.i=@firmwaredesign.org header.b="lTefF8Ij"
Received: from mail.privateemail.com (unknown [98.240.242.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4hyqPr5qy1zyN8;
	Mon, 05 Oct 2026 06:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=firmwaredesign.org;
	s=privateemail; t=1791182113;
	bh=nL4DI4IWdUkdgB4IvlHz3lx6yiOYEXyRIDxV95zcaYw=;
	h=From:To:Cc:Subject:Date:From;
	b=lTefF8IjJ8vVeRD6sQ+eAmDk4uspLBBcldAr4OmIzpNNP0jmmcf4Xo4Go9QH9XZF/
	 slloVCEDjI4OACNTQqlI5W1rBL8d7qQ7tmVdpGFMAZJ5dCCLM35iZSFyHpE4XCG82g
	 Ej7TjPQjsTcbrmPI9+iW9E5TCTBn4/lzE34z24vdTZhfy7MCHy+9ciw8m0/G4ReEyg
	 wOn8LexF7uCuUIeuqBq7OlBWrYW5A+glTQ3CIEDIYgIgneYk5MX4CJbmYyma3gtRSB
	 gObaNBuUz/oMaKEO8brwuGfJO3HRQeEFZzZgd/dKW27j7z5R7Dx7FK+VS08LJoDzuV
	 5vTf9M/w6l53A==
From: Marinela Tatiana Selseth <marinela.selseth@firmwaredesign.org>
To: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marinela Tatiana Selseth <marinela.selseth@firmwaredesign.org>
Subject: [PATCH] staging: greybus: bootrom: fix null pointer dereference in get_firmware
Date: Mon,  5 Oct 2026 01:34:54 -0500
Message-ID: <20261005063454.95647-1-marinela.selseth@firmwaredesign.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: marinela.selseth@firmwaredesign.org

Automated static analysis via Coccinelle uncovered a potential null
pointer dereference and uninitialized stack pointer vulnerability
inside gb_bootrom_get_firmware().

The routine evaluates whether a firmware transmission sequence is
complete at its trailing 'queue_work:' label by checking if the
transfer bounds match 'fw->size'.
When this label is reached the 'fw' can be uninitialized or NULL.
Both scenarios expose the kernel to critical memory faults or null
pointer panics.

Fix these dual vulnerability paths by initializing the 'fw' pointer
to NULL at its top-level definition block and introducing an
explicit short-circuit guard condition to safely gate the
trailing size evaluation.

Assisted-by: Gemini
Signed-off-by: Marinela Tatiana Selseth <marinela.selseth@firmwaredesign.org>
---
 drivers/staging/greybus/bootrom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
index 83921d90c322..cead4b505f6c 100644
--- a/drivers/staging/greybus/bootrom.c
+++ b/drivers/staging/greybus/bootrom.c
@@ -241,7 +241,7 @@ static int gb_bootrom_firmware_size_request(struct gb_operation *op)
 static int gb_bootrom_get_firmware(struct gb_operation *op)
 {
 	struct gb_bootrom *bootrom = gb_connection_get_data(op->connection);
-	const struct firmware *fw;
+	const struct firmware *fw = NULL;
 	struct gb_bootrom_get_firmware_request *firmware_request;
 	struct device *dev = &op->connection->bundle->dev;
 	unsigned int offset, size;
@@ -298,7 +298,7 @@ static int gb_bootrom_get_firmware(struct gb_operation *op)
 
 queue_work:
 	/* Refresh timeout */
-	if (!ret && (offset + size == fw->size))
+	if (fw && !ret && (offset + size == fw->size))
 		next_request = NEXT_REQ_READY_TO_BOOT;
 	else
 		next_request = NEXT_REQ_GET_FIRMWARE;
-- 
2.43.0

