Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA59D253B52
	for <linux-staging@lists.linux.dev>; Sun,  2 Nov 2025 11:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762083591; cv=none; b=r8qwpwPGYNV5Pwz/HQap8NVqAhjqG1VZ95D5CC4Fv1nwhvPD/Uo3rqIg0LjnESn2F+mWvurjasOWuegccph2ha0YG2+kesSwsl6yUi7sm+DxuEvYQmp7kftASlW1EPKJBsQ3/eY9E3JdJHKiJlxTSvjErqEDj6KzU2yAeWGndwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762083591; c=relaxed/simple;
	bh=FO8B+XSbG8/tNz7UwdzRHKt4zk5YCDQOjGbVamOS/1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OKomnc163+I+1t4mUX/AerUytioKkTLcDRMD3jSKMGDBjwsfZ5+OFQu5GBkcoTxrLGvagSATvm5JWycytXauEgUQQl+VFr6Ma6psTQSmz1HvIovo9sU2u8PIeVr3cttDU4BaPCI36uNczVRw9STQrbxNs2BC6JCFkcjY8GJM61Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jzhlc84T; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jzhlc84T"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-36d77de259bso24669061fa.3
        for <linux-staging@lists.linux.dev>; Sun, 02 Nov 2025 03:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762083588; x=1762688388; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YV8ILjCLbAd6Rh+u+y5fp6wN9Ns1g2oLwKcbOPZD8ow=;
        b=Jzhlc84Tgp1qZVygScpt3qoVkGnUm8bfA1rbxHW4T2ng5tLivGIsvkZsYcjbNEkR7Q
         vOH36D67CD4fn9RaNmdg2p82BM3liz6NqDR3ePhNdYdSQNdnAlLF8klMzNhCq4QVmO/5
         4vdJ3koGNJov6EOLQMVKu1PinzZ7POxwwv+jWLnUayTWsZ5f5E0X1W6Y/SimMduUQNhX
         TsE1yTYpjeYIa+DyKI1euMvuthaNYgyEz/EtwvDCpWHMFy2selrIiiPJ6wCF2lu6UPWL
         +dII42AIarlrmgOlGOk9ibiwL4D0BgkBfvz7cYk7NuNoMRR5tnJAF/vBT+kC3YyjSoK5
         H3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762083588; x=1762688388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YV8ILjCLbAd6Rh+u+y5fp6wN9Ns1g2oLwKcbOPZD8ow=;
        b=idCadJD3iEH7HjZ4JRZyEMdo9MVFD1HYAlR3EI8egzRdsh3BAa0WiDfpnoCP9Hu3gv
         kUy81CSnoilIcd1NnHRxA7mlNcJKB8aIHca/hizEJGuaFQ8OEpYo92SaUHk/huWBX3w1
         qjyriTUVuBKEz9rLpsfxlJPEESc44LDULoHj16MSBxNWjvfkKYHNgoSOfOkzQ+Kf3d5I
         5JNMNHZh9tl60tpyQcjp4lbbw0VtWoJrxvSlbK+Ox/IX8PZdYO4K4JwabvZXm+b0rsz0
         Sncvi0hMSO8b7olhD+Pwg5cBtUH0Npaob1jiftCmAjNgImt4YFjE1J+PI59BGm/keqF7
         NpLA==
X-Forwarded-Encrypted: i=1; AJvYcCV/f6rhiqjImGd34vGdcNVtwoJL6oO9drQwtcWDEc+ndtZ0DLFuI8i4v22Xpxq+tM7FF9xsj0d3FYA5rowY@lists.linux.dev
X-Gm-Message-State: AOJu0YxZUmD3l5f3mAX72gm/x4lJLMzE/4yMZcxLe5NEpZunVdvaAOLD
	qp/RqQge4mmfG2ayO8XfS6Ee/Lddfm4kluZz1D0MjLBGfLfYywRFsCNx
X-Gm-Gg: ASbGncvoTKOaePv4GmsWjfWfWehTShSwqioTpDqK2dxNlnPXqKwK0MK+xR+R1nDHiU6
	NkLzU4qjp+0cSJu34hlNED0W0+8aD/3TdNV9rGhtWm0vJZWB5CCsle2FWdU/dnowTdHpKBNjhwo
	Se9MaVUsW0zGbcLQtGE881GS90i/SIY2VoeJAzcC4NeChGH8tcmIVz9/Jhw3rVr1EHkQ3WX9LD0
	S/+4VtOQRI8gRJf2fxvMu48mtJJB2a5ylKEVzu+q3gzkYfvTLgJxNmoFEo2CNWGPX8qk9+rIzi2
	h1bfCDbEyh40ga1/p62pcPSgRn8Ybd9xxhfM4WkiXzjpFQ7hxNvXxCIF2mRdhRUmHzOQWnZrMpa
	roSsP1HwtI3WctJWPlCZ7tshb5xZLIfO685NJzfWPqMERWKB98ngvuNLBJ5I+vnQkWofePk8wvp
	wzAE9qlNfYQGiW/g==
X-Google-Smtp-Source: AGHT+IF5MuHNOFQad9POJ3EQYc0VGYemTssqUJUuIIhlti7JhbWBNjLgXwcxhlhjdqsvTxxddHJZDw==
X-Received: by 2002:a2e:a9aa:0:b0:37a:3204:aa15 with SMTP id 38308e7fff4ca-37a3204b08cmr6232551fa.48.1762083587800;
        Sun, 02 Nov 2025 03:39:47 -0800 (PST)
Received: from archlinux ([109.234.28.204])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a1c0e3562sm14414601fa.47.2025.11.02.03.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 03:39:46 -0800 (PST)
From: zntsproj <vacacax16@gmail.com>
X-Google-Original-From: zntsproj <vseokaktusah7@gmail.com>
To: gregkh@linuxfoundation.org
Cc: johan@kernel.org,
	elder@kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zntsproj <vseokaktusah7@gmail.com>
Subject: [PATCH v4] Fix tiny typo in firmware-management docs
Date: Sun,  2 Nov 2025 14:39:38 +0300
Message-ID: <20251102113938.3116-1-vseokaktusah7@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: zntsproj <vseokaktusah7@gmail.com>
---
 .../staging/greybus/Documentation/firmware/firmware-management  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/firmware-management b/drivers/staging/greybus/Documentation/firmware/firmware-management
index 7918257e5..393455557 100644
--- a/drivers/staging/greybus/Documentation/firmware/firmware-management
+++ b/drivers/staging/greybus/Documentation/firmware/firmware-management
@@ -193,7 +193,7 @@ Identifying the Character Device
 
 There can be multiple devices present in /dev/ directory with name
 gb-authenticate-N and user first needs to identify the character device used for
-authentication a of particular interface.
+authentication of a particular interface.
 
 The Authentication core creates a device of class 'gb_authenticate', which shall
 be used by the user to identify the right character device for it. The class
-- 
2.51.2

