Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B566D13
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 06:14:15 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id i133so1081692pfe.12
        for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 23:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f4O3R9w7Wsb1EUzo8wW0sX+4sR/BMGAQ/Nfx2MpJI38=;
        b=LYUO69wYAGl48pxViZuNMfgY0F9cuDlQY6nCQU/3p+8l2QtHc07flb9OraE46ZvIBx
         /xBG0BtrkwLHkotiYNUI/6fqla0cTVbsww7aEsuk4+Nngwd3P/pQjUKOvhuCMN7+yAE+
         Jw6YFeg29gPpHQCtelCih+4VXzxZFuDljGQ8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f4O3R9w7Wsb1EUzo8wW0sX+4sR/BMGAQ/Nfx2MpJI38=;
        b=dqCfiQ3jB8eNEnNkuVNndLMy5nHCVX8HqigDp6GJ/resVZgsPtuBk8RdwAUL/Ww3S0
         PvT+QRaIGgdmcQMZja1oMAIqQDMcLA/sbgeO7cIkdoFAaZq8P8kN8r1bKLCRs8uU2t5e
         wWStmhLGwMS7Vj5dkNY1UWhrqnWhUa5T3i4ar59bmMdPYY/5w87LfsVQ+GcgbIbSIDXQ
         MmgrqxQM6+MLuW3yBMGzdyY1iypwDPnS0RO2Hcms5OaFkV3S8Yzuc0NlWe/oac2/eXUt
         yyS7GsvWz/9iS7ZyPAAx88Z504ZK1lirQBHmln1+QmD1hUjVhCMljrZk0NeZXA5vX6uz
         WyxQ==
X-Gm-Message-State: AOAM531o8pJWCHss3HJurImq1k4GhzH8r7uTEEjzTOIs4tO+EHqWsa/0
	yzBix/VPbOVSTxstCILuriJnNA==
X-Google-Smtp-Source: ABdhPJywnPw6z16Ak9Sf4n0+8mKmDYgUDbPdhB9YE0Tz2tAm6kKcI6tqk6MiIjPWY4zGxPe54WmG+A==
X-Received: by 2002:a63:164e:: with SMTP id 14mr7225002pgw.246.1629267254757;
        Tue, 17 Aug 2021 23:14:14 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a8sm729024pfo.79.2021.08.17.23.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 23:14:12 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rustam Kovhaev <rkovhaev@gmail.com>,
	syzbot+22794221ab96b0bab53a@syzkaller.appspotmail.com,
	Allen Pais <apais@linux.microsoft.com>,
	Romain Perier <romain.perier@gmail.com>,
	linux-staging@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-block@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	clang-built-linux@googlegroups.com,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2 19/63] staging: wlan-ng: Use struct_group() for memcpy() region
Date: Tue, 17 Aug 2021 23:04:49 -0700
Message-Id: <20210818060533.3569517-20-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818060533.3569517-1-keescook@chromium.org>
References: <20210818060533.3569517-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2774; h=from:subject; bh=aGp1hVfQLzgNKVTBWpK4bHAQRaqFRmqtt5a8sjY+csw=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHKMizR57up2j4NPi4kVovJhubhBpYTgyg8yWF9zZ icJ94SKJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYRyjIgAKCRCJcvTf3G3AJpL6D/ 9OjwhbTRWiOOzSFBp8HIcdXHzLynmUDoremqboLQbbZFdvhzt0JN+X+5SXEKgIkDTabHGAyJJg7vbo zVrFanG+ya6KLCwo9BdiQAR/ueZXO5L+r/Giz1yPapqbt9k/nsEc5SYr5ucwOuJAxFE9KIGWEqYMrT i3E/cMd8/4hSpxFdVPIAs28n3YGzs5RdmJrvt0oE1gIolLyt89z92a2rYJdvxqr4c3EEmcmpORTtTP lkwRQ5y4dqKRSgda52wvAVbJiXwqCu+cZMKZbgEa3KUIL7s+H43Se99pCXw8Ub5zIFo+91KGljDQEx tb8lzPY0rRNNY0mbwRNYXf/W38QwRxZ3D5oUvC0N/0w4QQutHp9rU1gZioa3fOM/rHRt4HcprXi+nt 0aVMHLjt3F6niAccQBbHURhgEcp8WwIJfTi/bJ+gg4LPSpeEvVE4tQYywNI4FkILs77ejtC8wiZxw7 ocghlmQFrIyZuFFHQ08aqyrz9X6fmTVjexgK98h9oM/QBofgPJlUMtugzgwK/6v8LzRJ1jiml8GBZy OhAwKq8Jq0qW2GJdSkuk64fcF8WOlLGLlP1HErn6FXZfEY4MdumebnHUJDxpcnKVjQhgEciCCqBCSb /vsaJRVs0/wXUdwiP2kC/s1S+odfxQ0hXzojzVg0H0lmI3gP3DxmkZLDHg7Q==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memcpy(), memmove(), and memset(), avoid
intentionally writing across neighboring fields.

Use struct_group() in struct hfa384x_tx_frame around members
frame_control, duration_id, address[1-4], and sequence_control, so they
can be referenced together. This will allow memcpy() and sizeof() to
more easily reason about sizes, improve readability, and avoid future
warnings about writing beyond the end of frame_control.

"pahole" shows no size nor member offset changes to struct
hfa384x_tx_frame. "objdump -d" shows no meaningful object code changes
(i.e. only source line number induced differences.)

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rustam Kovhaev <rkovhaev@gmail.com>
Cc: syzbot+22794221ab96b0bab53a@syzkaller.appspotmail.com
Cc: Allen Pais <apais@linux.microsoft.com>
Cc: Romain Perier <romain.perier@gmail.com>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Kees Cook <keescook@chromium.org>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Link: https://lore.kernel.org/lkml/YQDvC4CghCazix4w@kroah.com
---
 drivers/staging/wlan-ng/hfa384x.h     | 16 +++++++++-------
 drivers/staging/wlan-ng/hfa384x_usb.c |  4 +++-
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/wlan-ng/hfa384x.h b/drivers/staging/wlan-ng/hfa384x.h
index 88e894dd3568..87eb87e3beab 100644
--- a/drivers/staging/wlan-ng/hfa384x.h
+++ b/drivers/staging/wlan-ng/hfa384x.h
@@ -476,13 +476,15 @@ struct hfa384x_tx_frame {
 
 	/*-- 802.11 Header Information --*/
 
-	u16 frame_control;
-	u16 duration_id;
-	u8 address1[6];
-	u8 address2[6];
-	u8 address3[6];
-	u16 sequence_control;
-	u8 address4[6];
+	struct_group(p80211,
+		u16 frame_control;
+		u16 duration_id;
+		u8 address1[6];
+		u8 address2[6];
+		u8 address3[6];
+		u16 sequence_control;
+		u8 address4[6];
+	);
 	__le16 data_len;		/* little endian format */
 
 	/*-- 802.3 Header Information --*/
diff --git a/drivers/staging/wlan-ng/hfa384x_usb.c b/drivers/staging/wlan-ng/hfa384x_usb.c
index f2a0e16b0318..38aaae7a2d69 100644
--- a/drivers/staging/wlan-ng/hfa384x_usb.c
+++ b/drivers/staging/wlan-ng/hfa384x_usb.c
@@ -2516,7 +2516,9 @@ int hfa384x_drvr_txframe(struct hfa384x *hw, struct sk_buff *skb,
 	cpu_to_le16s(&hw->txbuff.txfrm.desc.tx_control);
 
 	/* copy the header over to the txdesc */
-	memcpy(&hw->txbuff.txfrm.desc.frame_control, p80211_hdr,
+	BUILD_BUG_ON(sizeof(hw->txbuff.txfrm.desc.p80211) !=
+		     sizeof(union p80211_hdr));
+	memcpy(&hw->txbuff.txfrm.desc.p80211, p80211_hdr,
 	       sizeof(union p80211_hdr));
 
 	/* if we're using host WEP, increase size by IV+ICV */
-- 
2.30.2

