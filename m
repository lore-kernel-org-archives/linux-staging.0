Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511E6223311
	for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 17:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744997709; cv=none; b=TqAcoe5wPO79UIseDLDaGwNB/90eDBF3nRHwctpHqOE3TgRocEU5oygiagpMfFvVDYOJLo5gVhCnWM2wRznmwEb5eFa2JhA6eccQZJlEYuLXRO7Ekk5JsFNUPJzaAaa8hAFdmbrSiRDXVjrpzy7NidJDvWrwQbTgtFRWKgl5tP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744997709; c=relaxed/simple;
	bh=LDThIiFsWtW7LNFAZQNVxUPP1fREV6zlJNSL4JVrM5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G88Eho+KTgBP3nj41FuDvQk3xMvl47MNhZu2J9RObj5YAGIICdvOGX10u976nGP2r3gfVrFUudBn+PUdUKm/28GctnV/hsPLOey1QdcI4ju6yLzQol5p+ExR8jTfwvv0QPUM1ZNzQ9Ah0mUp+mXn3ZLhOoDmL6xbt6Z7AgWlt5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BnZiHfXf; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BnZiHfXf"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39c0dfba946so1316652f8f.3
        for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 10:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744997706; x=1745602506; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csArHKuBMKX8dfUeq28zUks4GtsX2v0W8y/LTpEF+/U=;
        b=BnZiHfXfNYqD1Qbm0d9wA+VJvpjxo1pfFg4Oyvw5NnEl2z/aRN0wujvYRDLdvDu+nb
         mEJscwBXC+lncyY9FUOjSxM0VJ4ipkQzsF9qv4C4GtTLdNmU+seayChyKOJtmwZs2ap/
         DK8c8y+z9Y8oC5Zoy6Xe1+8VyZfxbzfoxCMkKeyaeBtXHcSUQPPXghxkIVQTaI+jZT9j
         FqLLrEGJvXkEKN/fq39pxEkIbVkfO7UI5yRSGnqULF3Tpdgf5uEQFkKEWl9834BNx/IF
         JXZFgQnfcQaQKFdnESlKhjkBNx7qRiMIDWmsjZxAEaRyNyQbEZduDXgsQJsBhwBJPHuO
         uECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744997706; x=1745602506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=csArHKuBMKX8dfUeq28zUks4GtsX2v0W8y/LTpEF+/U=;
        b=jtA4jEjexths7airfWFel+Dib+u3q3yT2WZnNJVcBVwuVIJAVyxcMc27Ckk2NwwuFZ
         al+97xDy/cMLxzARfAml3dR7Zxw8zILfYN35i/CCGDAOF7BN0NPk3qRK4wo4lN8nsDaM
         2hfUUSAgEHDXnRJwxnIdmgFMyPsFA4dzH2GcOXvCUR0pgRM+pva454Rn3a+X/+qsu0Xf
         obAxcJ+EgbKPnzMv3BaShRWjglXV9MAHPfJRjCWF6q5VY23z/YBmzgvUTMvTfMEnXcXx
         Qg8WvJdmGnOHTXxdp/8Azcvcpzv7lKc2F3g84MqlJstl9OeIuwKzol/BG0rEfO3ImBqG
         RhUA==
X-Forwarded-Encrypted: i=1; AJvYcCUwawAhgNKJieH4yLwsAuUk4geBiLtEd4hQRJsGQj7gEBFsTLMcTxzOZxT0Yvdd4y/4izkhj9P3/Ls2+jck@lists.linux.dev
X-Gm-Message-State: AOJu0YzjCAXnDMtcZxmpT80opi6erd19c5/IsQwRqdbkNDT2MtWWWHFN
	wJoiKYUINRjYMfqrbDLLo1mYpY50HrNMDX/Khe9AF9yNKlV6mT55
X-Gm-Gg: ASbGncsyAyKZdFlLMRXnDRJKU75mvdmwXhqs4JLFOx0g/8XVfoqkegMe5eopevUvN6+
	7glZctRMgTVUeMr+G7kpTyyZdBA+DB5ciARL4yQb+jBhb7QdHZo1NXFkTebSKnwlx9RiYdaoAPb
	kwLHV9NssOFZMPdf0/EX7mrR0uMsIypUkV028s0b9ucdER55IFEbcJ71hKeAf+QkkowhJUwS2qz
	19xH7F3yNYYlwaGxGZzEHGwFVeF0YtwbHyyZG5ui9pSoRvW9nxV2wiKITFjgEulgZrrOZMRCKPX
	fNBSGBdNMpEXOlPYULWffSVh0rBtOLvZYkPiymXI3FGjto8ssrSvVzzQsiPsfITuN9BecN4c9Tw
	A
X-Google-Smtp-Source: AGHT+IGthIenlsGwjtshWXOrozso53tzfubQVslTvO6z3gNHpw83s4dbK5+maUlUJ6SvkuAZFIAF4w==
X-Received: by 2002:a05:6000:2913:b0:39e:f641:c43 with SMTP id ffacd0b85a97d-39efbaf689bmr2763752f8f.53.1744997705477;
        Fri, 18 Apr 2025 10:35:05 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4332f8sm3287320f8f.40.2025.04.18.10.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 10:35:05 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: marcello.carla@gmx.com,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 8/8] staging: gpib: Set control lines in attach
Date: Fri, 18 Apr 2025 19:34:34 +0200
Message-ID: <20250418173434.2892-9-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418173434.2892-1-dpenkler@gmail.com>
References: <20250418173434.2892-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the driver is attached the state of the main control lines
is not defined and can lead to hangs. Set the control lines to
a known state (logic false).

Fixes: 4cd654f84769 ("staging: gpib: Add gpio bitbang GPIB driver")
Tested-by: Dave Penkler <dpenkler@gmail.com>
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/gpio/gpib_bitbang.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 5c134cfb6d61..625fef24a0bf 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -1262,6 +1262,10 @@ static int bb_attach(struct gpib_board *board, const struct gpib_board_config *c
 		gpiod_direction_output(TE, 1);
 		gpiod_direction_output(PE, 1);
 	}
+/* Set main control lines to a known state */
+	gpiod_direction_output(IFC, 1);
+	gpiod_direction_output(REN, 1);
+	gpiod_direction_output(_ATN, 1);
 
 	if (strcmp(PINMAP_2, pin_map) == 0) { /* YOGA: enable level shifters */
 		gpiod_direction_output(YOGA_ENABLE, 1);
-- 
2.49.0

