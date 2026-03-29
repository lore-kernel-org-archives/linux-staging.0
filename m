Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEC44502F
	for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 06:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774765385; cv=none; b=b1834cAlIlLAsBUSU3nJ5R8TL5DA5jOrC1OGUEKs/F5NJMX2vC9Mkdn6jtHm73YBiFxmT8G4wU2GihfHBFqmmhJoYgF/wEaNSP6VY7htYsvGQUm3Zr/b7pKIfU9FxRmaxYbXfN/Hk8qTlS9JmhBw/RQ56KG1lsBk8gekrLQ0UGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774765385; c=relaxed/simple;
	bh=i0pePwZ3y7DZ422ucJbUj/55CfTnv291jqQYwO4/qFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fmzjds0O46FYJ1ixT+2KOh2q7Qqt8obazNEivHdaY4vawsi8eIOWUA0DcACp1AKjKgdYPNJo/8Zj1lGEaENjO/oDQo3qdNZ43ZlALBF9hySKJcc0Aary/nv/2DCAWl00rOIKHo12DX/VilPoaJu6a307/GzwN+Ccb+6O3x2cjtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R8ljriyp; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R8ljriyp"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-43b949bf4easo1952428f8f.0
        for <linux-staging@lists.linux.dev>; Sat, 28 Mar 2026 23:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774765382; x=1775370182; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0RU35JS4DH57VkMsmmqVtYTZvcfog7ONdCwp2cAdoVk=;
        b=R8ljriypSZv0Y2EOaysuoQ1J08AKQSgmzLpQLtIx0jKT5JKUaXQmCAqs9vYtVZZTYd
         1DFE+ADdaNAqKBNyJRZx/22pZmlQ4WsPy6Htrdn9N6GbumaSEMLOZrPj4ZiRtOyGtvLe
         lwyOIZdEyWyu/xgqkxsGIf4qS4GjnBb4wG0DbwLBElsem+FMpAwLOIGRD7a1TVrs0bWL
         z5MBPv/e1Oy34WQguFRM2NPQClAldebV7q5rfg+/4mEPbZmOM92jjTLxuM4ei1wAmfwu
         JAuHejP2Eyw9mOYhLHL5K7SvpJ2xjj+6WUjm43rlOrni7RsMCw7o4qxPT1ee2xNbrZE0
         d2yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774765382; x=1775370182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0RU35JS4DH57VkMsmmqVtYTZvcfog7ONdCwp2cAdoVk=;
        b=EmExzKSBQ4QTI/OyfodcwtDRrO3Fb55bgwoj0N/kFYsLofSSZfFTKmhD6JdxO68AOw
         J7qOZ3e6ZonQSdCtiEt39yfEsq0HNzBcdkcFmeVaJR8VEgUkD4OvBfIRUcISk7x6CpNV
         G1MJTSzEiiilWHp/uzUpaaDZlV1A9v6nN5ccl1gLAVbtPq2xrg8phMdaBhkildaaqBm8
         BRdFzJ+DRYJto1636fC97Na7cUDPAkzhdMW5prQ5MrNZNpF3D/5Heih9QhJPEuJfx19n
         cVyORKNjjhSQlx6Ms7hnEZD+KdObaSBfZ3UQTPZpNnWTrmZ/IgljufWgBVrVKlmFoKAS
         VQQg==
X-Forwarded-Encrypted: i=1; AJvYcCWhE+TS0CkeaIOMiBdOHE/OgyFgVoO9wKWpEBQiUGR7Leb1sA6bVZzQsYW+N9AbiOxCo/ZntcJi2POfipuc@lists.linux.dev
X-Gm-Message-State: AOJu0YyXndPpfcHA12uUoPlyiwUIoloSOridvrgaoOB6jeRqtj18/34s
	p08LCHTDNS/frDdN0BhudOFrmzwiiQQ2rVkxqPE9z61FEqilcE3POUYQ
X-Gm-Gg: ATEYQzxvUGS7TK6nPjvG/1kfQtL4IAR2/85dZm72TBHBGvnq03C/kakSi0FvJeN3zce
	aZSJ9OBP38J/BMIVBWu48K5ChrGH/LtJgVVuRWdHE3QB7fp3Cp1DMddSe87xKc5KcqW6d51AHa4
	XcPuUsQHeM2+daXSK4O9n96wFr1c5j6o3nyn7x/F+X21ZTKNgl+7+BiwGBrnQ8452gpvgjtYD6r
	gDGKsqostJoyQtN368vGMcM/jCEoNm6ZX6B16kVaZjoLKstsQ+CNBSiY8qaHWzP8mLwEUAdZZGo
	xifbbQMV9D3WTbZSqeAVbKyA4+5wPkC1Y1x/tVELiRhY3v/9EE62hyFt5vcTQ0B9mpoaodEdOvE
	py2iUxd7piQWEgCOE/fko0tHkTOB5tHsL2gT/v2IN8Qm9yrlC/52UvuAiZQqa35S9fP6afSA+bz
	z2g5cvDS7FvFNa3/6XpQ7H2vaa+rtL/LU=
X-Received: by 2002:a05:600c:c172:b0:486:f893:56c6 with SMTP id 5b1f17b1804b1-48729109ac4mr111790045e9.10.1774765381948;
        Sat, 28 Mar 2026 23:23:01 -0700 (PDT)
Received: from bera-arch ([2a02:ff0:c13:2eeb:2e7c:3a4f:2bc2:f78a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722be608bsm277135915e9.0.2026.03.28.23.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 23:23:01 -0700 (PDT)
From: =?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>
To: tommyguo039@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	tommyguo024@outlook.com
Subject: Re: [PATCH] staging: rtl8723bs: fix CamelCase warning for READ_MACREG
Date: Sun, 29 Mar 2026 09:22:32 +0300
Message-ID: <20260329062231.10536-2-b9788213@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260329045447.49789-1-tommyguo039@gmail.com>
References: <20260329045447.49789-1-tommyguo039@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 29 Mar 2026 00:54:47 -0400, Xiyuan Guo wrote:
> Rename the _Read_MACREG macro to READ_MACREG to resolve the
> checkpatch.pl "Avoid CamelCase" warning.
> 
> Signed-off-by: Xiyuan Guo <tommyguo024@outlook.com>
> ---

Can't apply it to staging-next.
