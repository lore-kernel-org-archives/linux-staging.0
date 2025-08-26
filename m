Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FA23090E2
	for <linux-staging@lists.linux.dev>; Tue, 26 Aug 2025 10:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756205063; cv=none; b=OyG9e58Zh8atDsBs8wigfu50SqFWfNM2ITVSEcTnMZ5IRaKQBlAmN9sKCRetvY3uRyEjmPrStusEJpKEyg12saWmK4cfMgE7bc4WiIlHHIFfdIggzRhP7pLe0OMJ/TqrK8egemN5NfBpcWS0WnY23sQ2wwFJAq58Qp9ytPQiNGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756205063; c=relaxed/simple;
	bh=liM9eRKLATT3ZL6VnM5QKUJlcWgIUIaeqGhZKRX+jhM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Qu9OjuUM5G+N7C7yeGLrPGCSO+v4VdAWjOoU9y1n0aVgn9GHYy4dgZDNo5EN1qgmTv9wtyuc8gSJD97ipO7xG8wm7fejse5oV4UkbQLXreOXBX/+MujrmNQkImi7HvpCRIZIkikIlXFdQrnWmqojYdrjK4DefsYlLLX51uLZllo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pZRRC0+4; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pZRRC0+4"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3c8406fb5e1so2110146f8f.3
        for <linux-staging@lists.linux.dev>; Tue, 26 Aug 2025 03:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756205059; x=1756809859; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nvqjc2Uq6UYs7NC0gnmnCXS5SKb+rIIaJ71OyXlnaBw=;
        b=pZRRC0+4DIL1sMn+zImISnAZp4jBNYX0r4ZK1xq8TrZQvDC9x25NeYZvII+SO8d74H
         tzRK+t7GvKKGUVzmPP0oMQcj5mQv4Lkq1rf2+g2mmrqOYclXmCgixDZ+BVeMAu/8m46B
         5veC1/EatzG6TaHgsdHsvFcFRUQywxSWzlULmLTnxHu3CfgL5CLe0DZPLycLqkipl6O9
         AA9/bho+eoKUta4MlV67UEWmdAJMllnQVBRtLVC2zFUbYwJvvRLpkXZPsYhVLGTRWocE
         w3KdcT5P6NnEZXLgjaJTzs3FmVigmT+WCkD3LIGvWqPQPhIb78eGWR+oLpNhXzAcFlO6
         M1MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756205059; x=1756809859;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nvqjc2Uq6UYs7NC0gnmnCXS5SKb+rIIaJ71OyXlnaBw=;
        b=mm83jNrsAnP1vbWzgQvVHbbH4EUUMMPbOig835w5lS0mYkT3AnhHwNyyBo33H1AiUK
         GYBCI4KKX1BxMjG3OxTX7lTxm0iEWayO1NGJWfhRq80xq90cZkQ1yT0Lt9rRm0rDJD1k
         /MuaB6nV2zCKNs0FYz8kA9tjSVSnOtMmXQ8VNQrDwQNZr3D/Ydube6LPyLofPaFPhdpt
         ELiJOHy20Sg4+iCLe3fqfxE847oBiRc/qVucpL76WnM+GOxmJmni2xsRcu2yZqwCE5Mg
         ZkOu0DRRldC6UkgPlLWFtRoaEP5SIeyCokawsTkhs5VI3VYFz1xNqg/KNI/mnlJ0npoC
         O/IQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnjlMJeddDByykP92qDs254F7lyIwM0StQnlclayidsqXgQ1T6WkLEWYJoWWsCoclGsop4F5LRyHqZujWP@lists.linux.dev
X-Gm-Message-State: AOJu0YwQGFNM3bMLxFH1QIEVuGMpM0xvw5meFHNZ2qQmr5HKy/fPwhWG
	iR9afxLJQLaKsgZonq+8Sm//0aLMDtrztWfSemnHounDYqKIKy9gdfyNbHJTCQEKjaOf+tmLOrj
	Qr8QS/GFylg==
X-Google-Smtp-Source: AGHT+IEhZCUA8cK1zdDsXe3cxZ2YP7l606fJk1sqWUVX0WU+Z/FGkAc6dryPpWOYOCYdSBOdJF7CAF7nuruD
X-Received: from wmti4.prod.google.com ([2002:a05:600c:8b84:b0:459:8c48:6c34])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:1446:b0:3c7:f0fb:838
 with SMTP id ffacd0b85a97d-3c7f0fb0c8cmr6695304f8f.17.1756205059144; Tue, 26
 Aug 2025 03:44:19 -0700 (PDT)
Date: Tue, 26 Aug 2025 10:44:13 +0000
In-Reply-To: <20250826104414.2817514-1-abarnas@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250826104414.2817514-1-abarnas@google.com>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250826104414.2817514-3-abarnas@google.com>
Subject: [PATCH 3/4] staging: media: atomisp: Remove returns from end of void functions
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Cc: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fix checkpatch.pl warning on useless returns on the end of void functions.

Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 .../atomisp/pci/hive_isp_css_common/host/fifo_monitor.c      | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fif=
o_monitor.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fi=
fo_monitor.c
index 76762fc0929cc..3caef0f4eb217 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monit=
or.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monit=
or.c
@@ -499,8 +499,6 @@ void fifo_channel_get_state(const fifo_monitor_ID_t ID,
 		assert(0);
 		break;
 	}
-
-	return;
 }
=20
 void fifo_switch_get_state(const fifo_monitor_ID_t ID, const fifo_switch_t=
 switch_id,
@@ -519,8 +517,6 @@ void fifo_switch_get_state(const fifo_monitor_ID_t ID, =
const fifo_switch_t switc
 	state->is_none =3D (data =3D=3D HIVE_ISP_CSS_STREAM_SWITCH_NONE);
 	state->is_sp =3D (data =3D=3D HIVE_ISP_CSS_STREAM_SWITCH_SP);
 	state->is_isp =3D (data =3D=3D HIVE_ISP_CSS_STREAM_SWITCH_ISP);
-
-	return;
 }
=20
 void fifo_monitor_get_state(const fifo_monitor_ID_t ID, fifo_monitor_state=
_t *state)
@@ -540,5 +536,4 @@ void fifo_monitor_get_state(const fifo_monitor_ID_t ID,=
 fifo_monitor_state_t *st
 		fifo_switch_get_state(ID, sw_id,
 				      &state->fifo_switches[sw_id]);
 	}
-	return;
 }
--=20
2.51.0.261.g7ce5a0a67e-goog

