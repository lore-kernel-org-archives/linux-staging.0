Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26BD27702
	for <linux-staging@lists.linux.dev>; Tue, 24 Dec 2024 05:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735017567; cv=none; b=mSM/qVEe5rPpXjxiCet+Mc6sYTYzv2GrFHI2T1bhby6qbTcQ1ulL7ioT6vZMW2Aoo83z1iKMtEQGc53TWRDItP6IPcXITwW4o000JCIWeNXa4lyoGckke0UVPFkeaWx58Hdb7PusglNPDJJnX5WWcCAN/vt2GdL0cRbW2ARvIAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735017567; c=relaxed/simple;
	bh=PvqMX5vTidA0r0PT5vyvl95UbhSddWRNtrjhBOqE2g0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FQ3Qti+0h3vplwPMXmFDPRB2p3OtUXxbQLyz0fSL8glLO2bld/7As8JYB1755rq3IZf6VoSlaUhoGyTnig2NjoNet7oMMchz79rUGkwrHuIrCFM9094u62vJ9k82N6fZvKZTY4QkDM/dAMlVwY84bCE/MFrT7V8aFD4zIAqoGxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GWn/8V/N; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GWn/8V/N"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2f43da61ba9so4117657a91.2
        for <linux-staging@lists.linux.dev>; Mon, 23 Dec 2024 21:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735017565; x=1735622365; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PvqMX5vTidA0r0PT5vyvl95UbhSddWRNtrjhBOqE2g0=;
        b=GWn/8V/N5qY5n1h5oIwAi4VBBeaj5DV9o+WVdtvkt6AXaWPrM/JOrv8IhftwVGRPQZ
         4scNG8edc7E/tSZnhvypeQlZepSFbR59n29azTqu5Ppa5b/7ljxqdhnj/zySLF8jPlv4
         FWWwf9rpaNnDoRyppky9CT5ljEC6yuuqpBZfIwLADn9k+hM+/KwObWIwRFjmr1zW8zw1
         q/jrLdbHmqk00mwJhJIKjzigc70GpKnBVgLd9PWPfED7A2LcF44Cmqf7O0iQz41eN5or
         Q9jU/tkG/AvHfJViIF3qtD5cj2WhqbS4K4TnXnGFAacWuuBzH9/D/sFUFSi+Pjnil9n/
         vowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735017565; x=1735622365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PvqMX5vTidA0r0PT5vyvl95UbhSddWRNtrjhBOqE2g0=;
        b=FweSb+rlP+ELo4AAEZ2toxfBFRKDftN57tRRCjZTAEim2n/a0RUxvCktdy+mtQDKK9
         VvCLr5O0NMI8fb5TVkL9KTZY0KBQi65O8wMHCSAN148jlH/9/MmNj8O9uplTAghzB6R/
         AhQhI3YCSMHujMVw/W2OqgCV8lsVP0HxqBiMbBqaADM9aGHKPcOKxjbxc+CygrV7wdWN
         QoPM6uDr5dheJOqxfLZ43oQoXE4YzwPx1y8pZeGEQ53SU5v1c5nqvSF8A4T35fhwuAfJ
         0ryjJYuFqFRclU9R9PJav7ljkmqgXCBsIZnH6wIMMt31Y5Z5pWomBQxwthYsudex5bVk
         mJ8Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0avYJewmOgcZEb5ByIqNYAys7CYgfRcLisrNrKyA1inRQimIw/8VRQFmxDbCboe+0GwYztZ3qFtTjN1V4@lists.linux.dev
X-Gm-Message-State: AOJu0YwjXYanGtWmAahxzXwX34S/0Xn8Cj1GaS9G0n+gq/qz5Jd78wsV
	X6HTyMFq8FVqwqRreCkBkfXfwG9/V8FzofIE+1slDn9rYDV2LFvg
X-Gm-Gg: ASbGncv5S9nZKb4CXcLmTJ1ndtw3ws1iyDV1ZyaREXum2TkP6ZvqxAfnFvJH9ov0dL/
	sfIrYLZs7f6LTNpd3+i/jTR2mL5gsRJxT4oZ9pgUH5aEaNKYcokTN42GdenLG7sVyIQawtI2ItH
	VPWd8dQrr2HF9FWQpOP2v+4VJld1XxUvczKKOw0hZ7pxucMpeLMK6B1rTeFWMM6mthY4lhv9BTe
	h0DlVB2MxF9oi4V3IV7vBVsUkwEM/PfUDjqx0AwHhiAMJDeqZZSzIZtooGoGBUmrLDwY6JLPg==
X-Google-Smtp-Source: AGHT+IG2t2HpVyZOO0iUJzYs8b8yo+wFxdVO/z2ldSJ9Fcjw9+djqM2xvShshxLjXt4t7GicBeuR1A==
X-Received: by 2002:a17:90b:1346:b0:2ee:ba0c:1726 with SMTP id 98e67ed59e1d1-2f452eeb5c8mr20192393a91.34.1735017565049;
        Mon, 23 Dec 2024 21:19:25 -0800 (PST)
Received: from localhost.localdomain ([106.208.149.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f5046sm82343955ad.179.2024.12.23.21.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 21:19:24 -0800 (PST)
From: Atharva Tiwari <evepolonium@gmail.com>
To: gregkh@linuxfoundation.org
Cc: elder@kernel.org,
	evepolonium@gmail.com,
	greybus-dev@lists.linaro.org,
	johan@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mgreer@animalcreek.com,
	vaibhav.sr@gmail.com
Subject: [PATCH] staging: greybus: Remove Module from list before freeing in gb_audio_module_release
Date: Tue, 24 Dec 2024 10:49:17 +0530
Message-Id: <20241224051917.1971-1-evepolonium@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <2024122358-vexingly-broadly-7df7@gregkh>
References: <2024122358-vexingly-broadly-7df7@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Yes I have tested the patch with greybus drivers enabled on Debian 12.It works as expected, and i did not get any errors or warning during the compilation

Please let me know if further changes are required.

Best regards,
Atharva Tiwari
