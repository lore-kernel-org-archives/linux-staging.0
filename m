Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F353D61;
	Thu, 16 Mar 2023 15:52:06 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id d10so1178226pgt.12;
        Thu, 16 Mar 2023 08:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678981926;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tOcVYpEkBU+F2J1BLwbVIMceM+rp1K8jWNJcX1iHdIo=;
        b=qBS8p0D8OOpgalLTxlU4DXIK3F+5cPuTq6SjsDfJ9wpnni3DIIeRQdwsP5PITOFAxs
         bmi/77J0sVy3L6szsHMSntVJajGHtcP1idPWDamRtyL4bcuxkGa6IydOiDT0qfkqhlJO
         HKtEAzMO5b5iPfGbd62Z0JamDBVKAvGYYY4jAkFD4YEszSxZB8SPOJRnOrEBxzJ3gw8V
         p8z3g2vG240yzBukFaTy6M3ELn2RkngrXTvFl/iznQgvN4aMq/LDIIBt4MS7qpgretX3
         2+KLmOnOIrdKpoutO9M2mfUbzOhJlTNUfeeYw88zffRTifYNRoqUxr4vY4stHTNzUeVL
         Qc5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678981926;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tOcVYpEkBU+F2J1BLwbVIMceM+rp1K8jWNJcX1iHdIo=;
        b=1qdd3efgF2PBjw8EbfBT7eNjWDx59Q/iUC5Q+7eMvqmGRtUVrs31Lm+8cym/fwpBS+
         F848Y2Kuh2+lNwvWpm3HlXEBCQgGxA49GcnAYmmFeHRu7bjJ1I2Plz9WdCZvS7LxYPsf
         PKhR2pzaROse857Jho1fQtSK+lYlk0au4on3LUZ5/FCBUvjyNn8L5ake0FO57kQ+8VRA
         y1Rfp2zUJEPVwjKpWNrimTC58fVwhG9WrhUx8lgqbX3X+9yZoZRbR00eAH181z5OJ64g
         iaVgpvezI8Mx8s75lFp85fuzxDN62wZEr9B/J6rnwD+4NM9WOo8QjiUoA81luTRAu7/H
         flyg==
X-Gm-Message-State: AO0yUKWd7qMRMM6jUUkZu1ujHbpnmmamNoGiDs1utFmK9dseqTTToYxI
	m5WT3yRY/qPcVK/h9slchu4=
X-Google-Smtp-Source: AK7set88clC4PgM3UNPgE6+tMcTDdZ/P2AuucREOUuO2YQ0vkMTXCNnanVH7L5/QolZABvczlD1HLg==
X-Received: by 2002:a62:8457:0:b0:625:eacf:caf9 with SMTP id k84-20020a628457000000b00625eacfcaf9mr2944270pfd.7.1678981926219;
        Thu, 16 Mar 2023 08:52:06 -0700 (PDT)
Received: from sumitra.com ([117.245.254.247])
        by smtp.gmail.com with ESMTPSA id x21-20020aa784d5000000b00592eb6f239fsm5606817pfn.40.2023.03.16.08.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 08:52:05 -0700 (PDT)
Date: Thu, 16 Mar 2023 08:52:02 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Subject: [PATCH v2] Staging: octeon: Fix line ending with '('
Message-ID: <20230316155202.GA82100@sumitra.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Adhere to coding-style.

Checkpatch has reported code style warning:
CHECK: Lines should not end with a '('.

Enhance the design of a function header:
Align the function parameters immediately after '(' in a single line.

Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
---

v2: Change patch subject and description.

 drivers/staging/octeon/octeon-stubs.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 7a02e59e283f..3e7b92cd2e35 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -1372,9 +1372,7 @@ static inline void cvmx_fau_async_fetch_and_add32(uint64_t scraddr,
 						  int32_t value)
 { }
 
-static inline union cvmx_gmxx_rxx_rx_inbnd cvmx_spi4000_check_speed(
-	int interface,
-	int port)
+static inline union cvmx_gmxx_rxx_rx_inbnd cvmx_spi4000_check_speed(int interface, int port)
 {
 	union cvmx_gmxx_rxx_rx_inbnd r;
 
-- 
2.25.1

