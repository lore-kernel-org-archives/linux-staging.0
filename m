Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB8B23ABA8
	for <linux-staging@lists.linux.dev>; Wed, 22 Apr 2026 13:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776865131; cv=none; b=sr6eMrJBW38+vUupiBEP8uIvLb8LGiDUbgz7xFtIs0vjqjrlpAozClJHlaV/vQZ5TPMRlTkEHqBZKw4/04q6QXR6acMy78h+JX5hInvEmynuWTmb9K0SxnbzFgIyr282WIGHGWIaVsTtVwWr74ZWQANC+Iv808SSsjC8Fkj17f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776865131; c=relaxed/simple;
	bh=xFaHrn7G6TIcfR41DP0SW/X9082q2L17KKyYzdBw07M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WHod1HseHoVosf70CkJrk3DYIB1LEQuX4NCAMUsFuE9XIKvkO+BYxhmriXW9Ed7ETU18GWZ82RWxv27CZIiEfA7l0wSyJ59fAmtLKXJUY351IsfSZZIGl89be5nWClOiCbkzk5DnrDyClY13ifk5DbG41FyG06+nrtYEfsd/pEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RpsQmiII; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RpsQmiII"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ad21f437eeso35472225ad.0
        for <linux-staging@lists.linux.dev>; Wed, 22 Apr 2026 06:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776865129; x=1777469929; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xFaHrn7G6TIcfR41DP0SW/X9082q2L17KKyYzdBw07M=;
        b=RpsQmiIIll1dJaauMQC7v6ZmZk7SQEXVvBsHljMo9yaD72HOWq3BY6KNA/wOmaFVEn
         eVKmRHZbwnmf5btriC2q4zOWatlaAPgCll19QOQ4WrWQgjAk+K3A4aRh0u8bDBI1QDL2
         TfwLVinWavmptatQVOf0tyhJ9Pqo7u5wcHVKOimfp+sG0fGLArZ3zOjM7KLlPcbRoRcw
         CT3FfgqBMt8f0o9yHFViOEjw89YoWiHxlx6fjSGClOgmj6SMY8sAOuXHh4TE+9Eo1b3o
         /PCNAHiBr7eaNoDvF1rPiOKj73e08keB3YIAmr/5HyOlYUjktIpOw3+VdCnBWVJ1LGli
         4bPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776865129; x=1777469929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xFaHrn7G6TIcfR41DP0SW/X9082q2L17KKyYzdBw07M=;
        b=Cp+A/DLxy7s9LWkDiU4dNCfGMWsF8HLUbRU/Wvf5aI6pU3MWwSkiW+P6GVP8xmKbEV
         ABfBBfajTihGA/dlQW+KyU7adfZCKekOftZ+cqSRd1Au+HmgRiuxOUUJuSqzz1/wYRWa
         rDZlFfa1qvMeAd+iROeBiaZ3Is+0oICiw7GOdV54grT4XNNOjvcOwntbKSEkQkHHa0jE
         TfuVWIYo/pwYdBEQZR5VAUdnhcpmJWYatK4yweEuZslW/OkTmmcPW14v1E/UTvPp/3XP
         cON/rdgGVoCUdaF1F5RH9PUgpSDW7vfruIcS0VKzr3obj/4y7B8oipfEbkJvSdxxIGUE
         L9lA==
X-Forwarded-Encrypted: i=1; AFNElJ8y+I+Sjh8i6zyPRP5yVr/WcGh+/4d2FdGmJNJM+TxnexwJ44k+paVpV88fKVpP8B7oLma3xuyAYq+TlRGM@lists.linux.dev
X-Gm-Message-State: AOJu0YzGXsQG974sTCoEV0V3zKVwD2DaGaKBLLzpt5sGcu419941cgXy
	0IXTpU2rzh48FmKnP+ZuIrXYyMQ3ersw5/FFul2HhPuBGCOYF0hZS8mH
X-Gm-Gg: AeBDieuwVFEAfZUGVnU7HCgStUoq7eunWexno0kUtae0btoT2tIdafqMy4vEjYFfV0x
	TMOmxmddEk+pedVLX7JVQ+5N5JWIdal3YCZCiXTbQDnSaIPZng70xrB+GvR9V1/g4kynIFheCGo
	9DEwfXFK1dWWhSzxaix4oXwYFxA2H1QR+oLGcksLKj8gbabxzEdmhFDR/iqQ9YKjv4DnWWfEmXZ
	YcD9+M0Ww6pIOxf1vYQjLkcQkkl0SA33PaY1i7ZoP4tQ7lwr2gArfJ/H6fGKWLk3LSJYVmQznKI
	6DrHWNxuYeMHeIMsLhGclww/JMX6mUeMiaMlnxngA32J3rfmq1bnZZ5qt/KybpkwWNzBct878y4
	lZyIAHQRKD2Sa2rgqCjPXZ/cDojkN4UUZKU7hrRkF+QlShVJ3hQEuzXnTEIGrDVp0OTTHfmMCLa
	bsaEfvHFvzts+nPG2h6zWUkT+llpupvzJnBbV23F1cfpPsHVWe75Fp
X-Received: by 2002:a17:903:2781:b0:2b2:4dc4:18cc with SMTP id d9443c01a7336-2b5f9e5ec81mr128342005ad.12.1776865129300;
        Wed, 22 Apr 2026 06:38:49 -0700 (PDT)
Received: from arch.localdomain ([103.182.132.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cf67sm161528325ad.51.2026.04.22.06.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 06:38:49 -0700 (PDT)
From: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: andy.shevchenko@gmail.com,
	andy@kernel.org,
	debjeetbanerjee48@gmail.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org
Subject: Re: [PATCH v4 1/2] media: atomisp: csi2: Remove unimplemented DPCM decompression
Date: Wed, 22 Apr 2026 19:08:31 +0530
Message-ID: <20260422133831.57318-1-debjeetbanerjee48@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aejF4OlVJtKSknxg@kekkonen.localdomain>
References: <aejF4OlVJtKSknxg@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sakari,
I've rebased onto your atomisp branch and generated the v5 patches. Should I send them now?

Regards,
Debjeet

