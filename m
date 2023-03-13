Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7848F4E
	for <linux-staging@lists.linux.dev>; Mon, 13 Mar 2023 22:46:30 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id y4so25470952edo.2
        for <linux-staging@lists.linux.dev>; Mon, 13 Mar 2023 15:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678747589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i9MmR4Fr1wEZcYJSTx2GTu6KpmAYC+ytQi2ef1yhiNY=;
        b=FRE7CYku/c6ERZDOHGzdq/FzlC+UHqtMuf5h8jrHPYW34DPFcPoAEigzKEr8yb9ZFW
         R4gZA0NhrooNgyA1i3LzuaxMJ5vjaOiLKjxBVbT0IH5A1WCWphmZ0cUfxrtSTlPmyBi7
         TDZk2vqWA5qzobJNPvJRuuNb6u1I6/27co6PKixB7GkC1BNzdrWw+EfQT8eY5vf+1q/I
         dYwfS18MeSCdsI4txx1hBpcjwqDkwUSGDQQ/aAf1czvJgVeHGui2rVS8YuH+b/rJ5Stu
         TUfy3iGyWQr7uVlTq40DQzKeFLivehOIxoK5Kh7MMvc3/bAkmr4TC4zqxIcXPL+Oejaq
         b4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678747589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i9MmR4Fr1wEZcYJSTx2GTu6KpmAYC+ytQi2ef1yhiNY=;
        b=7AK8L8nOjK1zZICDvVlrFlLU8r3Bdyd69SPHRm8s2a1UxWak/KmPB9x1IMrnC7Dhpo
         AjLpKFntMyr64YPgwY9h8cLI+ZgGV5ENAZeAS+Jw1lGcSLPGGQjEJRdZQ/ENhtVax7/T
         ZX9xI4E+H/7T+BoepwwGBCHfYiNEdDJBPNiz+bXrQNMVdsiBth1hwfz1Vg1FrZzwaxoU
         8zb9rar8I8fm2eyx1cKHaFgpn7rahmsjvCAEIfIyLeQbKpvtDX96/e3akwZt5dGjm2jk
         FwHKg3b69DOV75uabChr0vcb9WL42Aty00Y1UT5HXPVgzq2IDFc1Dm1w+eJ8SZTNNs2o
         /lKA==
X-Gm-Message-State: AO0yUKXXA1jco7yMuCshCv+S8vr1L92bg7HR3ehuu2epjKznRW+dv27O
	IPf4/dWuY29HWcEQlME0q4KTGkQseuI=
X-Google-Smtp-Source: AK7set/lHm9jtll06aMNqvCOy3aH8w8VJcmQ8/81auVCfFaHsERNvXRe4ab5G6/Qndp7EFt93Ct//w==
X-Received: by 2002:a05:6402:1d54:b0:4fb:ac81:49bf with SMTP id dz20-20020a0564021d5400b004fbac8149bfmr6958040edb.4.1678747589456;
        Mon, 13 Mar 2023 15:46:29 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id s23-20020a50ab17000000b004f1e91c9f87sm299296edc.3.2023.03.13.15.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 15:46:29 -0700 (PDT)
Date: Mon, 13 Mar 2023 23:46:27 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] staging: rtl8192e: Replace RF90_PATH_C in test
 expression of for loop
Message-ID: <f9af7a3d3e608206a4aa4ba2bd377b9201111b3f.1678740713.git.philipp.g.hortmann@gmail.com>
References: <cover.1678740713.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678740713.git.philipp.g.hortmann@gmail.com>

Replace RF90_PATH_C in test expression of the for loop with the variable
that is commonly used. This avoids false hits when searching for usage of
RF90_PATH_C and therefore improves readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index db26e431f8b7..fb4eede0470a 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1514,7 +1514,7 @@ static void _rtl92e_process_phyinfo(struct r8192_priv *priv, u8 *buffer,
 		return;
 
 	if (!prev_st->bIsCCK && prev_st->bPacketToSelf) {
-		for (rfpath = RF90_PATH_A; rfpath < RF90_PATH_C; rfpath++) {
+		for (rfpath = RF90_PATH_A; rfpath < priv->num_total_rf_path; rfpath++) {
 			if (!rtl92e_is_legal_rf_path(priv->rtllib->dev, rfpath))
 				continue;
 			if (priv->stats.rx_rssi_percentage[rfpath] == 0) {
-- 
2.39.2

