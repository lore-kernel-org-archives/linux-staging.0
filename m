Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF764EACB
	for <linux-staging@lists.linux.dev>; Sat, 23 Dec 2023 01:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="SpTAQ/ub"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3b9f8c9307dso2110435b6e.0
        for <linux-staging@lists.linux.dev>; Fri, 22 Dec 2023 17:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1703296797; x=1703901597; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Q6BFufqSpTpRSxFtBVFPQlLfAKF4PgzdI1kKWoUxZw=;
        b=SpTAQ/ubuQBJoH9LHU50qAafvTQw0qbbS1wybXTgHtUIJqcMeuLHxh6M9TJ9nratkB
         cJ7XhP9teDHPCFxKzzayjd3zvMRXSjSdM3QREQ9B/nZJeIAkWEgCpOSUBsuk1RIEQfNv
         gCBYlpYwLhiZuwnLkIMs4IPLu945wgcZP/Jl3EfWNg5kg3BBDLon9eDbUzjvNShAOzHW
         eeS46c84jLY3cTQGbAzK1BdijsaHmb1zk7vzWHiW4EyPY7FxD98TMqRJGX5/rS1ev58i
         g8yDBymbScsRM3sfeTifQ+qpF6AzGRzGfbKfoyE3EU3Icp2V0FXjsVSVc+VCbTjqwj+v
         5ehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703296797; x=1703901597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Q6BFufqSpTpRSxFtBVFPQlLfAKF4PgzdI1kKWoUxZw=;
        b=QcbPkpC/pghCy+PDr64cfBuSyAN1yno9O+NMvWDFCJsh/+PJasWMlzKLyzQWkxhK6Y
         dCJWQNegtfLGJlht/Y1haeUM76XhvUhQn9aGoBKj28kpFj8jkmn//qklla96qKXjJOr6
         9DoY44x6/vtfEVERQOzfUr15HFmd7lm+HjORZ6L/O8cwn9LrTsyT/zzUGfBorVR3v5vE
         tP/HuRtYJNSz6FRHLu95/O4VIRRTgJuXN3Etykw+0ga098TuFmwCnxlmbg+hFNmVder7
         VuSTNNBAHoJ40jrCbYXXEg+5sKRk3y74+ICRMqeZ2+9dny5/p3B5TfyvCOosi95solQE
         Q7/Q==
X-Gm-Message-State: AOJu0Yz5vI7o68BxZCDmpbdrqOjvgYsUPeSfiNthDr799f6Edbq2XrE+
	XDXUaStQUod4Ath9sIIpLUeBwM9JP9aGUQ==
X-Google-Smtp-Source: AGHT+IHuYu3aAWfG2k9qEnBgkaSHvXSnI4Cht8YZVKjPJH0bZPRvV/eCVvVXuWa8ks7/FNZUX0fEQw==
X-Received: by 2002:a05:6808:1708:b0:3b9:e2bf:c24e with SMTP id bc8-20020a056808170800b003b9e2bfc24emr2920662oib.15.1703296796891;
        Fri, 22 Dec 2023 17:59:56 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id kg15-20020a170903060f00b001d3edef115dsm4106546plb.20.2023.12.22.17.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 17:59:56 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 13/20] Staging: rtl8192e: Rename function rtllib_MFIE_Grate()
Date: Fri, 22 Dec 2023 17:59:35 -0800
Message-Id: <20231223015942.418263-14-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231223015942.418263-1-tdavies@darkphysics.net>
References: <20231223015942.418263-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename function rtllib_MFIE_Grate to rtllib_mfie_grate to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 6a3a8e0bb036..f3de04b98803 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -61,7 +61,7 @@ static void rtllib_mfie_brate(struct rtllib_device *ieee, u8 **tag_p)
 	*tag_p = tag;
 }
 
-static void rtllib_MFIE_Grate(struct rtllib_device *ieee, u8 **tag_p)
+static void rtllib_mfie_grate(struct rtllib_device *ieee, u8 **tag_p)
 {
 	u8 *tag = *tag_p;
 
@@ -342,7 +342,7 @@ static inline struct sk_buff *rtllib_probe_req(struct rtllib_device *ieee)
 	tag += len;
 
 	rtllib_mfie_brate(ieee, &tag);
-	rtllib_MFIE_Grate(ieee, &tag);
+	rtllib_mfie_grate(ieee, &tag);
 
 	return skb;
 }
-- 
2.39.2

