Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBCE101C3
	for <linux-staging@lists.linux.dev>; Sat, 18 Nov 2023 08:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m2+UEo4E"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9c40c3814a8so83380166b.0
        for <linux-staging@lists.linux.dev>; Sat, 18 Nov 2023 00:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700297473; x=1700902273; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4IeNlXsmBMHoH7xFQOzT7zMDYmFmso5R2YU54hCqJXw=;
        b=m2+UEo4EqkCRLFLhIVGN99Z/3c05zP5DKM/nJkudWAQ/+NtZW9F1kakt2VAdevOnsU
         9p3yzAxZlfGcNnb5r4YLH8NsR6Hlh5XjX7qmgx7HvmZ5hZPVKI9Z6bYv+Qyd3eiYm/hi
         t4+t/3afo5mryl1dPv3kNEcFlLGjM6oQ9TGE4ZRFu9PQlENG1apUUm6EgcOTe4t9R8+v
         WzAav/bC93ww1o6ySJriGeJ1MCnfqA/T2BsjnImeFXd8kB49YxS0spwsa5kUTHkFHXRk
         sO9IDcUZnqopeJQPv99ECd0S6Q9lqpZFHzveoQ4h/VymRel3liAAwLgeVqCYQdcg/3wA
         ndbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700297473; x=1700902273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4IeNlXsmBMHoH7xFQOzT7zMDYmFmso5R2YU54hCqJXw=;
        b=jcjP2YLwbne0xP+NdTgiWRRipL5Fx7RaOA/pN7TZIG/w8HcPmibGtT7R18aTwFSNj5
         GExqn3CoU7hqgB2NXkAM857xszgbdFi8t//HT0fLZETRTZ5u85YIMN2S1MUS7Puxd12y
         GFg/OgARA63hxTUibuH253ztEY7Cizzw9AZoJMIpirTnmB8dRLfmx4doWlXAVKGyQZZ1
         IaPxzb8BiqfFonS3IvLltuTZwzdk+GoFjf0FtHAe8fxBRN9/Lp7KZahXEpj83ZSGDcAU
         nniGSX7iQkobSdmsbgS/idey4XQewsWUpCb4kOza6uFzZX47u9TErtLeHaxxjzHFqamv
         BTjw==
X-Gm-Message-State: AOJu0YwO00M0Ewl2WK5Tt1xshwM7qN5S2rNb26rlTmGakT1z8GetoSBx
	PosdM/hjfT574iGjBLDQW8o=
X-Google-Smtp-Source: AGHT+IFHwZXi9hQx6GDo7DcH7fcX+4pp9aXtpSY0qesFiSTN77Cf3nH1Vx3COwZRLLVvFj66eHvjOg==
X-Received: by 2002:a17:906:108f:b0:9dd:5609:55b9 with SMTP id u15-20020a170906108f00b009dd560955b9mr1172060eju.2.1700297473260;
        Sat, 18 Nov 2023 00:51:13 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57ba2f20.dip0.t-ipconnect.de. [87.186.47.32])
        by smtp.gmail.com with ESMTPSA id s27-20020a170906169b00b009b29553b648sm1643314ejd.206.2023.11.18.00.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 00:51:13 -0800 (PST)
Date: Sat, 18 Nov 2023 09:51:11 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 02/10] staging: rtl8192e: Change parameter "ch" of set_chan()
 to u8
Message-ID: <4a76c0e2384d67410d383fdf860d0e0859555d1e.1700296319.git.philipp.g.hortmann@gmail.com>
References: <cover.1700296319.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1700296319.git.philipp.g.hortmann@gmail.com>

Change parameter "ch" of set_chan() to u8 to combine functions in the
following patch.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 995daab906c9..98b25768f614 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -226,7 +226,7 @@ static void _rtl92e_tx_timeout(struct net_device *dev, unsigned int txqueue)
 	netdev_info(dev, "TXTIMEOUT");
 }
 
-static void _rtl92e_set_chan(struct net_device *dev, short ch)
+static void _rtl92e_set_chan(struct net_device *dev, u8 ch)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
 
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index adaab56a9fb1..1d0878d1f696 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1469,7 +1469,7 @@ struct rtllib_device {
 	 * This function can sleep. the driver should ensure
 	 * the radio has been switched before return.
 	 */
-	void (*set_chan)(struct net_device *dev, short ch);
+	void (*set_chan)(struct net_device *dev, u8 ch);
 
 	/* indicate the driver that the link state is changed
 	 * for example it may indicate the card is associated now.
-- 
2.42.0

