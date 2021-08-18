Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451DA6D18
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 06:06:02 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id w68so1060034pfd.0
        for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 23:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6lG0U8bM2TUXGlj9bAHKfwVFEdBo2YZlvkgJ69Lo3ko=;
        b=Y/DVgqUz//veWIPGInRHjxd8QhbyKfsy0kdugXO1nEyKRG4J+RATjtzLJoSS87jCco
         VSjAoqrkaHNZh0+mHRdYJBCbqV9xxVXdwGu7uaa7PR+N6pyz9+QKjSd2/AWYtac6EKNc
         sHLZn6ndy938GBH63DZ5ESf+mXsv8jS252ytM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6lG0U8bM2TUXGlj9bAHKfwVFEdBo2YZlvkgJ69Lo3ko=;
        b=Rv8L0DkF1FSv5WYWC4owlmpQ1k2dODcz7fmSnA5qKC2rDUHtFt9DwaEs9TdS9YwwXO
         O2QDeaH+0VkSRugmtJykPW3OcaN6z9vnWZcyQnTkFc566r9zZo8ypTRwuoAqRdBxfO6j
         UXMGxHv2CaiXKNnLiGUcY4863EOerxUknRzaa3zzW+o2i8JZ+ir4dImcJTFok6Jv4hME
         OWsYm0Ywc3ioQ7U7uGUxzt8Ga3RpqmqZ6sdLLI806Al59Yek1CF+F3sUghBKD/2FWHr2
         xVMiYBqX+Ep7wjEf0HoOUc3vgQ7UpqvIAjIlqenv+SRadwY5/vsz+MbAibgGbvRfkcuR
         KQ5A==
X-Gm-Message-State: AOAM531WDdny383WCwL9UX+jzzC+74M7Pg/TkuuwhWZBS9uC9oMp1CSW
	555GomjJivkCQOhRSwgFyAvulw==
X-Google-Smtp-Source: ABdhPJx9i0gP/tEqucjw5t2MRNzXtgPICZZmJol3/cEVKCeeDWJ8qCew27BG46wra+MkbfYjKbKkfg==
X-Received: by 2002:a05:6a00:cd0:b0:3e2:209e:4e30 with SMTP id b16-20020a056a000cd000b003e2209e4e30mr7598474pfv.59.1629266761883;
        Tue, 17 Aug 2021 23:06:01 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id r10sm4624434pff.7.2021.08.17.23.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 23:05:58 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>,
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
Subject: [PATCH v2 28/63] fortify: Explicitly disable Clang support
Date: Tue, 17 Aug 2021 23:04:58 -0700
Message-Id: <20210818060533.3569517-29-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818060533.3569517-1-keescook@chromium.org>
References: <20210818060533.3569517-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1427; h=from:subject; bh=MScHo/g3fAm2U5yn8644/6JAGaRCvw+x4s3NMxUkYP4=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHKMkDmaoP7/LrBvrUTwAq8PIwkOtE8yNEb1/iGaE eotqJxGJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYRyjJAAKCRCJcvTf3G3AJvkeD/ wK2I9wXb6VkTqNx8ve7VdNSMmlz+1i164ClH9CGR/35x6hLdSQ8qayX0H9g6LrgzVflJDSu0VPqZq6 B60wT0GUsaN+NPYsGb2bVu1Rg3uumqZGiK90AHNJmSYkYU2G3Fqfi/WbeuSh9MygcOeGp/a9x/PQH5 e8dULezGq6dCpC7cs5Zl3okkhjEBCJNG2UsDzKuR/shPokEXvmczONNPE0wD9SGKoJlCrtTATmKvin 4tu2+3vQYizkssvftVjPL/zU+2R6x89hzrj96XdH+uAmeG5P820sWztifwnAHNcLVL5gq7wUOMrJ+f Z4XjIAC/G5EaSS4AhVIu9sD/iX8aeWmFJWF/Y21WLVPcvT0CbToC2WmKfl6Cf/5cmduks3BDmUc73D LWQ9JncTl44MKCvuBhARaFmlaFAJHnLG2EvjMIRi62WS27zMVn6Had7IAo/qffp70xB+LqBNwHlEFR 1DOf7RDGukFMS2YPB64C7srE0otlJasITjwoT2VlC8SUubfSWf2Xs29w2K9ID2LufJo4jW+DES/y1x In7sKpTi8O1ywlBFrMpRGpBZemeuMVX+n2a4KW0Dlmr8PJZVEczotW0P4mEO8JYhohZFLrpQR/oM0d v1l42WB3iKEQLRJlt/B8Os8r3w8Ad46AyHq8GE3PhyPABlRRPciSKq8TGApQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Clang has never correctly compiled the FORTIFY_SOURCE defenses due to
a couple bugs:

	Eliding inlines with matching __builtin_* names
	https://bugs.llvm.org/show_bug.cgi?id=50322

	Incorrect __builtin_constant_p() of some globals
	https://bugs.llvm.org/show_bug.cgi?id=41459

In the process of making improvements to the FORTIFY_SOURCE defenses, the
first (silent) bug (coincidentally) becomes worked around, but exposes
the latter which breaks the build. As such, Clang must not be used with
CONFIG_FORTIFY_SOURCE until at least latter bug is fixed (in Clang 13),
and the fortify routines have been rearranged.

Update the Kconfig to reflect the reality of the current situation.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 security/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/security/Kconfig b/security/Kconfig
index 0ced7fd33e4d..fe6c0395fa02 100644
--- a/security/Kconfig
+++ b/security/Kconfig
@@ -191,6 +191,9 @@ config HARDENED_USERCOPY_PAGESPAN
 config FORTIFY_SOURCE
 	bool "Harden common str/mem functions against buffer overflows"
 	depends on ARCH_HAS_FORTIFY_SOURCE
+	# https://bugs.llvm.org/show_bug.cgi?id=50322
+	# https://bugs.llvm.org/show_bug.cgi?id=41459
+	depends on !CC_IS_CLANG
 	help
 	  Detect overflows of buffers in common string and memory functions
 	  where the compiler can determine and validate the buffer sizes.
-- 
2.30.2

