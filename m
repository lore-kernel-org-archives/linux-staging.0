Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473CF2FAD
	for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 21:06:59 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id t21so17550517plr.13
        for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 14:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eHJ5K8LiDBXCeTCe7PvgaP3UqQR5uDLvklqQUiAbnC0=;
        b=C9odf/LxM8hQlFgEX94OyyWcybtfMz5fkcvxUOiwkptiFAnxb7Vjc9j5fcILzWzUe0
         9SXGn/8zZ/4rPOmwRPn9BGvFK32z6oyRZbo5d8AQJpThOjubhaqeuoW3W01DCWdHwowW
         ZQKSKYcukTOUL4ao1lnoeA3vzowcOeQgLkBm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eHJ5K8LiDBXCeTCe7PvgaP3UqQR5uDLvklqQUiAbnC0=;
        b=bHfm0lNyM4DHfPSDHuk3rtzsDGuHljqNeNVqRy9G/NSAdgXjHRu3U2h6aKxNNoZKng
         koKMlMix4j+/AYJ+9DOg/qxCixkd2MVuMovVLv+yVz1sXcBXhMdTV+5dGBuUdvEpWZN9
         a3/xyDtZMi33zw5IgpGcZbtIHk2jYEWZALl1Q4oMDlsI+5hlB1F4kAmC2yxTg+HR/qRM
         ANbhd68dlUTz/raa/EO9Ghyf2QhwMDMej6YYDbQlpjbckMPnQEBOrayMOQdwt4v+6wEu
         q8uSWirAJZJj7UjEd6bv14v0PuHVR6Cl3VcoG/cxunN9i1rM9m7w013vz27VU0Mb07jO
         ls2g==
X-Gm-Message-State: AOAM53266VFer3I2BwSf6krKR2PhDYii7zVvElgzjqnSz44IPdeFF1Ip
	ASHDvGzabSHqZmKBTkKoF9WOgw==
X-Google-Smtp-Source: ABdhPJyiPLiIxF0eZ6Ht4eersAStzTtAa77UuUUu3QKRioXbvWIKsuENyKgvU1Bb8BbQdCxPR7B6MQ==
X-Received: by 2002:a05:6a00:cc1:b029:32b:8465:9b59 with SMTP id b1-20020a056a000cc1b029032b84659b59mr24967310pfv.66.1627420018950;
        Tue, 27 Jul 2021 14:06:58 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id r128sm4687668pfc.155.2021.07.27.14.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 14:06:55 -0700 (PDT)
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
Subject: [PATCH 63/64] iwlwifi: dbg_ini: Split memcpy() to avoid multi-field write
Date: Tue, 27 Jul 2021 13:58:54 -0700
Message-Id: <20210727205855.411487-64-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727205855.411487-1-keescook@chromium.org>
References: <20210727205855.411487-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1543; h=from:subject; bh=s7Xq57zTgnpQLZW9o4dFqvke+b60yZlygvvLnoMj4dM=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhAHOO7ylJm1Pef8Nw2Y9AVMYN/aYHsm9YN/NkJMM0 14MmcVqJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYQBzjgAKCRCJcvTf3G3AJh5wD/ 0a9KvpCqyFZ9QKAdlblaiFHTvLu6J0I4KvuS/Pu8WGvbtdHoFcEc1A0J0FqancucuNe2oN76GijGN8 ZmNxkbLuDowcPvHB1KNKV+y/VKyD/GjTqJSFGbHSgE1d3XVQUqA8M80luRN12bHJex3vWEGlQIgVUS eo5mVVxa1vQFLA/APQtdO4QC3S0Rxaeq//vH7IZ+y8uTxf7ChRZtqCWERhOu6zi0YYM7UsadKsQ1UW kuKw1BHS6rVbpMLujJWWAPEyxEe0W/MD7sUJar7lh/sg2nbnVIlvXob+LuNF5xQtZwtIVnlj1/Tx1c JeZYoyxgw4/uvoQF/VaOiL8Fb1Mky8hA3J0Q0KSrMfDlDYr2psRQCz/wYgNiK8aZmkNvU6EyldhpRR jvpt2FEuN89iS51ofpMkKT9jWkj2G2IJnYUpSSBDS7x/6U33s9hWYtpjYFkmrtQS+KN+/zM7e0Wq85 h9kdtxEMB5GcqKunvfEzrJH/6l30zcuWdtxzKr+5eUMIzfT4m7IfJftQW1OHHiIRW8y1i2y9mOZGde lSqRZZ+xSG98+pb5deEI05oPi7AOE1XKeHnMMfVyygop9nOeSAmsJJWm+ExFOnNUkiTzMkM+sJqqiU uZuZWsn+50meKz7mBFEHFWpt++2rlXLf2jFCbTMaiMMKok79IQfcYfkHRDkg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

To avoid a run-time false positive in the stricter FORTIFY_SOURCE
memcpy() checks, split the memcpy() into the struct and the data.
Additionally switch the data member to a flexible array to follow
modern language conventions.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/wireless/intel/iwlwifi/fw/file.h     | 2 +-
 drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/fw/file.h b/drivers/net/wireless/intel/iwlwifi/fw/file.h
index 9a8c7b7a0816..226ccd3a6612 100644
--- a/drivers/net/wireless/intel/iwlwifi/fw/file.h
+++ b/drivers/net/wireless/intel/iwlwifi/fw/file.h
@@ -116,7 +116,7 @@ enum iwl_ucode_tlv_type {
 struct iwl_ucode_tlv {
 	__le32 type;		/* see above */
 	__le32 length;		/* not including type/length fields */
-	u8 data[0];
+	u8 data[];
 };
 
 #define IWL_TLV_UCODE_MAGIC		0x0a4c5749
diff --git a/drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c b/drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c
index 0ddd255a8cc1..f4efddf3e3c3 100644
--- a/drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c
+++ b/drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c
@@ -71,7 +71,8 @@ static int iwl_dbg_tlv_add(const struct iwl_ucode_tlv *tlv,
 	if (!node)
 		return -ENOMEM;
 
-	memcpy(&node->tlv, tlv, sizeof(node->tlv) + len);
+	memcpy(&node->tlv, tlv, sizeof(node->tlv));
+	memcpy(node->tlv.data, tlv->data, len);
 	list_add_tail(&node->list, list);
 
 	return 0;
-- 
2.30.2

