Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF03870
	for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 21:06:51 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id mz5-20020a17090b3785b0290176ecf64922so6653800pjb.3
        for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 14:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ix+5YCGgtf4ASFZ4v/FG8sEQnqankYDKBfCTYQuGyCQ=;
        b=bnW6f5ZW6PRNMZTriXsLXCjk+oTRJuSSLMLz4NTDsbeQQuOz8avWkiTWuVD5pzhNMg
         iYCqb4IKkBB7T/0UQWl/ua4svjdGwPBZ+rR0OQm74+vwXdPpiJrnKVlZXTKACJK+Udlc
         zOJKY2stD38NmwWjsipdZ/+lTjPzW1nI+JqKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ix+5YCGgtf4ASFZ4v/FG8sEQnqankYDKBfCTYQuGyCQ=;
        b=CR5ZFN+XKHNKIoIu+VBXaodmwKpL2Qsqj5aqL2vfwHG749BFxL7H7jghv5IIJdiifo
         /wqRObRb1Qd8mIpXBWCpeA4HjnFam7fiP9YmVnNCC9Gp5UE0d9OyxKwnnkS0lZ7oKYEi
         GeBc/IwgiO7h4sGu3Mv15MBzSDlPZm+/4u7FjbCDONNLug7IEKNyjI+lb1PytoriDfff
         WR9yVVDfmg9AzY1GRR2aobbH0pFWEaisFrpG3EmIIH+sGRU6cMvQCD0m2JjekzjPc83U
         AT4FBPAaUI7APS3hDFcmXYU0ttxet1ubiXdwnsCfxmong7bYyJxtmVCi7O3lf6ojATlz
         1wPA==
X-Gm-Message-State: AOAM533p2zBOjwkPwcmsq5ZFGiM/b+996V4QRT2V9X3iL6h05pm7utIY
	jLMFWfxJOQmhsS/3i4ftAKRCSw==
X-Google-Smtp-Source: ABdhPJwjggurGSKfII6BwItVhzcFMZ6EXwHYvl5td/Q0hyu7n7FMd1AYamrRsA+/bObA3M9juNtcYg==
X-Received: by 2002:a63:ee11:: with SMTP id e17mr25530642pgi.323.1627420011461;
        Tue, 27 Jul 2021 14:06:51 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d67sm4856651pfd.81.2021.07.27.14.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 14:06:50 -0700 (PDT)
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
Subject: [PATCH 40/64] net: 802: Use memset_after() to clear struct fields
Date: Tue, 27 Jul 2021 13:58:31 -0700
Message-Id: <20210727205855.411487-41-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727205855.411487-1-keescook@chromium.org>
References: <20210727205855.411487-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1002; h=from:subject; bh=W7mlz4eEFjlHgTTisxMegB0ZhUGQYb0aFf/Mmy3UOio=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhAHOJorvZuoNL45b35HsPI1mAinyEnA8ZX78L8pdJ 8EQ0wWuJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYQBziQAKCRCJcvTf3G3AJi3aD/ 9pKVrL7GGdaVZl4FyfYev6TME/fJq+q9IgkVKQ6QCoKY5T/n8lqb9wXu0sEDlYK/V1GqgYIyOt/r7B kfASageiRvyRg6nT+2AFkSJGPmwhPkUx2C0pnq6h2eqXzqar9s8LCEi8fZCrBkXObTwmGt5Elv2lL9 u3iRYv/VfrwevBjfH2MskR4OJDtdPLapzgjtDpmesjJgIuFqbLVbP0StJ/6qcp3046MFgobYGk5guX yTH4PNsJHtyrgdozwjttdVzeuhBt2WzgJQ1eaObNsLLLG37mPRxwCItRBkCwVkgMqOjQ4hE4IYAhXt A46hMy1iM0tpGB/EfZqHobJSxHkdDF8gcTzETtHJpWWBZYyLUvM2XIQ/jR1mne6xOpVdLMQUFxCFnn mY2w5SBcpciTvwuit/vfLui8lZtt29yIVecQbgt9pRHcNcLDYVr8lSjPmpO/H/Ey43fgftvpDaUE1K kZYNcM8o3ZI3ko0BO+gOPvhnYi1Hhu7xktOgZx9M3VFKye7+Rx5Hna1V2YsePjXkMGHbDlKaxCDbwc Es30R4/sgZcQr1pAtYhRgMIV9sd0TuiSf3pQyy3q5FvtNiOSMBvVO2cVjj+RDAqI4SNkvoAH2zrvou WNPNye5apRTKo4NrCQk68ENprSWgvKWfzUOE9H92IsOJCSP1oSa6QuA89TCQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memset(), avoid intentionally writing across
neighboring fields.

Use memset_after() so memset() doesn't get confused about writing
beyond the destination member that is intended to be the starting point
of zeroing through the end of the struct.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 net/802/hippi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/802/hippi.c b/net/802/hippi.c
index f80b33a8f7e0..00f6666b4b16 100644
--- a/net/802/hippi.c
+++ b/net/802/hippi.c
@@ -65,7 +65,7 @@ static int hippi_header(struct sk_buff *skb, struct net_device *dev,
 	hip->le.src_addr_type	= 2;	/* 12 bit SC address */
 
 	memcpy(hip->le.src_switch_addr, dev->dev_addr + 3, 3);
-	memset(&hip->le.reserved, 0, 16);
+	memset_after(&hip->le, 0, src_switch_addr);
 
 	hip->snap.dsap		= HIPPI_EXTENDED_SAP;
 	hip->snap.ssap		= HIPPI_EXTENDED_SAP;
-- 
2.30.2

