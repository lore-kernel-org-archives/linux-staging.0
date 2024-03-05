Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F4E537E9;
	Tue,  5 Mar 2024 09:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709630619; cv=none; b=JYLw+BaAf9ym/3s9JV/4ZKGTLqH2y11K/HV1gqPqgNZgZ5OKUm64ZJ8gwqUDyhqIMhgjf9XJ6y77M6lenQ1iFxYat42Fsh00aSelX0luiAglqWJvXRCOwqxZSlAynCq0xhAoN7gOUN/tBP+clvi+EFUm7MCehSUwQQxg743kx70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709630619; c=relaxed/simple;
	bh=CBNwkw1BxtvlXlFZjDFjkMRQM9L2AQaOHYoCCMYP9Nw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K/AVh7yvIjJL1ywlVt2WMM/Tco85Ii+AqLe9OcsT3sJ4HJZo8H0NEiwS9TxT5pZuESBfJ5bDuytf3CZ8P18H/GqdUgo0qLufGTpVP7ee0b31Jwk9DywTuagq1074KI0tfufiwi7oa87RtrH2Njh6EpTL1I+CkR0BifGQ0/YWQjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AO5xv/pR; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AO5xv/pR"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a4532f84144so249138966b.3;
        Tue, 05 Mar 2024 01:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709630616; x=1710235416; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xc8HhqMgjg816hbzsmDAagw3Ud1qy68pSp05gJwe/9I=;
        b=AO5xv/pRCAsg5B6uRL+00NjUwdt526RQf1GdtsEu2oAoMiX2VF8Jj44vOLJX4SDzHw
         KrBfQPMhPaKH6rKxt7we1ilyfqWneyHsDmY1NnVEXk12iS8ryYbdqrEBfxqF8zAJtyEy
         QGQYGSeD96qAzQbkYS4YXApRHr5+OuP3jg3NNBlwl/OePkL7jeAs1iNNBwWL7GfBbw9T
         sCzqvfwKduBidYpWyHYkqmbHu5hGf/YXzaJU6Depzr4mU8GUp9PJWIye/y6LerXycG3R
         YiPF2VwOG3rVvAO+K6ZBmYX9wkTVWC62UqsjAYpi3gbDJxqMqBttLj6m0NlgWj/s/cae
         gSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709630616; x=1710235416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xc8HhqMgjg816hbzsmDAagw3Ud1qy68pSp05gJwe/9I=;
        b=PXBEcrzLGUmlv6Q1W5JAI8Q8ecJoJD9Jr8kT17dqqEpEQquprY5YTCNQmcfuVZNA+w
         FcvXglKP8kZPV71xK//mr+TU0tcD5QR1q+aZWtN7vlneYzRoGYyqk/5oM3y9q281Wo8D
         X4pbiBZzBI/4L/v+5kPTXn4R/8q3P5fxdYJW0H8Ql3LCaWfXIS1y41Q+lXK89SR8EVof
         t62FRfrLsuwy/8GuQHWowKmmlnsq4Y8UHo0QMGGcPWRV2u2s2YDcWOEaWOJTzzPIKMpM
         7z6fksnVOpdTNuI/97s7wjmxchm5vYZoUzGiT0n8DTY0hLZ19kFXLe8CQKzO4c/CW/vy
         +keg==
X-Forwarded-Encrypted: i=1; AJvYcCU5avsX4Mnx7y9zqLEFxG21yF18SIdqU2Mcr/D2HFRnKD/GYk4R2ztPLMpIKvmyodCOoSXTOKLHjg9RLN2xZ8QXkdPu/u9TvAyDDCI63sWHw1fjWAsMLLII3t1FlmzUbiI8y2b6XjIaFA==
X-Gm-Message-State: AOJu0Yyro2tU/HwYBvhP8w+FS4+5rzljJpw6Bzrajkj0P1sAEbk4RNsW
	xImij/QKNLGoaF1pjZ9B1rPR9sTpc2r+DC3DFJHQzqXPgj2Wgd8w
X-Google-Smtp-Source: AGHT+IHK/Yuptsi8q61PZ8491EUJ6E9LTfVNHgenpWB656FL/0GufgKTZG8hm3P26tpW8+Gr1rTDyw==
X-Received: by 2002:a17:906:f750:b0:a3f:2b6f:6d57 with SMTP id jp16-20020a170906f75000b00a3f2b6f6d57mr7932702ejb.29.1709630616190;
        Tue, 05 Mar 2024 01:23:36 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id bx16-20020a170906a1d000b00a4588098c5esm1130650ejb.132.2024.03.05.01.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 01:23:35 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH v5] Staging: octeon: Match parenthesis alignment
Date: Tue,  5 Mar 2024 09:23:10 +0000
Message-Id: <20240305092310.3594-1-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240305051411.6431-1-dorine.a.tipo@gmail.com>
References: <20240305051411.6431-1-dorine.a.tipo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align the function parameters to silence a checkpatch warning.

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
Changelog:

V2: Fixed the warnings in the patch as suggested by
    <philipp.g.hortmann@gmail.com>

V3: Reworked this patch as a separate patchset as suggested by
    <dan.carpenter@linaro.org>

V4: Added a changelog at the bottom as suggested by
    <gregkh@linuxfoundation.org>

V5: Fixed the commit message

 drivers/staging/octeon/octeon-stubs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 3e7b92cd2e35..44cced319c11 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -1362,7 +1362,7 @@ static inline struct cvmx_wqe *cvmx_pow_work_request_sync(cvmx_pow_wait_t wait)
 }

 static inline int cvmx_spi_restart_interface(int interface,
-					cvmx_spi_mode_t mode, int timeout)
+					     cvmx_spi_mode_t mode, int timeout)
 {
 	return 0;
 }
--
2.25.1

