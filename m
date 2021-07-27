Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8872F80
	for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 20:59:11 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id a4-20020a17090aa504b0290176a0d2b67aso6632766pjq.2
        for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 13:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QDdnY+YZl5Kj4vlDFYwtmRw0qFCH7bvuzf5iZ5S7r+8=;
        b=Ky1aXIwN1k41XNVRUwHMb6gd8jWZQFtJbLhgYFrZRI/tEfjurJ/VltSyM8tcEHx7PU
         0hed7yoPtFdsfCcNmpZtry+48YfXQD9RicNrcpeyhhFCOPPT1fCJV/zFbOiKnPbf/PYX
         Cl3z+nnp3Cgm7D+0MY0+hinI4DYe7xo2z+8ZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QDdnY+YZl5Kj4vlDFYwtmRw0qFCH7bvuzf5iZ5S7r+8=;
        b=JltlgeTBePaU16Su/BrpxndvGdewfO9Lt5mVkv1WPmhF+rI4JEq6qkWuN/MMV8NQvs
         7RWLMFoKQVak7m2exFcPJ1P1OeHyzc9Qq7sZJevgVMzSAUfYItnCFMM9GwZJjhtcO8ZR
         yl+9ZlpHK9KKTQD0calQ7zpex6UnXkQesNGBBwM+0+yy7MBhFdj4qML+8TIaxbuTxuJO
         9Okb7J7iJY7YRWEFG15zaAb4YnBAXo7ZXiChXzANiDwPjVZNT/CLCfqjcHPE7lDKMKqn
         pL0ry0aF6xlT0Kd/TaVrLxmqyMJvslCNcC0TtWo81VEXalSICUsLfXBeiKoaD3CkIi2O
         3Tog==
X-Gm-Message-State: AOAM532c90Z9fcGXLoJd92ZF8LYENpe7Hc1stR9JWOPMmiFH0LerK+gn
	YOqqCXBYEWaUfhAz0GnDTg1J0g==
X-Google-Smtp-Source: ABdhPJzSgpKelqVCgUS+uWdh9X6zo2G6UcQ1toddE+js+YzGJwbaJ49IIj997nZ3+Sx8eXpefD//mQ==
X-Received: by 2002:a17:90b:4016:: with SMTP id ie22mr20891551pjb.68.1627419551082;
        Tue, 27 Jul 2021 13:59:11 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w23sm4741144pfc.60.2021.07.27.13.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 13:59:08 -0700 (PDT)
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
Subject: [PATCH 12/64] mwl8k: Use struct_group() for memcpy() region
Date: Tue, 27 Jul 2021 13:58:03 -0700
Message-Id: <20210727205855.411487-13-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727205855.411487-1-keescook@chromium.org>
References: <20210727205855.411487-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1790; h=from:subject; bh=oMSi3M1NOKgRYRJy6VWRMVEHsL86zQNiB3Lk1k+Xi3A=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhAHOCT3IlQZfHOrT/8AVoJNmOyRzR+nRudQyIVPi9 N+VgYJGJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYQBzggAKCRCJcvTf3G3AJvUtD/ 0VbZh1+apSqCt8UVVwcwz2SVJuqIVyUnd519aTLQ4I0CWMg8ghFTFnOrvuarCaRIX9zFlryZ3tW+jX TMbwvZJ2ASxTPhSxhEfUL3QjPZrscW1XTamKCXRYrFlctVtUxvJxBanAbD684+pmZo0R/nRcYbYP4L IaH2t5hZmvXcLZRQNyAWwGbdKj5zwyQ23qv/nPVNIDcAqdEm3B1gePnEkp/AsshevL2Rz+m/fA/waN DoEtXkNfhfzWoBpKH83gEDokctcvbaP61CQNZaHqbrHd42zmm2Oc/L/stpbIFWa1W2nh9aTJnw2eN4 2nGcQV7d5s0ULa0BhMCoAn0It3bg3KRnOhK037W8DLo8xFDdcqrxT2qzTKD2J5OaeXZHiNPwPbqUFX h/rZBBfQpN75s58FT+3GvmfMf0Y3Hv3frdpG1OXwpfoLVNK+i9yfiGVN69Ddw4Vdy4v/ae2+T+RY3I BVx0+IUN5Kq5oxAJN8czvd3TMtxtYody0FwrPyZ7k/WqBEg6tfrvE6hNlpKZnEjPkmVUZchWsXtBld c8xMtYaeMn/Q+ACu7/A1Y37jNDWcrPB3t/Vt7rmllooif7lGJWBfAoYlw+trqmygT+AGb1sFup/d90 nRs6XYpT6hUE8tDXo21HFYgvJz1bZdvxgX5sz4WXpYQlhqmDB5NJxHOXSm8A==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memcpy(), memmove(), and memset(), avoid
intentionally writing across neighboring fields.

Use struct_group() in struct mwl8k_cmd_set_key around members
key_material, tkip_tx_mic_key, and tkip_rx_mic_key so they can be
referenced together. This will allow memcpy() and sizeof() to more easily
reason about sizes, improve readability, and avoid future warnings about
writing beyond the end of key_material.

"pahole" shows no size nor member offset changes to struct
mwl8k_cmd_set_key. "objdump -d" shows no object code changes.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/wireless/marvell/mwl8k.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/marvell/mwl8k.c b/drivers/net/wireless/marvell/mwl8k.c
index 3bf6571f4149..a29277d5f9da 100644
--- a/drivers/net/wireless/marvell/mwl8k.c
+++ b/drivers/net/wireless/marvell/mwl8k.c
@@ -4225,9 +4225,11 @@ struct mwl8k_cmd_set_key {
 	__le32 key_info;
 	__le32 key_id;
 	__le16 key_len;
-	__u8 key_material[MAX_ENCR_KEY_LENGTH];
-	__u8 tkip_tx_mic_key[MIC_KEY_LENGTH];
-	__u8 tkip_rx_mic_key[MIC_KEY_LENGTH];
+	struct {
+			__u8 key_material[MAX_ENCR_KEY_LENGTH];
+			__u8 tkip_tx_mic_key[MIC_KEY_LENGTH];
+			__u8 tkip_rx_mic_key[MIC_KEY_LENGTH];
+	} tkip;
 	__le16 tkip_rsc_low;
 	__le32 tkip_rsc_high;
 	__le16 tkip_tsc_low;
@@ -4375,7 +4377,7 @@ static int mwl8k_cmd_encryption_set_key(struct ieee80211_hw *hw,
 		goto done;
 	}
 
-	memcpy(cmd->key_material, key->key, keymlen);
+	memcpy(&cmd->tkip, key->key, keymlen);
 	cmd->action = cpu_to_le32(action);
 
 	rc = mwl8k_post_pervif_cmd(hw, vif, &cmd->header);
-- 
2.30.2

