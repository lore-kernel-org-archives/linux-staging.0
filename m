Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB372FB3
	for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 20:59:13 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id k1so17546105plt.12
        for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 13:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vRBStJlDhZm0d9eTtG5cRn3WlrdJwJNmuGhxV2K5EZo=;
        b=Nsz8DWljVaxUV6IjBgBUCk1PKkbZhxU5GBCfudGyn6bedsv1Ex+WBSMOLSEz7G7MgN
         WAOh3b8WcpvZHC/rIjR95hnJWlWBQ/sOSeDYDJSdrWGDY1nyNgJogzpPcbea8ng/yF2+
         b7TY+b4L/qmqRTkRVDoo5D5RnEKDBdQLyajYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vRBStJlDhZm0d9eTtG5cRn3WlrdJwJNmuGhxV2K5EZo=;
        b=j0PgQXb38LPuN1qjdqLf85XyG7/Owv+Ug83kcH14bwAboWQTiqAfXmsYhq4SSEVmCi
         v2kWk3D5kq/O9hMEMtUM/Ojo5n2azHN4GAnRFA0otw2V+ngq61b2+g4Y2UxXRRlaJ77v
         dFTeoNdePPMesPjneXDd5vwiHyAle/RBbglAYy1CoFDQ9Q/nhQn9l8vypenb7SDcM+FK
         KAGu/BXpjz0ObVbUeVFKKVkvnLc2ZHZvj+XgmzRa0tE0q2eGAQAOCe278ODALuOVAlF1
         NC3w7BSsx9kRw+qLe7oJbFuOeYbtCPQ+EjNsUTyjSZ0NhQOqbSS0cdM1kOyJAyWIkbg8
         EvfQ==
X-Gm-Message-State: AOAM530OPB79Lzkc1zTeydrfTaDlCU2jocMzVn7pG40zo87anMD7K0sr
	FptWYe25bNqqGY46EZ/vSqArAA==
X-Google-Smtp-Source: ABdhPJyhWTh26zwaflmu8tgo3ARiqPdvOo/hYrckDCizLtD3AW+7DzGVFSehDuB/fG3mAAGw3NVedw==
X-Received: by 2002:a63:67c5:: with SMTP id b188mr25442155pgc.333.1627419553101;
        Tue, 27 Jul 2021 13:59:13 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f4sm5114945pgi.68.2021.07.27.13.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 13:59:12 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Keith Packard <keithpac@amazon.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-staging@lists.linux.dev,
	linux-block@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	clang-built-linux@googlegroups.com
Subject: [PATCH 31/64] fortify: Explicitly disable Clang support
Date: Tue, 27 Jul 2021 13:58:22 -0700
Message-Id: <20210727205855.411487-32-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727205855.411487-1-keescook@chromium.org>
References: <20210727205855.411487-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1434; h=from:subject; bh=OZRSNCCQRK4SI9xKythqbv7zK3vuXtwb3QhiwmK2e2s=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhAHOHwCOrXdjKPaQWQTp+uW9oUvftBkVWr8r2JNok P/qAaYqJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYQBzhwAKCRCJcvTf3G3AJoCzD/ 4rXCWl0wg4txaWiFFhdg/2zB4GZpYJQfc3gKG+4JFGMNSSyMqsjR7wvIcQ9gEw3+cnobZIiaO8b8Ts 4y0sNy+ntUvilrHAnRZtWZQVZ7Z0bphyaYuQgnGELUkyMmslVUhPTzSDaughNmfUsvkEFM+na0EDon 9JJonN1vAou+/HN62VbGE5PteJlTDw2ARwNaB/UDzOa8CrMfLABC2YCMWBQuW/UqXG+bpRn/qLi5tt MCnGh7OYAK68OrH12PTZeNI0ZH3K0pon9xoKCGRcbv4RNDpmHve1klM4hflJJRVdZs1aIaNJguaJTr 6HzvMH1IlLaBIYA4lMHcv39fbSr1Z24Y78ZwSdi26YFWkGiIV/xASK0JKJFtw2FqAGh322XFPKawrG jQORn0cKmpkW9asI32mQRS70BV/yIqqzFwVau7oE8B1pGVFNOb3v7tHQ1pe2FZlG3aDgzaXiZQvgvE BV8eE10/S2h2Ma/rMjBUEOjYcpqfCji2YQ9KXUQ9H8bATOOhL+MA0kKSq2drNbUrOiob2qLfmjcBrM 9FB51isfS+QH+Q88vYo6UjSXdNUljwv7UMKGBHm5ndrT3nefrnbGQCZFQt+GVMpwNv9zz9cx59pBu/ EGTrabicSmfTon6Nxko75RGn3EwP6RSQtf7jrirENHsTFm5z7IgfJKZI28iQ==
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
index 0ced7fd33e4d..8f0e675e70a4 100644
--- a/security/Kconfig
+++ b/security/Kconfig
@@ -191,6 +191,9 @@ config HARDENED_USERCOPY_PAGESPAN
 config FORTIFY_SOURCE
 	bool "Harden common str/mem functions against buffer overflows"
 	depends on ARCH_HAS_FORTIFY_SOURCE
+	# https://bugs.llvm.org/show_bug.cgi?id=50322
+	# https://bugs.llvm.org/show_bug.cgi?id=41459
+	depends on !CONFIG_CC_IS_CLANG
 	help
 	  Detect overflows of buffers in common string and memory functions
 	  where the compiler can determine and validate the buffer sizes.
-- 
2.30.2

