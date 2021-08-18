Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D9E6D18
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 06:05:59 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id x4so1141675pgh.1
        for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 23:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mboTeGUKr9yolgqYZyfRuYdmdGDjzaFuP+f8ddDuJQs=;
        b=VXB5rWrOkOUtfCqlqmI5NSVNx72RB77dAy2oZKxsFgyJYk7pRfvjGekORMHd3qeDjV
         w62NkRG1JnHmoQW1LYbSqf66ms3qEBb5M12TfQfmYL+UCdit3vS6intdi7dOK4yxjtOO
         0a7us/8TNkOy5LfwCUNfHgiRrh5IwxNX3jPnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mboTeGUKr9yolgqYZyfRuYdmdGDjzaFuP+f8ddDuJQs=;
        b=avXb5TFy3FOfiKp2qk/Se+yB+ptXWPd5kBs8BVGC83eGLTAwqvx0bGlozxKY/wla+i
         Oe2vv/aZJz7oupb4IOM0RgO5KruJ67qWcd3pFq9eZP3g3KaVRwX3eZ5DVUBaJKe9gq+n
         63irev6wHvsAwZsksHL8ue81Kd/kY2/NABpnTw7z+9Z6rXdPMwLTYcQ3ytzeWGK/Tm61
         Yt26yMv7WXEovSCVaDPxBFqRcUaLvJNLpLZksT3Uq+bSTJs465Ioz9mGwRA12K32qDEv
         iqir/Gj66LPcjjBH0/+Bnpsp2n0aY4WIrsfCVbb5EXXRLTqstOwX1VZgNT7dv6HwBVRZ
         T2qg==
X-Gm-Message-State: AOAM5309HVFR4wsdS6fDj7KEynfHlzKhvOdEoeAAy3S5zz3UYYAqF0lN
	KvO0S+1aW5mUC1ekPPW5nZ5dJQ==
X-Google-Smtp-Source: ABdhPJw0NQnubE2J9ww2IV6yMWGOt/X1HjRivrIndHgKRL2cM8oCkbJtHPmmWE3y9dhwziqzIdlJ6Q==
X-Received: by 2002:a63:2442:: with SMTP id k63mr7181356pgk.54.1629266759640;
        Tue, 17 Aug 2021 23:05:59 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id v15sm4713102pff.105.2021.08.17.23.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 23:05:59 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>,
	Daniel Axtens <dja@axtens.net>,
	Francis Laniel <laniel_francis@privacyrequired.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-staging@lists.linux.dev,
	linux-block@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	clang-built-linux@googlegroups.com,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2 29/63] fortify: Fix dropped strcpy() compile-time write overflow check
Date: Tue, 17 Aug 2021 23:04:59 -0700
Message-Id: <20210818060533.3569517-30-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818060533.3569517-1-keescook@chromium.org>
References: <20210818060533.3569517-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1260; h=from:subject; bh=sAqjTzTf+mWFy7xD73ZEpzjamgoLfVlMB8Pw3aei0Xc=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHKMkHMEpm10nE/aAHB48K6cSsvZL5sfcJfQj9wD4 87AucWeJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYRyjJAAKCRCJcvTf3G3AJoHIEA CVNsWBrDfaVMhp7dy0y/IJxDyV8yomgG4F72g/uCRRfJZ6t0QDX4mJHghw3qnhtNERaVf1zfyT4EpR Q+CnBXAbbYOY29o4ZaC5ADslFqQrcq5UXqAtvXX2hNdtEpN7jEvy+T0Dp7gErnaLTs1ZlewzFJixmh 05xnc5PGkQ/a2fhA/CtaXfcvvgj/Y1w7itfG3KT1Pc8P7hAB0xQUn5JwIyBFfsLsANHAXHUbw9VYDP fZZ0GNAEXZSrloJoa/3h+EnpUqfUAHZ6NG7o5k6rBUn2ktEbmeFwRAcvF137eXA++u2tSdegoXt14J LaoJ3RY4se8BmlCpgiOu6mTSPrs6Jb74GZdcpGwlL++bhsP342ng60dkvdbosL5Cz5rcQRxwrJ252w 1U0/10JSG6NNPtAYO7As1zp/w4iaNAbTundBjm6o+FckreellK+acr/YR5tu8mhYcwwjhv7Gn0PW53 tctiINRIsKtDHMAo5AYvcxOB0Cxa8Q44hhowrhkhYkzBO6F+t4p0Ht1Gse9m+/b9W5FzR+ruuTjN4b sJwG5NlgDrw9HodFlOrFU0g6f9jy+pOvo/aUejebmfFQ0E0rMohB1Ca6a4NGl1oW+3zmYJgmF3QYnL 3ztj9l/h7QOAIug/e6PSNcgokPbHAFyVpu6eHLsTcqKbjMMcdhK2ihPt1Oaw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

The implementation for intra-object overflow in str*-family functions
accidentally dropped compile-time write overflow checking in strcpy(),
leaving it entirely to run-time. Add back the intended check.

Fixes: 6a39e62abbaf ("lib: string.h: detect intra-object overflow in fortified string functions")
Cc: Daniel Axtens <dja@axtens.net>
Cc: Francis Laniel <laniel_francis@privacyrequired.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/fortify-string.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/linux/fortify-string.h b/include/linux/fortify-string.h
index 7e67d02764db..68bc5978d916 100644
--- a/include/linux/fortify-string.h
+++ b/include/linux/fortify-string.h
@@ -287,7 +287,10 @@ __FORTIFY_INLINE char *strcpy(char *p, const char *q)
 	if (p_size == (size_t)-1 && q_size == (size_t)-1)
 		return __underlying_strcpy(p, q);
 	size = strlen(q) + 1;
-	/* test here to use the more stringent object size */
+	/* Compile-time check for const size overflow. */
+	if (__builtin_constant_p(size) && p_size < size)
+		__write_overflow();
+	/* Run-time check for dynamic size overflow. */
 	if (p_size < size)
 		fortify_panic(__func__);
 	memcpy(p, q, size);
-- 
2.30.2

