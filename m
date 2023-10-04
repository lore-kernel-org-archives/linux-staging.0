Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E073915EAE
	for <linux-staging@lists.linux.dev>; Wed,  4 Oct 2023 14:18:03 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3af5fcb5e37so1416130b6e.0
        for <linux-staging@lists.linux.dev>; Wed, 04 Oct 2023 07:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696429083; x=1697033883; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R6/TWL/5A64z3k0Lwl1E33nP72so44fTzxRPPV1CpcA=;
        b=LAcfZNcH8/AIae4Pu4SNTUytGcgnbKDhQ6USqATjJ3ZlzKua/YwKCH8gwun71Ga/a3
         u4hB0m7Yn4uFafe4Pt/BWW3Xj5q0ElPJAAKD80eMOvtqWvQIAJh379NHAp5Zzkkacqy2
         2ia+4KU+ulPbzxm2sLrkug4gYItxaoEQ/1EBzHrp2yqjB46Or8maIZmhoUgv7cjmtAt2
         fIoYpaQnUqxgqW+n96NAw8sOMouZwlEygrXeM78VH3TsK5HhxlZGSyzi+PKeo94ehkvf
         k75JTKjGbc2tpFe6UyztiiHZ2ExhET7MnhPa2x7jjOtv7Ks50cezAfAPQbV9oZ9ie3TT
         hNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696429083; x=1697033883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R6/TWL/5A64z3k0Lwl1E33nP72so44fTzxRPPV1CpcA=;
        b=N0paeTH7L6J2QCJsqYFTOek4v4ClK/nWA0Bym2ZWxgs8S5cXQMyG8FzUAm/rGJlsgu
         xB4U7lUjXMSPQ0DqXMeX+MEPp1LyxIdqXetYncxry7tlmX3jnQobs6+oUgkDG9l5USnY
         KmfIIO+9P7fChJaFsMlTYV472uSjHfd/FC7nP7D4FxbgMGc3E4f8WdFA+ghOwtlBvONw
         IFb4xPD5VoPoaJf+Yjstzrk7MGEfZlxh6HtKsqeHwk2HRi9N6pzADIW8X734TvFLRqnA
         xh3060ZhUvqiXuomFJb9/yYDvcxX+H1iRjmaIKypHWIyhcKd8sgEwJ43BftnY2TEt2fJ
         zEmA==
X-Gm-Message-State: AOJu0YyArTMx6rLZvpZ7PxGfdjerX1P3S4B+codlODjrfwQ/k1X6ZO6Q
	vh9UPOQaix3wztpZNyvCqFE2Uw==
X-Google-Smtp-Source: AGHT+IFZdENtnTfT/79Al2GkgFgZYzcroccNCoL23QouRO9oJfO6wYPYPzottJe9QhfLXLLHF1SUOA==
X-Received: by 2002:a05:6808:23cd:b0:3a3:b39d:a8bf with SMTP id bq13-20020a05680823cd00b003a3b39da8bfmr3100444oib.45.1696429082602;
        Wed, 04 Oct 2023 07:18:02 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id dz14-20020a056808438e00b003a78d196acasm523761oib.32.2023.10.04.07.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 07:18:02 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: David Lechner <dlechner@baylibre.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH] staging: iio: resolver: ad2s1210: fix return with lock held
Date: Wed,  4 Oct 2023 09:17:26 -0500
Message-ID: <20231004-staging-iio-resolver-ad2s1210-fix-return-with-lock-held-v1-1-812b932997bd@baylibre.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.3
Content-Transfer-Encoding: 8bit

We missed a return statement in ad2s1210_initial() that would cause
the lock to be held when returning an error.

This is fixed by replacing the return with a goto to release the lock
before returning.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202310030222.iokamE9T-lkp@intel.com/
Fixes: 0d03d0e65846 ("staging: iio: resolver: ad2s1210: rework gpios")
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/staging/iio/resolver/ad2s1210.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
index 98afd2e9ea41..67d8af0dd7ae 100644
--- a/drivers/staging/iio/resolver/ad2s1210.c
+++ b/drivers/staging/iio/resolver/ad2s1210.c
@@ -555,7 +555,7 @@ static int ad2s1210_initial(struct ad2s1210_state *st)
 	mutex_lock(&st->lock);
 	ret = ad2s1210_set_resolution_gpios(st, st->resolution);
 	if (ret < 0)
-		return ret;
+		goto error_ret;
 
 	/* Use default config register value plus resolution from devicetree. */
 	data = FIELD_PREP(AD2S1210_PHASE_LOCK_RANGE_44, 1);

---
base-commit: a533eeaef80e879b3ad1937eee7a43d1f9961c5d
change-id: 20231004-staging-iio-resolver-ad2s1210-fix-return-with-lock-held-f547ce6fae49
