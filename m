Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BCA339872
	for <linux-staging@lists.linux.dev>; Wed, 17 Dec 2025 14:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765981552; cv=none; b=lm8FIT5E0GPJ+3ifBbTJWqwCG2nDt4aGibV6b4nZIu5Rfesk/6v6d8HyyYLBqCsgDGzU9tnwEy1kQfl9M01oGrLkfcqOJmBax4v0+FhmFfXD769D5MAhPH8EzAYvKbZZWgfZ/TzqaSgvy/O4SAkVpr4xpCrPcRwcMyEDGgH668Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765981552; c=relaxed/simple;
	bh=1EeN1U32XfZkCq9rTaUh4sD3+tv79l3aU4KJtYKvglo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t+1RWF+6cz1pFGfR8TpSMA6yUIJc1I/ZNfCqZWrZYLxHpn5ys39eoEBmZ1TwdOdvM9/p2tOtmgOoLS3BZtcfvyhXSeoSIgShbqTVbpKm1W5vOjS+q6hH3ZNSRIBC4X3YepWzFaVpb0OgkZlWhmJcR7xS1vP9FOCDGT/zVsEsZrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hY9U/G7m; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hY9U/G7m"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-34c1d84781bso5181141a91.2
        for <linux-staging@lists.linux.dev>; Wed, 17 Dec 2025 06:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765981550; x=1766586350; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z7CQOUtVaIcGOTfDI35YXHp9SZeFWTZ63jiuWO0e28w=;
        b=hY9U/G7mfh+pt6VKj2tHdxTSobchKsDEJs0mSOH+pgJqx93oerRWV4ugLGP33Z6lSh
         WgeGlin4b947cxR7tkR+ihmG5oJD3O+yi2oSedkiWecfX7nEz3RfAnqG8LksCqVucvMn
         HxfdOwctqJWJXNvEiWnwH7Qkqbr0a3KfBt+R52Jq6rK+jmZL363xEC8UuG35P01VFDyT
         7UdWfdSsoAZglS3IR8chYaOh2Eh4dJJ5r+3liu19FT1CaenRA1JixfigJ8a5i3dHRSui
         vdg/6B0hua4qqNOr8uom5jV8PZerAtBrEaDXNfBCa0jp7NSChH97vztuoCwiPC5EGkyW
         Qtxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765981550; x=1766586350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7CQOUtVaIcGOTfDI35YXHp9SZeFWTZ63jiuWO0e28w=;
        b=VWv9b9O42qmbHr9+Nsf6Fdpmmd7MQ+5+yBEUIHxXAQQPy/eKgMkVWOqPmGmdmnIbfG
         1yKLKLU7XI7pG5ldCup2vUxn7f/sH5am9Vs8JtjmXQ/t0i0Tcfkm0iVQRcDarammBiRM
         Oo4mUcuYstlUUZK17W5V8m/yeJdfsiupkB9d1JN6nQWoJ6kZBDnyy+EJxkX0irvMA0/w
         ACtgI+BT67IxMefDJpaNkmWgCEaTITEA1npHoTpL6+5c7AVRq6W0MBmWvONX3buAKiII
         0lRXtlAl4+ZBOhFsIp8hSrbKmttfhUiSxSbHcA7jxZ3rgVqaOGR9E+jiMGCXJ6kv7LJN
         LxGw==
X-Gm-Message-State: AOJu0Yzz9E4HkE4mvKmfej97uoTQz+/tBY8cKKaMTiwjObOjp0xMtdA5
	xOUtkfBM+QTJsDD714v9I0v3GI0Conkf1f9dyEzvY8pFq2QbQrDWrYmc
X-Gm-Gg: AY/fxX7YkxPttZxCI97mXYWW+3emjMTSwZPrfOjIHC1zlHQeFME3qDiY9iLh3i0F06h
	XvCscLfWomF6yqNXK7kNdcTIKqmIqvDNIjwkDT2Xym9q7H/Yd39qucrBJ94Omgr5GPBk9p0pbwv
	htXMSXzXk71PlKbNRotwxYfMMWvEMiR7q3gjk05WPXBzaXbI13vOcH3EMJTifWX1WgYsGYAKzGO
	lU8r2U7ozhVyV74U2t6dMQTollvTcXuVfMqYeijvu3WFw+Z0O/mZN5O2LAUL0colBMniGGBtcUf
	/cIgn1QuRtdlQLRsMlBOoPa3o9uqVVzegVhBf1hSAL6QS09BHjsH/RpSbUClH6YuFH5Zv4Bvp23
	TLbV9vCdh5kclA6u2U+mpc3yvNphxNyGeGPliTF17/dPz7frsOuqD7VH/fX+xDXTpnKBRi5NNWe
	IL0Dk0zClZq+qiFWW/L5o=
X-Google-Smtp-Source: AGHT+IHCJP7FNL8DH3AB0DxcARw9kaLpYFjnB5aBRnnMzpTAYKYSUkqJQCxOa1NU3o5bO5WcmEd47w==
X-Received: by 2002:a17:90b:5604:b0:34c:a29d:992a with SMTP id 98e67ed59e1d1-34ca29d9a5emr7740970a91.34.1765981549888;
        Wed, 17 Dec 2025 06:25:49 -0800 (PST)
Received: from ubuntu.. ([211.234.192.122])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34cdbacc1dasm1544331a91.10.2025.12.17.06.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 06:25:49 -0800 (PST)
From: Sanghyeon Lee <sanghae778@gmail.com>
To: gregkh@linuxfoundation.org,
	karanja99erick@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sanghyeon Lee <sanghae778@gmail.com>
Subject: [PATCH v2 0/2] remove unnecessary braces and else block
Date: Wed, 17 Dec 2025 14:24:42 +0000
Message-ID: <20251217142444.5530-1-sanghae778@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series fixed coding style warnings reported by checkpatch.pl
in drivers/staging/rtl8723bs/hal/odm_CfoTracking.c.

Changes in v2:
- Split the previous patch into two separate logical changes.

Sanghyeon Lee (2):
  staging: rtl8723bs: remove unnecessary braces
  staging: rtl8723bs: remove unnecessary else block

 drivers/staging/rtl8723bs/hal/odm_CfoTracking.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

-- 
2.43.0

