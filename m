Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD9918D643
	for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 20:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752870743; cv=none; b=ZjltuezFk+A9N9v4DVeUkTJ6MYRB9bE+iYsuH2Hwfmae+jDi3wpsTxDd/ykqMM2DTn4F9Ey8LzkbNOZZGIY9FACdLduFeV3QIiRWRC+r1dctB8T2zCIvF+RFH8bx0Aa9Gq5XD0EyQycEbK+UEjWdued7S88B7ooCG/iotL3+m70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752870743; c=relaxed/simple;
	bh=4Tw9BC7cQxs05B9tUg+PvNdlupf5tPIdaQ9IfTgq4DI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LYw0CtjMExfoBNYfwD692u5QuhQNt04bPlXISboAgVg5/n6MH2teAR1HNfHJuYiwbfCB4/BaP6+B59p0AXedhcvsZ9whNByFGGyiqGlrdnPweJ+SNtqx3ic2gnB6eMkhcaapzvF5ei1OAAMp/YsaIQL/eIN/57GxRq556hF2Tmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZbM1mwBq; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZbM1mwBq"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2ebb72384dbso858658fac.1
        for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 13:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752870741; x=1753475541; darn=lists.linux.dev;
        h=user-agent:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VsTMl5ayNgd8StI3u0W+gqGFg6Ns2EA4dxNGyic4NMU=;
        b=ZbM1mwBqqDU5Yr+D9d69bYyiQLmNlS/1UtctO233QwkxNh9ZKPpPXjOfTADiGLTqgM
         BQefNW5KizwyJQm+xWQbjWFuSXDxUEmV6T0NnXRTZrFUJum1u8vj6wrbLUHf6zSSNIpo
         p+36J0mh3040BWB+Ww2Yhhe7Fd3zSGf3QK4dc4OgSPTozyX+G3aKZKdWf5z/f0OkZMPD
         3fAVY1eQh3w+OIKf0x3Dd+oHgoa7Fid7ILZBFyHDlGJkxJ5IyGX1cwi/Ha+tLukgKVsO
         yUK7+i+WlQsNTQYHmVVPlVBNuwQpf9yV6waaHO4SkYOQUFIdxB4N4HvqIBJTv7UC1Tgn
         fYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752870741; x=1753475541;
        h=user-agent:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VsTMl5ayNgd8StI3u0W+gqGFg6Ns2EA4dxNGyic4NMU=;
        b=bQ5cVXhzbHjGoAQ/Pviym7FO/qeNA89ZKlY5UiD+M4kxrrqKfsoErjuMos2DRvYZyd
         Fw8mS2Jqdk4BBI++60NAaYNElrnwW8MJcHkmFvolAyANJCGNwFodjgtL5JrmbgYBry2f
         14zXspPMGJITpqSauvQQ4QXu1GFrpFq4yRjM4XbUl2v39Hy5Fvrvoy5LYxwWn/xfoSQg
         ZjCk8wfqgNhI7BPriF3Vty13TvwTsQH7QP1gCn2/oPYMYfsxXGihpC1LYEOLDfQwvtiV
         ZkqfJ2Ye8ix3DCOYQt7UpyOm46Rgy7LoPuS6bkmh0MQULA0mrl+mP9KIDhMoKBLK+n2v
         7p0g==
X-Gm-Message-State: AOJu0YxRI+sWXDdE8ANzD9HOWYI+XFxJp9C5aEB3FQpjmJrH2toimsw3
	7hX33M/OQ/Y4gI/3htZlHTAlYg0WKvEIP100kmGHAhNDZ69UYMPlNBco
X-Gm-Gg: ASbGncsZBy6JvRjJSztXpEbizhlroUaBix5sYsNasOt+WrV7ZKEcPGYyd1BBi0RLfJh
	KbQI+PaApKoziUgvFefIC71rEXIYphBHUmopvRUo0GYMbUCUv3JI7GUi/EC6w+Zj7/U6cHRVh6Z
	0V2yF0nJm9x1rpqnRUYpuApC28STkoAypldbfPFTbA/EvYfWr3mZ8Bu9MLTzfTR1Wd+dEiiQJUV
	QeBrmMDXNKju63LXHQBXFyL5P00mSMaS1mvj8X5eqUHdNWga/MH1zU+u/5WutZiWrs5Nf/RDhUu
	d8ZPJHSJqRLa+DZqgIpI3iexp92U2FsqMasypbO8ILw/97uJC6wqs+DAqioQgMl9OD2atf4LXgF
	hqXPwqLfhMrrpmY1w/dQAO7lmWGLi5iIEX33gDOOVVcfCc26yiw4JKmTQFgW8ZA==
X-Google-Smtp-Source: AGHT+IGXpIp1fjCASD0DU5rL5C2avlfFVXZ0tAQWGosKnkzFmyhma1UEPPGPttyumt8CkMZPNplhnA==
X-Received: by 2002:a05:6871:3685:b0:2ff:a814:dfdf with SMTP id 586e51a60fabf-300e9dcc04dmr3148383fac.20.1752870740749;
        Fri, 18 Jul 2025 13:32:20 -0700 (PDT)
Received: from MacBook-Pro-de-Ignacio.local ([181.161.11.224])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73e8354df9csm885664a34.12.2025.07.18.13.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 13:32:20 -0700 (PDT)
Date: Fri, 18 Jul 2025 16:32:18 -0400
From: Ignacio =?utf-8?B?UGXDsWE=?= <ignacio.pena87@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: sm750fb: make fixId array static const char *
 const
Message-ID: <aHqvUrXtxwf_k9sI@MacBook-Pro-de-Ignacio.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.x.x (Linux)

Fix checkpatch warning for the fixId array only:
"WARNING: static const char * array should probably be
 static const char * const"

The g_fbmode array cannot be made const as it is modified at runtime
in lynxfb_setup() and lynx_alloc().

Signed-off-by: Ignacio Peña <ignacio.pena87@gmail.com>
---
v2: Only change fixId array. The g_fbmode array is modified at
    runtime (lines 786, 788, 949, 953) and cannot be const.

 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 039e6875c894..c237a8f8eb59 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -730,7 +730,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 		"kernel HELPERS prepared vesa_modes",
 	};
 
-	static const char *fixId[2] = {
+	static const char * const fixId[2] = {
 		"sm750_fb1", "sm750_fb2",
 	};
 
-- 
2.39.5 (Apple Git-154)
