Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C045D22D4DC
	for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 07:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774768591; cv=none; b=HwxHfMomG53yVgT9PKQlXkxS3uYXIyrNnEysvqFVho/3EZo/XzMWhYBawSKSLLPnTKD4a8iLrjiGUrSQkbNmuJAjADry+H0fkHCMpa8sVS3vyNVu9yxxB6BnXyyBUbYy3Iz2wJy5VKFVGm18T4N23ih2r/RVoq3xGOCkRwVeIn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774768591; c=relaxed/simple;
	bh=1NxKiVQ1TIIQfXxJZ2jTSHxmlOFYe8yRaFFPpJwK6WA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=koQFkjAKKpPjiIVR61TEy6T55Q3JVZTWvto1dNl1pJJfauK4eYDseB/nK0v1azBJg8lI3aEen3ljbFKpBegfXFkvnmqWYhbkPO2wdMYXyTiZ2V/qAQazGYNzulQH4rziuvqKgSI/0VV23ASKhCRV7leedp/RYgR0vmlFD4Ysjxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aGcoFpoS; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aGcoFpoS"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56b7e5dfd25so3412898e0c.1
        for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 00:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774768590; x=1775373390; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1NxKiVQ1TIIQfXxJZ2jTSHxmlOFYe8yRaFFPpJwK6WA=;
        b=aGcoFpoSKgEnMypiufCuCJVrWZlI+vnVOD5CD4JwUw+xlgUGzrUt6t10pzjiNmyuIR
         TY9vWBFelUGWhn4b8o2HWwgh0xbGABoAxQwtdxrjc5qAdsh234w+pNr1jtOcB68bbcVG
         9Igv6awhOX7MSf3TP+sXMqh2kvqOtHlMxIX8ApPzWfSkYFSLcnMo6GPg7CkyNiaOY+hL
         dnRo7wLU4WTeb4wpa6vVFX/WhjaiuyvG95VwDjTNLnAQueLELfz5xh3Qda3zKI75XIoW
         XVDztNbAM/8wrB7FYaQkEDtZDO0N/r1ubjQ1VtOsMca94Iu5TkUTA2bo6Fdd50/xH62S
         /0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774768590; x=1775373390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1NxKiVQ1TIIQfXxJZ2jTSHxmlOFYe8yRaFFPpJwK6WA=;
        b=o/u5pDmaAxF/CWfAFxeeB7UL3LQwnAGFsqdJ7eUkXdYYGFy+khBbrDyaCZ1YqSIcZH
         8XyEAFueOT5i8Ncke+gaAA4keqTyH0KeKAxrwRGNih4ZHh7IuKFzyfL2MkspWKi68/2Q
         5DqIQaJYiDYfDBEHLynYAnTleOeg3vdCYQWTriRoKxdGMRA9HKJjZYv12s6uvT3/mIgh
         ZxGyUUerEeppS0lEeAeIOvFGXEVWEln2joFgRj+goDjolsxSADfU9/P1EypYGY6xdurZ
         5ZWdJO8by4hhmGnTs9m/iN8V0QHppJQ2wUfkOW8CrBl0XKv30G+A7fmJ/cdfjydCNpKb
         xLpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOTZIKywGXCFBVzqaEQsHjsUv8Myx0y6U5sNL2kKe2ODfba4rPB92979+xpKV0NICd5vPxm9oHtgQm+otN@lists.linux.dev
X-Gm-Message-State: AOJu0YzXei2c2E0GWnw7rnFEhjKUNXlfQ9YHSVO60sjXvmBh3XNrWfmd
	8Fh8jcDhtcEgezLkL366ppp9cTYQ1yjGbljXFiajGmrAULvZjT77SI2s
X-Gm-Gg: ATEYQzwG9gNK62/Mfi6TGe55ADXC9ZQ+JZJgliGEqLGK6/naNVzvyArcfu3XLsjV5nN
	hBVn7QFXa5nbgkfP5DDM80TdXaeKb3W1mpxqQRawC0RLWoInBm+tzRC2QBkIdnNaJx1OKkTPaC0
	/pTMxRb9gktGytoquxpPSjtxrvJB87iTYmbKHsCO4lGzS5muxZEvKRVJA8x46ISlEYK00MmqE58
	jkW7RToh7U1npuM4Rdfvs3NDKeuDRYc77Qby6xzREck0vbzsrP9OH6H8c01bNXPqKNvlCQlosoz
	yeHOIRSinX9q1Wy3MH1aYL5P5zLUBuz/4zpLH8Vcnw79AJeyoWlfLW+UaLI89byFm7EacRbGH1K
	T3O+O9jAr2ygUO+THJlrBtl9qBVLrRs4cmQW8rp97+f8gHzRjxA3UKcZCu34nfquGdAWqG3pq7y
	DGJC2NZtwTR4iIst3K601c/yzX
X-Received: by 2002:a05:6102:f95:b0:600:d0f:bacf with SMTP id ada2fe7eead31-604e4d73ea0mr3937751137.11.1774768589747;
        Sun, 29 Mar 2026 00:16:29 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac6:d6df:aa::11:19a])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60512a5afa9sm4390638137.6.2026.03.29.00.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 00:16:29 -0700 (PDT)
From: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	=?UTF-8?q?Sebasti=C3=A1n=20Alba=20Vives?= <sebasjosue84@gmail.com>
Subject: [PATCH v2 0/4] staging: vc04_services: vchiq-mmal: fix multiple memory safety issues 
Date: Sun, 29 Mar 2026 01:15:38 -0600
Message-ID: <20260329071616.507876-1-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260329062229.493430-1-sebasjosue84@gmail.com>
References: <20260329062229.493430-1-sebasjosue84@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes since v1:
- Reframed patch 1 as hardening rather than security fix (Greg)
- Switched pr_err/pr_warn to ratelimited variants (Greg)
- Added Cc: stable to all patches (Greg)
- Note: dev_err() not used as this file has no struct device access

This series adds defensive bounds checks to the MMAL VCHIQ driver
which handles multimedia message passing between the ARM CPU and the
VideoCore GPU on all Raspberry Pi models.

Reported-by: Sebastián Alba Vives <sebasjosue84@gmail.com>

