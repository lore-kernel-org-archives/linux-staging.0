Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176933E317B
	for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 14:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785507732; cv=none; b=O/nfO/+G8l5GVQZORZjQmcWqtgeoObidP+skMYlOCRvAqb/2kIqsC9y7N++aAXjS4141Em+6kxgkcuKrGxM/ce9RTB1xD8+lvJ+uQAeijPvJnaQaWraw6R/VgjaWZhRLTjOSvxESMEKajyJElTucmqZP7UEHvtN5DpOesBTx2K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785507732; c=relaxed/simple;
	bh=VzKzblJm5rgyb/ApzrdOGokPbeFFKLWcJLfKJaL46as=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AA+wF3ocfsKNQYP50bsj1ewMK2SdBQ+nBVq39lEgo/8oKiRnHL8kUWiAV985AzuDVB1xXrLLfgLME4rE9DmQqZ0ycOh4Dv3aUBZDtCjzNEUlZdFmqj7gaLnNzq6sv049a+McHXNC3h1gBo584CpA48CjjMI7E+U0v4+4GsLMua4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=moLaxpIf; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="moLaxpIf"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f707e5d75so802908f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 07:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785507729; x=1786112529; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bH2nEn+FLwjGrO0gmE8jagrScGJhr1VDjNezydxDsPs=;
        b=moLaxpIfmSzw9hBKyZuhBie2n+3zA2zc1nzxDRDwIw/D1xFcf+mrZnimGzg/Mefk7F
         T0NOuvPHetfCyVJauqAe8XM+lwrlfXs6aJJsfZ3qZmrEhIbApHfpYVcwW0QBG7RAF+6A
         Yo55YWSgRzKnSzfc50LUdxmuZf3A46fSMMUlThlGvuHZZMtqyoDZhquoxMtjGTNJ2SkK
         HiMf8ON+vOxL7ABl0Ltkhiz5z5Fx6NOnmJUGxExl4EsbVMP5/l1oPuI+ODJt9IVsTPGc
         TBAuwMRZGw+2Pijo6G3ODfBzh2+DewprKDdmxwLSAQ3NXutgQ1rX/sW1QnpmjVg8M7Ui
         /5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785507729; x=1786112529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bH2nEn+FLwjGrO0gmE8jagrScGJhr1VDjNezydxDsPs=;
        b=qsOGugqHptLTJqL9HdWAzMbOdHn5T79W8jKLT20WSZ5SQecQAsv/HG1srlNftz2JWX
         oylYGnGgtlvg+0sWtcNZO4T8ZcKqlVQZoAUAxnosRqn9VGpLmexT51iCRFlG9Dysrw8T
         qRdFFAbpgChiWiuWeid3PHVdxB7s9xRfyhcxD6sc70Hk/IJ2+wVxzQamdvJVNx7yXwwV
         UiJK1jF1MPkJIARei//ZZe4ea4/3gdBGwjGaOy+F0MwgDBuTA6o+WwJXZSf4x5BxTr8H
         wlxbB9KWqm4RRIqwkWVNuZEEUg/ss0PfwY5qGC4mQo6D8ryWQr5Am8a+walKz6nSXK8O
         UbBA==
X-Forwarded-Encrypted: i=1; AHgh+Rq0uoa+APTQA6U86YiuujKtAqznA5qI0NLnLV+kk3tgn8LiQ3tcB9gOymG9aER1Va7ietzh+ejyN9xzn8ZS@lists.linux.dev
X-Gm-Message-State: AOJu0Yz84RzuLci/wIefU9DzmA1+Scgjq5FQoyi+HeEa4TrK0y9WYUV3
	Sy26OA66IkSTmuVneU6vBnTShZRVYju0lN1vNqb0byq1RTvOLjCjxIVw
X-Gm-Gg: AR+sD10gfJ90QzB3KCiHcgPGfJKb9Gm2yixtuiH/sAz3vStAACNedcYHWA2PyPYd0Qn
	s0jHmaHaigR5FDEiMPCQbRLuJkcfgeco/UO+abK8ImfSVp/tkUZxdf8KebRwg2q7HSTTa6lBbBF
	ScTxfahLXv9ohW8rlxOgiaaBgtb6EXRHlnWPr4E4D233m13hclc8faSLqsnzdm1H0BFuV0zOdH2
	do/W2lsBCO0rnkgOIbsH2gC/kWOwYQAYpKXC9qSLugyZJbq9h6a39q9Hr8BCQpxPCtJkMMQk+7m
	k6UGR8dWedKOsnhux3sDlGCf5tUkJeUm7qchZi0X3gbJaxLFPX0mLidgNEy3QgeDMBNEgSrBfz0
	iZsgJjA4O4GLU2s7c7tET6S/VoqC5chGLhcIuQZNqaql5i3HKM1ZwCt51gSbwyWH3jrkR9u3X8T
	N3jD/dJnMkOIpIeEH2IZnbgXES0qzcLn+3cABHqxO52yMnS2XHgvzCeDC7mCEqpM3McVd9aa97U
	0/SESu0NqM9Pd1fxJsN7pU6biPl9XBzhmCFQgKjafPAPwvKizY3
X-Received: by 2002:a05:6000:2310:b0:47f:52e9:3716 with SMTP id ffacd0b85a97d-47fd2b665ddmr5267057f8f.44.1785507729177;
        Fri, 31 Jul 2026 07:22:09 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-233-039.088.074.pools.vodafone-ip.de. [88.74.233.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456220esm5560224f8f.18.2026.07.31.07.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 07:22:08 -0700 (PDT)
From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH v3 0/2] staging: rtl8723bs: Changing two struct members
Date: Fri, 31 Jul 2026 14:20:02 +0000
Message-ID: <20260731142004.15281-1-fliegbert2@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715171634.1550-1-fliegbert2@gmail.com>
References: <20260715171634.1550-1-fliegbert2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch changes two members of the struct adapter.
Two additional patches ar made to fix some checkpatch warnings.

Changes in v3:
- Rebased against staging-testing
- Fixed building error

Changes in v2:
- Rebased against staging-testing

Dalvin-Ehinoma Noah Aiguobas (2):
  staging: rtl8723bs: change struct member bSurpriseRemoved
  staging: rtl8723bs: fix Alignment should match open parenthesis in
    rtw_mlme_ext.c

 drivers/staging/rtl8723bs/core/rtw_btcoex.c   |  2 +-
 drivers/staging/rtl8723bs/core/rtw_cmd.c      |  8 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  8 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 80 +++++++++----------
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  | 12 +--
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 10 +--
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  | 12 +--
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  8 +-
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   |  4 +-
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  8 +-
 drivers/staging/rtl8723bs/hal/sdio_ops.c      |  2 +-
 drivers/staging/rtl8723bs/include/drv_types.h |  8 +-
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 10 +--
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c  |  4 +-
 .../staging/rtl8723bs/os_dep/sdio_ops_linux.c | 32 ++++----
 15 files changed, 104 insertions(+), 104 deletions(-)

-- 
2.55.0

