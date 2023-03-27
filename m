Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE2279CE
	for <linux-staging@lists.linux.dev>; Mon, 27 Mar 2023 21:03:08 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-930bc91df7bso38691266b.1
        for <linux-staging@lists.linux.dev>; Mon, 27 Mar 2023 14:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679950986;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JdyEfmioMXlj8zaCBESKr5gB9JvQl1r0IW8/axbQUWk=;
        b=JSM7FINsXu+k0Q8FSg9PdASYMz0a426/lZY0A2yAmS56PUYmHT0ahCa6b269dEJ+3C
         zArw8BRovwRPPlRQtW45C87/+8uMPX1DKYVl7VXcU8DWwVyNPynHQPtirDmgKC3Fapl3
         eE8MKIs2uFYMu0FV5ZHch9YHm3spthPvmF7Rm9jcl8p2V99KdNbmeBBtnNdsZKOrPq6r
         XpfDqRmrKFGKnLMpy5xcAfitXmyJGp6LyrnGBarqGguIiEvNdvS/fTclm+QTYmWbT434
         lnwjYSpdYolTbH7r9UAu7pF66vQqEt/bu2qKzWZr5ZyT+jGaEq+Hzi97vYpwKrxzM68a
         pDRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679950986;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JdyEfmioMXlj8zaCBESKr5gB9JvQl1r0IW8/axbQUWk=;
        b=qraVsNgxnhjEoryXQ9Xp2h45Ud8Pjnw+kL6fGjqqoOpcx6hlQTQr4P3gz4wj6LDnIY
         +vacLxWXzNBLDEqvYrx5QflniNOt/fwX/QR7F1X9epEH2cG9ayfit7mUs3m+gtgpuuCg
         ZxeH4BDvBwOeIFGrPSFJX5xPU3v0dWxo4EDwIW73NhdEqJGvMyU5aiHJ9FU55uKlMok7
         opfDxkM2yo4pmJA+EZyJxPiSU2YyLOU/vEb0jkw9Aq7RM3FfqlOepsbEmpodx7D6WsS+
         IzlPtEHR7vW/q5NedC62jaSFIXtwmziksSADFQ2oH1PCOOnlYxa7b3z1pR4Tuodxt9lJ
         n5ng==
X-Gm-Message-State: AAQBX9dsI2I3t9CRdXsevhwp6F27okKPXdSWRk+fsyReZGNhmD6ju3cp
	y5G1S2/Pp2/QLUaDBiae3uIA9Ew79Sk=
X-Google-Smtp-Source: AKy350ZRWyOrbJwCctralYpHk1twvtMNFXbyP8Xd9seLJHuiF/qb1wy+2gyKvMBOiZE75LGlxkJ5/Q==
X-Received: by 2002:a17:906:51c9:b0:92f:27c2:13c0 with SMTP id v9-20020a17090651c900b0092f27c213c0mr11868755ejk.6.1679950986448;
        Mon, 27 Mar 2023 14:03:06 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id sd24-20020a170906ce3800b00931024e96c5sm14628338ejb.99.2023.03.27.14.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 14:02:59 -0700 (PDT)
Date: Mon, 27 Mar 2023 23:02:45 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] staging: rtl8192e: Remove 5G wireless_mode in
 rtl92e_set_wireless_mode
Message-ID: <693a34b187f21d9d48accd3b0b953dff2f0795eb.1679949171.git.philipp.g.hortmann@gmail.com>
References: <cover.1679949171.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1679949171.git.philipp.g.hortmann@gmail.com>

Remove wireless_mode == WIRELESS_MODE_N_5G as 5G is not supported by
hardware and to improve readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 12e5132fa788..c03978353a90 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -624,12 +624,11 @@ void rtl92e_set_wireless_mode(struct net_device *dev, u8 wireless_mode)
 
 	priv->rtllib->mode = wireless_mode;
 
-	if ((wireless_mode == WIRELESS_MODE_N_24G) ||
-	    (wireless_mode == WIRELESS_MODE_N_5G)) {
+	if (wireless_mode == WIRELESS_MODE_N_24G)
 		priv->rtllib->ht_info->enable_ht = 1;
-	} else {
+	else
 		priv->rtllib->ht_info->enable_ht = 0;
-	}
+
 	_rtl92e_refresh_support_rate(priv);
 }
 
-- 
2.39.2

