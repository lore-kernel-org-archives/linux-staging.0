Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F353CCF9
	for <linux-staging@lists.linux.dev>; Tue,  3 Oct 2023 19:33:51 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40646537450so3193125e9.0
        for <linux-staging@lists.linux.dev>; Tue, 03 Oct 2023 12:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696361630; x=1696966430; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J8N2tOkDAA669roEY7JwJC/ZX0XtgD+W4+RzL+0SA5k=;
        b=lYszgeHxB2rVMT4gnTkpnaLdxutBi/N6PgztRPkP7OJecd9xC3GUW6ljEL89ioE2Ok
         4MLaPHv7JotdCWkA5hziJbf3wlgiAaagkRRMv3B8lNyI5EN2QHRejG95joOtx4fIrlAl
         3NIhcNQYeuVLNYolk+H1im63RCTsTXzYYSGLk9GVVvshU/cR5x0i7oDfFgNTh9qe9KVQ
         iR4VkPp8V6Up6yzdazEwWvcXGWtkmfhEJLHpToeNWiGwmirZibZZ7m81mal0B6224hQV
         RhpCdELqSiYA4F9BwFTgMnGqQCk8jklmvHuzZm03rWsBjYWGCT/IuBdDMamayObaArqS
         LTKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696361630; x=1696966430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J8N2tOkDAA669roEY7JwJC/ZX0XtgD+W4+RzL+0SA5k=;
        b=NPESHuWL++krbzciKQZuV81VbMWDwKhsJh0roEvCJtm/DIkO82sW25fllXepRGp91c
         ublymlS1NpUO1DbHc1OTe5H3wfiZIZWw6kAyrBKwZM9hqzlcIyVtTy6hMehd6kwf8UL/
         Dc2+s5Z33nm0fMlkvNJV0T19UVKUy4fA1RMXuBfXWhiW+SbrEFZuPs0HIN5KpOweFS/i
         nGLJhFO0GB2ZEbDuWpLTn0gj8y9gce6QKkQoW+LTtBh/KWm8XyB4CKZ1/n8+SHsBczUi
         jafmKasOJpR/X12jdCnEK4738Ie5wkIWUW0Sh5tKF5ixVaDkhw4M/Mts8GX7v/3b/oV6
         bfhw==
X-Gm-Message-State: AOJu0YwqvHY65x5kViYdiInQs7WxVrb4VhmRD193v6icqNZ2+i5dAKED
	ADo+63jnM+wbqeIZyRWaPQzQa/qXDJw=
X-Google-Smtp-Source: AGHT+IE1ExQhIDPmWaPm2sKRCbrelt0383LJTft1aBkzY75A2GfQaAR+G2AMC8lMZajUWLNIrbM4OA==
X-Received: by 2002:a17:906:530c:b0:9ae:6552:4af6 with SMTP id h12-20020a170906530c00b009ae65524af6mr148050ejo.1.1696361609136;
        Tue, 03 Oct 2023 12:33:29 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id pk13-20020a170906d7ad00b0099bc08862b6sm1541785ejb.171.2023.10.03.12.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 12:33:28 -0700 (PDT)
Date: Tue, 3 Oct 2023 21:33:27 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 04/11] staging: rtl8192e: Remove unused variable raw_tx
Message-ID: <7ab7606ba836746d28afdb72914fb4e05824dac8.1696360403.git.philipp.g.hortmann@gmail.com>
References: <cover.1696360403.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1696360403.git.philipp.g.hortmann@gmail.com>

Remove unused variable raw_tx as it is just set to 0 and not used.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib.h        | 1 -
 drivers/staging/rtl8192e/rtllib_module.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 98b8b7db027e..41b34331380c 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1364,7 +1364,6 @@ struct rtllib_device {
 	u64 ps_time;
 	bool polling;
 
-	short raw_tx;
 	/* used if IEEE_SOFTMAC_TX_QUEUE is set */
 	short queue_stop;
 	short scanning_continue;
diff --git a/drivers/staging/rtl8192e/rtllib_module.c b/drivers/staging/rtl8192e/rtllib_module.c
index abd6bfd4dfa3..195d8aa88138 100644
--- a/drivers/staging/rtl8192e/rtllib_module.c
+++ b/drivers/staging/rtl8192e/rtllib_module.c
@@ -114,7 +114,6 @@ struct net_device *alloc_rtllib(int sizeof_priv)
 	ieee->drop_unencrypted = 0;
 	ieee->privacy_invoked = 0;
 	ieee->ieee802_1x = 1;
-	ieee->raw_tx = 0;
 	ieee->hwsec_active = 0;
 
 	memset(ieee->swcamtable, 0, sizeof(struct sw_cam_table) * 32);
-- 
2.42.0

