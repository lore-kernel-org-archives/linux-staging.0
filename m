Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F871FB8
	for <linux-staging@lists.linux.dev>; Tue, 21 Mar 2023 06:45:28 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id o11so15070116ple.1
        for <linux-staging@lists.linux.dev>; Mon, 20 Mar 2023 23:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679381127;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cBlI+oJSvB7F5CTf18vIbj2UkTaU+FCvh8P2NMwv3gQ=;
        b=Kn04m2cMujcd/1X7I/qQ+Z2L028Rke8VOWJhLt5koVK0fM+PvKiWkZfvU645FT9WCh
         /jpvAQG3RJ9uSveqkB5UTeM6SgMrjP/viPnW63ZOLv3E8m9/uQllFCMZH6eBMOjbpCr8
         I2LhtvmIzWVLq4zsYBQMNqpC2Y7+VHVveL4r99cBJBntBafGOnJdKDDgtsrzLbipR3LR
         lCDixDgkWDymUq6ifCzeE+b3qUb3Gy/7PCFKnNbWejDXeXqwfusgZFSyMTYYNK24Sbzb
         RvNdOh7ClJl2MwdLisvPoVrSwmJ2ftcd4rd3piSJ0R/asYwofvdHyq7riYuvbDUVulsy
         vEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679381127;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cBlI+oJSvB7F5CTf18vIbj2UkTaU+FCvh8P2NMwv3gQ=;
        b=Vi7O/MsBi+qeUmyKjtYsGHSiM25FVsZVQdsdz+2bJvNR9kkokBhP25ys9raLBHybqf
         0Y6Kgy43P7S2p2n4XoriSv016zunDQaF+CRmw1+3mhBAI1UDRuqx4PyQ1/mre7BaCGK+
         tkVAoFVPeYjEbwrf+0K3qNmxu4EkuRou8lR+10O432Vs5fjl+Q+RghoRZEouPVINQhbP
         Q+IG1sLE8mvDShRZ8D8R0dpfNEiWfM5W9vqzXrPG7GzZ9l2aGt+tXRLC2Eysx3HCK3tv
         6kxfZDYKogpUF24ccx+DYCp4ldN9x23rOWR2528HxEIW8czfxVGPGP/8YglftK63kCtI
         SSRg==
X-Gm-Message-State: AO0yUKX0u++DPQyxVgC2v1rd+/aoYZ/giwBz27Zxw/3GwlPJlXMbiStJ
	Xfky7O1KZzjvbEPFaY+PfAg=
X-Google-Smtp-Source: AK7set9Zqsp2EHKO3BKgI2Rc3F7SqxGfJ3+HyrFqA/Qq1gQgwPg2C0jgfZXkuqX2tUJp14J9CM4SWw==
X-Received: by 2002:a17:903:124e:b0:19e:8076:9bd2 with SMTP id u14-20020a170903124e00b0019e80769bd2mr1509171plh.17.1679381127711;
        Mon, 20 Mar 2023 23:45:27 -0700 (PDT)
Received: from trent-reznor ([2601:641:4000:81:109e:9b0c:f18f:7fa1])
        by smtp.gmail.com with ESMTPSA id jm18-20020a17090304d200b001888cadf8f6sm7796388plb.49.2023.03.20.23.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 23:45:26 -0700 (PDT)
Date: Mon, 20 Mar 2023 23:45:24 -0700
From: Daniel Watson <ozzloy@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: av7110: put spaces around operators
Message-ID: <ZBlShLl4PYlNIpGN@trent-reznor>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

put spaces around '=' and '<=' to match style from checkpatch

Signed-off-by: Daniel Watson <ozzloy@gmail.com>
---
 drivers/staging/media/av7110/av7110_hw.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110_hw.h b/drivers/staging/media/av7110/av7110_hw.h
index 6380d8950c695..3274146c401f1 100644
--- a/drivers/staging/media/av7110/av7110_hw.h
+++ b/drivers/staging/media/av7110/av7110_hw.h
@@ -402,8 +402,8 @@ static inline u32 irdebi(struct av7110 *av7110, u32 config, int addr, u32 val, u
 {
 	u32 res;
 
-	res=av7110_debiread(av7110, config, addr, count);
-	if (count<=4)
+	res = av7110_debiread(av7110, config, addr, count);
+	if (count <= 4)
 		memcpy(av7110->debi_virt, (char *) &res, count);
 	return res;
 }
@@ -424,7 +424,7 @@ static inline u32 rdebi(struct av7110 *av7110, u32 config, int addr, u32 val, un
 	u32 res;
 
 	spin_lock_irqsave(&av7110->debilock, flags);
-	res=av7110_debiread(av7110, config, addr, count);
+	res = av7110_debiread(av7110, config, addr, count);
 	spin_unlock_irqrestore(&av7110->debilock, flags);
 	return res;
 }
-- 
2.34.1

