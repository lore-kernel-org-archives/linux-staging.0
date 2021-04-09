Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7EB70
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 11:40:17 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id b17so3687778pgh.7
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 04:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=NZw4NFmYLCrGc5aV3J0vJb8Lp57C7Yd+gPIf9yWrJX0=;
        b=eHmec72RD9J7Z1L5wZrwKZs3r+i0WFgJUIpnEX2+tnXsZOV/reXykSNlnDAGFb/eAP
         LEq/nBwdvZ6iwVZ5iqRnRLGYRIWPDREUUL5ZvTnc9PpYQyPGH3IRbzls8lvr4W2X0DCw
         ncSxPrAfTnvwVW4Oa1nJeFZPiSnuyM+0qLH2+GH9Cxvk5zxdZAZhJEAP1+OAoWJoSv3T
         PSt6LFTi3+lZYKTjbo4Zn1AmZFGvQpUMDcu/dl2f9HbAJk+TTDn0Jb9qMxKTatLQTx+3
         VCMX+QMh0v3GBTisnuZX4K37zbD00vz9AUoD/3UdxAT35Ze4RQfV1Qv5W6PdASsc0Jcx
         /C3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=NZw4NFmYLCrGc5aV3J0vJb8Lp57C7Yd+gPIf9yWrJX0=;
        b=oSt1X4e40jhDaR1tTycorzxn8OqOhbB1m+3Xth9UZyMEUr+V2xlML2M8561l8euzhY
         DdapxJRltml3Bc7l1H7IeDpIRVY/ixKDy990PUrPyRzll4HQz0v5Q8teP9nVgLKGCQ+h
         IzceYk/U+DECymrRd29a9XveofE4RDkxLas3Hj1NoU6Ofquhh1lXeiqQFQnzm2j3m3rS
         dd0yFMY2I/MCge/kESsSOyJYtMQxw6jeqRju1QHtzRKOdsDbF23wcP1STwC4ux8y77uR
         nlObAYlLrorglECbgsNbfY3ejJVpCLI+7GSX20gWBv5w8+fn3UzKKA5lhaZPbYfCR/vm
         GXsg==
X-Gm-Message-State: AOAM5323QRKJtr0DHMLD7o6Nyc7rxgSlxi6+5KN8eUTZ+quypcVVYjai
	brQfUuRulb5+DcYBifPZXMs=
X-Google-Smtp-Source: ABdhPJx5qyws6Y/1T974jp6ZSCO3rIFu8BMgmrh5UdAUROkXUumKDO2jM64MR6idWYX1iN8STLCP/A==
X-Received: by 2002:a63:30c1:: with SMTP id w184mr12534931pgw.230.1617968417154;
        Fri, 09 Apr 2021 04:40:17 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id e6sm2573864pgh.17.2021.04.09.04.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 04:40:16 -0700 (PDT)
Date: Fri, 9 Apr 2021 17:10:10 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in
Subject: [PATCH v2] staging: media: zoran: moved statement to next line with
 '*'
Message-ID: <YHA9Gsc2pmmtmlNA@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Moved the statement to next line and added '*' before it to meet
linux kernel coding style for long(multi-line) comments.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---

Changes from v1:- made style changes according to linux kernel coding style
for long comments.

drivers/staging/media/zoran/zr36060.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/zoran/zr36060.c b/drivers/staging/media/zoran/zr36060.c
index 035634fc1c6d..8c6f4d792a9d 100644
--- a/drivers/staging/media/zoran/zr36060.c
+++ b/drivers/staging/media/zoran/zr36060.c
@@ -249,7 +249,8 @@ static const char zr36060_ta[8] = { 0, 1, 1, 0, 0, 0, 0, 0 };	//table idx's AC
 static const char zr36060_decimation_h[8] = { 2, 1, 1, 0, 0, 0, 0, 0 };
 static const char zr36060_decimation_v[8] = { 1, 1, 1, 0, 0, 0, 0, 0 };
 
-/* SOF (start of frame) segment depends on width,
+/*
+ * SOF (start of frame) segment depends on width,
  * height and sampling ratio of each color component
  */
 static int zr36060_set_sof(struct zr36060 *ptr)
-- 
2.30.2

