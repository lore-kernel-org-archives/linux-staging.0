Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A878B6D13
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 06:24:18 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id k19so1108429pfc.11
        for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 23:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vvaO3IOaijbnIA6KqFSDgFo2qxgHnLpT3XyLd7qDOYY=;
        b=kDXEIEitA/zilEeOzVZcblUGb+gd0VUzPPKPAZRekMacsTOzvDvGIy5nd+Plg3xGqF
         ljL/5yphBqGZuftKhE1BcSTKZc0Q9ZAZtIBhK+w2XzKNzqFl0DOizZMClRh8F3cCrW6I
         4nLShAKzqA0o+5ZrPzG62J+rwCOEUexcSDo3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vvaO3IOaijbnIA6KqFSDgFo2qxgHnLpT3XyLd7qDOYY=;
        b=EvLZtqoJi7t1ghTb4qHK2YvEYN9kI2SROXnE6SKmncfgMW/kWFO7CFKvPZuGWdEjSS
         3DtgXaz7Ce3v0a5Ke2zUWnFdgmeUv3CH7JYs2tRT0to7Vn0/m8NBP7wJOjkvJuF5ehiC
         qjfd7ZGT91TFQYhrlhYOMKFgELsK6cNpZX5dU1oGK5GrnzP4zS6V6wLX6UKZSZVVixhX
         nYBjodQnZVaEDakNPqxEag5OEzynWS91eg4652JG4GwFB92RTc8xaGYeDN7Y1NTutt3Z
         ZTWTmoAwOhqrKxAQ0UrgQunzLDKFl08Ngz6bV5WZK/Vdtshm8JJTMRafFNUGpNzA05D6
         WSRQ==
X-Gm-Message-State: AOAM533XsJOIc8qayyQpsIiqj+P+qN9BRjnHY2DSnnvIiwRA8kbpulnT
	yHe9fAruteMIGHvKdPrR2kKWYw==
X-Google-Smtp-Source: ABdhPJxLnTYg2dyG52a8dlHZQo2KnsFk9IIV2ZT2c1iszf6YYPkQGA1eSgtlSotuJmQJc5qNxJ68Bw==
X-Received: by 2002:aa7:87d1:0:b029:3e0:e44b:6429 with SMTP id i17-20020aa787d10000b02903e0e44b6429mr7687468pfo.81.1629267857946;
        Tue, 17 Aug 2021 23:24:17 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id l12sm4445453pff.182.2021.08.17.23.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 23:24:15 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>,
	Kalle Valo <kvalo@codeaurora.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	dri-devel@lists.freedesktop.org,
	linux-staging@lists.linux.dev,
	linux-block@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	clang-built-linux@googlegroups.com,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2 45/63] ath11k: Use memset_startat() for clearing queue descriptors
Date: Tue, 17 Aug 2021 23:05:15 -0700
Message-Id: <20210818060533.3569517-46-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818060533.3569517-1-keescook@chromium.org>
References: <20210818060533.3569517-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3372; h=from:subject; bh=NQT3fqVVXi8ODh6WoJGB8sg9K5wYYHx+7JpT5FAL4cU=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHKMopXDUfrKda33TUBFxN6HBO6TlnPSMDcCCdRDS 0aeVcWmJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYRyjKAAKCRCJcvTf3G3AJhzGEA CY8p5TOKzJnk1TIbV+Hzc40bIrnKi3XB25slGqFlL9PC0EefG0LRY7a/kfnqj/FIFz17UsuycljRiL cACD/vfRToJ7yzKKAmxJEdfFC9iw7Xzoq9md8jDhbHG+5rEQLDA2Y8/KjGoyRoAVQUeCsHcJe+UAXU /C5fU4ck0d6s6EiIVlN7DyLPX1dt3uBgOwRyBODvNuiyvNXvhGO3XJv0FCDFCT5z75xj1tU14JGWyN PD0hj1XmCBY1e9AxpCMIlhi+/X5qb5jGTLXX/Md1KsTZvmbxvau9ABz55gWYFUQGS3X+k1Rlmv5T+v lQWqSK/nXQAlXtMjB9ywh5KsA5aVqsKNBUXndQA68SKCaNf/TyoXdI1m4yYbWg/BcAGWta/La0zhv8 6uPbEVUb8Vg2ZE5Iqlcs/ld7qL4G/K1NRERjZr+0R73esdLiYb9TgQFqKMWrJPe98lypwjAdWColpN I8cEBcItkU3uu4rF/5fh/NmOKClsPYi08PLRs5e03i6wu9s1aoaETYlf1CnhWQasVpVUQKL19q5EaQ 6mL+ds0GvKbFFnRg94o4s2GHh5vlbNIY8AZQMoUGgZ+Kclor6FXedzWgb33JBTE6JU4bg97H5xgdcx ZY2UZxJPJIziE2+vb6CbU1ZYgZ27bDV0FLUmziQd/krKAdEaAHnqHTqhCInw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memset(), avoid intentionally writing across
neighboring fields.

Use memset_startat() so memset() doesn't get confused about writing
beyond the destination member that is intended to be the starting point
of zeroing through the end of the struct. Additionally split up a later
field-spanning memset() so that memset() can reason about the size.

Cc: Kalle Valo <kvalo@codeaurora.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/wireless/ath/ath11k/hal_rx.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.c b/drivers/net/wireless/ath/ath11k/hal_rx.c
index 325055ca41ab..0bab425f5dc9 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.c
@@ -29,8 +29,7 @@ static int ath11k_hal_reo_cmd_queue_stats(struct hal_tlv_hdr *tlv,
 		  FIELD_PREP(HAL_TLV_HDR_LEN, sizeof(*desc));
 
 	desc = (struct hal_reo_get_queue_stats *)tlv->value;
-	memset(&desc->queue_addr_lo, 0,
-	       (sizeof(*desc) - sizeof(struct hal_reo_cmd_hdr)));
+	memset_startat(desc, 0, queue_addr_lo);
 
 	desc->cmd.info0 &= ~HAL_REO_CMD_HDR_INFO0_STATUS_REQUIRED;
 	if (cmd->flag & HAL_REO_CMD_FLG_NEED_STATUS)
@@ -62,8 +61,7 @@ static int ath11k_hal_reo_cmd_flush_cache(struct ath11k_hal *hal, struct hal_tlv
 		  FIELD_PREP(HAL_TLV_HDR_LEN, sizeof(*desc));
 
 	desc = (struct hal_reo_flush_cache *)tlv->value;
-	memset(&desc->cache_addr_lo, 0,
-	       (sizeof(*desc) - sizeof(struct hal_reo_cmd_hdr)));
+	memset_startat(desc, 0, cache_addr_lo);
 
 	desc->cmd.info0 &= ~HAL_REO_CMD_HDR_INFO0_STATUS_REQUIRED;
 	if (cmd->flag & HAL_REO_CMD_FLG_NEED_STATUS)
@@ -101,8 +99,7 @@ static int ath11k_hal_reo_cmd_update_rx_queue(struct hal_tlv_hdr *tlv,
 		  FIELD_PREP(HAL_TLV_HDR_LEN, sizeof(*desc));
 
 	desc = (struct hal_reo_update_rx_queue *)tlv->value;
-	memset(&desc->queue_addr_lo, 0,
-	       (sizeof(*desc) - sizeof(struct hal_reo_cmd_hdr)));
+	memset_startat(desc, 0, queue_addr_lo);
 
 	desc->cmd.info0 &= ~HAL_REO_CMD_HDR_INFO0_STATUS_REQUIRED;
 	if (cmd->flag & HAL_REO_CMD_FLG_NEED_STATUS)
@@ -762,15 +759,17 @@ void ath11k_hal_reo_qdesc_setup(void *vaddr, int tid, u32 ba_window_size,
 	 * size changes and also send WMI message to FW to change the REO
 	 * queue descriptor in Rx peer entry as part of dp_rx_tid_update.
 	 */
-	memset(ext_desc, 0, 3 * sizeof(*ext_desc));
+	memset(ext_desc, 0, sizeof(*ext_desc));
 	ath11k_hal_reo_set_desc_hdr(&ext_desc->desc_hdr, HAL_DESC_REO_OWNED,
 				    HAL_DESC_REO_QUEUE_EXT_DESC,
 				    REO_QUEUE_DESC_MAGIC_DEBUG_PATTERN_1);
 	ext_desc++;
+	memset(ext_desc, 0, sizeof(*ext_desc));
 	ath11k_hal_reo_set_desc_hdr(&ext_desc->desc_hdr, HAL_DESC_REO_OWNED,
 				    HAL_DESC_REO_QUEUE_EXT_DESC,
 				    REO_QUEUE_DESC_MAGIC_DEBUG_PATTERN_2);
 	ext_desc++;
+	memset(ext_desc, 0, sizeof(*ext_desc));
 	ath11k_hal_reo_set_desc_hdr(&ext_desc->desc_hdr, HAL_DESC_REO_OWNED,
 				    HAL_DESC_REO_QUEUE_EXT_DESC,
 				    REO_QUEUE_DESC_MAGIC_DEBUG_PATTERN_3);
-- 
2.30.2

