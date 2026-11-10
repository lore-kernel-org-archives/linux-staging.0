Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794311882;
	b=MQHh79xyFh/yg+URrSuyStb0fm+T3BEMR3OEdiP9v5je4ONXU9FjFJT8gtpBQAPNLNUN
	 TeKDFH/ur9xTYXIrf6eTnvNHs9SDmUP811zbPo6NAG8+BNwpMIHVekfCWCOZkj2AQ8Dwi
	 yM0YmTeDZ+TBepJC1d0atYCmH6wQXnMsK/9SXuDDiMKsZk1EzZd5LZrRGZU+BQ4AuXx2d
	 tYUoSBJk6Ize4eaQbxaAHEYysJK64EhpOb4PRYQVeRLx4Q6VrOaByspLPmbJzB6obSlZb
	 H31z5XWP6cpcmpQdys10hVXUl4mH7wP6yLtf7TAFuLUTL7/Xxko39cqLQcZlGBQSVGA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311882;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=NtZdO6nOLG1xCmYrcxMOJxxZ01jNgWBM1JEvDfWm2HM=;
	b=p8/E8YCcBj0EMRByxEMLNJ/ZQf05OupYIi9n4P05DBk6DsWwcLlbrVEodIzswb2ZUFsJ
	 LSU2SC81dT2PsjFiJOX2kg+gWbvaq7ujpG9kznlukZmGOoWkUPt58E5dMFly/6JtQeskm
	 daN6vT3Me1/qLS5oLEpxC4XJfTlYvoJFgM2mbeIR2/a9Z6sK6ynr7DaWcFO+cqIBz9fav
	 mcJZFHw21sdGGwimgVJ71jCGSmrHyVNFd1POMnzxPVqOTn+O1laqZIxsYNrpNNq/EgFy2
	 3KCw8LTCnEo7tYfrQ3zppYna3FtEkLFbNWJL80o5YKcqaIY6YTZvif7Ov5BYb5K1QYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P31J6kYI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD29606A336
	for <linux-staging@lists.linux.dev>; Tue, 10 Nov 2026 11:58:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAD29606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P31J6kYI
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b3402105b9so14129767b3.0
        for <linux-staging@lists.linux.dev>; Tue, 10 Nov 2026 03:58:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794311880; cv=none;
        d=google.com; s=arc-20260327;
        b=YVXdqN8XSYIwov36Oxcy0HW6KzBqDdHstvztCwRMVOZTGa8C3OtMO22OCDryZoCf5R
         ZP0Ghay9z2Ercl5ngCRgFJvbXbRGD3tiYlxOC8xQFGOb1Sjy71LMoLczBunstr/c9TwR
         Dr0K0O84Z8djr2HchkLGG+fo+ixDiFIhs9NFIsxhVqEAUJaGQKMrhdmyzBArfG989Jp9
         SeZc8bPRFait17IGPJulzjzxHeHc6TETXIFfII1pSzcn3PFZtZOvRt5IUi5oaLneAULr
         HcYB56KxXrhiSk5RfWT406isP6mmL2OZLozFYLSvyNZLl2n6pzLz7m8a54mQFowLsNUl
         jGYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=NtZdO6nOLG1xCmYrcxMOJxxZ01jNgWBM1JEvDfWm2HM=;
        fh=oyOC6W33SE8Z+o8aNzOVD3F/IudzfMbORz/sSKPekTo=;
        b=ThR5PiVW6x1shoeB2F6cEzjqXsC+ToS1BcEdH1TxT2RSCOcKNNR9qGiH1axaslupae
         2M8A0GYoV8ab2E7BDdHlAx+pBYs43qc+WJXte+usggPVB99OT77i+7Ej+iiAuFxC7aKp
         FH5Bae+M8t5ODR5nAXAxJBAry6hXpRwQsXfaMLs2ZCTUUP03kLO3faGsvdPzzP3dXQ7k
         KGtJQ4Pwr0R0L+FYQSQ9k9YsNg6UCsiDvzkX84SF7GS0nb4/NdbcQ+xFQj1OMAxKHpII
         thPvQplU5sjoP876Mg463yHeU1pnOdA1Ynm0RmJTV1xlKeLUBNmfi3S56a/jejaFwxIk
         ceFg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794311880; x=1794916680; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NtZdO6nOLG1xCmYrcxMOJxxZ01jNgWBM1JEvDfWm2HM=;
        b=P31J6kYIsEGTz2UbhHeJ3py5LSunOsjGtSdB6n+9NRHZ2McFYQTTJPegPRwUNiaWP+
         Os/I49BPMUI3EdBx5mq2vBdCrigvc88p6Bc8Q4yRMe6IXmIzFBhMkNbOV2mRQ6thRdGi
         WAKZXFug6UnKWd65Tgws4UAV4kX9/NgYgha0DBmEvcdxR6eOqxZUSO43Rw5Y6LoiETyU
         BxAfiNrdR7Jd9uGj/K4WrsA1LMtLsACzKbnZlo4/l9zb1cU5F9p6HODN6EJSvMg1EZ7m
         u/ETootTBWz0/8HSRtZ7Q1mLsT4wKBDTPKE5Jy8FWVQRMvfZbiekcYvW69CWKH6rVh2I
         g0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794311880; x=1794916680;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NtZdO6nOLG1xCmYrcxMOJxxZ01jNgWBM1JEvDfWm2HM=;
        b=AqC59jdWh/+obzRxfGQm+oV6Zaqv66fzSTcMzBQSTF5gJ8AW1Ds0NQXEgO6CW4l175
         97Hb3nk+UxiJj7IgwvlT73McXcHQ/GOOwSLTH3CVf9+0kF7uzZLNG71tB1CjIw+2Q1tg
         De7CqCe+XjMHfzyopU1gqiiCVYwJzNNS41QV/72S/rn+EwSCenb1RgCDXyhtSsnSuwLg
         9fr82Kq08xkMubA49mX4ZJRyYrwasqa89PJZYX5xWby9XcT+34ZB3RAZouktDpONiATv
         gttacwEtL28Vvgj4rz9VqvAOi4LW7bp94RJR2GsD5Frypt71HkTfq2ohad7dkjGc6jJj
         /hgQ==
X-Forwarded-Encrypted: i=1; AL+hErGm/+TS3FOwCLKJ92DQVfQ45VDoTiS0LP2X1PLjcahaGreChrRlF1ZdueEoVSzWzjaAJ/zT22lx4vVysrCs@lists.linux.dev
X-Gm-Message-State: APuU4Z/SVcbQry+70w7J9G0vv27QBuSzA3fqE1gL8s7uQaNvTJgFMEzU
	p+MSWIaemQSI4H5Q8YMvcImmqVfmW2YW4kPDpKxp521DaEQB3yVPePx7cN3ySM9DcY4WQv2HpAA
	vkhS/WoJEcnW4FZdeP4aeuiuWg37ODQE=
X-Gm-Gg: AYBFou3iPetrYtNAxbnbEL/jBBKNm3D8I2pH2ym6/5bQdm6YKcWPL819H6O5vCsXa8B
	Q/DXo18RCU3EjTyvXwwfPkM24Fl1kZMcZEAn4q9uALVCO2bytr1hs7AWcrhfBkWph4VL9lJ82L8
	Tslu7Y7wmdlqb8o48+eEwNVV4venNXlWqv8yd6DESY0UvPMFgKBCQK54cxyQ6P9SnHbpZhnUyo3
	nRT/yjvyq85ROYpKwmfgacVS+MK7FhQoNZdMoUTve3lIIVvT5B7ynyFOivM+PXXJJ56BUF4lLDV
	K+dKUlYJG/DHcMbnZyk1rziIWRkmULffIBwcV3PaH0LLa1kicagfZw4Klny2buVTA2Kx9/GC70u
	aCWcQquDO0lTQlXauZKleQCuFXdjB5lJUGwXIljq2LxwYiwPH09Spwg==
X-Received: by 2002:a05:690c:dc6:b0:8b0:f0cc:db0e with SMTP id
 00721157ae682-8b392c3d7b0mr12234627b3.78.1794311880452; Tue, 10 Nov 2026
 03:58:00 -0800 (PST)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: =?UTF-8?Q?Kincses_Benj=C3=A1min?= <kincses.benjamin2007@gmail.com>
Date: Tue, 10 Nov 2026 12:57:49 +0100
X-Gm-Features: AclHuK-790e-YG3XMXcbn9JCn1hGEUSurN1poH3-rodvAOagUfzcQKHK3R5q3Ng
Message-ID: <CAB9ndWsADtrZNFLafOoO7qAdgWncBbKbBkLVv4P8b6jyTwx4qw@mail.gmail.com>
Subject: [PATCH] staging: media: atomisp: fix spelling in hmm_bo log messages
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Three hmm_bo log messages misspell the past tense of 'bind'.
Fix them to use 'bound', as listed in scripts/spelling.txt.
Only string literals are changed; no functional change.

Signed-off-by: Benjamin Kincses <kincses.benjamin2007@gmail.com>
---
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 0a8f401..1fc5c1e 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -448,7 +448,7 @@ void hmm_bo_release(struct hmm_buffer_object *bo)
        }

        if (bo->status & HMM_BO_BINDED) {
-               dev_warn(atomisp_dev, "the bo is still binded, unbind
it first...\n");
+               dev_warn(atomisp_dev, "the bo is still bound, unbind
it first...\n");
                hmm_bo_unbind(bo);
        }

@@ -830,7 +830,7 @@ int hmm_bo_bind(struct hmm_buffer_object *bo)

 status_err2:
        mutex_unlock(&bo->mutex);
-       dev_err(atomisp_dev, "buffer object already binded.\n");
+       dev_err(atomisp_dev, "buffer object already bound.\n");
        return -EINVAL;
 status_err1:
        mutex_unlock(&bo->mutex);
@@ -882,7 +882,7 @@ void hmm_bo_unbind(struct hmm_buffer_object *bo)
 status_err:
        mutex_unlock(&bo->mutex);
        dev_err(atomisp_dev,
-               "buffer vm or page not allocated or not binded yet.\n");
+               "buffer vm or page not allocated or not bound yet.\n");
 }

 int hmm_bo_binded(struct hmm_buffer_object *bo)
