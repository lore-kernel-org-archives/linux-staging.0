Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1781FB0
	for <linux-staging@lists.linux.dev>; Sat, 29 Jul 2023 07:53:25 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-98273ae42d0so75728566b.0
        for <linux-staging@lists.linux.dev>; Sat, 29 Jul 2023 00:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690617204; x=1691222004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=faBqIZ3yezrIb7jUJEkGY6pcGmEoUQ5K1cfQPvpPu3Y=;
        b=WWLJiSrZ36YPa3OhEeXxE5Q5F6zNm9i4bWmNBky9lNgX1ICW3hhMMHsvHGtVppGqlW
         Ru9eQOThE2rK3m3NDBb1TM36V0g4m8bbC72Ph4mz4gSWibtE3DDV3QZDALGm9L5wFwN3
         83ECAaDkqOyni3P9keuwtNTOoUAL1gdI7sTUdFVM2/adANhI4iDHPOO9/0ii6Lx91kGZ
         4uYa/AU55VCwAnmSC9cn8LOaPygmIvSjh2xL4YuW3R2ERq+O1yuLfa/Y/aA8abLiboPF
         qWl+0aVi9pZs4K7E9FVPtKucmjduexiOj0Ft6vode+Bp9zZtnCTDeEFgPZ5/7w2GksSx
         hjoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690617204; x=1691222004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=faBqIZ3yezrIb7jUJEkGY6pcGmEoUQ5K1cfQPvpPu3Y=;
        b=fzlq5jzAfvwFVqyRAbDRZzvwnnHCE0BDBPlDWWRAdMGkmqs+8yRM2yTzTAZ3rFPyCC
         hgDVkjRBUVv6XXOSeB8pLXZLmAp9puiuiCSMjgOAPsxqUkZOtbulYuxxp10nsH0eNI7u
         hv114ecXgDLArNg3ln++RymyMlJV3Dhq8nVOV5QH0sezNbfXz5eL8deZBVOmzjHTAPEa
         4T7nY8tPDYbmS4dPdYU/VAuoWZcd+HfnMH9nAI1qYwBidt81zQocJm0A77yy8eZnytlX
         FnMqcA0Y34o6yZ2PZvNTEY970hJ8uTOQ+Bn5Ss5UzKbmYpY3BfPU1azWfDrUw+R51xYG
         RstA==
X-Gm-Message-State: ABy/qLZUsN6zLFjrxzcxcHUOELNS18iutytuURJG/UGa8hq7ZJddPzpF
	veCpgLEc3+3LPWe5WNHi5kc=
X-Google-Smtp-Source: APBJJlGxpEAKnLzA/W8E7sdqeYIbhGqonODNFSz4M8UbE9ZD9NErNo14UVcZKxjFtiZwOWaSXej6jA==
X-Received: by 2002:a17:906:10c9:b0:99b:b3a1:4376 with SMTP id v9-20020a17090610c900b0099bb3a14376mr1355615ejv.2.1690617203907;
        Sat, 29 Jul 2023 00:53:23 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id sb2-20020a170906edc200b0099b76c3041csm3026106ejb.7.2023.07.29.00.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 00:53:23 -0700 (PDT)
Date: Sat, 29 Jul 2023 09:53:21 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 06/10] staging: rtl8192e: Remove is_mesh from
 rtllib_send_probe_requests
Message-ID: <06a4c66112e22d6131711969dd4f5ac9fab91426.1690615475.git.philipp.g.hortmann@gmail.com>
References: <cover.1690615475.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1690615475.git.philipp.g.hortmann@gmail.com>

Function rtllib_send_probe_requests() has unused parameter is_mesh.
Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 06b872c1ad68..614f19603af1 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -460,7 +460,7 @@ static void rtllib_send_probe(struct rtllib_device *ieee)
 	}
 }
 
-static void rtllib_send_probe_requests(struct rtllib_device *ieee, u8 is_mesh)
+static void rtllib_send_probe_requests(struct rtllib_device *ieee)
 {
 	if (ieee->active_scan && (ieee->softmac_features &
 	    IEEE_SOFTMAC_PROBERQ)) {
@@ -525,7 +525,7 @@ static void rtllib_softmac_scan_syncro(struct rtllib_device *ieee, u8 is_mesh)
 
 		ieee->set_chan(ieee->dev, ch);
 		if (ieee->active_channel_map[ch] == 1)
-			rtllib_send_probe_requests(ieee, 0);
+			rtllib_send_probe_requests(ieee);
 
 		/* this prevent excessive time wait when we
 		 * need to wait for a syncro scan to end..
@@ -587,7 +587,7 @@ static void rtllib_softmac_scan_wq(void *data)
 	ieee->set_chan(ieee->dev, ieee->current_network.channel);
 
 	if (ieee->active_channel_map[ieee->current_network.channel] == 1)
-		rtllib_send_probe_requests(ieee, 0);
+		rtllib_send_probe_requests(ieee);
 
 	schedule_delayed_work(&ieee->softmac_scan_wq,
 			      msecs_to_jiffies(RTLLIB_SOFTMAC_SCAN_TIME));
-- 
2.41.0

