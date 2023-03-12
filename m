Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2171FC5;
	Sun, 12 Mar 2023 13:34:00 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id p4so2815211wre.11;
        Sun, 12 Mar 2023 06:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678628038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eiPifvN1XyvobUmqZyfiK5INxKhDqGlZtgkMioL3vMo=;
        b=GD6j0vNGy5Lk6teLi7snFXICeRLvcvAeHQgKz0wMKKq51ZXiBSetiG1myusJCpWqVe
         MCbUrIEUent2OpbRaxrwkbESipcSRMf0O54/mi2vOxROjfEbdnMdZhOiWn3RvMY7H1s8
         RmkgPL6SsjyEdNMajkghtLSIz5+I1ObSj5m/cfnSaLwlT3Lvqej8N0secVKSpfU1Ei4V
         /jJM9HTgGarrtGxNwo1RWQgHcnB+qkeJXQhQ6z6h+MxUtyVICwYD9VTZPrw5SoNFt+Js
         zIjJ0qTAykb4W5c0GPQS/MKs17RVVFfND2owpMimAUJMdQdNFmhVZ9PXrEwBX9hLn2eq
         zpqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678628038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eiPifvN1XyvobUmqZyfiK5INxKhDqGlZtgkMioL3vMo=;
        b=WbC+vkhyovjy2WI4jHev7S266obxaSdeKZLYzBKtS9rn19kGxtC+D/evInTWIvKGJ9
         hdIDsZvFYNPbll/1640uXB/7d+hAagHB2GwDJSmSIQUbxBZWu+cfgv8tjIK0pSusT5X8
         ImhA37flGngLNzU7mlT5Nq4jnDsSrB4UNM9BjStNPHFrX0zAwVpx8lLY+NH4mRMtBchs
         kZXwoxE3jjeNWeXGL9nxYGg6qqGW5t1IC3g3CY581zaHEqPzFxRdyoxjaOwjHBM5FzpO
         iQUwyhy72CCaq6U8M5Dkxbpap4Ag1Yc0PRVyIzDkITE+3bhhraLrMAOgOLEHMwJnygpg
         g3Bw==
X-Gm-Message-State: AO0yUKU9cw/qodSnMYrDbOHLJpE3FitsxOxl5tK0gX/RtOP1x7JztLan
	Zz2okT6beti9m/B/8ehUnCTOMP+FABw=
X-Google-Smtp-Source: AK7set/puNB5iYM3sVYz/qm/8L3NnuFuYKU862+lC/uC5s4YoS4lGRh4xVvFdbe9kTag0BdON6cycA==
X-Received: by 2002:adf:df8f:0:b0:2ce:a758:d6fb with SMTP id z15-20020adfdf8f000000b002cea758d6fbmr3149122wrl.1.1678628038167;
        Sun, 12 Mar 2023 06:33:58 -0700 (PDT)
Received: from alaa-emad.. ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id x3-20020a5d6503000000b002c55306f6edsm5144594wru.54.2023.03.12.06.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:33:57 -0700 (PDT)
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
To: outreachy@lists.linux.dev
Cc: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	gregkh@linuxfoundation.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	eng.mennamahmoud.mm@gmail.com
Subject: [PATCH] staging: iio: meter: enclose Macros with complex values in parentheses
Date: Sun, 12 Mar 2023 15:33:47 +0200
Message-Id: <20230312133347.120944-1-eng.mennamahmoud.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

enclose Macros with complex values in parentheses is especially useful
in making macro definitions “safe” (so that they
evaluate each operand exactly once).

this error reported by chechpatch.pl

"ERROR: Macros with complex values should be enclosed in parentheses"

for ADE7854_SPI_SLOW, ADE7854_SPI_BURST and ADE7854_SPI_FAST
macros and this error fixed by enclose these macros in parentheses.

Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
---
 drivers/staging/iio/meter/ade7854.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/iio/meter/ade7854.h b/drivers/staging/iio/meter/ade7854.h
index 7a49f8f1016f..41eeedef569b 100644
--- a/drivers/staging/iio/meter/ade7854.h
+++ b/drivers/staging/iio/meter/ade7854.h
@@ -139,9 +139,9 @@
 #define ADE7854_MAX_RX    7
 #define ADE7854_STARTUP_DELAY 1000
 
-#define ADE7854_SPI_SLOW	(u32)(300 * 1000)
-#define ADE7854_SPI_BURST	(u32)(1000 * 1000)
-#define ADE7854_SPI_FAST	(u32)(2000 * 1000)
+#define ADE7854_SPI_SLOW	((u32)(300 * 1000))
+#define ADE7854_SPI_BURST	((u32)(1000 * 1000))
+#define ADE7854_SPI_FAST	((u32)(2000 * 1000))
 
 /**
  * struct ade7854_state - device instance specific data
-- 
2.34.1

