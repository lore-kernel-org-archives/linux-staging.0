Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD6722339
	for <linux-staging@lists.linux.dev>; Thu,  5 Feb 2026 03:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770262456; cv=none; b=lhi+PKuXIvSuqfKhOA5G/yCauQrRIV2aRxn73BBmtQxHC2ytpkCqbLT6ehwUcVZVZbMG/otaWgn3kK2VebfU+GLWHh7KkdrvXh5BNmjgJrgTNIGLbJ4bxQcU4l9rvivDopVO0IL3nV0kTxMTyhFRjYC7tuV2xqiRJm+IvrrMRmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770262456; c=relaxed/simple;
	bh=JsM3bs9wbuea4OGau2HK8ogv4O7M4EeZBKJ0wErNKLs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YNzHoVNNsnpCZx5EIXM2wLiso8kmrLDnMWB/LSR28Kg86vC9uIL2gdcPHs9hcgiQHJ1Wn4qfpZ0IDsCqlS+JykZUGRj6oKGk4qBWthYHjNvd81+lmQXEbQlCwNc8q+gbgExNsxLJRKkAUmHArzATyd6FuJbubyFn4PR+8yoRRYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HUq0FGiF; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HUq0FGiF"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8c7120353f1so41389785a.3
        for <linux-staging@lists.linux.dev>; Wed, 04 Feb 2026 19:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770262455; x=1770867255; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d61n7HxTXPgkp/RcfIbsA3Xy8ZsyJxLiUSY6lHZjydM=;
        b=HUq0FGiF6wrdH9onzMyuSB66bHZT7iAMFhxRxXARXWJ1E8NkklcrNxUcN2dIEjaygc
         f+7pvzaJrBqlBPDMUyes8O/ZnKFV3IfLcIh3d7KmtamQ6NOiWNaWjB46xmCwpMGWtuD9
         pZ4HQzXcnuYh4DN4p4lDHRqH6/106SQf2J1pXmcRlDit6LbBLDo3OwTUu16Z8mNR4z56
         6fG37H4EMKXKSwKn5UXZfZ+rVQorm217CeJk+K9f9FTLoe10AeHEGGvLe2+LypF3Ljsc
         DAyWrxESo9jgRbNQxCv7gxDe7LEwspc/vRmcr6hi9W53L9gRMeb8fE91AYb/QDrSR7A4
         pQ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770262455; x=1770867255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d61n7HxTXPgkp/RcfIbsA3Xy8ZsyJxLiUSY6lHZjydM=;
        b=dNWww9jn5c7ukNyUR7EpjHf0brIkgbidlu7OGEM+xtCLrO4DhsS+hDn4ZKZkU5bjk/
         m+uI9fGx/pZwcAU9fKTVTox7or6pgGNziY4XEgS0H+FmJ+OHJPfPl7D31CfDX46lGBGq
         KWgdJ0NnDKi46g6PJZf7jw1q196g3eU9XA3Ex4Fpms67ZZzpmPb84BOlcPyGefTTEbZ9
         XX8UPMkzLsj0JqzS2oh43+ixavIGVCodKAklMutvD5JWi+kXVPOSsMXJoP2cDMgVTz3n
         t39sIKNRzxYnVEvCbkYK/pp8k7nYcvyjdR4M2mXEUxCXsiQBc7Y1lwogdkpPRauV0ier
         vEtw==
X-Forwarded-Encrypted: i=1; AJvYcCUa3qvngDweRl8j0qjLeIUXxhf/vzxIrK9t4T3utitBGR39+PT7mpSOlmbf2wyUsEsJ+tepQ0jVOUd9gB6/@lists.linux.dev
X-Gm-Message-State: AOJu0YyL2DQC0VwdSbi/angLxw40RIWc884MVwZNCQkXeBp9h535DSVl
	15/27hEpMfy3mDc1xci4na5YZcoxPX7fkG10ajctBWmnmebsxC9iBqNk
X-Gm-Gg: AZuq6aLoTPez+O7ivfF7q05u3iZtCuLqv+20xiGfj6BleoYBGB3/hJ6MSFTt692yG4y
	H0Ztiqyhf414jo8IjHrV1vZE0l0DnxS92KGLOR7xQawMBgd/qW5VwKG0yJk/36PaeBmzopRd/CT
	dGNpmfHju0Mhm0PHysByHH0JUFXW3c/sAx86iqMCtWRqj4WG4e30mIdU5jiiAdBMfZ15LDxeAhJ
	QdSl1gQLQu1trR98j7083VjXNloFPdmD7SC2nyvOoJ2Gbv2pHAd0Dqr/vLTizMqcPKuHniT2UmM
	mp4FvbdQddddB74gZDjZBdtAZCDRjBR36bZzf6PUuLIy/tUP1ZZQfKU9Xjko1BMCobO7CcDrfF0
	L7hBrl/+kKmXccGi3gpGcUUkJcIzgMpkhfEKEM47BQ5fjW5OCDr+1+vOTYuA52/6KOBRBm2zZY+
	PaSMgDdqxWkZaSkUe0wxmUsYSty81U6w==
X-Received: by 2002:ac8:7d92:0:b0:4ee:1dd0:5a47 with SMTP id d75a77b69052e-5061c1d010emr62182591cf.76.1770262454778;
        Wed, 04 Feb 2026 19:34:14 -0800 (PST)
Received: from localhost.localdomain ([50.21.71.60])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5061c147f42sm30275891cf.3.2026.02.04.19.34.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Feb 2026 19:34:14 -0800 (PST)
From: Neel Bullywon <neelb2403@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Neel Bullywon <neelb2403@gmail.com>
Subject: [PATCH v3] [PATCH v3] staging: greybus: gbphy: Replace sprintf() with sysfs_emit()
Date: Wed,  4 Feb 2026 22:34:08 -0500
Message-ID: <20260205033408.86340-1-neelb2403@gmail.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace sprintf() with sysfs_emit() in the protocol_id_show() sysfs
attribute function. This code is safe as-is, but replace
sprintf() with sysfs_emit() because we are trying to get rid of calls
to sprintf() as part of kernel hardening; sysfs_emit() is more
appropriate in this context.

Signed-off-by: Neel Bullywon <neelb2403@gmail.com>
---
This was compile-tested only (no VM/hardware used)

Changes in v2:
- Subject: change to imperative "Replace" (was "Replaced").
- Wording and line breaks adjusted in the commit body for clarity.

Changes in v3:
- Clarify what "safe" means (buffer is PAGE_SIZE) per Dan Carpenter's
  suggestion.
- Reflow lines to avoid awkward breaks.
---
 drivers/staging/greybus/gbphy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/gbphy.c b/drivers/staging/greybus/gbphy.c
index 60cf09a302a7..55f132b09cee 100644
--- a/drivers/staging/greybus/gbphy.c
+++ b/drivers/staging/greybus/gbphy.c
@@ -31,7 +31,7 @@ static ssize_t protocol_id_show(struct device *dev,
 {
 	struct gbphy_device *gbphy_dev = to_gbphy_dev(dev);
 
-	return sprintf(buf, "0x%02x\n", gbphy_dev->cport_desc->protocol_id);
+	return sysfs_emit(buf, "0x%02x\n", gbphy_dev->cport_desc->protocol_id);
 }
 static DEVICE_ATTR_RO(protocol_id);
 

base-commit: de0674d9bc69699c497477d45172493393ae9007
-- 
2.44.0

