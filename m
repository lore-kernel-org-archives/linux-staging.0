Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87AC27FB2E
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 04:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771907847; cv=none; b=gV9jS2M0GE+6rsHhcVe/4TJgFKw7K0x1vJQo4Ij9GMyG4uZVR+A2RS+2ELQlG/n96hXIAiH9qdROZOXXYKI1lW8zg9jYnIRofQ1tXBXh6OJCPegUo4QmND4EE+9sqE3eZkqJXNS4xizvlXDqCCcW+mmv1iBL3W4yVtCnrSJq9II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771907847; c=relaxed/simple;
	bh=rkcaTzdhnOUsvVPPDN5jN/l9NjqX1ct2YHAKgIoFbCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qg5RfBaXAaKHB3XDWD65O27M9s3GecKShepF+kj+LH4M2CQMPAy8YefOc/4TpzknAQ63bG0mta24EaMMlVCQ/hC3xamXZ64iJBB/5s3PRRRt85ZRnC4kIgJqt3AR5bwCmgtZUVwFKHiKYI7dVjQLS99BQ/vMaPZjcqTAU19MZE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yyx8/0nL; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yyx8/0nL"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-65bfe9c585cso8161420a12.0
        for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 20:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771907844; x=1772512644; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHFoNpDggMVPU5m2ABJYI9RV/07YWIq85AG3VfOeQgw=;
        b=Yyx8/0nLj3WtmvrezrvFh0xCfudqQNSTSGmYbXbRJEhBSR1jyuTwfHFWBun1NJ+QQ6
         g2UNCiKjPFn8SN6MElC/d6EiZ+x28rt8SZEh0wVcKsFmziWrZqGFGdgVTH4W+vSx4xkW
         f3A2rnqoU205L7zPrAEo7YxQG7lGjhFxJSHc1mvMkH1eP1ztlqybhN5USNWTVJZtHhwJ
         ZWdx3pAdlhvqs/Nz8cNfOoJRbonIo7TY4JkNihmYqniZtZY/gKJHBV8qsCTIzgxz8DXq
         5xjxO3f/QmfhKTC7PUFuJQ4mllEM/FxWjvlgNSGoFtp8GRYycg8jCNURML7V1o1SXG/3
         1zyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771907844; x=1772512644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HHFoNpDggMVPU5m2ABJYI9RV/07YWIq85AG3VfOeQgw=;
        b=Kd6dlRjtQZzNSV5iqKqs3FIMGBR3ycJ5MZIXfPOJCghEUuwU9kmV2JuqnE74EkfB7+
         VY0Ve3OmI8CaOdIzM3EfIWmLEL8bry9+NuEalgVvkmfDcS8itEaIVDuHKOQ+4LLL7yHM
         reZIlMugiQ+mVk6HW9YbDdUtdIX+Et8XFpbd1L0Ltx8sKA9FZUJfkNjHQYFqxnx57t++
         +d17AyZyXk42joPSkke2vvada4wRzYs2az0v2wSryOZ8nRNsF9ToPoRU8NOxAC+ta321
         r6z00Ytf2d8pRcKD3NR+rpsr0cZdKia4u9VdGBVsXw4TMUzk4US9n869oWMF0PpQWVI9
         71UA==
X-Gm-Message-State: AOJu0YyTI81raDsnq4imyMVMvwKfxg3bw11NK/MuPWjasYFScB1Y90sG
	3JVC3YRvHTzlxWNw7aIdSaLbzM4jVWtVe2Pf6l0OAm2R/x9ooFrC5Na02zX/1YM0a6CJsO4s
X-Gm-Gg: ATEYQzw9RBHWgbat6qaf+6h8hcK7id4wSilOw/JNMSeuWVgmlPVoRvNlodVVG27KIcT
	F8LV4eQA7WUMKmIbvIF5Xy4USRbyKbu4y3gfiP2F4hxzZgT5pVkjPXetQ1kLieHxjKXAFkUolwD
	9vDqo13vB5+fVK2gxI719YN+Y0yWq05yCePhJrk4h3X+U1I2z6XLd2uIfhGQ3/+LgbWS9GXtY5A
	auAOkIrwbEqs9THoD/D2qOXlG8MRM/5D9JB3Mh8RuynsdHEw25uKfNhwW5yzk0UJCH7G5VcfXbc
	Ce1HWMLk7+XDZ3pMK9CP2zuUl+4OMbxSJ1pUca8KVOQfUtloL0UBYwoiW1oe1pHYwjPwzL+NNxm
	ZID4wqqporOQ/iyI+A+STqfIjZB7JhIGPw/4b3LSdttv6Fw//v14K1jzBtuWu7UeY8YViC0H5tC
	9qXmpiVjCl3Ql/PszneIwR8BZ4A5uwECkxq4qk95l3Wt4PuFn+tWw3BDz3VnH10fpFWjbNcYpLO
	coSgxlcu8P95woDoS80D7xt1qOJ1Aiogh/Zk9rJNe+DfPfABKRK9ukkNKAadfyGzA9L9XP0qQ==
X-Received: by 2002:a05:6402:2551:b0:658:ba4a:c357 with SMTP id 4fb4d7f45d1cf-65ea4ee29a2mr5121965a12.9.1771907844039;
        Mon, 23 Feb 2026 20:37:24 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-b.c.i2f7e30109524dc12-tp.internal (206.242.32.34.bc.googleusercontent.com. [34.32.242.206])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65eab9aae0csm3104205a12.10.2026.02.23.20.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 20:37:23 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH v2 0/3] staging: most: dim2: clean up error handling in fsl_mx6_enable
Date: Tue, 24 Feb 2026 04:37:20 +0000
Message-ID: <20260224043723.1828-1-iprintercanon@gmail.com>
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

