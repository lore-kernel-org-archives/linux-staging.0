Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D6C20D4F2
	for <linux-staging@lists.linux.dev>; Thu,  1 May 2025 21:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746135045; cv=none; b=OVrU9Zpfd2wgtvyTiK+v0RQNzhKIeXkyKnJel0276JsdTYpfYyFxsZ9Bq4YlR96GFr2VtuEX1bgojl9GM187F21kfMoTr0OyGHfnyRYgPEkRO8Rq4JwPKKtDnKhFohwbZlmyIrL0RtTWulO1ltQIg3FZCSuIyxfubcZZeA3Tqa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746135045; c=relaxed/simple;
	bh=yhYCmS8IVoXo1p7mRguldiGQwoQVGa85dcolwS17S80=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J0X9+MYI6bAf24A6JBagZIsz57REYX7blHFb/sXy12bNhsVW/fVvJB0cCcNgVbcNz3TYYU0eLZK2bMOe2+DrB88fSCfjdAYyfe9xUb9QtB9oND3VQAUlLxuZDg8F+smDC15PC55k8WPdjn2p7WF3OhHG+86PxWJG85UiuOSMAz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CoLTNJg/; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CoLTNJg/"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac339f53df9so291401466b.1
        for <linux-staging@lists.linux.dev>; Thu, 01 May 2025 14:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746135041; x=1746739841; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xAPg97rlsRsbrLSpiR27c6dVk7oaQrfXRDJd8fOaN9Q=;
        b=CoLTNJg/0bl1bc0iOY/IE3mWUIVE6kKbjf3ZRH4FEibV43AMDVhfEA1dNr3WG+dB4Q
         580acW4iFM/x8HSob5Iv6VA7rzcqtKi7ybUhL2F/3COsNyrSvJpQiE8jgvzo+aCUYlQe
         fzGzjUWxwhJxLOHh1i9r4vFJkoas8RpDyfiIIJQ8yOiJ/I/dVFzLn7S3jcmgWonNwlhv
         udf4qJir6FOYKEc5LvRFr9VZEdXtXob87b5vaAlg9MeVTZHYtPX4CYKFRO2aQdmH01eN
         5nheH+/hSdTT9F89LqKTmgtHPDmyj5PvpbgCZMWaGy4M6vx1MpnCQT0ZDAemfcy1p8+p
         CtsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746135041; x=1746739841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xAPg97rlsRsbrLSpiR27c6dVk7oaQrfXRDJd8fOaN9Q=;
        b=RhhsY9BITVJNYpTl8lTKqLX0Z+f5J2VcJe0XhnMMzXMMrO4DNM4Xo9hbGXFfaGSHZW
         I8Lib5wKP/2b/5eqDZHrV/T/M7kJIj2mmg501z41gcMlooa73hqZvoZPhf4+QE3g6MpP
         kZBatwatNfNEfIwpz0pkp4km20UWg4QdYV7wVpgcFgr3qj0eSRt+OU4JqAOxYdP2Gg07
         Q1BSD9sJSSeohECvBuShHp1elAZvda9sEh9sgGiGyUsONnQb8gMcOJeWL+WvTza4h38i
         T6XawAhKu8C2m5Fa4DfaFlKbcB3xYLWw4wimpFXy63jHnn1o4piat/W58lR3wlegwjty
         DLcA==
X-Forwarded-Encrypted: i=1; AJvYcCUc/fxDYL+Cmkepqav+QX1T4V6ezx7SpaJ49lOvYj7lpV8v5j3grjYeMVWcp/TK/rznfQTGBRXu1FiXdW8D@lists.linux.dev
X-Gm-Message-State: AOJu0YxkRWRaCUH8FN6lkIHgu3R0rZv8rAiMIRSY4ulAg2hLhcUZlR4V
	reC1CMgEGsoo7C7gF4/7zneA5YwFURj48XXl5o4t24DQZkZ02ak4
X-Gm-Gg: ASbGnctxA10eQu78iRgV3UUqqAdGcqafuSUdClK4UF7/PLWsLg99iBA1B7LRQRSqErm
	85fn5opVgWcUt8soVFtkry7KC3ZVCBJltAM2762kjki5OaoRgsBDayxqhMYrwJdJLqnAL4X2RvO
	qnUB6/G+yRa811ex/0WuKsufCG0P12x/SkJ8sAFoTH6jEvDfv+jkeU13+UA2ee9jMJhkAG10RFX
	EIa52K+dtxS1S9ZlVUOLJMuVXLvo3B4Wqt8/tqsVLB5Z1+aUAzpuXF94vHGocECxqbwWqIAfch9
	bP+c9iAtr64sYxqE3qqgJjT535qkcg5wh17XxxSlP1Qlr4kdCP/wl71jtn+UH1YHKIkIsZXhZ5F
	LSPgPVkRH5dALdVYRLJ5q/MnhubpbKZ/tlM8SY5txdLO30/ZXCiogzKeCQtJIZKaOj3A99xpNYO
	+BwQ==
X-Google-Smtp-Source: AGHT+IHZwkIMNHb7vmuhFcwg+PFYsQ5Nh9aKpaqDy7Dh25DUh58mjbcCXEQIa8W0R9RKqNzY5rec3w==
X-Received: by 2002:a17:907:9717:b0:acb:5ec4:e944 with SMTP id a640c23a62f3a-ad17ad81e27mr73901166b.15.1746135040517;
        Thu, 01 May 2025 14:30:40 -0700 (PDT)
Received: from chimera.arnhem.chello.nl (2001-1c08-0706-8b00-41fd-2957-14cb-eff7.cable.dynamic.v6.ziggo.nl. [2001:1c08:706:8b00:41fd:2957:14cb:eff7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da560a63sm96466866b.139.2025.05.01.14.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 14:30:40 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: [PATCH 2/8] Staging: gpib: Updated return type `request_system_control`
Date: Thu,  1 May 2025 23:30:31 +0200
Message-Id: <28632a0bf5275553e929e8699830377069e921fa.1746133676.git.thomas.andreatta2000@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1746133676.git.thomas.andreatta2000@gmail.com>
References: <cover.1746133676.git.thomas.andreatta2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update `request_system_control` type from void to int.

Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
---
 drivers/staging/gpib/include/gpib_types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
index 2d9b9be683f8..4c28f35606ef 100644
--- a/drivers/staging/gpib/include/gpib_types.h
+++ b/drivers/staging/gpib/include/gpib_types.h
@@ -93,7 +93,7 @@ struct gpib_interface_struct {
 	 */
 	int (*go_to_standby)(struct gpib_board *board);
 	/* request/release control of the IFC and REN lines (system controller) */
-	void (*request_system_control)(struct gpib_board *board, int request_control);
+	int (*request_system_control)(struct gpib_board *board, int request_control);
 	/* Asserts or de-asserts 'interface clear' (IFC) depending on
 	 * boolean value of 'assert'
 	 */
-- 
2.34.1

