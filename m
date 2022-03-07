Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751523B53
	for <linux-staging@lists.linux.dev>; Mon,  7 Mar 2022 14:46:06 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id i8so23656304wrr.8
        for <linux-staging@lists.linux.dev>; Mon, 07 Mar 2022 06:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TnuayJqqO6PRDmzyTvn21h8f65mMIJndsojjx882OXc=;
        b=QNJugbyqzySDgHdDdGqu0c/SNKPry3EZ5Un0ef5kLO5A2MINUwhlw6rmfuY1bg/qDo
         lrIAPvEDtP3dTn8wAyounn60fEcS2VELUVmfrj5hehBxPbEvuXYKnAHEy8tZTldMon/4
         TgjpyZUEGFfUzp8x0pZrL4H5oNcmoO5fD76FRaam7XvG8GMZqA8zwAkLESXgHEpLAH0e
         R+uSXhekTZWguXSvr4MCnhV4aSK6JYAIpQCx1pBpI2IBjfsc+VN4/o9n7gm9wEzqzbEH
         aLWiyxkxYyOCqDzsNGAEXm3lXP53wZIFxJzOkbZS8ibEFbSB9y5I1Gg2R1kl5bRDMkhq
         1vhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TnuayJqqO6PRDmzyTvn21h8f65mMIJndsojjx882OXc=;
        b=VoEyzv8HS2r23XXkwh4lI7J8CN1OCIop1n0typSbDF95IEAf3i/VO1OD785Hk4pDde
         XbclJWwQYlVvqV1QdiHZl5D8Ap5qjmt9bUsY/48AAM2ylUKpqzNb37vFaOQgxj3bSfbD
         vfQgeI35zthSqZzcCBQmWBMRtA9bgrISVYSY23PxmeCKTeX0yiDBmG4OeBOs7lQI2IE0
         MafJYn2FgiU4Lg0r8YrgBTOinjvuwhgy69KguEN37NMdEyjFNLsueE61g1I41vzAj3lQ
         J7HhkhIwEp/gaY2krr75ETLJSZNVWU8iiak5/SVDT5Tl3Mwu2i2ycnOmDF05Wd/8Luhn
         4Y+w==
X-Gm-Message-State: AOAM531CAOriWFF1u7StGd/Hlpu6qxzC/VtCMvU3QXFiVARCjcjrAj31
	+x815JO4yYdJKzXBSmM66bM=
X-Google-Smtp-Source: ABdhPJwwXWeujosxzRqNzzOHBuqrta0lQ8JNylmK2wr7FxCzx7SadlOqXdGe4d6U7mz2dam3O5GbeQ==
X-Received: by 2002:a05:6000:1d8f:b0:1e3:319d:519e with SMTP id bk15-20020a0560001d8f00b001e3319d519emr8626895wrb.548.1646664364669;
        Mon, 07 Mar 2022 06:46:04 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id j17-20020a05600c191100b00389a1a68b95sm11218160wmq.27.2022.03.07.06.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 06:46:04 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: gdm724x: remove redundant assignment of pointer w
Date: Mon,  7 Mar 2022 14:46:03 +0000
Message-Id: <20220307144603.136846-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Pointer w is being assigned a value that is never read, it is
being re-assigned a new value later. The assignment is redundant
and can be removed.

Cleans up clan scan build warning:
drivers/staging/gdm724x/gdm_lte.c:198:2: warning: Value stored to 'w'
is never read [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/staging/gdm724x/gdm_lte.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/gdm724x/gdm_lte.c b/drivers/staging/gdm724x/gdm_lte.c
index 0d8d8fed283d..d5bec53b0194 100644
--- a/drivers/staging/gdm724x/gdm_lte.c
+++ b/drivers/staging/gdm724x/gdm_lte.c
@@ -195,7 +195,6 @@ static __sum16 icmp6_checksum(struct ipv6hdr *ipv6, u16 *ptr, int len)
 	pseudo_header.ph.ph_len = be16_to_cpu(ipv6->payload_len);
 	pseudo_header.ph.ph_nxt = ipv6->nexthdr;
 
-	w = (u16 *)&pseudo_header;
 	for (i = 0; i < ARRAY_SIZE(pseudo_header.pa); i++) {
 		pa = pseudo_header.pa[i];
 		sum = csum_add(sum, csum_unfold((__force __sum16)pa));
-- 
2.35.1

