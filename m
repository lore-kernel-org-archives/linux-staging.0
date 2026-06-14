Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD8D21FF23
	for <linux-staging@lists.linux.dev>; Sun, 14 Jun 2026 15:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781451931; cv=none; b=jENNXs5+jXbpehstqltJfz4bl62mHppMUlWu4vBRui78P9R+TysUPgRA4D9Mhdc4tTBdWyBawgEI15epcfc1TWgoiZnyLfZoOaH+vMyoMFDlSLlwGD7ewdVctmZW2Kzp6sm9QxpOS1cNhmuXBu7xCT+5UDne3uZ89Z/UPFEa9tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781451931; c=relaxed/simple;
	bh=a4fUsm0sri2CJp9Xa6+EfCy3v837PLIvJct/CxDUWxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EB+FAb/5NBuL9oc0e/QbybnDk38D2eLkJ7K1+TG9/15Hg8v9HIFPfkUlXZKCpcVf1FgYXu3FoeeER79GJlmgo9olrCRB1r4UQB5sFKd92MMxKtxRyNHhhZfzD2hxoqnd3x4ReDBo8Zq4ShUbklBHl/+/PLrbjtIg/A/nnrxDk5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LWFOEqJX; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LWFOEqJX"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4922244f7c7so9640785e9.0
        for <linux-staging@lists.linux.dev>; Sun, 14 Jun 2026 08:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781451928; x=1782056728; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Ovn4XB3GgCDHVcufiauy/1mVBNPpRS6FI6cibDiq4A=;
        b=LWFOEqJXFJdyPJk97WxXAexFGiNPLk8P3W5SYmLOfhmWnrwnNiu9seTITsTv7w5slZ
         m2DYzqBZc4+LEPteMN11Y6KLLzrJYpB9Dkx9j37NAF+Hlwjwt+9CLxGlvDJgJj3AFaZX
         7b+1olc7dj1p5S8DhnkpNrv9yALEwbz1wypNT+ofrySC5jMphU3+L7mf7f7lqT3kFrq9
         kKMXFzuMpOWRca3VCFx32OYmFqs51ZUg1rup3+4hPNRRa3F7tth9TcSZBIG/BfTWXP9D
         LFbFN60oWnyZDP7bCD5GIOwbr1YhTB07KDjmBNklLA4Wq1Avo+qaGW/PGpivb/eey6vj
         ofIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781451928; x=1782056728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5Ovn4XB3GgCDHVcufiauy/1mVBNPpRS6FI6cibDiq4A=;
        b=DjTjBjE2oADxS+ou9UN7d53JyvETf/uV//NDEwtBIr5LZYOQeCXpfhraEykB8iP9L/
         5RzjcsHo/BthdXJtVDTZSnt5P5xf7HoFeMFG7Fwck8Lv9SKaiRD2gllorsGMLMHcH6U1
         UxRaS+muWq4DxyLel/qyCnmxMGcPLtc8dgVlMAjFymx0O9FShMSAOzWxLQrLbo65+VUl
         QYeGJ1U/S1DmFOjbckFAowUIQcTW3V9vtNiSsVKv6Vi3WEoI85a8ATjNQu2snGzXXtbD
         vIH0RwJcUfHWYoUtzTipaH3he19y2OFDqoFHF7K2S5bYjg0FZDDU7heLU/2g4jAjvPDO
         WbMg==
X-Forwarded-Encrypted: i=1; AFNElJ/reL9t211cNKOn67tQPGogRxBktMWwqc9aaCQzcoe+JeybEjDxPqQkydkFuI8E6YQMIBsHWtsaKqIGhokB@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6QWixq0wk4IFmamMYIIXaV6247zrVfOwpsnaXaW9SBaGNozCv
	obsuXabG9YeeQxeRZJ0FHm0P8iKHtBV2U1xXS0FuvlpRfxWNZO8oJcAwMS8XqO1e
X-Gm-Gg: Acq92OHbJtsqRaoA2TfjYRMFgLwke4tyMLghJW+FsEq/nv1J6wgaU7P+5uQcrRDzYUc
	iUhevVYfwfXgRV/ZYrAZEVEaGm9GxooFk0FQvKwne/YpY67EYsJvaO9V8CClx0DPc/eB0sMRCIh
	AXDF8xrHN06qz+KJxqy6+YELOqsbbhSSTO6FnLv90SJdZfiLeO+aupIe7ND8NHc5Lu5A1P6GZL8
	l3BmZrKr8G4Gbb9ZqWqpOjAkmwaTPQFDchJsljPC64KsMLLq5uzrz50p9yEBWEPYxHtVEUmNa9o
	UCdU8TPGvBToomJK1bs1cwIfN8It1XbxR8Z1aRzB63ByGLn9x5uEvbFTNVpuGKmHVwZ/tAgLNRS
	jAig+6RURdxnLD9GS240QwmS7vb61KTyxpPGJP2aAKraJ4KoaVKryVvV127SIQA5dvjMyAPdGC1
	q7OJZ55W8f/gfH+cu92hHwcuBVj6REfhZC8GZvjXKlV1OaPg==
X-Received: by 2002:a05:600c:3512:b0:491:9969:739d with SMTP id 5b1f17b1804b1-4922011393fmr92175955e9.29.1781451928107;
        Sun, 14 Jun 2026 08:45:28 -0700 (PDT)
Received: from fedora ([154.182.122.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922031b7d2sm184237135e9.5.2026.06.14.08.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 08:45:27 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: gregkh@linuxfoundation.org
Cc: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH v3 1/2] staging: greybus: audio_codec: fix sscanf return value check
Date: Sun, 14 Jun 2026 18:43:28 +0300
Message-ID: <20260614154329.5176-2-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260614154329.5176-1-abdelnasserhussein11@gmail.com>
References: <20260614154329.5176-1-abdelnasserhussein11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Smatch static checker warns:
drivers/staging/greybus/audio_codec.c:335 gbaudio_module_update()
warn: sscanf doesn't return error codes

The sscanf() function returns the number of successfully matched input
items, not a negative error code. Compare the return value directly
with the expected number of conversions (3) instead of storing it in
'ret' and returning it as an error code, which leads to returning
a positive value on failure.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Closes: https://lore.kernel.org/all/YoOLnDkHgVltyXK7@kili/

Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
Changes in v3:
- Split from the previous v2 patch into a separate patch.
- Updated tags to properly credit Dan Carpenter for the smatch warning.

 drivers/staging/greybus/audio_codec.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index 720aa752e17e..295222ec0f1a 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -311,8 +311,7 @@ int gbaudio_module_update(struct gbaudio_codec_info *codec,
 	}
 
 	/* parse dai_id from AIF widget's stream_name */
-	ret = sscanf(w->sname, "%s %d %s", intf_name, &dai_id, dir);
-	if (ret < 3) {
+	if (sscanf(w->sname, "%s %d %s", intf_name, &dai_id, dir) != 3) {
 		dev_err(codec->dev, "Error while parsing dai_id for %s\n", w->name);
 		return -EINVAL;
 	}
-- 
2.54.0

