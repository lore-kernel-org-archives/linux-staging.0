Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92840378807
	for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 21:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771880995; cv=none; b=BYCogA7MEKEHcqp7824aFLOABv3SPS2qwQCEtHLUR6H5O4thOtWtXDNss550MH2Vj93KMWg1A4GtJ+iMtqzkV2aPg2oB70A0OKWOSeX93gLRRra9szlz9X/54gvSHMPttNtZegtu56o3XkDurYcz0ZKbmsHWAl48UaY7dgp48MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771880995; c=relaxed/simple;
	bh=rkcaTzdhnOUsvVPPDN5jN/l9NjqX1ct2YHAKgIoFbCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ju5O4SKEekOW3k0wFu6oYSGy9wwZdvp3s3YLh4ofqiUOzz616oaefwDvhYPGkRJvQcN5WzeMIGVkzvZa/6fyE9Thxbcjx43Xseyt+IMts4Obiv0EMRIlXKsQJgQmkur3ZB3qNOnQokanAYkPQ60FL7FuklcElKt2PlL9/M4kPaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TWqLk5vw; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TWqLk5vw"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b8871718b00so773041666b.3
        for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 13:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771880992; x=1772485792; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHFoNpDggMVPU5m2ABJYI9RV/07YWIq85AG3VfOeQgw=;
        b=TWqLk5vwpcakPbkMvwH90ybHjkMDpkGqFo10LGUm9EbnvXsMZFiEozwVlP3Oq/4Gl5
         5sZZ/YidL4OZNGszXfcLkp75TdYM1t6uBKVg+n/D6AGGdFjRahKMyo0E96e0r3WLdVDb
         FguiZ2qUv87lz70xfp8n3zN2FUybIHYu/VtwqH3+HkGaXNo7Pobd2q2gCWcG+qyKRZMj
         ChvcjLIUqeble4OoklOpL4g5E28pic0d903cPnleR9yAL1mjBnzIKiODhnwkO5O0Hqv5
         gxtCCk0LmC5qx1S5pwgBLre4oP2NvlgbS2IcAgjAIHXdp9g7u1nMnqWJozIqEyU6SKf2
         OQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771880992; x=1772485792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HHFoNpDggMVPU5m2ABJYI9RV/07YWIq85AG3VfOeQgw=;
        b=wYRSZpzKUrXJ3vLdyC5HKdkEvxo8pTTfNzS6kN/Ypc5bugEbcqQEKWedR75ffp5tUL
         8C6fPBey//AlzKUzBy/8xP0frIUU5fVGj3ygs2KaK5cxVfn3NmCn0UGUJuY1RZXYvX5/
         By1RuSy77e++PB+SCighZt2re+Ali2JBqYNfMfUrc6dt8n4pmmzS/+dNLY8ukPZm/D/r
         /azp4s64cSKHIirK36jPTLYtOGeBc0yaz6QL/wVrbEU5SHrOdocSk1rRFbkSnQhwfdzM
         Zdni7wzJ+LuVP0iNnD7v8+8WwevGxCzx8nTQp/9htJ/4tvIMeaEfw0VMMBCYMAuxnAsx
         1mDQ==
X-Gm-Message-State: AOJu0YyNwpncKIthbryAGqJ5Em75g9f6RZuomxISwZeAptvuzMlq0q7H
	CD8oI+7CvvasadEv+VmT+dmfsFM0YAcRaZKJ4O4ViZGC/rQk/qEYAv8z
X-Gm-Gg: AZuq6aLn2P0lSkV6U9Jm/+Spta3fBLj8MXqud/VVEUblfdvHievz2rKF8eNhKaxN66q
	aXjNgTSRrKCiy267QIouIFyh2Wdsz2SFDEhwSn8ODuRlnAKX3BnMCt2smjK8RlOamNWM1LH2UlE
	EXvyex4bZrhqCUJeKX2vl9PJqyWYXGO5eICLOVBWlxIt/sXmvbrtYWacmHTnFBUbl6GMVYTMOtI
	BjWIBHWjYFuZZxtrglyHT3GGSrNeSlnnw2Rp2dMW0Ha/KlVkX3wjw22VtyDw2pfur+elRqLFDkH
	cYU9cL4A70Xjl0UuELJRpFAxhN96kNrordIG8khQ49LVUFyPoDh8hnZORYwjzRXNYWik1ICh0ET
	NG6TrxzqgJ+ZIMuNptqdFINt1l9pZPyYhAQFlVcN86gDb89YI3V3D+MGp8N7ofHkSfvfIM4FR8d
	3MvkXg09TRwUcldoi7YqfwY8IayHJVoSkGcz8VyJlXmIq2Yn9MsH/dQAdbCokeMwjwGJIWj7dWZ
	OLSvr6eApxl/wKoeb4WKl/NB60FtjaZFs6TNv5LZjYTzS11387+NXrFuGY9ySQbiwbyDHjk4bRk
X-Received: by 2002:a17:906:2485:b0:b88:6542:86a0 with SMTP id a640c23a62f3a-b9081bf864cmr463658666b.54.1771880991681;
        Mon, 23 Feb 2026 13:09:51 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-b.c.i2f7e30109524dc12-tp.internal (186.209.141.34.bc.googleusercontent.com. [34.141.209.186])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084c5dcb2sm366399766b.6.2026.02.23.13.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 13:09:51 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH v2 0/3] staging: most: dim2: clean up error handling in fsl_mx6_enable
Date: Mon, 23 Feb 2026 21:09:47 +0000
Message-ID: <20260223210950.1900-1-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260216201921.1788-1-iprintercanon@gmail.com>
References: <20260216201921.1788-1-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up error handling in fsl_mx6_enable(), split into
separate logical changes per Dan Carpenter's review of v1.

Changes since v1:
  - Split combined patch into 3 separate patches (one change per patch)
  - Extended string indirection fix to all three enable functions

Patch 1 replaces IS_ERR_OR_NULL() with IS_ERR() since devm_clk_get()
never returns NULL.

Patch 2 replaces dev_err() + hardcoded -EFAULT with dev_err_probe()
and PTR_ERR() to propagate correct error codes and handle probe
deferral properly.

Patch 3 removes unnecessary string indirection in dev_err() calls
("%s\n", "message" -> "message\n").

Artem Lytkin (3):
  staging: most: dim2: replace IS_ERR_OR_NULL with IS_ERR for
    devm_clk_get
  staging: most: dim2: use dev_err_probe and proper error codes for
    clock
  staging: most: dim2: remove unnecessary string indirection in dev_err

 drivers/staging/most/dim2/dim2.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

-- 
2.43.0

