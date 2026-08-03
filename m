Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC87283CB5
	for <linux-staging@lists.linux.dev>; Mon,  3 Aug 2026 04:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785730181; cv=none; b=aExZUa+OJSPTRmP51H7PUMrdlZ6omxpx235Oql3cQn3DL/V2W05xfvIuxJU0fTbL9WepZ2Gr5KH10ZNsn34krTIXK39P8vtb8w30MQCxBF2QTPo//CbRl6h1vv/CIijC2gOYrVwYR7SuL4p4432HqvGzyX52w+EDNWLMzp9JXyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785730181; c=relaxed/simple;
	bh=qdkgC7X8xsrVxxAJvBjGSGkn09CNoMf1XaeV8l/xSZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sUsW6ApXCZfKJYSEN/bS3aNb4Zl8cJnpwO4eT2yRREiZFRXQjMtiKX7fvyrORn/1JJCM+Za81yjJ/HUTyjios4ZCRXskUi59Nii2p5+GndvyJrXTvkmyiNAjbHUP0sN8e46DTy5SRannXv/uetY3fmB7V9cWBL1qeNNCG3drqxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QW+jiLX5; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QW+jiLX5"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5bf9506704fso771880e0c.2
        for <linux-staging@lists.linux.dev>; Sun, 02 Aug 2026 21:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785730178; x=1786334978; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EDVVXgDFGwdwAJNFq0Lnv/4zVTHHlmavZdUyT2s7HFQ=;
        b=QW+jiLX5N4HCzAmFI7arEURAFUZLqP4gxys9ulD1GB2+IL5LwroHBqXpDBI6YqOgki
         KNQgm+jnGyZPkb7L8wceF5E32w6Lytu9YeyLKl9wYMzvnhXIKlSE7rckjNcXJZegBXvI
         C4yDyoPwGm/ep2HibFR/rNk+iyNV67BYyNkJbsZgM1HdUpED9pjGPFW/fGrl5r6tFffX
         KzydbDfv4V2LwFLb1ccT0WbWEsob/PY9xYy3mPVxNIfQzpLnM1UsTaRsE02HqwAwSP+4
         uUAq1L8PpAIRBO8aGm5cI8lErabwkamnpaf7vrd/q0fKSEk3G6id17lp6vaSartGX1WN
         KMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785730178; x=1786334978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EDVVXgDFGwdwAJNFq0Lnv/4zVTHHlmavZdUyT2s7HFQ=;
        b=bMH7fQHk1BkSkPvXPofJS4MvxDK/2a7NitwrA8FEAJN4vZapYbh3/pVndaFrEV6aT3
         l6CPQbgBY2SiFaD/WWAfy4aZJODQ9nyALB71vMctFcmWvhQ4/6lx2KNpdT2WgpZrWKPs
         DQjXpxzS1MT+yG0euYkx48H2LtjrTk8w+QHCea+DN0q8wt/TLOWFWfhMJXczilGbH5Ze
         pZ/mzHlSSI64zUr8mqK54JeL23SBwFB6N0sRM70JLfGoqFEm1/jFVdLyOKfFDkUeU+mu
         a7yTOMvROqekxIR7KcKNYBxuzP+yQBGdMNMx+TJAzbZwU3F16J5OIRAk9Uf7aNx30wmR
         J/Cg==
X-Forwarded-Encrypted: i=1; AHgh+Rq2+0VL+ca/1jmotb/y4D97v75x2JdqdH+uaBkZ1NEKGRr5W2fHjQVfYW2mVkX1sc636h9vAZGG1A/wVb/m@lists.linux.dev
X-Gm-Message-State: AOJu0YzvdybNw6bv1SLL5Uoz9owABZZjSJZNV2O/ZI3uo/Wa565L6Ht/
	AcNS0n3Excqy6cXguYoV5ygKHz5QJ2kk838FFaIHE0BG5rHzFPQRZy05
X-Gm-Gg: AR+sD10gJ3/i++7ojIZ7criAob52lFTSnPy1l9qQp4DcPVXqc9VSZIAHMNF4lHQ2TXf
	EAAWlq6pGI/48uBte38OztLmqGqdHooYrUu+zyAXg7+lTuO9463KwhS75nW/JthTBIp6wKFIaPH
	BNvf2xg4jqAxG1Sp2+kTF2Ds8YlhbCO1kT5eLPvjL/bNO0EXYIaOqw05GptCzl9n0uqIyhaBw/T
	Ypq7JPs1OT0llAAEuaccNe7f71Cb3dIWbZA/WK7bCuvkg6ELt+2jo2SFU8DcUkSSEA/dx3PBO6V
	NJhiQNP4o0NrNFg6JinbemTfFhMwAS/vsQTUi79e5mKHhQXvoYoaTogpqx2rf4n57eKQfxZ+NxD
	cPCL5PWysG6i1Zzbob154KoHRvHwx0iSFaUZPm7HSeYB8KrcnXbwv2HJFIZnyfZ/y8jBuqMEhML
	DABO3P/B9S/HpwEQ8MqcUcIU4aZdRouhJw9Wy/+eiO7yTciL1KlLi/fF3YUBnKeWtiLVFNeZXKl
	q0JmvesUPObTdW9pzwtDlGS3z5YUEQzPGUlcIMpBQg=
X-Received: by 2002:a05:6102:3e82:b0:747:4dcf:189e with SMTP id ada2fe7eead31-75b2225f8bcmr5708135137.5.1785730177794;
        Sun, 02 Aug 2026 21:09:37 -0700 (PDT)
Received: from lucas-inspiron153525.. (host110.181-12-179.telecom.net.ar. [181.12.179.110])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-759b8e1e8d5sm5366413137.6.2026.08.02.21.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 21:09:37 -0700 (PDT)
From: Lucas Jeffrey <luquijeffrey@gmail.com>
To: gregkh@linuxfoundation.org
Cc: florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lucas Jeffrey <luquijeffrey@gmail.com>
Subject: [PATCH] staging: vc04_services: preserve bcm2835_audio_write errors
Date: Mon,  3 Aug 2026 01:09:28 -0300
Message-ID: <20260803040928.12453-1-luquijeffrey@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When sending audio data in multiple packets, a successful later packet
could overwrite an earlier failure in status. This caused the function
to report success even if one packet was not queued.

Stop sending packets after the first failure to preserve the error.

Signed-off-by: Lucas Jeffrey <luquijeffrey@gmail.com>
---
 drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
index 3156cb8392f4..5ac23cfa7983 100644
--- a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
+++ b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
@@ -365,6 +365,9 @@ int bcm2835_audio_write(struct bcm2835_alsa_stream *alsa_stream,
 
 			status = vchiq_queue_kernel_message(vchiq_instance,
 							    instance->service_handle, src, bytes);
+			if (status)
+				break;
+
 			src += bytes;
 			count -= bytes;
 		}
-- 
2.43.0

